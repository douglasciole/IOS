//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Douglas + Daniel on 2020-05-18.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItemController {
    func search(matching urlString: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
        
        let baseURL = URL(string: "https://itunes.apple.com/search")!
        guard let url = baseURL.queryString(urlString) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                print(error)
                completion(nil)
            } else {
                guard let data = data else {
                    print("No data!"); completion(nil);
                    return
                    
                }
                
                guard let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) else {
                        print("Fail to decode JSON"); completion(nil);
                    return
                }
                completion(storeItems.results)
                
            }
            
        }
        
        task.resume()
    }
}
