//
//  ViewController.swift
//  Counter
//
//  Created by Андрей on 28.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearHistory()
    }

    @IBAction func plusDidTap() {
        counter += 1
        addMessageToHistory(message: "значение изменено на +1")
    }
    
    @IBAction func minusDidTap() {
        if counter > 0 {
            counter -= 1
            addMessageToHistory(message: "значение изменено на -1")
        } else {
            addMessageToHistory(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetDidTap() {
        counter = 0
        addMessageToHistory(message: "значение сброшено")
    }
    
    private func addMessageToHistory(message: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        
        let dateString = dateFormatter.string(from: currentDate)
        
        historyTextView.text.append("[\(dateString)]: \(message)\n")
        
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction func clearHistoryDidTap() {
        clearHistory()
    }
    
    private func clearHistory() {
        historyTextView.text = "История изменений:\n"
    }
}

