//
//  mana.totalbutton.swift
//  mana
//
//  Created by 강성훈 on 4/9/25.
//
import UIKit
import SnapKit
//임시로 설정해서 확인하고, 나중에 다른 팀원의 버튼과 라벨과 연결할거임.
let totalbutton = UIButton()
let totalcancelButton = UIButton()
let totallabel = UILabel()
let samplebutton = UIButton()

func configureTotalButton() {
    totalbutton.setTitle("계산하기", for: .normal)
    totalbutton.setTitleColor(.white, for: .normal)
    totalbutton.backgroundColor = .orange
    totalbutton.layer.cornerRadius = 10
    
    samplebutton.setTitle("만화데이터추가", for: .normal)
    samplebutton.titleLabel?.font = .systemFont(ofSize: 15)
    samplebutton.setTitleColor(.white, for: .normal)
    samplebutton.backgroundColor = .orange
    samplebutton.layer.cornerRadius = 10
    
    
    totalcancelButton.setTitle("전체취소", for: .normal)
    totalcancelButton.setTitleColor(.orange, for: .normal)
    totalcancelButton.backgroundColor = .black
    totalcancelButton.layer.cornerRadius = 10
    
    totallabel.text = "총합: 0원"
    totallabel.font = .systemFont(ofSize: 16, weight: .medium)
    totallabel.textColor = .darkGray
    totallabel.textAlignment = .center
}

