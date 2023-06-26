//
//  EndPoint.swift
//  UikitBaseProject
//
//  Created by Zülfü Akgüneş on 26.06.2023.
//

import Foundation

protocol EndPointProtocol{
    var baseURL:String { get }
    var path:String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    func request() -> URLRequest
}

enum HTTPMethod :String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint{
    case getUsers
}

extension Endpoint: EndPointProtocol{
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self{
        case .getUsers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .getUsers: return .get
            
        }
    }
    
    var header: [String : String]? {
        //var header: [String : String] = ["Authorization" : "Bearer \(token)"]
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL Error")
        }
        components.path = path
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let header {
            for (key,value) in header{
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
        
    }
    
    
    
}
