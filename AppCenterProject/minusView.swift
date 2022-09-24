//
//  minusView.swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/08/25.
//

import Foundation
import UIKit
// 벌점 기준 리스트 컨트롤러
class minusView:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("벌점 기준 뷰입니다.")
    }
    // 벌점 기준 리스트 창을 사라지도록 하는 버튼 제어 함수입니다.
    @IBAction func dissmissminusView(_sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
