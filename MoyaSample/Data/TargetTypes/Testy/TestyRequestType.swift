//
//  TestyRequest.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import Moya


enum TestyRequest {
    case testy
    case register(testy: TestyEntity)
}

extension TestyRequest: SampleTargetType {
    
    var path: String { return "/testies" }
    
    var method: Method {
        switch self {
        case .testy: return .get
        case .register(_): return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .testy: return nil
        case .register(let testy): return ["id": testy.testyId]
        }
    }
    
    
    var task: Task {
        switch self {
        case .testy: return .requestPlain
        case .register(_):
            let parameters = self.parameters ?? [:]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
}
