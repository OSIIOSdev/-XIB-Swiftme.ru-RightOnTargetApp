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

    private var value = 0
    private var round = 0
    private var points = 0
    private var result = 0
    private let maxRoundValue = 10
    
    private var missingValueText = "The value is still missing"
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        getSliderSettings()
        getLabelSettings()
        getButtonSettings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        showAlertController(title: "New game", message: "Try to get less than \(maxRoundValue) points. To start a game press \"Start game\"")
    }

    // MARK: - IBAction
    
    @IBAction func getResultButton() {
        switch round {
        case 0:
            value = Int.random(in: Int(desiredValueSlider.minimumValue)...Int(desiredValueSlider.maximumValue))
            desiredValueLabel.text = value.formatted()
            

            checkValueButton.setTitle("Check value", for: .normal)
            round = 1
        case 1 ..< 5:
            points = abs(value - Int(desiredValueSlider.value))
            result += points
        
            value = Int.random(in: Int(desiredValueSlider.minimumValue)...Int(desiredValueSlider.maximumValue))
            desiredValueLabel.text = value.formatted()
        
            round += 1
        default:
            result <= maxRoundValue ? showAlertController(title: "Game over", message: "You win! Your final result is \(result)") :
                           showAlertController(title: "Game over", message: "You lose! Your final result is \(result)")
            round = 0
            result = 0
            desiredValueLabel.text = 0.formatted()
            checkValueButton.setTitle("Start game", for: .normal)
            desiredValueLabel.text = missingValueText
        }
        
    }
    
    
    // MARK: - Private methods
    
    private func getLabelSettings() {
        
        desiredValueLabel.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueLabel.font = UIFont.boldSystemFont(ofSize: 22)
        desiredValueLabel.text = missingValueText
        
    }

    private func getSliderSettings() {
        
        desiredValueSlider.minimumValue = 0
        desiredValueSlider.maximumValue = 50
        desiredValueSlider.value = Float.random(in: desiredValueSlider.minimumValue...desiredValueSlider.maximumValue)
        
        desiredValueSlider.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueSlider.thumbTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueSlider.minimumTrackTintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        desiredValueSlider.maximumTrackTintColor = .white
        
    }
    
    private func getButtonSettings() {
        
        checkValueButton.layer.cornerRadius = 15
        checkValueButton.layer.borderWidth = 2.5
        checkValueButton.layer.borderColor = UIColor.black.cgColor
        checkValueButton.backgroundColor = .white
        checkValueButton.setTitleColor(.black, for: .normal)
        checkValueButton.setTitle("Start game", for: .normal)
        checkValueButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
    }
    
    private func showAlertController(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

