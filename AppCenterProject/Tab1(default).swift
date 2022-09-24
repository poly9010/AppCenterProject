//
//  Tab1(default).swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/07/26.
//

import Foundation
import UIKit
import WebKit

class Tab1:UIViewController {
    
    //로그아웃 버튼을 제어하는 함수입니다.
    @IBAction func LogoutButton(_sender:UIButton) {
        // 로그아웃 버튼을 누를 시 휴대폰에 저장되어있는 userdefault의 정보를 삭제하고, 로그인 화면으로 넘어갑니다.
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pw")
        self.navigationController?.popViewController(animated: true)
}
    

 
    @IBOutlet weak var tab1View: UIView?
    @IBOutlet weak var infoCard: UIView?


    
    override func viewDidLoad() {
        print("첫번째 탭 입니다")
        super.viewDidLoad()
        loadWebPage("http://www.naver.com")
        self.tab1View?.layer.shadowColor = UIColor.gray.cgColor
        self.tab1View?.layer.shadowOffset = CGSize(width:0,height: 1)
        self.tab1View?.layer.shadowRadius = 3.0
        self.tab1View?.layer.shadowOpacity = 0.3
        print("tab1 ")
        
    }
    
    @IBOutlet weak var webView:WKWebView?
    
    func loadWebPage(_ url: String) {
        guard let myUrl = URL(string: url) else{
            return
        }
        let request = URLRequest(url:myUrl)
        webView?.load(request)
    }
    
    // 알림창 구현 함수입니다.(간단한 알림을 구현)
    func simpleAlert(title:String,message:String) {
       let alert = UIAlertController(title:title,message: message,preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
       let cancelAction = UIAlertAction(title:"취소",style:.cancel,handler: nil)
       
       alert.addAction(okAction)
       alert.addAction(cancelAction)
       
       present(alert,animated: true)
   }
    
}
