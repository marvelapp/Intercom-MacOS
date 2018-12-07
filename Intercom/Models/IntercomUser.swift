//
//  User.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public struct IntercomUser: Codable {

    var type: IntercomUserType?
    var id: String?
    var userId: String?
    var email: String?
    var phone: String?
    var customAttributes: JSONValue?

    enum CodingKeys : String, CodingKey {
        case type = "type"
        case id = "id"
        case userId = "user_id"
        case email = "email"
        case phone = "phone"
        case customAttributes = "custom_attributes"
    }

    public init(type: IntercomUserType?, id: String?, userId: String?, email: String?, phone: String?, customAttributes: JSONValue?){
        self.type = type
        self.id = id
        self.userId = userId
        self.email = email
        self.phone = phone
        self.customAttributes = customAttributes
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(IntercomUserType.self, forKey: .type)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        customAttributes = try values.decodeIfPresent(JSONValue.self, forKey: .customAttributes)
    }

}

public enum IntercomUserType: String, Codable {
    case user = "user"
    case contact = "contact"
}
