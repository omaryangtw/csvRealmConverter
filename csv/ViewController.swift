//
//  ViewController.swift
//  csv
//
//  Created by veneng on 2019/12/3.
//  Copyright © 2019 veneng. All rights reserved.
//

import UIKit
import SwiftCSV
import RealmSwift


class ViewController: UIViewController {

    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("default realm path is \(realm.configuration.fileURL?.absoluteString)")

    }
    
    @IBAction func generateRealmTapped(_ sender: UIButton) {
        // clear everything in the realm in case we clicked the button twice and it adds the same data twice
        
        try? realm.write {
            realm.deleteAll()
        }
        
        generateDictFromCSV()
    }

    @IBAction func generateRealmForIOS(_ sender: UIButton){
        generateDictFromCSVForIOS()
    }
    
    func generateDictFromCSV() {
        // get the URL to the restaurants.csv file
        guard let csvURL = Bundle.main.url(forResource: "myImeDict", withExtension: "csv") else {
            print("unable to open csv")
            return
        }
        
        // parse the CSV file using SwiftCSV library
        guard let csv : CSV? = try? CSV(url: csvURL) else {
            print("unable to parse csv")
            return
        }
        
        // go through each row of the CSV file
        try? csv?.enumerateAsDict{ dict in
            
            // declare an empty Restaurant realm model
            let imeDict = ImeDict()
            
            // assign restaurantID from the CSV file to the model
            if let wordIDstr = dict["wordId"],
                let wordId = Int(wordIDstr) {
                imeDict.wordId = wordId
            }
            
            // assign name from the CSV file to the model
            if let kiplmj = dict["kiplmj"] {
                imeDict.kiplmj = kiplmj
            }
            
            // assign slogan from the CSV file to the model
            if let kiplmjInputWithNumberTone = dict["kiplmjInputWithNumberTone"] {
                imeDict.kiplmjInputWithNumberTone = kiplmjInputWithNumberTone
            }
            
            if let kiplmjInputWithoutTone = dict["kiplmjInputWithoutTone"] {
                imeDict.kiplmjInputWithoutTone = kiplmjInputWithoutTone
            }
            
            if let kiplmjShortInput = dict["kiplmjShortInput"] {
                imeDict.kiplmjShortInput = kiplmjShortInput
            }
            
            if let poj = dict["poj"] {
                imeDict.poj = poj
            }
            
            if let pojInputWithNumberTone = dict["pojInputWithNumberTone"] {
                imeDict.pojInputWithNumberTone = pojInputWithNumberTone
            }
            
            if let pojInputWithoutTone = dict["pojInputWithoutTone"] {
                imeDict.pojInputWithoutTone = pojInputWithoutTone
            }
            
            if let pojShortInput = dict["pojShortInput"] {
                imeDict.pojShortInput = pojShortInput
            }
            
            if let pojPrioritystr = dict["pojPriority"],
                let pojPriority = Int(pojPrioritystr) {
                imeDict.pojPriority = pojPriority
            }
            
            if let kiplmjPrioritystr = dict["kiplmjPriority"],
                let kiplmjPriority = Int(kiplmjPrioritystr) {
                imeDict.kiplmjPriority = kiplmjPriority
            }
            
            if let hanji = dict["hanji"] {
                imeDict.hanji = hanji
            }
            
            // save the restaurant model into the realm file
            try? self.realm.write {
                self.realm.add(imeDict)
            }
        }
    }
    func generateDictFromCSVForIOS() {
        // get the URL to the restaurants.csv file
        guard let csvURL = Bundle.main.url(forResource: "myImeDict", withExtension: "csv") else {
            print("unable to open csv")
            return
        }
        
        // parse the CSV file using SwiftCSV library
        guard let csv : CSV? = try? CSV(url: csvURL) else {
            print("unable to parse csv")
            return
        }

        
        // go through each row of the CSV file
        try? csv?.enumerateAsDict{ dict in
            
            // declare an empty Restaurant realm model
            let imeDict = ImeDict8()
            
            // assign restaurantID from the CSV file to the model
            if let wordIDstr = dict["wordId"],
                let wordId = Int(wordIDstr) {
                imeDict.wordId = wordId
            }
            
            if let mainCodestr = dict["mainCode"],
                let mainCode = Int(mainCodestr) {
                imeDict.mainCode = mainCode
            }
            
            if let wordPropertyCodestr = dict["wordPropertyCode"],
                let wordPropertyCode = Int(wordPropertyCodestr) {
                imeDict.wordPropertyCode = wordPropertyCode
            }
            
            // assign name from the CSV file to the model
            if let tailo = dict["kiplmj"] {
                imeDict.tailo = tailo
            }
            
            // assign slogan from the CSV file to the model
            if let tailoInputWithNumberTone = dict["kiplmjInputWithNumberTone"] {
                imeDict.tailoInputWithNumberTone = tailoInputWithNumberTone
            }
            
            if let tailoInputWithoutTone = dict["kiplmjInputWithoutTone"] {
                imeDict.tailoInputWithoutTone = tailoInputWithoutTone
            }
            
            if let tailoShortInput = dict["kiplmjShortInput"] {
                imeDict.tailoShortInput = tailoShortInput
            }
            
            if let poj = dict["poj"] {
                imeDict.poj = poj
            }
            
            if let pojInputWithNumberTone = dict["pojInputWithNumberTone"] {
                imeDict.pojInputWithNumberTone = pojInputWithNumberTone
            }
            
            if let pojInputWithoutTone = dict["pojInputWithoutTone"] {
                imeDict.pojInputWithoutTone = pojInputWithoutTone
            }
            
            if let pojShortInput = dict["pojShortInput"] {
                imeDict.pojShortInput = pojShortInput
            }
            
            if let prioritystr = dict["pojPriority"],
                let priority = Int(prioritystr) {
                imeDict.priority = priority
            }
            
            if let wordLengthstr = dict["wordLength"],
                let wordLength = Int(wordLengthstr) {
                imeDict.wordLength = wordLength
            }

            if let prioritystr = dict["lomajiCharLength"],
                let priority = Int(prioritystr) {
                imeDict.priority = priority
            }

            
            if let hanji = dict["hanji"] {
                imeDict.hanji = hanji
            }
            
            // save the restaurant model into the realm file
            try? self.realm.write {
                self.realm.add(imeDict)
            }
        }
    }
}

