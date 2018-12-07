//
//  Connection.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class IntercomConnection {

    public typealias Completion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

    var request: URLRequest
    var session: URLSession

    init(endpoint: IntercomEndpoint) {

        let accessToken = Intercom.shared.accessToken ?? ""
        let config = URLSessionConfiguration.default
        let url = URL(string: endpoint.url)!

        self.session = URLSession(configuration: config)
        self.request = URLRequest(url: url)
        self.request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        self.request.addValue("application/json", forHTTPHeaderField: "Accept")
        self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    }

    func start(completion:Completion?) {

        let task = session.dataTask(with: request) {
            (data, response, error) in
            completion?(data, response, error)
        }

        task.resume()

    }

}
