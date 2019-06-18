//
//  CameraViewController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    var myCamera : Camera!
    
    @IBOutlet var CameraImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCamera = Camera(controller: self, andImageView: CameraImg)
        // Do any additional setup after loading the view.
        super.viewDidLoad()
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
