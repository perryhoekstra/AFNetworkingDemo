//
//  Constants.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Norsemen Solutions. All rights reserved.
//

struct Constants {
    
    //The API's base URL
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}

