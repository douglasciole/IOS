//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Douglas + Daniel on 2020-05-18.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var name: String
    var artist: String
    var type: String
    var artworkURL: URL
    var description: String
    
    //Matching json keys with properties that does not have the same name
    enum CodingKeys: String, CodingKey{
        case name = "trackName"
        case artist = "artistName"
        case type = "kind"
        case artworkURL = "artworkUrl30"
        case description
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        type = try values.decode(String.self, forKey: CodingKeys.type)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        
        
        if let d = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = d
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
    
}

struct StoreItems: Codable {
    let resultCount: Int
    let results: [StoreItem]
}
