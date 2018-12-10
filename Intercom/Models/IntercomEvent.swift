//
//  IntercomEvent.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public struct IntercomEvent: Codable {

    var eventName: String
    var createdAt: Double = Date().toGlobalTime().timeIntervalSince1970.rounded(toPlaces: 0)
    var userId: String
    var metaData: JSONValue?

    enum CodingKeys : String, CodingKey {
        case eventName = "event_name"
        case createdAt = "created_at"
        case userId = "user_id"
        case metaData = "metadata"
    }

    public init(eventName: String, userId: String, metaData: [String: Any]?) throws {
        self.eventName = eventName
        self.userId = userId

        if let metaData = metaData {
            let decoder = JSONDecoder()
            let jsonData = try JSONSerialization.data(withJSONObject:metaData)
            let values = try decoder.decode(JSONValue.self, from: jsonData)
            self.metaData = values
        }
        
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        eventName = try values.decode(String.self, forKey: .eventName)
        createdAt = try values.decode(Double.self, forKey: .createdAt)
        userId = try values.decode(String.self, forKey: .userId)
        metaData = try values.decodeIfPresent(JSONValue.self, forKey: .metaData)
    }

}

