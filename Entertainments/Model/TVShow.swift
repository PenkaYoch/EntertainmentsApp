//
//  TVShow.swift
//  TVShow
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

struct TVShow: Decodable {
    let id: String?
    let imageUrl: String?
    let startTime: Double?
    let endTime: Double?
    let title: String?
    let episodeTitle: String?
    
}

extension TVShow: Comparable {
    
    static func < (lhs: TVShow, rhs: TVShow) -> Bool {
        return lhs.startTime ?? 0.0 > rhs.startTime ?? 0.0
    }
    
}
