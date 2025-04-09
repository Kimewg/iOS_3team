import UIKit

func scrollViewUI(_ views: UIView) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.addSubview(views)
    scrollView.backgroundColor = .yellow
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.alwaysBounceHorizontal = true
    return scrollView
}
