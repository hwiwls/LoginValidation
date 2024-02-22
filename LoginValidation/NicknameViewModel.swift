//
//  NicknameViewModel.swift
//  LoginValidation
//
//  Created by hwijinjeong on 2/23/24.
//

import Foundation

class NicknameViewModel {
    var inputText = Observable("")
    
    var outputResult = Observable("")
    
    init() {
        inputText.bind { value in
            self.validation(value)
        }
    }
    
    private func validation(_ text: String) {
        let text = inputText.text
        let specialChar = ["@", "#", "$", "%"]
        
        if text.isEmpty {
            outputResult.text = "닉네임을 입력해주세요"
        } else if text.count < 2 || text.count > 10 {
            outputResult.text = "닉네임은 1글자~10글자만 가능합니다."
        } else if specialChar.contains(where: text.contains) {
            outputResult.text = "@, #, $, %는 입력할 수 없습니다."
        } else {
            outputResult.text = "사용 가능한 닉네임입니다."
        }
    }
}
