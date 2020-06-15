import UIKit

struct ColorGuessingBrain {
    let targetColor: UIColor
    let colorOptions: [UIColor]
    
    init() {
        self.targetColor = UIColor.random()
        self.colorOptions = [
            targetColor.randomNearbyColor(withDistance: 0.1),
            targetColor.randomNearbyColor(withDistance: 0.1),
            targetColor
        ]
    }
    
    func guess(color: UIColor) -> Bool {
        return color == targetColor
    }
}

// https://stackoverflow.com/questions/29779128/how-to-make-a-random-color-with-swift

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1)
    }
    func randomNearbyColor(withDistance distance: Double) -> UIColor {
        let redDistance = CGFloat(stride(from: -distance, to: distance, by: 0.001).map { $0 }.randomElement()!)
        let greenDistance = CGFloat(stride(from: -distance, to: distance, by: 0.001).map { $0 }.randomElement()!)
        let blueDistance = CGFloat(stride(from: -distance, to: distance, by: 0.001).map { $0 }.randomElement()!)
        return UIColor(red: rgba.red + redDistance,
                       green: rgba.green + greenDistance,
                       blue: rgba.blue + blueDistance,
                       alpha: rgba.alpha)
    }
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

