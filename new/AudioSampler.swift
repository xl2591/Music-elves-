//
//  AudioSampler.swift
//  SampleTriggering
//
//  Created by Nicholas Arner on 5/8/16. Edited Andy Hunt 25/8/17
//  Copyright © 2017 University of York Department of Electronics 
//

import Foundation
import AudioKit

open class AudioSampler {
    
    // Declare AudioPlayers pointer as class variables
    // so they can be accessed by the functions below
    
    var playerOne: AKAudioPlayer!
    var playerTwo: AKAudioPlayer!
    var playerThree: AKAudioPlayer!
    var playerFour: AKAudioPlayer!
    var playerFive: AKAudioPlayer!
    var playerSix: AKAudioPlayer!
    var playerSeven: AKAudioPlayer!
    
    init () {
        
        // Load the audio samples into audio file readers
        
        let sampleOne = try! AKAudioFile(readFileName: "loop1 drum.wav", baseDir: .resources)
        let sampleTwo = try! AKAudioFile(readFileName: "loop2 drum2.wav", baseDir: .resources)
        let sampleThree = try! AKAudioFile(readFileName: "loop3 drum3.wav", baseDir: .resources)
        let sampleFour = try! AKAudioFile(readFileName: "loop4 drum4.wav", baseDir: .resources)
        let sampleFive = try! AKAudioFile(readFileName: "loop5 flute.wav", baseDir: .resources)
        let sampleSix = try! AKAudioFile(readFileName: "loop6 flute2.wav", baseDir: .resources)
        let sampleSeven = try! AKAudioFile(readFileName: "loop7.wav", baseDir: .resources)

        // Create audio players for each audio file
        
        playerOne = try! AKAudioPlayer(file: sampleOne)
        playerTwo = try! AKAudioPlayer(file: sampleTwo)
        playerThree = try! AKAudioPlayer(file: sampleThree)
        playerFour = try! AKAudioPlayer(file: sampleFour)
        playerFive = try! AKAudioPlayer(file: sampleFive)
        playerSix = try! AKAudioPlayer(file: sampleSix)
        playerSeven = try! AKAudioPlayer(file: sampleSeven)
        
                
        // Create a mixer object with the audio players as inputs
        
        let mixer = AKMixer(playerOne, playerTwo, playerThree, playerFour, playerFive, playerSix, playerSeven)
//        let reverbb = AKReverb(mixer)
 //       AudioKit.output = mixer // Let mixer output go to AudioKit o/p
//        try!AudioKit.start()
    }
    
    // These functions are accessible outside the class so that the
    // ViewController can access them, and trigger the files.
    
    open func PlaySampleOne() {
        playerOne.play()
    }
    open func PlaySampleTwo() {
        playerTwo.play()
    }
    open func PlaySampleThree() {
        playerThree.play()
    }
    open func PlaySampleFour() {
        playerFour.play()
    }
    open func PlaySampleFive() {
        playerFive.play()
    }
    open func PlaySampleSix() {
        playerSix.play()
    }
    open func PlaySampleSeven() {
        playerSeven.play()
    }
  
    }
    
  
    
    

