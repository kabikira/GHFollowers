//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/15.
//

import Foundation

enum PresistenceActionType {
    case add, remove
}

enum PersistenceManager {

    static private let defaults = UserDefaults.standard
    enum Keys { static let favorites = "favorites" }


    static func updateWith(favorite: Follower, actionType: PresistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavoretes { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)

                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }

                completed(save(favorites: favorites))

            case .failure(let error):
                completed(error)
            }
        }
    }


    static func retrieveFavoretes(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }

        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorites))
        }
    }


    static func save(favorites: [Follower]) -> GFError? {

        do {
            let encoder = JSONEncoder()
            let encodedFavarites = try encoder.encode(favorites)
            defaults.set(encodedFavarites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorites
        }
    }
}
