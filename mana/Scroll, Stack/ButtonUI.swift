import UIKit

func ButtonUI(title: String) -> UIButton{
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    return button
}
