import UIKit

extension UIView {
    func applyNeumorphism(
        cornerRadius: CGFloat = 12,
        lightShadowColor: UIColor = .white,
        darkShadowColor: UIColor = UIColor.black.withAlphaComponent(0.2),
        shadowRadius: CGFloat = 6,
        shadowOffset: CGFloat = 6,
        backgroundColor: UIColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
    ) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false

        // 기존 그림자 레이어 제거 (중복 방지)
        self.layer.sublayers?.removeAll(where: { $0.name == "neumorphicLight" || $0.name == "neumorphicDark" })

        // 레이아웃 확정
        self.layoutIfNeeded()

        // Light Shadow Layer
        let lightShadow = CALayer()
        lightShadow.name = "neumorphicLight"
        lightShadow.frame = self.bounds
        lightShadow.backgroundColor = backgroundColor.cgColor
        lightShadow.shadowColor = lightShadowColor.cgColor
        lightShadow.shadowOffset = CGSize(width: -shadowOffset, height: -shadowOffset)
        lightShadow.shadowOpacity = 1
        lightShadow.shadowRadius = shadowRadius
        lightShadow.cornerRadius = cornerRadius
        self.layer.insertSublayer(lightShadow, at: 0)

        // Dark Shadow Layer
        let darkShadow = CALayer()
        darkShadow.name = "neumorphicDark"
        darkShadow.frame = self.bounds
        darkShadow.backgroundColor = backgroundColor.cgColor
        darkShadow.shadowColor = darkShadowColor.cgColor
        darkShadow.shadowOffset = CGSize(width: shadowOffset, height: shadowOffset)
        darkShadow.shadowOpacity = 1
        darkShadow.shadowRadius = shadowRadius
        darkShadow.cornerRadius = cornerRadius
        self.layer.insertSublayer(darkShadow, at: 0)
    }
    
    
}

extension UILabel {
    func applyShadow(
        color: UIColor = .black,
        opacity: Float = 0.15,
        radius: CGFloat = 2,
        offset: CGSize = CGSize(width: 1, height: 1)
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.masksToBounds = false
    }
}


