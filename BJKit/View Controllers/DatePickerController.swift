/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UIDatePicker.
*/

import UIKit

class DatePickerController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
    }

    // MARK: - Configuration
    func configureDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        let now = Date()
        datePicker.minimumDate = now
        let sevenDaysFromNow = Calendar.current.date(byAdding: .day, value: 7, to: now)
        datePicker.maximumDate = sevenDaysFromNow
        datePicker.minuteInterval = 2
        datePicker.addTarget(self, action: #selector(updateDatePickerLabel), for: .valueChanged)
        updateDatePickerLabel()
    }
    
    @objc
    func updateDatePickerLabel() {
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
}
