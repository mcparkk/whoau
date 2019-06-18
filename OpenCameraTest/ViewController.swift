//
//  ViewController.swift
//  OpenCameraTest
//
//  Created by 조기현 on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //utterance.voice = AVSpeechSynthesisVoice(language : "ko_KR")
    
    var myCamera:Camera!
    
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //myCamera = Camera(controller: self, andImageView: imageView)
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string : "친구들을 만나느라 샤샤샤 조르지마 어디가지 않아 부르게해줄게 베이베.")
        
        utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
        
        
        synthesizer.speak(utterance)
    }
    override func viewDidAppear(_ animated: Bool) {
       // myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
       // myCamera.stop()
    }
    
}


