//
// Created by Atsushi Miyake on 2018/04/30.
// Copyright (c) 2018 Atsushi Miyake. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {

    func fill<A>( _ value: A) -> Observable<A> {
        return map { _ in value }
    }

    var discarded: Observable<()> {
        return self.fill(())
    }
}