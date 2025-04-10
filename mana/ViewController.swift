import UIKit
import SnapKit

class ViewController: UIViewController {
    let genreScroll = UIScrollView()
    let genreStack = UIStackView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        return cv
    }()
    let tableview = UITableView()
    let totalbutton = UIButton()
    let totalcancelButton = UIButton()
    let paylabel = UILabel()
    let totallabel = UILabel()
    let totalCountLabel = UILabel()
    let cellMultiplier: CGFloat = 0.5
    var viewModels: [CollectionViewCellViewModel] = []
    var choiceComic: [Comic] = []
    let fitstLabel = ComicLabelFactory.makeLabel(
            text: "마나Check",
            fontName: "BlackHanSans-Regular",
            fontSize: 46,
            alignment: .center
        )
    
    override func viewDidLoad() {
        let a = "eunseo"
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(addComicToCart(_:)), name: NSNotification.Name("ComicAdded"), object: nil)
        
        setupComic()
        
        // 기본 값: 액션 카테고리
        if let actionComics = comicCategory["스포츠"] {
            viewModels = actionComics.map { CollectionViewCellViewModel(comic: $0) }
        }
        // 라벨 추가 및 제약 설정
        view.addSubview(fitstLabel)
        fitstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.leading.equalToSuperview().inset(24)
               }

        genreCategory()
        configureCollectionView()
        configureTotalButton()
        configureTableView()
        layoutViews()
        configureLayout()
    }
    
    @objc func addComicToCart(_ notification: Notification) {
            guard let comic = notification.object as? Comic else { return }
 
        let currentCount = comicCountDic[comic.title] ?? 0

        // 10개 이상이면 추가 막고 알럿 표시
        if currentCount >= 10 {
            showManaWarningAlert()
            return
        }

        if currentCount > 0 {
            comicCountDic[comic.title] = currentCount + 1
        } else {
            comicCountDic[comic.title] = 1
            choiceComic.append(comic)
        }

            tableview.reloadData()
        
        updateTotalCountLabel() // 총 개수 라벨 업데이트
        updateTotalPriceLabel() // 결제금액 업데이트
       
        }
    
    // MARK: - 장르 스크롤 뷰 + 버튼
    func genreCategory() {
        let genres = ["스포츠", "호러", "로맨스", "액션", "추억의 만화"]
        genreStack.axis = .horizontal
        genreStack.spacing = 19
        genreStack.distribution = .fillEqually
        genreScroll.showsHorizontalScrollIndicator = false
        
        view.addSubview(genreScroll)
        genreScroll.addSubview(genreStack)
        
        genreScroll.snp.makeConstraints {
            
            $0.top.equalTo(fitstLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        genreStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(44)

        }
        
        for genre in genres {
            let button = UIButton(type: .custom)
            button.setTitle(genre, for: .normal)
            button.setTitleColor(UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0), for: .normal)
            button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
            button.backgroundColor = .clear
            button.layer.borderColor = UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0).cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 22
            button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 8, right: 11)
            button.addTarget(self, action: #selector(genreTapped(_:)), for: .touchUpInside)
               
            button.snp.makeConstraints {
                $0.height.equalTo(34)
                 
            }
            
            genreStack.addArrangedSubview(button)
        }
    }
    
    @objc func genreTapped(_ sender: UIButton) {
        guard let selectedGenre = sender.currentTitle,
              let comics = comicCategory[selectedGenre] else { return }
        
        viewModels = comics.map { CollectionViewCellViewModel(comic: $0) }
        collectionView.reloadData()
        
        // 선택된 버튼 스타일만 강조
        for case let button as UIButton in genreStack.arrangedSubviews {
            let isSelected = (button == sender)
            button.backgroundColor = isSelected ? UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0) : .clear
            button.setTitleColor(isSelected ? .white : UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0), for: .normal)
        }
    }
    
    // MARK: - 테이블뷰 설정
    func configureTableView() {
        tableview.register(ComicCell.self, forCellReuseIdentifier: "ComicCell")
        tableview.dataSource = self
        tableview.layer.cornerRadius = 10
        tableview.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5)
        view.addSubview(tableview)
    }
    
    // MARK: - 버튼,라벨 설정
    func configureTotalButton() {
        
        totalbutton.setTitle("결제하기", for: .normal)
        totalbutton.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        totalbutton.backgroundColor = UIColor(red: 1, green: 0.45, blue: 0, alpha: 1)
        totalbutton.layer.cornerRadius = 25
        totalbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        totalcancelButton.setTitle("전체취소", for: .normal)
        totalbutton.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        totalcancelButton.backgroundColor = .clear
        totalcancelButton.layer.borderWidth = 1.5
        totalcancelButton.setTitleColor(.orange, for: .normal)
        totalcancelButton.layer.borderColor = UIColor.orange.cgColor
        totalcancelButton.layer.cornerRadius = 25
        
        paylabel.text = "결제금액"
        paylabel.font = UIFont(name: "BlackHanSans-Regular", size: 20)
        paylabel.textColor = .white
        paylabel.textAlignment = .center
        
        totallabel.text = "0원"
        totallabel.font = UIFont(name: "BlackHanSans-Regular", size: 20)
        totallabel.textColor = .white
        totallabel.textAlignment = .center
        
        totalCountLabel.text = "총 0개"
        totalCountLabel.font = UIFont(name: "BlackHanSans-Regular", size: 20)
        totalCountLabel.textColor = .white
        totalCountLabel.backgroundColor = .clear
        
        totalbutton.addTarget(self, action: #selector(clickCalculateButton), for: .touchUpInside)
        totalcancelButton.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
    }
    
    // MARK: - 레이아웃
    func layoutViews() {
        view.addSubview(collectionView)
        view.addSubview(totalbutton)
        view.addSubview(totalcancelButton)
        view.addSubview(paylabel)
        view.addSubview(totallabel)
        view.addSubview(tableview)
        view.addSubview(totalCountLabel)
        
        tableview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(collectionView.snp.bottom).offset(50)
            $0.bottom.equalToSuperview().inset(180)
        }
        
        totalbutton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(143)
            $0.height.equalTo(52)        }
        
        totalcancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(143)
            $0.height.equalTo(52)
        }
        
        paylabel.snp.makeConstraints {
            $0.leading.equalTo(tableview.snp.leading)
            $0.bottom.equalTo(totalbutton.snp.top).offset(-10)
        }
        
        totallabel.snp.makeConstraints {
            $0.trailing.equalTo(tableview.snp.trailing)
            $0.bottom.equalTo(totalbutton.snp.top).offset(-10)
        }
        
        totalCountLabel.snp.makeConstraints {
            $0.leading.equalTo(tableview.snp.leading)
            $0.bottom.equalTo(tableview.snp.top).offset(-5)
        }
    }
    
    // MARK: - 버튼 액션
    @objc func clickCalculateButton() {
        var chooseComic: [String: Int] = [:]
        for cell in tableview.visibleCells {
            if let comicCell = cell as? ComicCell {
                let title = comicCell.comicdata.title
                let count = comicCell.count
                if count > 0 {
                    chooseComic[title] = count
                }
            }
        }
        if chooseComic.isEmpty {
             let alert = UIAlertController(title: "결제 스킬을 사용할 수 없습니다", message: "마나를 채워주세요", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
             present(alert, animated: true, completion: nil)
             return
         }
        let totalPrice = calculatePrice(chooseComic)
        totallabel.text = "결제금액: \(totalPrice)원"
        
        let alert = UIAlertController(title: "결제 스킬 사용", message: "결제가 완료되었습니다", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        self.reserCart()
    }
    
    @objc func clickCancelButton() {
        Alert.showCancelAlert(on: self) {
            self.reserCart()
        }
    }
    
    //장바구니 총 수량 업데이트 메서드
    func updateTotalCountLabel() {
        let totalCount = comicCountDic.values.reduce(0, +)
        totalCountLabel.text = "총 \(totalCount)개"
    }
    //결제금액 업데이트 메서드
    func updateTotalPriceLabel() {
        let totalPrice = comicCountDic.reduce(0) { partialResult, item in
            partialResult + (comicTitle[item.key]?.price ?? 0) * item.value
        }
        totallabel.text = "\(totalPrice)원"
    }
    func reserCart() {
        comicCountDic.removeAll()
        self.choiceComic.removeAll()
        self.totallabel.text = "0원"
        self.updateTotalCountLabel()
        self.tableview.reloadData()
    }
    
}
//장바구니 총갯수 업데이트 프로토콜
extension ViewController: ComicCellDelegate {
    //갯수, 금액 업데이트 하는 델리게이트
    func comicCell(_ cell: ComicCell, didUpdateCount count: Int) {
        updateTotalCountLabel() // <- 총 개수 라벨 업데이트
        updateTotalPriceLabel() // <- 결제금액 업데이트
    }
    //갯수 제한해서 알럿 띄우는 델리게이트
    func showManaWarningAlert() {
        let alert = UIAlertController(title: "마나 사용 초과", message: "준비한 마나가 부족합니다", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    // 셀 제거 델리게이트
    func removeComic(_ comic: Comic) {
        comicCountDic[comic.title] = nil
        if let index = choiceComic.firstIndex(where: { $0.title == comic.title }) {
            choiceComic.remove(at: index)
            tableview.reloadData()
            updateTotalCountLabel()
            updateTotalPriceLabel()
        }
    }
}

// MARK: - 테이블 뷰 데이터소스
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choiceComic.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = choiceComic[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "ComicCell", for: indexPath) as! ComicCell
        cell.cellConfigure(with: comic)
        cell.delegate = self
        cell.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        return cell
    }
}

