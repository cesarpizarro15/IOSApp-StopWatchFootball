//
//  InstructionViewControler.swift
//  Contador
//
//  Created by Cesar Pizarro Jacinto on 9/7/16.
//  Copyright © 2016 Cesar Pizarro Jacinto. All rights reserved.
//

import UIKit



class InstructionViewController: UIViewController {

    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    instructionsLabel.lineBreakMode = .ByWordWrapping
    instructionsLabel.numberOfLines = 0
    instructionsLabel.text = "ENGLISH:\nThe game works with the fractions of the second.\nThe turn is switching betweet the two teams.\n\n00 - Goal\n99 or 01 - Penalty -> Pair number in next move to score\n50 - Own Goal (OG)\n\n---------------\n\nEspañol:\nEl juego funciona con las fracciones de segundo.\nEl turno cambia de un equipo a otro.\n\n00 - Gol\n99 or 01 - Penalti -> numero par en la siguiente jugada para marcar\n50 - Gol en propia meta(PP)"
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
}