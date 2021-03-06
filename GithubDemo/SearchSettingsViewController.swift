//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Matthew Lee on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {

    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?
    var settingsValue: Int = 0
    
    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let settings = settings {
            starLabel.text = "\(settings.minStars)"
            slider.value = Float(settings.minStars)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        settings?.minStars = Int(slider.value)
        
        self.delegate?.didSaveSettings(settings: settings!)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onSliderChange(_ sender: Any) {
        self.settingsValue = Int(slider.value)
        self.starLabel.text = String(self.settingsValue)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
