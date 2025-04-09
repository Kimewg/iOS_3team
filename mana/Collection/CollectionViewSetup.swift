import UIKit

// MARK: - 컬렉션 뷰 초기 설정 메서드
extension ViewController {
    
    // 컬렉션 뷰의 델리게이트, 데이터소스 설정 및 셀 등록
    func configureCollectionView() {
        collectionView.delegate = self // 셀 선택, 레이아웃 등의 이벤트 처리
        collectionView.dataSource = self // 셀의 개수와 내용 설정
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier) // 커스텀 셀 등록
    }
}
// MARK: - UICollectionViewDataSource (컬렉션 뷰에 표시할 데이터 설정)
extension ViewController: UICollectionViewDataSource {
    
    // 컬렉션 뷰에 몇 개의 섹션을 표시할지 설정 (여기선 1개)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 각 섹션에 몇 개의 셀이 들어갈지 설정 (viewModels 배열의 개수만큼)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    // indexPath에 해당하는 셀을 생성 및 구성하여 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀을 재사용 큐에서 꺼내오기
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyCollectionViewCell.identifier,
            for: indexPath
        ) as? MyCollectionViewCell else {
            // 셀 타입이 맞지 않을 경우 앱 종료
            fatalError("Could not dequeue MyCollectionViewCell")
        }

        // 해당 인덱스의 뷰모델로 셀 구성
        cell.configure(with: viewModels[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout (셀의 크기 설정)
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.size.width - 90) / 2  // 여백을 고려하여 두 셀을 나란히 표시
            let height: CGFloat = 168  // 셀 높이
            return CGSize(width: width, height: height)
        }
        
        // 가로 간격 설정 (셀 간 간격)
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 30  // 가로 간격 30
        }
        
        // 세로 간격 설정 (셀 간 세로 간격)
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 30  // 세로 간격 30
        }}

// MARK: - UICollectionViewDelegate (필요 시 셀 선택 등의 처리)
extension ViewController: UICollectionViewDelegate { }

