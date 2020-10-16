//
//  ApiManager.swift
//  InfiniteScroll
//
//  Created by Victor Luni on 13/10/20.
//

import Foundation



class ApiManager<DataContent> where DataContent: Decodable {
    
    func loadFromApi(endpoint: String, completion: @escaping (DataContent) -> ()) {
        //
        
        if let url = URL(string: endpoint) {
            URLSession.shared.dataTask(with: url) { data, res, err in
                if let response = data {
                    guard let unwrapped = self.decodeGeneric(data: response) else {
                        fatalError()
                    }
                    completion(unwrapped)
                }
            }.resume()
        }
    }
    
    
    func decodeGeneric(data: Data) -> DataContent? {
        do {
            let result = try JSONDecoder().decode(DataContent.self, from: data)
            return result
        } catch {
            print(error)
        }
        return nil
    }
    
}
