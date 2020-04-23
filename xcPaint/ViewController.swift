//
//  ViewController.swift
//  xcPaint
//
//  Created by Stringham on 12/1/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawView: Drawview!

    @IBAction func redButton(_ sender: Any) {
        drawView.lineColor = UIColor.red.cgColor
    }
    
    
    @IBAction func blackButton(_ sender: Any) {
        drawView.lineColor = UIColor.black.cgColor
    }
    
    
    @IBAction func greenButton(_ sender: Any) {
        drawView.lineColor = UIColor.green.cgColor
    }
    
    
    @IBAction func blueButton(_ sender: Any) {
        drawView.lineColor = UIColor.blue.cgColor
    }
    
    
    @IBAction func eraseButton(_ sender: Any) {
        drawView.lineColor = UIColor.white.cgColor
    }
    
    
    @IBAction func brownButton(_ sender: Any) {
        drawView.lineColor = UIColor.brown.cgColor
    }
    
    @IBAction func yellowButton(_ sender: Any) {
        drawView.lineColor = UIColor.yellow.cgColor
    }
    
    
    @IBAction func purpleButton(_ sender: Any) {
        drawView.lineColor = UIColor.purple.cgColor
    }
    
    
}

