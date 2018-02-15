//
//  SampleRequest.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import Moya

protocol SampleTargetType: TargetType {}
extension SampleTargetType {
    var baseURL: URL { return URL(string: "")! }
    var headers: [String: String]? { return nil }
    var sampleData: Data { return Data() }
}
