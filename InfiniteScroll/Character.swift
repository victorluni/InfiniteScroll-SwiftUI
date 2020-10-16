//
//  Character.swift
//  InfiniteScroll
//
//  Created by Victor Luni on 13/10/20.
//

import Foundation

struct CharacterList: Codable {
    
    var info: Info
    var characters: [Character]
    
    init() {
        self.info = Info(count: 0, pages: 0, next: nil, prev: nil)
        self.characters = []
    }
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case characters = "results"
    }
}

struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
}


struct Character: Codable, Identifiable, Hashable {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
}

struct Origin: Codable, Hashable {
    var name: String
    var url: String
}
