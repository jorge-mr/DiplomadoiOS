//
//  ViewController.swift
//  MyFirebaseiOSLab
//
//  Created by d182_Jorge_M on 05/05/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    //Esta cuenta de firebase esta en ios.enero.2018@gmail.com
    var ref : DatabaseReference!
    
    let formContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let registerButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(loginRegister), for: .touchUpInside)
        return btn
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Contraseña"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 1, y: 1, width: 15, height: 10))
        leftView.backgroundColor = .white
        tf.leftView = leftView
        return tf
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "email@example.com"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let formSegmentedControl : UISegmentedControl = {
        let sgc = UISegmentedControl(items: ["Login","Register"])
        sgc.translatesAutoresizingMaskIntoConstraints = false
        sgc.selectedSegmentIndex = 0
        sgc.tintColor = #colorLiteral(red: 0.8721945882, green: 0.9710169435, blue: 0.9931192994, alpha: 1)
        sgc.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        return sgc
    }()
    
    @objc func segmentedChange(){
        let title = formSegmentedControl.titleForSegment(at: formSegmentedControl.selectedSegmentIndex)
        registerButton.setTitle(title, for: .normal)
    }
    
    @objc func loginRegister(){
        if formSegmentedControl.selectedSegmentIndex == 0 { //login user
            loginUser()
        } else { //register user
            registerUser()
        }
    }
    
    func loginUser(){
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error?.localizedDescription {
                    print("🌪",error)
                } else {
                    print("🌟 usuario autenticado",user)
                    let userController = UserViewController()
                    self.navigationController?.pushViewController(userController, animated: true)
                }
            }
        } else {
            print("Introduce los datos completos")
        }
    }
    
    func registerUser(){
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let error = error?.localizedDescription {
                    print("🌪",error)
                } else {
                    print("🌟 usuario creado",user)
                    let values = ["name" : email]
                    self.ref.updateChildValues(values, withCompletionBlock: { (error, databaseRef) in
                        if error != nil {
                            print(error?.localizedDescription ?? "errorr")
                        }else{
                            print("dato guardado en la base de firebase")
                            print(databaseRef.description())
                        }
                    })
                }
            }
        } else {
            print("Introduce los datos completos")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        view.backgroundColor = #colorLiteral(red: 0.366412282, green: 0.8295993209, blue: 1, alpha: 1)
        setUpLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpLayout(){
        view.addSubview(formContainerView)
        view.addSubview(registerButton)
        view.addSubview(formSegmentedControl)
        formContainerView.addSubview(emailTextField)
        formContainerView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
        formContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        formContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        formContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
        formContainerView.heightAnchor.constraint(equalToConstant: 120),
        
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        registerButton.topAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: 15),
        registerButton.widthAnchor.constraint(equalTo: formContainerView.widthAnchor),
        registerButton.heightAnchor.constraint(equalToConstant: 50),
        
        emailTextField.leftAnchor.constraint(equalTo: formContainerView.leftAnchor, constant: 15),
        emailTextField.topAnchor.constraint(equalTo: formContainerView.topAnchor),
        emailTextField.widthAnchor.constraint(equalTo: formContainerView.widthAnchor),
        emailTextField.heightAnchor.constraint(equalToConstant: 60),
        
        passwordTextField.leftAnchor.constraint(equalTo: formContainerView.leftAnchor),
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
        passwordTextField.widthAnchor.constraint(equalTo: formContainerView.widthAnchor),
        passwordTextField.heightAnchor.constraint(equalToConstant: 60),
        
        formSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        formSegmentedControl.bottomAnchor.constraint(equalTo: formContainerView.topAnchor, constant: -15),
        formSegmentedControl.widthAnchor.constraint(equalTo: formContainerView.widthAnchor),
        formSegmentedControl.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
}





//pod 'Firebase/Core'
//pod 'Firebase/Auth'
//pod 'Firebase/Database'
//pod 'Firebase/Storage'
















