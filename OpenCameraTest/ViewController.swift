//
//  SaveController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation
import Speech



class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    //utterance.voice = AVSpeechSynthesisVoice(language : "ko_KR")
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    
    
    var myCamera:Camera!
    let synthesizer = AVSpeechSynthesizer()
    var speechResult:String?
    
    @IBOutlet var BtnSpeech: UIButton!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: .init(identifier: "ko-KR"))
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        
        if available {
            BtnSpeech.isEnabled = true
        }else{
            BtnSpeech.isEnabled = false
        }
    }
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @IBAction func speechToAction(_ sender: Any) {
        if audioEngine.isRunning{
            audioEngine.stop()
            recognitionRequest?.endAudio()
            BtnSpeech.isEnabled = false
            BtnSpeech.setTitle("음성인식", for: .normal)
        }else{
            
            
            startRecording()
            BtnSpeech.setTitle("중지", for: .normal)
        }
    }
    
    
    func startRecording(){
        
        if recognitionTask != nil{
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, options: .mixWithOthers)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
        }catch{
            print("오디오세션 에러")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        
        //let inputNode = audioEngine.inputNode
        guard let inputNode: AVAudioNode  = audioEngine.inputNode else {fatalError("녹음장치가 없당")}
        
        guard let recognitionRequest = recognitionRequest else {fatalError("서버에 음성전달 못함ㅠㅠ")}
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask
            = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: {(result, Error) in
                var isFinal = false
                
                if result != nil{
                    
                    self.speechResult = result?.bestTranscription.formattedString
                    
                    if (self.speechResult?.contains("학습"))!
                    {
                        
                        self.btnSave.accessibilityActivate()
                        
                    }else if(self.speechResult?.contains("카메라"))!
                    {
                        self.btnCamera.accessibilityActivate()
                    }
                    
                    
                    
                    isFinal = (result?.isFinal)!
                }
                
                if Error != nil || isFinal {
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    
                    self.recognitionRequest = nil
                    self.recognitionTask = nil
                    
                    self.BtnSpeech.isEnabled = true
                }
            }
        )
        
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat){ (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
        }catch{
            print("에러때문에 오디오 엔진 실행 안된다능")
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRecognizer?.delegate = self
        
        // Do any additional setup after loading the view.
        //myCamera = Camera(controller: self, andImageView: imageView)
        
        let utterance1 = AVSpeechUtterance(string : "얼굴 인식 학습을 하시려면 화면 위쪽을, 얼굴 인식 기능 사용은 화면 아래쪽을 눌러주세요.")
        
        utterance1.voice = AVSpeechSynthesisVoice (language: "ko_KR")
        
        synthesizer.speak(utterance1)
        
        speechRecognizer?.accessibilityActivate()
        
        
        
        
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
