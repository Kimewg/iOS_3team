//
//  mana.Alert.swift
//  mana
//
//  Created by 강성훈 on 4/9/25.
//
import UIKit

struct Alert {
    static func showCancelAlert(on viewController: UIViewController, confirmHandler: @escaping () -> Void){
        let alert = UIAlertController(title : "장바구니 비우기", message: "장바구니를 비우시겠습니까", preferredStyle: .alert)
        
        let sucess = UIAlertAction(title: "네", style: .default){
            action in
            confirmHandler()
            print("장바구니를 비웠습니다")
        }
        let cancel = UIAlertAction(title: "아니오", style: .default){
            cancel in
            print("취소하였습니다")
            
        }
        alert.addAction(sucess)
        alert.addAction(cancel)
        
        viewController.present(alert, animated: true)
    }
}
