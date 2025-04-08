//
//  ViewController.swift
//  mana
//
//  Created by 김은서 on 4/7/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let a = "tableview_12"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        genreCategory()
    }
    //버튼 및 스택뷰 구성
    func genreCategory() {
        let genres = ["스포츠", "호러", "로맨스", "액션", "그때 그 시절"]
        var genreButtons: [UIButton] = []
        let genreScroll = UIScrollView()
//        genreScroll.showsHorizontalScrollIndicator = false
//           genreScroll.translatesAutoresizingMaskIntoConstraints = false
//           view.addSubview(genreScroll)

        //장르 버튼이 들어갈 가로 스택뷰
        let genreStack = UIStackView()
        genreStack.axis = .horizontal
        genreStack.spacing = 19
        genreStack.distribution = .fillEqually
        genreStack.translatesAutoresizingMaskIntoConstraints = false
       
        
        view.addSubview(genreScroll)
        genreScroll.addSubview(genreStack)
//        genreStack.addNewView(button)
        
        genreScroll.snp.makeConstraints {
            $0.top.equalToSuperview().inset(101)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44
            )
        }
        
        genreStack.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(101)
            $0.height.equalTo(717)
        }
        
        
        for genre in genres {
            let button = UIButton(type: .custom)
            button.setTitle(genre, for: .normal)
            button.setTitleColor(UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0), for: .normal)
            button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
            button.backgroundColor = .clear
            //            button.frame = (width: 80, height: 34)
            button.layer.borderColor = (CGColor(red: 1, green: 0.45, blue: 0, alpha: 1.0)/*, for: .normal*/)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 40
            button.addTarget(self, action: #selector(genreTapped(_:)), for: .touchUpInside)
            
            genreStack.addArrangedSubview(button)
            
        }
//        return genreCategory() ->GENERAL 카테고리 함수 안에서 함수를 재호출하는 과정이기 때문에 영원히 호출될 가능성 다분함. 삭제 요망.
    
        
    }
    
    @objc func genreTapped(_ sender: UIButton) {
        //버튼 클릭 및 스크롤 기능 넣기
        let title = sender.currentTitle ?? ""
        
        if
    }
   
}
