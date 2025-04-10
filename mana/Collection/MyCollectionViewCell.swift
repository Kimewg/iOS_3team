import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    private var comic: Comic?
    
    private let comicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.orange.cgColor
        imageView.layer.borderWidth = 3
        
        return imageView
    }()

    private let infoBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Regluar", size: 11)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let cellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.45, blue: 0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonTapped() {
        guard let comic = comic else { return }
                NotificationCenter.default.post(name: NSNotification.Name("ComicAdded"), object: comic)
       }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(comicImageView)
        contentView.addSubview(infoBackgroundView)
        infoBackgroundView.addSubview(titleLabel)
        infoBackgroundView.addSubview(priceLabel)
        infoBackgroundView.addSubview(cellButton)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        comicImageView.snp.makeConstraints {
            $0.edges.equalToSuperview() // 이미지가 셀 전체 채움
        }

        infoBackgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.35) // 아래쪽 35% 차지
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.lessThanOrEqualTo(cellButton.snp.leading).offset(-8)
        }

        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.trailing.lessThanOrEqualTo(cellButton.snp.leading).offset(-8)
        }

        cellButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(50)
            $0.height.equalTo(25)
        }
    }

    func configure(with viewModel: CollectionViewCellViewModel) {
        comicImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.name
        priceLabel.text = "\(viewModel.price)원"
        comic = viewModel.comic
    }
}
