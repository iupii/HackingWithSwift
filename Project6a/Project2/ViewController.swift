//
//  ViewController.swift
//  Project2
//
//  Created by Iurii Pachin on 2019/08/21.
//  Copyright © 2019 Iurii Pachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        self.button1.layer.borderWidth = 1
        self.button2.layer.borderWidth = 1
        self.button3.layer.borderWidth = 1
        
        self.button1.layer.borderColor = UIColor.lightGray.cgColor
        self.button2.layer.borderColor = UIColor.lightGray.cgColor
        self.button3.layer.borderColor = UIColor.lightGray.cgColor
        
        self.askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 1...2)
        
        self.button1.setImage(UIImage(named: countries[0]), for: .normal)
        self.button2.setImage(UIImage(named: countries[1]), for: .normal)
        self.button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        self.title = self.countries[self.correctAnswer].uppercased()
    }
    
    func sayAnswer(action: UIAlertAction! = nil) {
        let ac = UIAlertController(title: "answer", message: self.countries[self.correctAnswer], preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: self.askQuestion))
        present(ac, animated: true)
    }

    @IBAction func buttenTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == self.correctAnswer {
            title = "Correct"
            self.score += 1
        } else {
            title = "Wrong"
            self.score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(self.score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: self.askQuestion))
        ac.addAction(UIAlertAction(title: "Answer", style: .default, handler: self.sayAnswer))
        present(ac, animated: true)
    }
}

