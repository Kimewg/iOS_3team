//
//  ViewController.swift
//  mana
//
//  Created by 김은서 on 4/7/25.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    // 테이블 뷰 생성
    let tableview = UITableView()
    var choiceComic: [Comic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComic()
        //여기서 값 정함
        
        //임시 버튼 설정, 결제버튼,총 금액라벨 관련 설정 부분
        configureTotalButton()
        view.addSubview(totalbutton)
        view.addSubview(totallabel)
        view.addSubview(totalcancelButton)
        view.addSubview(samplebutton)
        
        samplebutton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(70)
            $0.top.equalToSuperview().inset(200)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        totalbutton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        totalcancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        totallabel.snp.makeConstraints {
            $0.bottom.equalTo(totalbutton.snp.top).offset(-10)
            $0.centerX.equalToSuperview()
        }
        totalbutton.addTarget(self, action: #selector(clickCalculateButton), for: .touchUpInside)
        totalcancelButton.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
        samplebutton.addTarget(self, action: #selector(clickAddDatabutton), for: .touchUpInside)
        
        //tabelview에 표시할 셀의 속성정보
        tableview.register(ComicCell.self, forCellReuseIdentifier: "ComicCell")
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.layer.cornerRadius = 10
        tableview.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        
        //테이블뷰 레이아웃
        tableview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(500)
            $0.bottom.equalToSuperview().inset(150)
            
        }
    }
    @objc func clickCalculateButton() {
        var chooseComic: [String:Int] = [:]
        for cell in tableview.visibleCells{
            if let comicCell = cell as? ComicCell {
                let title = comicCell.comicdata.title
                let count = comicCell.count
                if count > 0 {
                    chooseComic[title] = count
                }
            }
        }
        let totalPrice = calculatePrice(chooseComic)
        totallabel.text = "총합: \(totalPrice)원"
    }
    @objc func clickCancelButton() {
        Alert.showCancelAlert(on: self){
            comicCountDic.removeAll()
            self.choiceComic.removeAll()
            totallabel.text = "총합: 0원"
            self.tableview.reloadData()
        }
    
    }
    @objc func clickAddDatabutton() {
            //여기다가 데이터 추가 메서드
        let newTitle = ["이누야샤","원피스","나루토"]
        let newComic = newTitle.compactMap{ comicTitle[$0] }
        
        //ContentsOf는 배열에 여러 요소를 한꺼번에 추가할때 사용하는 문법.
        
        choiceComic.append(contentsOf: newComic)
        tableview.reloadData()
        
        }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choiceComic.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = choiceComic[indexPath.row] //여기서 값 정함
        let cell = tableview.dequeueReusableCell(withIdentifier: "ComicCell", for: indexPath) as! ComicCell // 강제 캐스팅 해야함
        cell.cellConfigure(with: comic)
        cell.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        return cell
    }
}



