/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIPickerView.
*/

import UIKit

class PickerViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var colorSwatchView: UIView!
    
    enum ColorComponent: Int {
        case red = 0, green, blue
        
        static var count: Int {
            return ColorComponent.blue.rawValue + 1
        }
    }
    
    struct RGB {
        static let max: CGFloat = 255.0
        static let min: CGFloat = 0.0
        static let offset: CGFloat = 5.0
    }
    
    lazy var numberOfColorValuesPerComponent: Int = (Int(RGB.max) / Int(RGB.offset)) + 1
    
    var redColor: CGFloat = RGB.min {
        didSet {
            updateColorSwatchViewBackgroundColor()
        }
    }
    
    var greenColor: CGFloat = RGB.min {
        didSet {
            updateColorSwatchViewBackgroundColor()
        }
    }
    var blueColor: CGFloat = RGB.min {
        didSet {
            updateColorSwatchViewBackgroundColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
    }
    
    func configurePickerView() {
        let selectedRows: [ColorComponent: Int] = [.red: 13, .green: 41, .blue: 24]
        
        for (colorComponent, selectedRow) in selectedRows {
            pickerView.selectRow(selectedRow, inComponent: colorComponent.rawValue, animated: true)
            pickerView(pickerView, didSelectRow: selectedRow, inComponent: colorComponent.rawValue)
        }
    }
    
    func updateColorSwatchViewBackgroundColor() {
        colorSwatchView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
}

extension PickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return ColorComponent.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfColorValuesPerComponent
    }
}

extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let colorValue = CGFloat(row) * RGB.offset
        
        // Set the initial colors for each picker segment.
        let value = CGFloat(colorValue) / RGB.max
        var redColorComponent = RGB.min
        var greenColorComponent = RGB.min
        var blueColorComponent = RGB.min
        
        switch ColorComponent(rawValue: component)! {
        case .red:
            redColorComponent = value
            
        case .green:
            greenColorComponent = value
            
        case .blue:
            blueColorComponent = value
        }
        
        if redColorComponent < 0.5 {
            redColorComponent = 0.5
        }
        if blueColorComponent < 0.5 {
            blueColorComponent = 0.5
        }
        if greenColorComponent < 0.5 {
            greenColorComponent = 0.5
        }
        let foregroundColor = UIColor(red: redColorComponent, green: greenColorComponent, blue: blueColorComponent, alpha: 1.0)
        
        // Set the foreground color for the entire attributed string.
        let attributes = [
            NSAttributedString.Key.foregroundColor: foregroundColor
        ]
        
        let title = NSMutableAttributedString(string: "\(Int(colorValue))", attributes: attributes)
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorComponentValue = RGB.offset * CGFloat(row) / RGB.max
        
        switch ColorComponent(rawValue: component)! {
        case .red:
            redColor = colorComponentValue
            
        case .green:
            greenColor = colorComponentValue
            
        case .blue:
            blueColor = colorComponentValue
        }
    }

}
