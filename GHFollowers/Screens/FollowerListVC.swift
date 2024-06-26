//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/01.
//

import UIKit

protocol FollowerListVCDelgate: AnyObject {
    func didRequestFollowers(for username: String)
}

class FollowerListVC: GFDataLoadingVC {

    enum Section { case main }

    var username: String!
    var followers: [Follower]         = []
    var filteredFollowers: [Follower] = []
    var page                          = 1
    var hasMoreFollowers              = true
    var isSearching                   = false
    var isLoadingMoreFollowers        = false

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!


    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
        title         = username
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        configureSearchController()
        getFollowers(username: username, page: page) // はじめて表示したときpageが1になる
        configureDateSource()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }


    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }


    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for username"
        searchController.obscuresBackgroundDuringPresentation = false // これはデフォルトでfalseみたい
        navigationItem.searchController = searchController
    }


    func getFollowers(username: String, page: Int) {
        showLoadingView()
        isLoadingMoreFollowers = true

        Task {
            do {
                let followers = try await NetworkManager.shared.getFollowers(for: username, page: page)
                updateUI(with: followers)
                dismissLoadingView()
            } catch {
                if let gfError = error as? GFError {
                    presentGFAlert(title: "Bad Stuff Happind", message: gfError.rawValue, buttonTitle: "Ok")
                } else {
                    presentDefaulError()
                }

                dismissLoadingView()
            }

//            guard let followers = try? await NetworkManager.shared.getFollowers(for: username, page: page) else {
//                presentDefaulError()
//                dismissLoadingView()
//                return
//            }
//
//            updateUI(with: followers)
//            dismissLoadingView()
        }

//        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
//            guard let self = self else { return }
//            self.dismissLoadingView()
//
//            switch result {
//            case .success(let followers):
//                self.updateUI(with: followers)
//
//            case .failure(let error):
//                print(error.rawValue)
//                self.presentGFAlertOnMainThread(title: "Bad Stuff Happind", message: error.rawValue, buttonTitle: "Ok")
//            }
//            self.isLoadingMoreFollowers = false
//        }
    }


    func updateUI(with followers: [Follower]) {
        if followers.count < 100 { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)

        if self.followers.isEmpty {
            let message = "This user doesn't have any followers. Go follow them 😀."
            DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
            return
        }
        self.updateData(on: self.followers)
    }


    func configureDateSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower) // cellにフォロワーのログイン名と画像をわたす
            return cell
        })
    }


    func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}


extension FollowerListVC: UICollectionViewDelegate {

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY       = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height        = scrollView.frame.size.height

//        print("OffsetY = \(offsetY)")
//        print("ContentHeight = \(contentHeight)")
//        print("Height = \(height)")

        if offsetY > contentHeight - height {
            guard hasMoreFollowers, !isLoadingMoreFollowers else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followers
        let follower    = activeArray[indexPath.item]

        let destVC        = UserInfoVC()
        destVC.username   = follower.login
        destVC.delegate   = self
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}


extension FollowerListVC: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredFollowers.removeAll()
            updateData(on: followers)
            isSearching = false
            return
        }
        isSearching = true
        filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredFollowers)
    }


    @objc func addButtonTapped() {
        showLoadingView()

        Task {
            do {
                let user = try await NetworkManager.shared.getUserInfo(for: username)
                addUserToFavorites(user: user)
                dismissLoadingView()
            } catch {
                if let gfError = error as? GFError {
                    presentGFAlert(title: "Something Went Wrong", message: gfError.rawValue, buttonTitle: "Ok")
                } else {
                    presentDefaulError()
                }

                dismissLoadingView()
            }
        }
    }


    func addUserToFavorites(user: User) {
        let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)

        PersistenceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self = self else { return }

            guard let error = error else {
                DispatchQueue.main.async {
                    self.presentGFAlert(title: "Success!", message: "You have successjully favorited this user🎉", buttonTitle: "Hooray!")
                }
                return
            }
            DispatchQueue.main.async {
                self.presentGFAlert(title: "something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
}

extension FollowerListVC: UserInfoVCDelgate {

    func didRequestFollowers(for username: String) {
        self.username = username
        title         = username
        page          = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(username: username, page: page)
    }
    

}
