//
//  ViewController.swift
//  RecTexto
//
//  Created by d182_Jorge_M on 22/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ine")
        iv.backgroundColor = UIColor.red
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let resultsLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: "Arial", size: 20.0)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        self.findText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLayout(){
        view.addSubview(imageView)
        view.addSubview(resultsLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        resultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        resultsLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        resultsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dump(self.imageView.bounds)
    }

    func findText(){
        var textLayer : [CAShapeLayer] = []
        let textDetectionRequest = VNDetectTextRectanglesRequest { (req, err) in
            guard let observations = req.results as? [VNTextObservation] else {
                print("resultados inesperados")
                return
            }
            dump(self.imageView.bounds.height)
            textLayer = self.addShapesToText(forObservations: observations, withImageView: self.imageView)
        }
        if let image = self.imageView.image, let cgImage = image.cgImage {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            guard let _ = try? handler.perform([textDetectionRequest]) else {
                return print("No se pudo hacer la detección de texto")
            }
            for layer in textLayer {
                self.imageView.layer.addSublayer(layer)
            }
        } else {
            
        }
    }

    func addShapesToText(forObservations observations: [VNTextObservation], withImageView textImageView: UIImageView) -> [CAShapeLayer] {
        let layers : [CAShapeLayer] = observations.map { observation in
            let w = observation.boundingBox.size.width * textImageView.bounds.width
            let h = observation.boundingBox.size.height * textImageView.bounds.height
            let x = observation.boundingBox.origin.x * textImageView.bounds.width
            let y = abs(((observation.boundingBox.origin.y * (textImageView.bounds.height)) - textImageView.bounds.height)) - h
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: x, y: y, width: w, height: h)
            layer.borderColor = UIColor.blue.cgColor
            layer.cornerRadius = 4
            layer.borderWidth = 3
            return layer
        }
        return layers
    }
}

