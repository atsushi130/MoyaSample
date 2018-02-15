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
}

extension TestyRequest: SampleTargetType {
    var path: String { return "" }
    var method: Method { return .get }
    var task: Task { return .requestPlain }
}
