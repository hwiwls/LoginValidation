//
//  Observable.swift
//  LoginValidation
//
//  Created by hwijinjeong on 2/23/24.
//

import Foundation

class Observable {
    
    private var closure: ((String) -> Void)?
    
    var text: String {
        didSet {
            closure?(text)
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(text)
        self.closure = closure
    }
}
