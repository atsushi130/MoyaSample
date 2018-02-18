//
//  SampleService.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/18.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import Moya

protocol Service {
    associatedtype Endpoint: EndpointProtocol
    var provider: MoyaProvider<Endpoint> { get }
}
