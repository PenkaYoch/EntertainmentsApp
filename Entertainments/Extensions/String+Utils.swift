//
//  String+Utils.swift
//  Entertainments
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

extension String {
    
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
    
    func to<T: Decodable>(object obj: T.Type) -> T? {
        if let jsonData = self.data(using: .utf8) {
            return try? JSONDecoder().decode(obj, from: jsonData)
        }
        return nil
    }
    
}
