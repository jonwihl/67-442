//
//  jsonParser.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/12/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonParser {
    var maintenances = [Maintenance]()
    let json = JSON("data.json")

    func parseJson() -> [Maintenance]{
        for i in 0...1 {
            let request = json["maintenances"][i]
            let id = i + 1
            let title = json["maintenances"][i]["title"].string
//            let desctiption = request["description"].string
//            let created_on = request["created_on"].string
//            let closed_on = request["closed_on"].string
//            let photo = request["photo"].string
            
            let maintenance = Maintenance(id: id, title:title!, description:"the sink is broken", created_on:"11/1/2018", closed_on:"11/3/2018", photo:"xyz", active: true)
            maintenances.append(maintenance)
        }
        return maintenances
    }
}
