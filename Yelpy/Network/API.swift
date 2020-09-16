//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([[String:Any]]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "XNlv70KoxKmGxKnLAMuW1K5WohStOuBN6W-5_O8H8oibFKAhnuRqRuwfkfSXtyVdBntSEvixZoMe-aAjbn756i5XdPKw5_Kz9YI17DASQbdQAYBOKsnKPq97mUthX3Yx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
        

                // ––––– TODO: Get data from API and return it using completion
                print(data)
                // 1. Convert JSON to dictionary
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // 2. Grab business data and convert it to an array of dictionaries for each restraunt
                let restraunts = dataDictionary["businesses"] as! [[String: Any]]
                // 3. completion is an escape method which allows the data to be used
                
                return completion(restraunts)
                
                }
            }
        
            task.resume()
        
        }
    }

    
