//
//  Comments.swift
//  AlamofireTest
//
//  Created by Mohamed Ali on 01/10/2022.
//

import Foundation

// MARK: - Comments
struct Comments: Codable {
    let comments: [Comment]
    let total, skip, limit: Int
}

// MARK: - Comment
struct Comment: Codable {
    let id: Int
    let body: String
    let postID: Int
    let user: UserComment

    enum CodingKeys: String, CodingKey {
        case id, body
        case postID = "postId"
        case user
    }
}

// MARK: - User
struct UserComment: Codable {
    let id: Int
    let username: String
}
