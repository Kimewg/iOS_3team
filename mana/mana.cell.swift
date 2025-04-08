//
//  mana.swift
//  mana
//
//  Created by 강성훈 on 4/8/25.
//

import UIKit
import SnapKit

class ComicCell: UITableViewCell {
    let titlelabel = UILabel()
    let pricelabel = UILabel()
    let countlabel = UILabel()
    let plusbutton = UIButton()
    let minusbutton = UIButton()
    
    func configure(with comic: comic) {
        titlelabel.text = comic.title
        pricelabel.text = "\(comic.price)원"
    }
    //초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout() //셀 속성, 레이아웃
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //여기서부터 레이아웃
    func setupLayout() {
        //각각 요소들을 뷰에 띄워주기
        [titlelabel, pricelabel, countlabel, plusbutton, minusbutton].forEach {
            contentView.addSubview($0)
        }
        //폰트 및 스타일 설정
        titlelabel.font = .systemFont(ofSize: 16)
        pricelabel.font = .boldSystemFont(ofSize: 14)
        pricelabel.textAlignment = .right
        
        countlabel.text = "0"
        countlabel.textAlignment = .center
        
        minusbutton.setTitle("–", for: .normal)
        plusbutton.setTitle("+", for: .normal)
        
        minusbutton.setTitleColor(.orange, for: .normal)
        plusbutton.setTitleColor(.orange, for: .normal)
        
        minusbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        plusbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        //SnapKit 제약 설정
        titlelabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        pricelabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
        
        countlabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(30)
        }
        
        minusbutton.snp.makeConstraints {
            $0.trailing.equalTo(countlabel.snp.leading).offset(0)
            $0.centerY.equalTo(countlabel)
        }
        
        plusbutton.snp.makeConstraints {
            $0.leading.equalTo(countlabel.snp.trailing).offset(0)
            $0.centerY.equalTo(countlabel)
        }
    }
}

