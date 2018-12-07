//
//  IntercomUserMethods.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class IntercomUserMethods {

    public func updateLastSeen(_ userId: String, completion: IntercomConnection.Completion?) {

        let json: [String: Any] = [
            "user_id": userId,
            "update_last_request_at": true
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

        let connection = IntercomConnection(endpoint: .users)
        connection.request.httpMethod = "POST"
        connection.request.httpBody = jsonData

        connection.start(completion: completion)

    }

    public func update(_ intercomUser: IntercomUser, completion: IntercomConnection.Completion?) {

        let encodedData = try? JSONEncoder().encode(intercomUser)

        let connection = IntercomConnection(endpoint: .users)
        connection.request.httpMethod = "POST"
        connection.request.httpBody = encodedData

        connection.start(completion: completion)

    }

}
