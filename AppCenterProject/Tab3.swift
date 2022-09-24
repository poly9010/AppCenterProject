//
//  Tab3.swift
//  AppCenterProject
//
//  Created by 김민정 on 2021/07/30.
//

import Foundation
import UIKit

class Tab3:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView?
    let CellName:String = "tab3CustomCell"

    
    @IBOutlet weak var tab3View:UIView?

    override func viewDidLoad() {
        print("세번째 탭 입니다")
        super.viewDidLoad()
        
        self.tab3View?.layer.shadowColor = UIColor.gray.cgColor
        self.tab3View?.layer.shadowOffset = CGSize(width:0,height: 1)
        self.tab3View?.layer.shadowRadius = 3.0
        self.tab3View?.layer.shadowOpacity = 0.3
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
    

    
    }
    //테이블뷰의 한 섹션당 몇개의 셀을 담을 것 인지 리턴하는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //여기에 현재 받은 상 벌점의 개수를 반환하는 코드를 작성합니다.
        return 5
    }
    
    //각 행에 해당하는 셀(의 내용)을 리턴해주는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //여기에 각 행마다 상벌점을 받은 날짜, 상벌점의 내용, 상벌점의 점수, 총 합계를 추가합니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: CellName, for: indexPath) as! tab3TableViewCell
            
        cell.dateCellLabel?.text = "2000.00.00"
        cell.pointCellLabel?.text = "5"
        cell.pointNameCellLabel?.text = "우수 사생"
        cell.pointSumCellLabel?.text = "10"
        return cell
    }
    
    // 상점 기준을 보여주는 컨트롤러에서 엑스 버튼을 누를시 다시 탭 3화면으로 돌아오도록 하는 함수입니다.
    @IBAction func plusButton(_ sender: UIButton){
        guard let plus = self.storyboard?.instantiateViewController(withIdentifier: "plusView") else{
            print("상점 기준 화면 전환 실패")
            return
        }
        plus.modalPresentationStyle = .fullScreen
        self.present(plus, animated: true)
        
    }
    // 벌점 기준을 보여주는 컨트롤러에서 엑스 버튼을 누를시 다시 탭 3화면으로 돌아오도록 하는 함수입니다.
    @IBAction func minusButton(_ sender: UIButton){
        guard let minus = self.storyboard?.instantiateViewController(withIdentifier: "minusView") else{
            print("벌점 기준 화면 전환 실패")
            return
        }
        minus.modalPresentationStyle = .fullScreen
        self.present(minus, animated: true, completion: nil)
    }
  
}
