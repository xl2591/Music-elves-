//
//  ViewController.swift
//  new
//
//  Created by 刘牛牛 on 11/12/2019.
//  Copyright © 2019 刘牛牛. All rights reserved.
//

import UIKit
import AudioKit 
import AudioKitUI
import Foundation

class  ViewController: UIViewController {

    var oscillator = AKOscillator( waveform: AKTable(.square))
    var reverb: AKReverb!
    var delay:  AKDelay!
   var audioSampler: AudioSampler!
    //reverb slider
    @IBOutlet var drywetmixslider: UISlider!
    @IBOutlet var reverbAmountLabel: UILabel!
    @IBAction func dryWetmixslider(_ sender: UISlider) {
         // Call the corresponding function in the reverbAudioPlayer class
        reverb.dryWetMix = Double(sender.value)
        reverbAmountLabel.text = String(format: "%0.2f",
        reverb.dryWetMix)
        
    }
    
    
    
    
    //piano button
    
    
    @IBAction func pianopressed(_ sender: UIButton) {
        
        oscillator.amplitude = 1.0
        if sender.tag == 1{
            oscillator.frequency = 261.626
        }
        else if sender.tag == 2 {
            oscillator.frequency = 293.67
        }
        else if sender.tag == 3 {
            oscillator.frequency = 329.63
        }
        else if sender.tag == 4 {
            oscillator.frequency = 392.00
        }
        else if sender.tag == 5 {
            oscillator.frequency = 440.00
        }
        else if sender.tag == 6 {
            oscillator.frequency = 493.88
        }
        else if sender.tag == 7 {
            oscillator.frequency = 523.25
        }
        else if sender.tag == 8 {
            oscillator.frequency = 587.33
        }
        else if sender.tag == 9 {
            oscillator.frequency = 659.26
        }
        

    }
    
    @IBAction func pianoreleased(_ sender: UIButton) {
        oscillator.rampDuration = 0.1
        oscillator.amplitude = 0.0
        oscillator.rampDuration = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         audioSampler = AudioSampler() 
        
  
        //create instance of ReverbAudioPlayer class
        

        reverb = AKReverb(oscillator)

        let mixer = AKMixer(reverb,audioSampler.playerOne,audioSampler.playerTwo,audioSampler.playerThree,audioSampler.playerFour,audioSampler.playerFive,audioSampler.playerSix,audioSampler.playerSeven) //add audiosample
        AudioKit.output = mixer
        reverb.dryWetMix = 0.8
       reverb.loadFactoryPreset(.cathedral)
       reverbAmountLabel.text = String(format: "%0.2f", reverb.dryWetMix)
        
        //create
        
        try!  AudioKit.start()  
        oscillator.amplitude = 0.0
        oscillator.rampDuration = 0.2
        oscillator.frequency = 440.0
        oscillator.start()
        
        
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame:UIScreen.main.bounds)
        backgroundImage.image = UIImage(named:"abc.jpg")
        backgroundImage.contentMode = .scaleToFill

        self.view.insertSubview(backgroundImage, at : 0)
    }
    
    
    //create audiofile button
   
    @IBAction func loopButtonPressed(_ sender: UIButton) {
          if sender.tag == 1{audioSampler.PlaySampleOne()
            print("button click")}
          else if sender.tag == 2{audioSampler.PlaySampleTwo()}
          else if sender.tag == 3{audioSampler.PlaySampleThree()}
          else if sender.tag == 4{audioSampler.PlaySampleFour()}
          else if sender.tag == 5{audioSampler.PlaySampleFive()}
          else if sender.tag == 6{audioSampler.PlaySampleSix()}
          else if sender.tag == 7{audioSampler.PlaySampleSeven()}
        
    }
    @IBAction func loopButtonReleased(_ sender: UIButton) {
        print("button click")
    }
    
    
    
    
    
    
    
    
 }

