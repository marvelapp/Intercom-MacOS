//
//  Endpoints.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

enum IntercomEndpoint: String {

    case users = "users"
    case leads = "contacts"
    case visitors = "visitors"
    case companies = "companies"
    case dataAttributes = "data_attributes"
    case tags = "tags"
    case segments = "segments"
    case notes = "notes"
    case events = "events"
    case count = "counts"
    case conversations = "conversations"
    case admins = "admins"
    case teams = "teams"

    var url: String {
       return "https://api.intercom.io/" + self.rawValue
    }

}
