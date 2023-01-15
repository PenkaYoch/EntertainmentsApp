//
//  Entertainment.swift
//  TVShow
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

struct Entertainment: Decodable {
    
    enum EntertainmentType: String, Decodable {
        case tvShow = "tvShow"
        case other = "other"
    }
    
    let id: String?
    let type: EntertainmentType?
    var showsAt: ShowAtModel?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case showsAt = "shows"
    }
    
}
