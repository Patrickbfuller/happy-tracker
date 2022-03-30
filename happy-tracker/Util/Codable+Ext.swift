//
//  Codable+Ext.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/30/22.
//

import Foundation

extension Encodable {
    func toDict() -> [String: Any]? {
        var dict: [String: Any]? = nil
        do {
            let data = try JSONEncoder().encode(self)
            dict = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
        } catch {
            print(error)
        }
        return dict
    }
}
