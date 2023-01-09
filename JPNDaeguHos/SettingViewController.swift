import UIKit
import DLRadioButton

class SettingViewController: UIViewController {
    
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var currentVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        
        let versionChk = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        currentVersion.text = versionChk
        
        let rawValue = UserDefaults.standard.integer(forKey: "Appearance")
        modeSelector.selectedSegmentIndex = rawValue
    }
    
    @IBAction func modeSelect(_ sender: Any) {
        view.window?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: modeSelector.selectedSegmentIndex) ?? .unspecified
        UserDefaults.standard.set(modeSelector.selectedSegmentIndex, forKey: "Appearance")
    }
        
}


