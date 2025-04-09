//
//  ViewController.swift
//  mana
//
//  Created by 김은서 on 4/7/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var number: Int = 0
    let label = UILabel()
    let paymentButton = UIButton()
    let resetButton = UIButton()
    
    
    
    let fitstLabel: UILabel = {
        let label = UILabel()
        label.text = "마나Check"
        label.font = UIFont(name: "BlackHanSans-Regular", size: 46)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
        
    }()
    
    let totalLabell: UILabel = {
        let label = UILabel()
        label.text = "총 0개"
        label.textColor = .white
        label.font = UIFont(name: "pretendard-Bold", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    
    let totalLabel2: UILabel = {
        let label = UILabel()
        label.text = "결제금액"
        label.textColor = .white
        label.font = UIFont(name: "pretendard-Bold", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    
    let totalLabel3: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.textColor = .white
        label.font = UIFont(name: "pretendard-Bold", size: 16)
        label.textAlignment = .right
        
        return label
    }()
    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "전체취소"
        label.textColor = .white
        label.font = UIFont(name: "pretendard-Bold", size: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    let buttonLabel1: UILabel = {
        let label = UILabel()
        label.text = "전체결제"
        label.textColor = .white
        label.font = UIFont(name: "pretendard-Bold", size: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(totalLabell)
        view.addSubview(totalLabel2)
        view.addSubview(buttonLabel)
        view.addSubview(buttonLabel1)
        view.addSubview(totalLabel3)
       
        configureUI()
        
    
            setupFitstLabel()
            
        }
    
    
        
        private func configureUI() {
            
            paymentButton.setTitle("전체결제", for: .normal)
            paymentButton.setTitleColor(.white, for: .normal)
            paymentButton.backgroundColor = .orange
            paymentButton.layer.cornerRadius = 8
            paymentButton.addTarget(self, action: #selector(paymentButtonTapped), for: .touchDown)
            
            resetButton.setTitle("전체취소", for: .normal)
            resetButton.setTitleColor(.white, for: .normal)
            resetButton.layer.cornerRadius = 8
            resetButton.layer.borderWidth = 1
            resetButton.layer.borderColor = UIColor.orange.cgColor
            resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchDown)
            
            [label, paymentButton, resetButton]
                .forEach { view.addSubview($0) }
            
        }
        
        func setupFitstLabel() {
            view.addSubview(fitstLabel)
            
            fitstLabel.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(38)
                $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(24)
                $0.width.equalTo(225)
                $0.height.equalTo(58)
            }
            
            totalLabel3.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(38)
                $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
                $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
                $0.bottom.equalTo(460)
                $0.right.equalTo(0)
                
            }
            
            
            totalLabell.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-20)
                $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
                $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
                $0.bottom.equalTo(350)
                
                
            }
            
            totalLabel2.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-20)
                $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
                $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
                $0.height.equalTo(1350)
            }
            
            paymentButton.snp.makeConstraints {
                $0.top.equalTo(totalLabel3.safeAreaLayoutGuide.snp.top).offset(650)
                $0.width.equalTo(80)
                $0.right.equalTo(-100)
                
                
            }
            
            resetButton.snp.makeConstraints {
                $0.top.equalTo(totalLabel3.safeAreaLayoutGuide.snp.top).offset(650)
                $0.width.equalTo(80)
                $0.right.equalTo(-200)
            }
        }
        
        @objc
        private func paymentButtonTapped() {
            self.number = 1
            label.text = "\(buttonLabel1)"
        }
        
        @objc
        private func resetButtonTapped() {
            self.number = 0
            label.text = "\(buttonLabel)"
        }
    }
