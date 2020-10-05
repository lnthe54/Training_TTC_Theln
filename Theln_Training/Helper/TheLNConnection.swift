//
//  TheLNConnection.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/5/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class TheLNConnection {
    
    let url = "https://my-json-server.typicode.com/vantrung8794/ttcTrainingRepo/db"
    
    func postRequest<T:Mappable>(success: @escaping (T) -> Void) {
        
        Alamofire.request(url).responseObject { (response: DataResponse<T>) in
            guard let response = response.result.value else { return }
            success(response)
        }
    }
}
