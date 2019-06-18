//
//  SaveController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation

class SaveController: UIViewController {
    
    var myCamera:Camera!
    let Synthesizer = AVSpeechSynthesizer()
    
    
    @IBAction func ChangeSwip(_ sender: Any) {
        if(myCamera.backCamera){
            myCamera.stop()
            Synthesizer.stopSpeaking(at: .immediate)
            let utterance = AVSpeechUtterance(string : "현재, 전면카메라입니다.")
            
            utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
            Synthesizer.speak(utterance)
        }else{
            Synthesizer.stopSpeaking(at: .immediate)
            myCamera.start()
            //let Synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string : "현재, 후면카메라입니다.")
            
            utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
            Synthesizer.speak(utterance)
        }
    }
    
    @IBOutlet var SaveImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCamera = Camera(controller: self, andImageView: SaveImgView)
        
        // Do any additional setup after loading the view.
        // let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string : "현재, 후면카메라입니다. 메인화면으로 가시려면  오른쪽으로 스와이프를, 전/후면 카메라 변경은 왼쪽으로 스와이프 해주십시오.")
        
        utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
        Synthesizer.speak(utterance)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
        Synthesizer.stopSpeaking(at: . immediate)
        myCamera.stop()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

