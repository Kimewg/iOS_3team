import UIKit
import SnapKit

// ViewController의 레이아웃 구성 확장
extension ViewController {
    // 컬렉션 뷰를 View에 추가하고 오토레이아웃 설정
    func configureLayout() {
        view.addSubview(collectionView) // 컬렉션 뷰를 뷰 계층에 추가
               
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(75) // 스크롤뷰 아래로 75포인트 떨어지게
            make.left.right.equalToSuperview().inset(30) // 양옆 여백 30
            make.height.equalTo((168 * 2)+30)
        }
    }
}
