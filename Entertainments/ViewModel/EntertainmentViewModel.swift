//
//  EntertainmentViewModel.swift
//  Entertainments
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

protocol EntertainmentViewModel {
    
    var entertainment: Entertainment? { get }
    
    mutating func loadJsonFile()
}





