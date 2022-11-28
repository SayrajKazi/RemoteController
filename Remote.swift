//
//  ViewController.swift
//  remotecontrol7
//
//  Created by Sayraj Kazi on 3/15/22.
//

import UIKit



class Remote: UIViewController {

    var numberArray = [String]()
    var typingNumber = false
    var favoriteC: favoriteChannel?

   

    
    
    
    
    
    
    
    
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var Switch: UISwitch!
    
   
    @IBOutlet weak var channelbl: UILabel!
    
    
    @IBOutlet weak var Switchlbl: UILabel!
    
    
    @IBOutlet weak var sliderlbl: UILabel!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
   
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var favoriteChannelSegmentedControl: UISegmentedControl!
    
    
    @IBAction func favChannelNameSelected(_ sender: UISegmentedControl) {
        if sender.titleForSegment(at: sender.selectedSegmentIndex) != nil{
        let index = favoriteChannelSegmentedControl.selectedSegmentIndex
        channelbl.text = favoriteChannels[index].number
        
    }
        

    }
    
   
    @IBAction func switchToggled(_ sender: UISwitch) {
        Switchlbl.text = "Switch " + (sender.isOn ? "on" : "off")
        Switch.setOn(sender.isOn, animated: true)
        
        if Switch.isOn != true {
            channelbl.isHidden = true
            slider.isHidden = true
            button.isEnabled = false
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            button5.isEnabled = false
            button6.isEnabled = false
            button7.isEnabled = false
            button8.isEnabled = false
            button9.isEnabled = false
            favoriteChannelSegmentedControl.isEnabled = false

        
        }else{
            channelbl.isHidden = false
            slider.isHidden = false
            button.isEnabled = true
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            button6.isEnabled = true
            button7.isEnabled = true
            button8.isEnabled = true
            button9.isEnabled = true
            favoriteChannelSegmentedControl.isEnabled = true

            
        }
        }
        
        
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderlbl.text = "\(Int(sender.value))"
}
    
    
    @IBAction func channelIncremented(_ sender: UIButton) {
        let numberDisplay = Int(channelbl.text!)
        if numberDisplay! + 1 > 99 {
        } else {
            let incrementedNumber = numberDisplay! + 1
            channelbl.text = "\(incrementedNumber)"
        }
    
    }
    @IBAction func channelDec(_ sender: UIButton) {
        
        let numberDisplay = Int(channelbl.text!)
        if numberDisplay! - 1 < 1 {
        } else {
            let decrementedNumber = numberDisplay! - 1
            channelbl.text = "\(decrementedNumber)"
        }
    }
    
    
  

    
    
    
    
    @IBAction func buttonttapped(_ sender: UIButton) {
        let number: String = String(sender.tag)
        
        if numberArray.count == 0 || numberArray.count == 1 {
            numberArray.append(number)
        }
        if numberArray.count == 2 {
            let newChannel = numberArray[0] + numberArray[1]
            
            if newChannel == "00" {
                numberArray.removeAll()
            } else {
                channelbl.text = newChannel
                numberArray.removeAll()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        channelbl.text = " My tv"
        sliderlbl.text = "volume: \(Int(slider.value))"
       
        
    
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        
            favoriteChannelSegmentedControl.setTitle(favoriteChannels[0].name, forSegmentAt: 0)
        
       
            favoriteChannelSegmentedControl.setTitle(favoriteChannels[1].name, forSegmentAt: 1)
        
                    favoriteChannelSegmentedControl.setTitle(favoriteChannels[2].name, forSegmentAt: 2)
        
            favoriteChannelSegmentedControl.setTitle(favoriteChannels[3].name, forSegmentAt: 3)
        }
    
  
}

