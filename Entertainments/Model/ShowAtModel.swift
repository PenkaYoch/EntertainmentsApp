//
//  ShowAtModel.swift
//  TVShow
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

struct ShowAtModel: Decodable {
    
    var at: [TVShow]?
    
    private enum CodingKeys: String, CodingKey {
        case at = "at"
    }
}
