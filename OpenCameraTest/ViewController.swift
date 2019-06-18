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
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //myCamera = Camera(controller: self, andImageView: imageView)
        
        let utterance1 = AVSpeechUtterance(string : "얼굴 인식 학습을 하시려면 화면 위쪽을, 얼굴 인식 기능 사용은 화면 아래쪽을 눌러주세요.")
        
        utterance1.voice = AVSpeechSynthesisVoice (language: "ko_KR")
        
        synthesizer.speak(utterance1)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        // myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
        // myCamera.stop()
        synthesizer.stopSpeaking(at: .immediate)
    
}


}
