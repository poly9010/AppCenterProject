//
//  tab2.swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/07/30.
//

import Foundation
import UIKit

class Tab2:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tab2View:UIView?
    @IBOutlet weak var tab2TableView1:UITableView?
    @IBOutlet weak var tab2TableView2:UITableView?
    @IBOutlet weak var tab2TableView3:UITableView?
    @IBOutlet weak var tab2TableView4:UITableView?
    
    //각 테이블뷰에 몇개의 섹션이 들어갈지 갯수를 반환해주는 메소드입니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tab2TableView1{
            return 5
        }
        else if tableView == tab2TableView2{
            return 5
        }
        else if tableView == tab2TableView4{
            return 3
        }
        else{
            return 3
        }
    }
    
    //각 테이블 뷰에 어떤 내용이 들어갈지 테이블뷰 셀을 반환해주는 메소드입니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tab2TableView1{
            let cell1 = UITableViewCell()
            cell1.textLabel?.text = "테이블뷰 1의 셀입니다"
            return cell1
        }
        else if tableView == tab2TableView2{
            let cell2 = UITableViewCell()
            cell2.textLabel?.text = "테이블뷰 2의 셀입니다"
            return cell2
        }
        else if tableView == tab2TableView3{
            let cell3 = UITableViewCell()
            cell3.textLabel?.text = "테이블뷰 3의 셀입니다."
            return cell3
        }
        else{
            let cell4 = UITableViewCell()
            cell4.textLabel?.text = "테이블뷰 4의 셀입니다."
            return cell4
        }
    }
    
    
    override func viewDidLoad() {
        print("두번째 탭 입니다")
        //상단바의 그림자를 설정합니다.
        self.tab2View?.layer.shadowColor = UIColor.gray.cgColor
        self.tab2View?.layer.shadowOffset = CGSize(width:0,height: 1)
        self.tab2View?.layer.shadowRadius = 3.0
        self.tab2View?.layer.shadowOpacity = 0.3
        
        // 각 테이블뷰의 델리게이트와 데이터 소스를 설정합니다.
        self.tab2TableView1?.delegate = self
        self.tab2TableView1?.dataSource = self
     
        
        self.tab2TableView2?.delegate = self
        self.tab2TableView2?.dataSource = self
      
        
        self.tab2TableView3?.delegate = self
        self.tab2TableView3?.dataSource = self
        
        self.tab2TableView4?.delegate = self
        self.tab2TableView4?.dataSource = self

        
    }
    
    
}
