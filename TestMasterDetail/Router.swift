//
//  Router.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/20/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import Foundation



enum HTTPMethod : String {
    case get = "GET"
}

enum Router : String {
    case jogos = "/games"
    private var prodution : Bool {
        return false
    }
    private var host : String {
        if prodution {
           return "https://academyworldcup.herokuapp.com/api/v1"
        }
        return "http://localhost:3000/api/v1"
    }
    
    private var path : String { return self.rawValue }
    
    private func buildQueryItem( _ param : (key:String, value:Any) ) -> URLQueryItem {
        return URLQueryItem(name: param.key, value: "\(param.value)")
    }
    
    func requestWithMethod<T : Decodable >(_ method : HTTPMethod, params : [String:Any]? = nil , completion : ((T?,Error?)->Void)? ) {
        
        let baseUrl = host.appending(path)
        var urlComponents = URLComponents(string: baseUrl)
        
        if let params = params {
            urlComponents?.queryItems = params.map { buildQueryItem($0) }
        }
        
        guard let url = urlComponents?.url else { return}
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _ , error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    completion?(nil,error)
                }
            }
            let decoder = JSONDecoder()
            guard let data = data else {return}
            do {
                let result = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion?(result,nil)
                }
            }catch{
                print(error)
            }
            
        }.resume()
    }
}

