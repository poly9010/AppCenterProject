//
//  Tab4.swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/07/30.
//

import Foundation
import UIKit
// 상점 기준 리스트 컨트롤러
class plusView:UIViewController{
    override func viewDidLoad() {
        print("상점 기준 뷰입니다.")
    }
    // 상점 기준 리스트 창을 사라지도록 하는 버튼 제어 함수입니다.
    @IBAction func dissmissplusView(_sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
