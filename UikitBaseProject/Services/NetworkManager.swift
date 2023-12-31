//
//  NetworkManager.swift
//  UikitBaseProject
//
//  Created by Zülfü Akgüneş on 26.06.2023.
//

import Foundation

protocol UserService{
    func getUser(completion: @escaping (Result<[User], Error>) -> Void)
}

class NetworkManager: UserService{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T,Error>) -> Void){
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            
            if let error{
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            
            guard let data = data else{
                completion(.failure(NSError(domain: "Invalid Response Data", code: 0)))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    
    func getUser(completion: @escaping (Result<[User], Error>) -> Void){
        let endpoint = Endpoint.getUsers
        request(endpoint, completion: completion)
    }
}
