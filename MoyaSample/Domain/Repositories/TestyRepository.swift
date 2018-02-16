//
//  TestyRepository.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/15.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import RxSwift
import RxMoya
import Moya

struct TestyRepository {
    
    static let shared    = TestyRepository()
    private let provider = MoyaProvider<TestyRequest>()
    
    private init() {}

    var testies: Observable<[Testy]> {
        return self.provider.rx.request(.testy).map([TestyEntity].self).asObservable().map { testies in
            return testies.map { testy in
                return Testy(entity: testy)
            }
        }
    }
}
