//
//  ViewController.swift
//  MoyaSample
//
//  Created by Atsushi Miyake on 2018/02/14.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TestyRepository.shared.testies
            .subscribe(onNext: { testies in
                print(testies)
            }, onError: { error in
                print(error)
            }).disposed(by: self.disposeBag)
        
        let entity = TestyEntity(testyId: 1)
        TestyRepository.shared.register(testy: entity)
            .subscribe(onNext: { _ in
                print("Post request success")
            }, onError: { error in
                print(error)
            }).disposed(by: self.disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

