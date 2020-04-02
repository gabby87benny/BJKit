/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UISegmentedControl.
*/

import UIKit

class SegmentedControlViewController: UITableViewController {
    @IBOutlet weak var defaultSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tintedSegmentedControl: UISegmentedControl!
    @IBOutlet weak var customSegmentsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var customBackgroundSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDefaultSegmentedControl()
        configureTintedSegmentedControl()
        configureCustomSegmentsSegmentedControl()
        configureCustomBackgroundSegmentedControl()
    }
    
    func configureDefaultSegmentedControl() {
        //defaultSegmentedControl.selectedSegmentIndex = 0
        defaultSegmentedControl.setEnabled(false, forSegmentAt: 2)
        defaultSegmentedControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
    }
    
    func configureTintedSegmentedControl() {
        tintedSegmentedControl.tintColor = UIColor(named: "tinted_segmented_control")
        tintedSegmentedControl.selectedSegmentIndex = 1
        tintedSegmentedControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
    }
    
    func configureCustomSegmentsSegmentedControl() {
        customSegmentsSegmentedControl.setImage(UIImage(systemName: "airplane"), forSegmentAt: 0)
        customSegmentsSegmentedControl.setImage(UIImage(systemName: "gift"), forSegmentAt: 1)
        customSegmentsSegmentedControl.setImage(UIImage(systemName: "burst"), forSegmentAt: 2)
        customSegmentsSegmentedControl.selectedSegmentIndex = 0
        customSegmentsSegmentedControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
    }
    
    func configureCustomBackgroundSegmentedControl() {
        customBackgroundSegmentedControl.selectedSegmentIndex = 0
        
        // Set the background images for each control state.
        let normalSegmentBackgroundImage = UIImage(named: "stepper_and_segment_background")
        customBackgroundSegmentedControl.setBackgroundImage(normalSegmentBackgroundImage, for: .normal, barMetrics: .default)
        
        let disabledSegmentBackgroundImage = UIImage(named: "stepper_and_segment_background_disabled")
        customBackgroundSegmentedControl.setBackgroundImage(disabledSegmentBackgroundImage, for: .disabled, barMetrics: .default)
        
        let highlightedSegmentBackgroundImage = UIImage(named: "stepper_and_segment_background_highlighted")
        customBackgroundSegmentedControl.setBackgroundImage(highlightedSegmentBackgroundImage, for: .highlighted, barMetrics: .default)
        
        // Set the divider image.
        let segmentDividerImage = UIImage(named: "stepper_and_segment_divider")
        customBackgroundSegmentedControl.setDividerImage(segmentDividerImage,
                                                         forLeftSegmentState: .normal,
                                                         rightSegmentState: .normal,
                                                         barMetrics: .default)
        
        let captionFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .caption1)
        let font = UIFont(descriptor: captionFontDescriptor, size: 0)
        let titleAttributesNormal = [
            NSAttributedString.Key.foregroundColor : UIColor.systemPurple,
            NSAttributedString.Key.font : font
        ]
        customSegmentsSegmentedControl.setTitleTextAttributes(titleAttributesNormal, for: .normal)
        
        let highlightedTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGreen,
            NSAttributedString.Key.font: font
        ]
        customBackgroundSegmentedControl.setTitleTextAttributes(highlightedTextAttributes, for: .highlighted)
        
        customBackgroundSegmentedControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
    }
    
    @objc func segmentSelected(_ segmentedControl: UISegmentedControl) {
        print("The selected segment changed for: \(segmentedControl).")
    }
}
