import UIKit

struct ComicLabelFactory {
    static func makeLabel(text: String,
                          fontName: String,
                          fontSize: CGFloat,
                          textColor: UIColor = .white,
                          alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: fontName, size: fontSize)
        label.textColor = textColor
        label.textAlignment = alignment
        return label
    }
}
