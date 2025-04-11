import UIKit

struct Alert {
    static func showCancelAlert(on viewController: UIViewController, confirmHandler: @escaping () -> Void){
        let alert = UIAlertController(title : "마나 초기화", message: "마나를 비우시겠습니까", preferredStyle: .alert)
        
        let sucess = UIAlertAction(title: "네", style: .default){
            action in
            confirmHandler()
            print("모든 마나를 비웠습니다")
        }
        let cancel = UIAlertAction(title: "아니오", style: .default){
            cancel in
            print("스킬 사용을 취소하였습니다")
            
        }
        
        alert.addAction(cancel)
        alert.addAction(sucess)

        viewController.present(alert, animated: true)
    }
}
