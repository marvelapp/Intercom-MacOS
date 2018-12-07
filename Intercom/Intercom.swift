//
//  Intercom.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class Intercom {

    public static let shared = Intercom()

    var accessToken: String?
    var isSetup = false

    public func setup(accessToken: String) {
        self.accessToken = accessToken
        self.isSetup = true
    }

    let users = IntercomUserMethods()
    let events = IntercomEventMethods()

}
