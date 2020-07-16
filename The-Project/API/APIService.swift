//
//  APIService.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
func getInfo(completion: @escaping (tourResponse)->()) {

    let url = URL(string: "https://run.mocky.io/v3/1713b9f3-198a-45a2-88ca-951403645319")!

    URLSession.shared.dataTask(with: url) { (data, res, err) in
    guard let data = data else {return}
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(tourResponse.self, from: data)
            completion(result)
        } catch {print(error)}
    }.resume()
}

        
    

