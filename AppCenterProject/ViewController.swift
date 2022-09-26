//
//  ViewController.swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/07/18.
//

import UIKit
import SystemConfiguration

class ViewController: UIViewController {

    var isIdSaving:Bool?
    var isAutoLogin:Bool?
    @IBOutlet var idText:UITextField?
    @IBOutlet var pwText:UITextField?
    @IBOutlet var autoLoginBtn:UIButton?//자동로그인 체크박스
    @IBOutlet var idSavingBtn:UIButton?//아이디저장 체크박스
    
    override func viewWillAppear(_ animated: Bool) {
        if let userId = UserDefaults.standard.string(forKey: "id"),let userPw = UserDefaults.standard.string(forKey: "pw"){
            autoLoginBtn?.isSelected = true
            self.idText?.text = userId
            self.pwText?.text = userPw
            
        }
        else if let userIdSaving = UserDefaults.standard.string(forKey: "idsaving"){
            idSavingBtn?.isSelected = true
            self.idText?.text = userIdSaving
        }
        else{
            print("저장된 아이디와 비밀번호가 없음")
            autoLoginBtn?.isSelected = false
            idText?.text = nil
            pwText?.text = nil
            return
        }
        super.viewWillAppear(true)
        print("로그인 화면이 나타납니다")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("로그인화면입니다")
    }
    //자동로그인 체크 시 실행 함수( 자동로그인 체크 시 아이디 저장 버튼 또한 자동 체크 )
    @IBAction func autoLoginAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{//자동로그인이 체크되었을 시
            idSavingBtn?.isSelected = true//아이디 저장 또한 체크
            isAutoLogin = true
        }else{
            isAutoLogin = false
        }
    }
    
    //아이디저장 체크 시 실행 함수
    @IBAction func idSavingAction(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            isIdSaving = true
        }else{
            isIdSaving = false
        }
    }
    
    @IBAction func loginButton(_ sender:UIButton){
        if LoginIsVaild() == 1{ //로그인 성공 여부
            guard let tabBarController = self.storyboard?.instantiateViewController(identifier:"tabBarController") else{
                print("메인 화면으로 전환 실패")
                return
            }
              self.navigationController?.pushViewController(tabBarController, animated: true)
        }
        else{
            print("로그인 실패")
            simpleAlert(title: "로그인 실패", message: "아이디와 비밀번호룰 확인해주세요")
            return
        }
    }
    
    
    //로그인 여부 함수( 성공 or 실패 )
    func LoginIsVaild() -> Int{
        let login:Int = 1
        //서버 이동 -> 로그인 성공 or 실패 여부 확인
        if login == 1{
            if self.isAutoLogin == true {
                print("Auto Login")
                UserDefaults.standard.set(idText?.text, forKey: "id")
                UserDefaults.standard.set(pwText?.text, forKey: "pw")
                return 1
                }
            else if isIdSaving == true{
                print("id saving")
                UserDefaults.standard.set(idText?.text,forKey: "idsaving")
                return 1
            }
            else{
                print("자동로그인하지 않고 로그인")
                return 1
            }
    }
        else{
            print("로그인 실패")
            return 0
        }
    }

    /*
    @IBAction func moveToDefault(_ sender:Any){
        guard let tab1 = self.storyboard?.instantiateViewController(identifier:"Tab1") else{
            print("디폴트 화면으로 전환 실패")
            return
        }
        tab1.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(tab1, animated: true)
        
    }
 
*/
    //알림 
     func simpleAlert(title:String,message:String){
        let alert = UIAlertController(title:title,message: message,preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
        let cancelAction = UIAlertAction(title:"취소",style:.cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
    }
    
    
}
    

  
    
    



