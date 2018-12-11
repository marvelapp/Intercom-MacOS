//
//  IntercomEventMethods.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class IntercomEventMethods {

    public func submit(_ intercomEvent: IntercomEvent, completion: IntercomConnection.Completion?) {

        let encodedData: Data

        do {
            encodedData = try JSONEncoder().encode(intercomEvent)
        } catch {
            completion?(nil, nil, error)
            return
        }

        let connection = IntercomConnection(endpoint: .events)
        connection.request.httpMethod = "POST"
        connection.request.httpBody = encodedData

        connection.start(completion: completion)

    }

}
