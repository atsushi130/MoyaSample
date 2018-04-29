//
//  SampleService.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/18.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import Moya
import RxSwift

protocol Service {
    associatedtype Endpoint: EndpointProtocol
    var provider: MoyaProvider<Endpoint> { get }
}

extension Single where Element == Moya.Response {
    func defaultSetting() -> Observable<Element> {
        return self.asObservable().flatMap { response -> Observable<Element> in
            switch response.statusCode {
            case 200...226: return Observable.just(response)
            default:
                let error = try! response.map(ServiceError.self)
                return Observable.error(error)
            }
        }
    }
}
