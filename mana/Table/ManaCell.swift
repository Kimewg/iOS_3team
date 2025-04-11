import UIKit
import SnapKit

//장바구니 수량 업데이트
protocol ComicCellDelegate: AnyObject {
    func comicCell(_ cell: ComicCell, didUpdateCount count: Int)
    //마나 부족 알럿 호출.
    func showManaWarningAlert()
    func removeComic(_ comic: Comic)
}

class ComicCell: UITableViewCell {
    //델리게이트 선언
    weak var delegate: ComicCellDelegate?

       var count: Int = 0 {
           didSet {
               countlabel.text = "\(count)"
               cartCountLabel.text = "\(count)"
               pricelabel.text = "\(comicdata.price * count)원"
               comicCountDic[comicdata.title] = count
               //값이 바뀔 때마다 델리게이트 호출
               delegate?.comicCell(self, didUpdateCount: count)
           }
       }
    
    let titlelabel = UILabel()
    let pricelabel = UILabel()
    let countlabel = UILabel() // 장바구니 개별 수량 카운트 용
    let plusbutton = UIButton()
    let minusbutton = UIButton()
    let cartCountLabel = UILabel()  //장바구니 총 갯수 업데이트 위한 셀 수량 파악용
//    var count = 0
    var comicdata: Comic!
    
    func cellConfigure(with comic: Comic) {
        self.comicdata = comic

        // 제목이 11글자 이후는 생략
        let maxTitleLength = 11
        if comic.title.count > maxTitleLength {
            let index = comic.title.index(comic.title.startIndex, offsetBy: maxTitleLength)
            titlelabel.text = String(comic.title[..<index]) + "..."
        } else {
            titlelabel.text = comic.title
        }

        pricelabel.text = "\(comic.price)원"
        count = comicCountDic[comic.title] ?? 0
        countlabel.text = "\(count)"
        
        if count == 0 {
                  let trashImage = UIImage(systemName: "trash")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
                  minusbutton.setImage(trashImage, for: .normal)
                  minusbutton.setTitle("", for: .normal)
              } else {
                  minusbutton.setImage(nil, for: .normal)
                  minusbutton.setTitle("–", for: .normal)
              }
    }

    //초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout() //셀 속성, 레이아웃
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //여기서부터 각 셀의 레이아웃
    func setupLayout() {
        //각각 요소들을 뷰에 띄워주기
        [titlelabel, pricelabel, countlabel, plusbutton, minusbutton].forEach {
            contentView.addSubview($0)
        }
        //폰트 및 스타일 설정
        titlelabel.font = UIFont(name: "Pretendard-Medium", size: 14)
        titlelabel.textColor = .white
        pricelabel.font = UIFont(name: "Pretendard-Medium", size: 14)
        pricelabel.textColor = .white
        pricelabel.textAlignment = .right
        
        countlabel.text = "0"
        countlabel.textColor = .white
        countlabel.textAlignment = .center
        
        minusbutton.setTitle("–", for: .normal)
        plusbutton.setTitle("+", for: .normal)
        
        minusbutton.setTitleColor(.orange, for: .normal)
        plusbutton.setTitleColor(.orange, for: .normal)
        
        minusbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        plusbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        minusbutton.addTarget(self, action: #selector(minusClick), for: .touchUpInside)
        plusbutton.addTarget(self, action: #selector(plusClick), for: .touchUpInside)
        
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
    @objc func plusClick(sender: UIButton) {
        if count >= 10 {
                delegate?.showManaWarningAlert() // 델리게이트 호출
                return
            }
            count += 1
        
        minusbutton.setImage(nil, for: .normal)
        minusbutton.setTitle("-", for: .normal)
//        //comicCountDic에 카운트 저장.
//        comicCountDic[comicdata.title] = count
//        countlabel.text = "\(count)"
//        pricelabel.text = "\(comicdata.price * count)원"
//        return
    }
    @objc func minusClick(sender: UIButton) {
        if count > 0 {
            count -= 1
            
            //수량이 0이 되었을 때 버튼을 휴지통으로 변경
        if count == 0 {
            let trashImage = UIImage(systemName: "trash")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
            minusbutton.setImage(trashImage, for: .normal)
            minusbutton.setTitle("", for: .normal)
    }
        } else {
            //수량이 이미 0인데 다시 누르면 셀 제거
            delegate?.removeComic(comicdata)
        }
    }
}
