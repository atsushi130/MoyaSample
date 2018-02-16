//
//  Testy.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

struct Testy {
    
    let id: Int
    let object: NestTesty?
    
    struct NestTesty {
        let name: String
        init(entity: TestyEntity.NestTestyEntity) {
            self.name = entity.name
        }
    }
    
    init(entity: TestyEntity) {
        self.id = entity.testyId
        switch entity.testyObejct {
        case .some(let object): self.object = NestTesty(entity: object)
        case .none: self.object = nil
        }
    }
}
