//
//  TestyRequest.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

extension SampleApi {
    
    struct Testy: Service {
        
        // Singleton
        static let shared = SampleApi.Testy()
        private init() {}
        
        // MoyaProvider
        let provider = MoyaProvider<SampleApi.Testy.Endpoint>()
        
        // MARK: Endpoint
        enum Endpoint: EndpointProtocol {
            case testy
            case register(testy: TestyEntity)
        }
    }
}

// MARK: - Endpoint definition
extension SampleApi.Testy.Endpoint {

    var path: String { return "/testies" }
    
    var method: Moya.Method {
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

// MARK: - Interface
extension SampleApi.Testy {
    
    func fetch() -> Observable<[Testy]> {
        return self.provider.rx.request(.testy).map([TestyEntity].self).asObservable().map { testies in
            return testies.map { testy in
                return Testy(entity: testy)
            }
        }
    }
    
    func register(_ testy: TestyEntity) -> Observable<Void> {
        return self.provider.rx.request(.register(testy: testy)).asObservable().discarded
    }
}
