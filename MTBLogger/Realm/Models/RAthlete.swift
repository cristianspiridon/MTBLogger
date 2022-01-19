//
//  RAthlete.swift
//  MTBLogger
//
//  Created by Cristian Spiridon on 19/01/2022.
//

import Foundation
import RealmSwift
import StravaSwift

class RAthlete: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var profile: String = ""
    @objc dynamic var createdAt: Date? = nil
    
    static func create(athlete: Athlete?) -> RAthlete? {
        guard let athlete = athlete else {
             return nil
        }

        let rathlete: RAthlete = RAthlete()
        rathlete.id = athlete.id ?? 0
        rathlete.firstname = athlete.firstname ?? ""
        rathlete.lastname = athlete.lastname ?? ""
        rathlete.city = athlete.city ?? ""
        rathlete.country = athlete.country ?? ""
        rathlete.profile = athlete.profile?.absoluteString ?? ""
        rathlete.createdAt = athlete.createdAt
        
        return rathlete
    }
    
    override static func primaryKey() -> String? {
      return "id"
    }
}
