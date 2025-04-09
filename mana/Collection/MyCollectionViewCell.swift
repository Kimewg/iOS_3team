import Foundation
import UIKit

// UICollectionView에서 사용할 사용자 정의 셀 (커스텀 셀)
class MyCollectionViewCell: UICollectionViewCell {
    // 셀 재사용 식별자
    static let identifier = "MyCollectionViewCell"
    // 셀 내부에 표시할 라벨 정의
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private let comicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    // 초기화 시 UI 구성
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //  Congifure Label
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(comicImageView)
        
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        comicImageView.frame = CGRect(x: (contentView.frame.width - 100)/2, y: 10, width: 100, height: 100)
            comicImageView.contentMode = .scaleAspectFit
            comicImageView.clipsToBounds = true

            titleLabel.frame = CGRect(x: 10, y: 115, width: contentView.frame.width - 20, height: 20)
            priceLabel.frame = CGRect(x: 10, y: 140, width: contentView.frame.width - 20, height: 15)
    }
    // 셀에 뷰모델 데이터를 적용하는 메서드
    func configure(with viewModel: CollectionViewCellViewModel) {
       // contentView.backgroundColor = viewModel.backgroundColor
        titleLabel.text = viewModel.name
        priceLabel.text = "\(viewModel.price)원"
        comicImageView.image = UIImage(named: viewModel.imageName)
    }
}
