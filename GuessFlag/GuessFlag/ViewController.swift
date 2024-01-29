//
//  ViewController.swift
//  GuessFlag
//
//  Created by Bengi Anıl on 20.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var flag1: UIButton!
    @IBOutlet var flag2: UIButton!
    @IBOutlet var flag3: UIButton!

    var countries: [String] = [String]()
    var score: Int = 0
    var correctAnswer: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createCounties()
        getQuestion()
    }

    func configureUI() {
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1
        flag1.layer.borderColor = UIColor.lightGray.cgColor
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        flag3.layer.borderColor = UIColor.lightGray.cgColor
    }



    func createCounties() {
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }

    func getQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func tappedFlags(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
            score -= 1
        }

        let alertViewController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Continue", style: .default, handler: getQuestion))
        present(alertViewController, animated: true)

    }
}

