//
//  ApiError.swift
//  AFNetworkingDemo
//
//  Copyright © 2019 Norsemen Solutions. All rights reserved.
//

enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
