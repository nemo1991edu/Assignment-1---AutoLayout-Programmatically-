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
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    orangeRectangleView()
    purpleRectangleView()
    stackViewSquares()
    view.addSubview(mainView)
    setupLayout()
    
  }
    func makeSquareViews() -> [UIView] {
        
        var squareViews = [UIView]()
        
        for _ in 1...3 {
            let square = UIView(frame: .zero)
            square.backgroundColor = .blue
            square.translatesAutoresizingMaskIntoConstraints = false
            square.widthAnchor.constraint(equalToConstant: 80).isActive = true
            square.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            squareViews.append(square)
        }
        return squareViews
    }

    func stackViewSquares() {
        
        let stackView = UIStackView(arrangedSubviews: makeSquareViews())
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
    
        mainView.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.75).isActive = true
        
    }
    
    
    func orangeRectangleView() {
       
        let rectView = UIView()
        rectView.backgroundColor = UIColor(red: 252/255, green: 86/255, blue: 3/255, alpha: 1)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(rectView)

        rectView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        rectView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        rectView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        rectView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        let innerView1 = UIView()
        innerView1.backgroundColor = .systemOrange
        innerView1.translatesAutoresizingMaskIntoConstraints = false
        rectView.addSubview(innerView1)


        innerView1.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 10).isActive = true
        innerView1.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 10).isActive = true
        innerView1.widthAnchor.constraint(equalTo: rectView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.55).isActive = true
        innerView1.bottomAnchor.constraint(equalTo: rectView.bottomAnchor, constant: -10).isActive = true


        let innerView2 = UIView()
        innerView2.backgroundColor = .systemOrange
        innerView2.translatesAutoresizingMaskIntoConstraints = false
        rectView.addSubview(innerView2)
        
        innerView2.topAnchor.constraint(equalTo: rectView.topAnchor, constant: 10).isActive = true
        innerView2.trailingAnchor.constraint(equalTo: rectView.trailingAnchor, constant: -10).isActive = true
        innerView2.widthAnchor.constraint(equalToConstant: 82).isActive = true
        innerView2.bottomAnchor.constraint(equalTo: rectView.bottomAnchor, constant: -10).isActive = true
    
    }
    
    func purpleRectangleView() {
        let rectView = UIView(frame: .zero)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.backgroundColor = .purple
        mainView.addSubview(rectView)
        rectView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        rectView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        rectView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.66).isActive = true
        rectView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
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
