//
//  ViewController.swift
//  RightOnTargetApp
//
//  Created by OSIIOSdev on 11.03.2025.
//

import UIKit

final class RightOnTargetViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet var desiredValueLabel: UILabel!
    
    @IBOutlet var desiredValueSlider: UISlider!
    
    @IBOutlet var checkValueButton: UIButton!
    
    
    // MARK: - Private properties

    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getButtonSettings()
    }
    
    
    // MARK: - IBAction
    
    
    
    
    // MARK: - Private methods
    
    private func getLabelSettings(for label: UILabel) {
        
    }

    private func getButtonSettings() {
        checkValueButton.layer.cornerRadius = 15
        checkValueButton.layer.borderWidth = 2.5
        checkValueButton.layer.borderColor = UIColor.white.cgColor
        checkValueButton.backgroundColor = .black
        checkValueButton.tintColor = .white
        checkValueButton.setTitle("Check value", for: .normal)
    }
    
    

}

