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
    
    @IBOutlet var minimumValuelabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    
    @IBOutlet var checkValueButton: UIButton!
    
    
    // MARK: - Private properties

    var game: Game!
    
    private var missingValueText = "The value is still missing"
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        game = Game(minValue: 1, maxValue: 10, rounds: 5, bound: 10)
        updateLabelWithDesiredValue(textLabel: (game.currentDesiredValue).formatted())
        
        getSliderSettings()
        getLabelSettings()
        getButtonSettings()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        showAlertController(title: "New game", message: "Try to get less than \(game.limit) points. To start a game press \"Start game\"")
        
    }

    
    // MARK: - IBAction
    
    @IBAction func getResultButton() {
        if checkValueButton.currentTitle == "Start game" {
            checkValueButton.setTitle("Check value", for: .normal)
        }
        
        game.calculateScore(with: Int(desiredValueSlider.value))
        
        if game.isGameOver {
            game.score <= game.limit ? showAlertController(title: "Game over", message: "You win! Your final result is \(game.score)") :
            showAlertController(title: "Game over", message: "You lose! Your final result is \(game.score)")
            
            game.resdartGame()
            
            desiredValueLabel.text = 0.formatted()
            checkValueButton.setTitle("Start game", for: .normal)
            desiredValueLabel.text = missingValueText
            
            return
        } else {
            game.startNewRound()
        }
        
        updateLabelWithDesiredValue(textLabel: (game.currentDesiredValue).formatted())

    }
    
    
    // MARK: - Private methods
    
    private func updateLabelWithDesiredValue(textLabel: String) {
        desiredValueLabel.text = textLabel
    }
    
    private func getLabelSettings() {
        
        [desiredValueLabel, minimumValuelabel, maximumValueLabel].forEach {
            $0.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            $0.font = UIFont.boldSystemFont(ofSize: 22)
        }
        
        desiredValueLabel.text = missingValueText
        minimumValuelabel.text = game.minDesiredValue.formatted()
        maximumValueLabel.text = game.maxDesiredValue.formatted()
        
    }

    private func getSliderSettings() {
        
        desiredValueSlider.minimumValue = Float(game.minDesiredValue)
        desiredValueSlider.maximumValue = Float(game.maxDesiredValue)
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

