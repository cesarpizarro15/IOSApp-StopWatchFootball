//
//  ViewController.swift
//  Contador
//
//  Created by Cesar Pizarro Jacinto on 8/7/16.
//  Copyright © 2016 Cesar Pizarro Jacinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var laps: [String] = []
    
    var timer = NSTimer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    
    var stopwatchString: String = ""
    
    var startStopWatch: Bool = true
    var addLap: Bool = false
    
    var scoreTeam1: Int = 0
    var scoreTeam2: Int = 0
    
    var turn: Int = 1

    
    @IBOutlet weak var stopwatchLabel: UILabel!
    
    @IBOutlet weak var lapsTableView: UITableView!
    
    @IBOutlet weak var starstopButton: UIButton!
    @IBOutlet weak var lapresetButton: UIButton!
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    
    @IBAction func startStop(sender: AnyObject) {
    
        if startStopWatch == true {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.updateStopwatch), userInfo: nil, repeats: true)
            startStopWatch = false
            
            starstopButton.setImage(UIImage(named: "stop.png"), forState: UIControlState.Normal)
            //lapresetButton.setImage(UIImage(named: "lap.png"), forState: UIControlState.Normal)
            
            addLap = true
        }else{
            timer.invalidate()
            startStopWatch = true
            
            
            
            starstopButton.setImage(UIImage(named: "start.png"), forState: .Normal)
            //lapresetButton.setImage(UIImage(named: "reset.png"), forState: .Normal)
            
            checkTimer()
            
            addLap = false
        }
        
        
        
    
    }
    
    
    @IBAction func lapReset(sender: AnyObject) {
        
        if addLap == true {
            
            //laps.insert(stopwatchString, atIndex: 0)
            //lapsTableView.reloadData()
            
            
        }else{
            
            addLap = false
            //lapresetButton.setImage(UIImage(named: "lap.png"), forState: .Normal)
            
            fractions = 0
            seconds = 0
            minutes = 0
            
            laps.removeAll(keepCapacity: false)
            lapsTableView.reloadData()
            
            stopwatchString = "00:00.00"
            stopwatchLabel.text = stopwatchString
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopwatchLabel.text = "00:00.00"
        //instructionsLabel.text = "The game works with the fractions of the second. \n\n00 - Goal\n50 - Own Goal (OG)\n99 or 01 - Penalty"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateStopwatch(){
        
        fractions += 1
        if fractions == 100{
            seconds += 1
            fractions = 0
        }
        
        if seconds == 100{
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        
        stopwatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        stopwatchLabel.text = stopwatchString
        
    }
    
    func checkTimer(){
        
        switch fractions {
        case 0:
            laps.insert("GOAL for Team\(turn) " + stopwatchString, atIndex: 0)
            if turn == 1{
                scoreTeam1 += 1
                team1.text = String(scoreTeam1)
            }else{
                scoreTeam2 += 1
                team2.text = String(scoreTeam2)
            }
        case 50:
            laps.insert("GOAL for Team\(turn)(OG) " + stopwatchString, atIndex: 0)
            if turn == 1{
                scoreTeam2 += 1
                team1.text = String(scoreTeam2)
            }else{
                scoreTeam1 += 1
                team2.text = String(scoreTeam1)
            }
            // change turn again
            changeTurn()
        default:
            laps.insert("Team\(turn) " + stopwatchString, atIndex: 0)

        }
        
        
        changeTurn()
        
        lapsTableView.reloadData()
    }
    
    func changeTurn(){
        
        if turn == 1 {
            turn = 2
        }else{
            turn = 1
        }
    }
    
    
    
    
    
    
    // Table View Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.backgroundColor = self.view.backgroundColor
        
        cell.textLabel?.text = "\(laps.count-indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return laps.count
    }

}

