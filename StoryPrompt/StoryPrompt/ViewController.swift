//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Lara Martin on 10.09.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    let storyPrompt = StoryPromptEntry()
    
    @IBAction func changeNumber(_ slider: UISlider) {
        numberLabel.text = "Number \(Int(slider.value))"
        storyPrompt.number = Int(slider.value)
    }
    
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
        print(storyPrompt.genre)
    }
    
    @IBAction func generateStoryPromptCTA(_ sender: Any) {
        updateStoryPrompt()
        print(storyPrompt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPrompt.number = Int(numberSlider.value)
    
        print(storyPrompt)
    }
    
    func updateStoryPrompt() {
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
}

extension ViewController : UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}
