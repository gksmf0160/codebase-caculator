//
//  poketmon.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//
import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeEntry]
    let sprites: Sprites

    struct TypeEntry: Decodable {
        let type: TypeName
        struct TypeName: Decodable {
            let name: String
        }
    }

    struct Sprites: Decodable {
        let front_default: String?
    }
}
