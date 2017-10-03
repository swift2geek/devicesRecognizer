//
//  ViewController.swift
//  vision-ML-test
//
//  Created by Vladimir Valter on 27/09/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {

    @IBOutlet weak var captureImageView: RoundedShadowImageView!
    @IBOutlet weak var flashBtn: RoundedShadowButton!
    @IBOutlet weak var identificationLbl: UILabel!
    @IBOutlet weak var confidenceLbl: UILabel!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var roundedLblView: RoundedShadowView!

    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080

        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)

        do {
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true {
                captureSession.addInput(input)
            }

            cameraOutput = AVCapturePhotoOutput()

            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.addOutput(cameraOutput!)

                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait

                cameraView.layer.addSublayer(previewLayer!)
                captureSession.startRunning()

            }
        } catch {
            debugPrint(error)
        }
    }


}

