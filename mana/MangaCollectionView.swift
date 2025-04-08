//
//  MangaCollectionView.swift
//  mana
//
//  Created by ios_starter on 4/8/25.
//

import UIKit
import SnapKit

class MainMenu: UICollectionView() {
    // 셀 초기화 시 UI 세팅
    override init(frame: CGRect) {
           super.init(frame: frame)
        //이건 collectionLayout을 컬렉션 뷰에 붙여주고 나서 layout 설정을 setupLayout()에서 세팅하는 방식
           self.collectionViewLayout = collectionLayout
           setupLayout()
           setupCollectionView()
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //컬렉션뷰, 레이아웃 빌드
    let collectionLayout = UICollectionViewFlowLayout()

    private func setupLayout() {
        collectionLayout.backgroundColor = .clear
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.sectionInset = UIEdgeInsets(top: 183, left: 34, bottom: 300, right: 33)
        collectionLayout.minimumInteritemSpacing = 50
        collectionLayout.isPagingEnabled = true
    }

    private func setupCollectionView() {
        self.backgroundColor = .clear
        self.register(mangaCell.self, forCellWithReuseIdentifier: mangaCell.identifier)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


