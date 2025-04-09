import UIKit
import SnapKit

class ViewController: UIViewController {

    let cellMultiplier: CGFloat = 0.5
    var viewModels: [CollectionViewCellViewModel] = []
    // 컬렉션 뷰에 사용할 데이터
    
    // 컬렉션 뷰 정의
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    // 스크롤뷰를 전역 프로퍼티로 선언
    var scrollView: UIScrollView!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // 버튼 타이틀 배열
        let buttonTitle = ["스포츠", "호러", "로맨스", "액션"]
        
        // 버튼들 생성
        let buttons = buttonTitle.map { ButtonUI(title: $0) }
        
        // 스택뷰 생성
        let stackView = StackViewUI(buttons)
        
        // 스크롤뷰 생성
        scrollView = scrollViewUI(stackView)

        // 스크롤뷰 추가 및 제약 설정
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        setupComic() // 딕셔너리 초기화
          
          // 액션 카테고리만 가져오기
          if let actionComics = comicCategory["액션"] {
              viewModels = actionComics.map {
                  CollectionViewCellViewModel(name: $0.title, price: $0.price, imageName: $0.imageName)
              }
          }
        
        // 컬렉션 뷰 설정
        configureCollectionView()
        configureLayout()

    }
}

