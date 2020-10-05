//
//  EmployeeObject.swift
//  Theln_Training
//
//  Created by Ngoc The on 10/5/20.
//  Copyright © 2020 Ngoc The. All rights reserved.
//

import ObjectMapper

enum PositionType: String {
    case intern = "Intern"
    case junior = "Junior"
    case senior = "Senior"
    
}

class EmployeeContainerObject: Mappable {
    var employees: [EmployeeObject]?

    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        employees <- map["employees"]
    }
}

class EmployeeObject: Mappable {
    var id = ""
    var createdAt = ""
    var name = ""
    var avatar = ""
    var address = ""
    var isMale: Bool = false
    var status = -1
    var dayWorking = -1
    var position: PositionType = .intern
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["createdAt"]
        avatar <- map["avatar"]
        name <- map["name"]
        address <- map["address"]
        isMale <- map["isMale"]
        status <- map["status"]
        dayWorking <- map["dayWorking"]
        getPosition()
    }
    
    func getPosition() {
        if dayWorking < 60 {
            position = .intern
        } else if dayWorking >= 200 {
           position = .senior
        } else {
            position = .junior
        }
    }
}
