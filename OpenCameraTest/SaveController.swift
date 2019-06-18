//
//  SaveController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class SaveController: UIViewController {
    
    var myCamera:Camera!
    

    
    @IBAction func ChangeSwip(_ sender: Any) {
        if(myCamera.backCamera){
            myCamera.stop()
        }else{
            myCamera.start()
        }
    }
    
    
    
        
    
   
        //frontCamera = FrontCamera(controller: self, andImageView: SaveImgView)
  
    
//    @IBAction func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if (gestureRecognizer.state == .ended) {
//
//        }
//    }

    @IBOutlet var SaveImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myCamera = Camera(controller: self, andImageView: SaveImgView)
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
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
