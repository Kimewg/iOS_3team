//
//  mana.swift
//  mana
//
//  Created by 강성훈 on 4/8/25.
//

import UIKit
import SnapKit

class ComicCell: UITableViewCell {
    let titlelabel = UILabel()
    let pricelabel = UILabel()
    let countlabel = UILabel()
    let plusbutton = UIButton()
    let minusbutton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}

