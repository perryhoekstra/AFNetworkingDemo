//
//  ApiRouter.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Norsemen Solutions. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case getPosts(userId: Int)
    
    case updatePost(post: Post)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        switch self {
            case .getPosts(let userId):
                let params = [Constants.Parameters.userId : userId]
            
                urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            
            case .updatePost(let post):
                urlRequest = try! JSONParameterEncoder.default.encode(post, into: urlRequest)
        }
        
        return urlRequest
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
            case .getPosts:
                return .get
            case .updatePost:
                return .post
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
            case .getPosts, .updatePost:
                return "posts"
        }
    }
}

