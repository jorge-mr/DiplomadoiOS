//
//  DetectFaceViewController.swift
//  rostros
//
//  Created by d182_Jorge_M on 02/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Vision
import ImageIO

class DetectFaceViewController: UIViewController {

    var selectedImage : UIImage!
    
    let faceImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "placeholder")
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let resultsLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: "Arial", size: 15)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faceImage.image = selectedImage
        view.backgroundColor = .white
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let ciImage = selectedImage.cgImage else { return }
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(selectedImage.imageOrientation.rawValue))
        let faceRequest = VNDetectFaceRectanglesRequest(completionHandler: handleFaces)
        let handler = VNImageRequestHandler(cgImage: ciImage, orientation: orientation!)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([faceRequest])
            }catch {
                print("error al manejar la peticion",error)
            }
        }
    }
    
    func handleFaces(request: VNRequest, error : Error?){
        guard let observations = request.results as? [VNFaceObservation] else { return }
        DispatchQueue.main.async {
            self.handleFaces(observations: observations)
        }
    }
    
    
    func handleFaces(observations: [VNFaceObservation]){
        resultsLabel.text = "Se detectaron \(observations.count) rostros"
        
        for face in observations {
            let box1 = face.boundingBox
            let box2 = faceImage.bounds
            
            let w = box1.size.width * box2.width
            let h = box1.size.height * box2.height
            let x = box1.origin.x * box2.width
            let y = abs((box1.origin.y * box2.height) - box2.height) - h
            
            let subview = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
            subview.layer.borderColor = UIColor.yellow.cgColor
            subview.layer.borderWidth = 3.0
            faceImage.addSubview(subview)
        }
    }
    
    func setupLayout(){
        view.addSubview(faceImage)
        view.addSubview(resultsLabel)
        NSLayoutConstraint.activate([
            faceImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            faceImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            faceImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            faceImage.heightAnchor.constraint(equalToConstant: 300),
            resultsLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            resultsLabel.heightAnchor.constraint(equalToConstant: 30),
            resultsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resultsLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
    }
    
}
