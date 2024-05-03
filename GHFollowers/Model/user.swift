//
//  user.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/03.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var createdAt: String
}
