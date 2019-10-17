//
//  Post.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Norsemen Solutions. All rights reserved.
//

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
    
    var json: Constants.Json {
        let post: Constants.Json = [
            "id": id,
            "title": title,
            "body" : body,
            "userId" : userId
        ]
        
        return post
    }
    
    func toString() -> String {
        return "id: [" + String(id) + "], title: [" + title + "], body: [" + body + "], userId: [" + String(userId) + "]"
    }
}
