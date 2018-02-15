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

    var testy: Observable<Testy> {
        return self.provider.rx.request(.testy).map(TestyEntity.self).map(Testy.init).asObservable()
    }
}
