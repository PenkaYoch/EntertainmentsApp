//
//  Utils.swift
//  Entertainments
//
//  Created by Penka Yochkova on 14.01.23.
//

import Foundation
import UIKit

struct Utils {
    
    /*
     * Sort enum type
     */
    enum SortType: Int {
        case Earliest = 0
        case Latest = 1
    }
    
    /*
     * Convert seconds to Date Time
     */
    static func convertSecondsToDateTime(time: Double) -> String {
        let date = Date(timeIntervalSince1970: time / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "HH:mm:ss"
        
        return formatter.string(from: date)
    }
    
    /*
     * Find time duration between two hour variables
     */
    static func findDurationBetweenDates(time1: Double, time2: Double) -> Int {
        let date1 = Date(timeIntervalSinceNow: time1)
        let date2 = Date(timeIntervalSinceNow: time2) // 3:30
        let diff = Int(date2.timeIntervalSince1970 - date1.timeIntervalSince1970)
        let hours = diff / 3600
        let minutes = (diff - hours * 3600) / 60
        return minutes
    }
    
    /*
     * Load image from url
     */
    static func loadImage(from url: URL) -> UIImage? {
        let imageData: Data
        
        do {
            imageData = try Data(contentsOf: url)
        } catch {
            return nil
        }
        
        return UIImage(data: imageData)
    }
    
    static func loadImage(from urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        return self.loadImage(from: url)
    }
}
