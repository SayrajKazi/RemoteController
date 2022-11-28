//
//  DVRController.swift
//  assgnmentUIKitControls
//
//  Created by Sayraj Kazi on 3/2/22.
//

import UIKit

class DVR: UIViewController {

    var playButtonInProgress = false
    
    var stopButtonInProgress = true
    
    var pauseButtonInProgress = false
    
    var fastForwardButtonInProgress = false
    
    var fastRewindButtonInProgress = false
    
    var recordButtonInProgress = false
    
    @IBOutlet weak var powerDisplay: UILabel!
    @IBOutlet weak var stateDisplay: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var fastRewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if recordButtonInProgress == false
            {
                let state: String = "Play"
            stateDisplay.text = state
            playButtonInProgress = true
        
        stopButtonInProgress = false
        } else {
            
            let title = "Warning"
            let message = "Cannot play while recording"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            func forcePlayHandler(alert: UIAlertAction!) {
                let state: String = "Play"
                stateDisplay.text = state
                
                stopButtonInProgress = false
                
                let title = "Alert"
                let message = "Current operation has been stopped and requested operation will proceed"
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: "Force Play", style: .default, handler: forcePlayHandler)
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            if playButtonInProgress == false {
                present(alertController, animated: true, completion: nil)
            } else {
                
            }
        }
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
        stateDisplay.text = "Stopped"
        //playButtonInProgress = true
        stopButtonInProgress = true
       // fastForwardButtonInProgress = false
        //fastRewindButtonInProgress = false
       // pauseButtonInProgress = false
        recordButtonInProgress = false
    }
    
    
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        
        if playButtonInProgress == true && stopButtonInProgress == false {
            
        
        let state: String = sender.currentTitle!
        stateDisplay.text! = state
            stopButtonInProgress = false
            pauseButtonInProgress = false
        }
        else {
            let title = "Warning"
            let message = "Cannot pause while stopped or recording"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            func forcePauseHandler(alert: UIAlertAction!) {
                let state: String = "Pause"
                stateDisplay.text = state
                playButtonInProgress = true
                stopButtonInProgress = false
                
                let title = "Alert"
                let message = "Current operation has stopped and requested operation will proceed"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: "Force Pause", style: .default, handler: forcePauseHandler)
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            if pauseButtonInProgress == false {
            present(alertController, animated: true, completion: nil)
            
            } else {
                
            }
    }
        playButtonInProgress = true
    }
    
    @IBAction func fastForwardButtonPressed(_ sender: UIButton) {
        
        if playButtonInProgress == true && stopButtonInProgress == false
            /*|| stateDisplay.text == "Fast Forward" || stateDisplay.text == "Fast Rewind" || stateDisplay.text == "Pause"*/ {
            let state: String = sender.currentTitle!
            stateDisplay.text = state
            stopButtonInProgress = false
            fastForwardButtonInProgress = false
        } else {
            let title = "Warning"
            let message = "Cannot fast forward while stopped or recording"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            func forceFastForwardHandler(alert:UIAlertAction!) {
                let state: String = "Fast Forward"
                stateDisplay.text = state
                playButtonInProgress = true
                stopButtonInProgress = false
                
                let title = "Alert"
                let message = "Current operation has stopped and requested operation will proceed"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: "Force Fast Forward", style: .default, handler: forceFastForwardHandler)
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            if fastForwardButtonInProgress == false {
                present(alertController, animated: true, completion: nil)
                fastForwardButtonInProgress = true
            } else {
            
            }
            }
        //playButtonInProgress = true
    }
    
    @IBAction func fastRewindButtonPressed(_ sender: UIButton) {
        if playButtonInProgress == true && stopButtonInProgress == false {
            let state: String = sender.currentTitle!
            stateDisplay.text = state
            stopButtonInProgress = false
            fastRewindButtonInProgress = false
        } else {
            let title = "Warning"
            let message = "Cannot fast rewind while stopped or recording"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            func forceFastRewindHandler(alert: UIAlertAction!) {
                let state: String = "Fast Rewind"
                stateDisplay.text = state
                playButtonInProgress = true
                
                stopButtonInProgress = false
                
                let title = "Alert"
                let message = "Current operation has stopped and requested operation will proceed"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            
            let confirmAction = UIAlertAction(title: "Force Fast Rewind", style: .default, handler: forceFastRewindHandler)
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            if fastRewindButtonInProgress == false {
                present(alertController, animated: true, completion: nil)
                fastRewindButtonInProgress = true
            } else {
                
            }
        }
        //playButtonInProgress = true
    }
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        if stopButtonInProgress == true {
            let state: String = "Recording"
            stateDisplay.text = state
            
            recordButtonInProgress = true
            
         
            
            playButtonInProgress = false
            
             stopButtonInProgress = true
            
             pauseButtonInProgress = false
            
             fastForwardButtonInProgress = false
            
             fastRewindButtonInProgress = false
            
             recordButtonInProgress = false
            
            
            
        } else {
            
            let title = "Warning"
            let message = "Cannot record unless DVR is in stopped state"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            func forceRecordHandler(alert:UIAlertAction!) {
                let state: String = "Record"
                stateDisplay.text = state
                stopButtonInProgress = true
                
                let title = "Alert"
                let message = "Current operation has stopped and requested operation will proceed"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
            let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: forceRecordHandler)
            
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            
            if recordButtonInProgress == false {
                present(alertController, animated: true, completion: nil)
                //recordButtonInProgress = true
            } else {
                
            }
            
        }
        //stopButtonInProgress = true
    }
    
    
    @IBAction func powerSwitchToggled(_ sender: UISwitch) {
        powerDisplay.text = (sender.isOn ? "On" : "Off")
        powerSwitch.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true {
            powerDisplay.text = "On"
            playButton.isEnabled = true
            stopButton.isEnabled = true
            pauseButton.isEnabled = true
            fastForwardButton.isEnabled = true
            fastRewindButton.isEnabled = true
            recordButton.isEnabled = true
        } else {
            powerDisplay.text = "Off"
            playButton.isEnabled = false
            stopButton.isEnabled = false
            pauseButton.isEnabled = false
            fastForwardButton.isEnabled = false
            fastRewindButton.isEnabled = false
            recordButton.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    

}
