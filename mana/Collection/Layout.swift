import UIKit
import SnapKit

// ViewController의 레이아웃 구성 확장
extension ViewController {
    // 컬렉션 뷰를 View에 추가하고 오토레이아웃 설정
    func configureLayout() {
        view.addSubview(collectionView) // 컬렉션 뷰를 뷰 계층에 추가
               
        collectionView.snp.makeConstraints { make in
                make.top.equalTo(genreScroll.snp.bottom).offset(15)   // 장르 스크롤뷰 아래로 75pt
                make.left.right.equalToSuperview().inset(30)          // 좌우 여백 30pt
                make.height.equalTo((168 * 2) + 30)                    // 셀 2개 높이 + 여백
            }
    }
}
