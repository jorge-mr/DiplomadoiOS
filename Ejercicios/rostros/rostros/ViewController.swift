//
//  ViewController.swift
//  rostros
//
//  Created by d182_Jorge_M on 02/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setTitle("Detectar rostros", for: .normal)
        button.addTarget(self, action: #selector(detectFace), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectImage))
        setupLayout()
    }

    func setupLayout(){
        view.addSubview(button)
        view.addSubview(faceImage)
        
        NSLayoutConstraint.activate([
        faceImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        faceImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        faceImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
        faceImage.heightAnchor.constraint(equalToConstant: 300),
        
        button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
        button.heightAnchor.constraint(equalToConstant: 30),
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
    }
    
    @objc func detectFace(){
        let detectFaceView = DetectFaceViewController()
        detectFaceView.selectedImage = selectedImage
        navigationController?.pushViewController(detectFaceView, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            faceImage.image = image
            selectedImage = image
            dismiss(animated: true)
        }
    }
}

