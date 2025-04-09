import UIKit

func StackViewUI(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal // axis = .horizontal
        stackView.backgroundColor = .black // backgroundColor = .black
        stackView.spacing = 10 // spacing = 10
        stackView.distribution = .fillEqually // distribution = .fillEqually
        
        return stackView
    }
