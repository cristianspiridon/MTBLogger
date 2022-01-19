//
//  Token.swift
//  MTBLogger
//
//  Created by Cristian Spiridon on 19/01/2022.
//

import Foundation
import RealmSwift
import StravaSwift

class RToken: Object {
    
    @objc dynamic var id: String = UUID.init().uuidString
    
    /** The access token **/
    @objc dynamic var accessToken: String = ""

    /** The refresh token **/
    @objc dynamic var refreshToken: String = ""

    /** Expiry for the token in seconds since the epoch **/
    @objc dynamic var expiresAt: Int = 0

    /** The athlete **/
    @objc dynamic var athlete: RAthlete? = nil
    
    
    static func create(token: OAuthToken) -> RToken {
        let rtoken = RToken()
        rtoken.accessToken = token.accessToken ?? ""
        rtoken.refreshToken = token.refreshToken ?? ""
        rtoken.expiresAt = token.expiresAt ?? 0
        rtoken.athlete = RAthlete.create(athlete: token.athlete)
        return rtoken
    }
    
    override static func primaryKey() -> String? {
      return "id"
    }
}
