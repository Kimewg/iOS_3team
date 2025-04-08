//
//  MangaCollectionViewCell.swift
//  mana
//
//  Created by ios_starter on 4/8/25.
//

import UIKit
import SnapKit

class MangaCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let infoBackgroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMangaCollection()
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMangaCollection() {
        [imageView,infoBackgroundView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFill //이미지 잘리지 않고 크기 유지

//        imageView.image = UIImage(named: "manga_sample_1")
        
        infoBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        infoBackgroundView.layer.cornerRadius = 30
        infoBackgroundView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }
    func setupCellLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview())
        }
        infoBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(imageView)
            make.height.equalTO(55)
        }
    }
}

