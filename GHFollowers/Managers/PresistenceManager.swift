//
//  PresistenceManager.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/15.
//

import Foundation

enum PresistenceActionType {
    case add, remove
}


enum PresistenceManager {

    static private let defaults = UserDefaults.standard

    enum Keys {
        static let favorites = "favorites"
    }


    static func updateWith(favorite: Follower, actionType: PresistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavoretes { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites

                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)

                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }

                completed(save(favorites: retrievedFavorites))

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
