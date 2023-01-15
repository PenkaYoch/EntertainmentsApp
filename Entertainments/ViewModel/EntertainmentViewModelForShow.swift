//
//  EntertainmentViewModelForShow.swift
//  Entertainments
//
//  Created by Penka Yochkova on 8.11.22.
//

import Foundation

struct EntertainmentViewModelForShow: EntertainmentViewModel {
    
    var entertainment: Entertainment?
    
    mutating func loadJsonFile() {
        
        guard let path = Bundle.main.path(forResource: "techInterviewJson", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            
            let data = try Data(contentsOf: url)
            let entertainment = try
            JSONDecoder().decode(Entertainment.self, from: data)
            
            self.entertainment = entertainment
            
        } catch  {
            print(error)
            
        }
    }
    
}


