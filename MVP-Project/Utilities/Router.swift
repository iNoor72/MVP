//
//  Router.swift
//  MVP-Project
//
//  Created by Noor Walid on 14/04/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
  
    static let baseURL = "https://reqres.in"
    
    case users
    case resources
    
    var method: HTTPMethod {
        switch self {
        case .resources:
            return .get
        case .users:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .resources:
            return "/api/unknown"
        case .users:
            return "/api/users?page=2"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURL)
        let request = URLRequest(url: (url?.appendingPathComponent(path))!)
        
        return request
    }
    
    
}
