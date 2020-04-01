/*
    Created by Benny on 02/04/17.
    
    
    Abstract:
    A view controller that demonstrates how to use UISwitch.
*/

import UIKit

class SwitchViewController: UITableViewController {
    @IBOutlet weak var defaultSwitch: UISwitch!
    @IBOutlet weak var tintedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDefaultSwitch()
        configureTintedSwitch()
    }
    
    func configureDefaultSwitch() {
        defaultSwitch.isOn = true
        defaultSwitch.addTarget(self, action: #selector(switchClicked(_:)), for: .valueChanged)
    }
    
    func configureTintedSwitch() {
        tintedSwitch.isOn = true
        tintedSwitch.tintColor = UIColor.systemBlue
        tintedSwitch.onTintColor = UIColor.systemGreen
        tintedSwitch.thumbTintColor = UIColor.systemPurple
        tintedSwitch.addTarget(self, action: #selector(switchClicked(_:)), for: .valueChanged)
    }
    
    //MARK: Switch clicked
    @objc func switchClicked(_ aSwitch: UISwitch) {
        if aSwitch == defaultSwitch {
            defaultSwitch.isOn = !defaultSwitch.isOn
        }
        else {
            tintedSwitch.isOn = !tintedSwitch.isOn
        }
        print("A switch changed its value: \(aSwitch).")
    }
}
