//
//  TestyEntity.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

struct TestyEntity: Decodable {
    let testyId: Int
    let testyObejct: NestTestyEntity?
    
    init(testyId: Int, testyObject: NestTestyEntity? = nil) {
        self.testyId     = testyId
        self.testyObejct = testyObject
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: RootKeys.self)
        self.testyId     = try values.decode(Int.self, forKey: .testyId)
        self.testyObejct = try values.decodeIfPresent(NestTestyEntity.self, forKey: .testyObject)
    }
    
    private enum RootKeys: String, SnakeCaseCodingKey {
        case testyId
        case testyObject
    }
    
    struct NestTestyEntity: Decodable {
        let name: String
        private enum CodingKey: String, SnakeCaseCodingKey {
            case name
        }
    }
}
