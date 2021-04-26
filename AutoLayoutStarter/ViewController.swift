//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    let purpleBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let orangeView: UIView = {
        let viewContainer = UIView()
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = .orange
        leftView.layer.borderWidth = 8
        leftView.layer.borderColor = UIColor.red.cgColor
        viewContainer.addSubview(leftView)

        let rightView = UIView()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.backgroundColor = .orange
        rightView.layer.borderColor = UIColor.red.cgColor
        rightView.layer.borderWidth = 8
        viewContainer.addSubview(rightView)
        // setup inner views
        leftView.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        leftView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        leftView.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 2/3).isActive = true
        leftView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        
        rightView.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -8).isActive = true
        rightView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        
        return viewContainer
    }()
    
    let blueView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let square1 = UIView()
        square1.translatesAutoresizingMaskIntoConstraints = false
        square1.backgroundColor = .blue
        containerView.addSubview(square1)
        let square2 = UIView()
        square2.translatesAutoresizingMaskIntoConstraints = false
        square2.backgroundColor = .blue
        containerView.addSubview(square2)
        let square3 = UIView()
        square3.translatesAutoresizingMaskIntoConstraints = false
        square3.backgroundColor = .blue
        containerView.addSubview(square3)
        
        square1.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        square1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        square1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        square1.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.0).isActive = true
        
        square2.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        square2.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        square2.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.0).isActive = true
        square2.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.0).isActive = true
        
        square3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        square3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        square3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        square3.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1.0).isActive = true
        
        return containerView
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupView()
        setupLayout()
    }
    
    fileprivate func setupView() {
        self.mainView.addSubview(self.purpleBoxView)
        self.mainView.addSubview(self.orangeView)
        self.mainView.addSubview(self.blueView)
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
                                            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        // purple view
        self.purpleBoxView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        self.purpleBoxView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        self.purpleBoxView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 7/10).isActive = true
        self.purpleBoxView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        // orange view
        self.orangeView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        self.orangeView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        self.orangeView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.orangeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // blue view
        self.blueView.centerYAnchor.constraint(equalTo: self.mainView.centerYAnchor).isActive = true
        self.blueView.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
        self.blueView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.blueView.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 8/10).isActive = true
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

