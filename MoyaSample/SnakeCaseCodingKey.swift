//
//  SnakeCaseCodingKey.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/16.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

protocol SnakeCaseCodingKey: CodingKey {}
extension SnakeCaseCodingKey where Self: RawRepresentable, Self.RawValue == String {
    var stringValue: String {
        return self.rawValue.replacingOccurrences(of: "([A-Z])", with: "_$1", options: .regularExpression).lowercased()
    }
}
