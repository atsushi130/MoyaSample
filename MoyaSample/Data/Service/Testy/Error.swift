//
// Created by Atsushi Miyake on 2018/04/30.
// Copyright (c) 2018 Atsushi Miyake. All rights reserved.
//

import Foundation

struct ServiceError: Error, Codable {
    let statusCode: Int
    let message: String
}