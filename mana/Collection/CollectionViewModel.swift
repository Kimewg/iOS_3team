import Foundation
import UIKit

// 셀에 표시할 이름과 배경색을 담은 뷰모델 구조체
struct CollectionViewCellViewModel {
    let comic: Comic

    var name: String { comic.title }
    var price: Int { comic.price }
    var imageName: String { comic.imageName }
}
