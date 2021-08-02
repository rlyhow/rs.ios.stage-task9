//
//  MainViewController.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 28.07.21.
//

import UIKit

class MainViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var portrait:[NSLayoutConstraint]?
    var landscape:[NSLayoutConstraint]?
    var isPortrait: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupViews()
        setupStackConstraint()
        setupScrollView()
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        isPortrait = UIDevice.current.orientation.isPortrait
        
        view.addSubview(scrollView)
        scrollView.addSubview(horizontalStack)
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        horizontalStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        
        if (UIScreen.main.traitCollection.verticalSizeClass == .regular) {
            NSLayoutConstraint.activate(portrait!)
        } else {
            NSLayoutConstraint.activate(landscape!)
        }
        
    }
    
    func setupStackConstraint() {
        portrait = [
            horizontalStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            horizontalStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ]
        
        landscape = [
            horizontalStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 200),
            horizontalStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -200)
        ]
    }
    
    func setupViews(){
        horizontalStack.addArrangedSubview(leftRow)
        horizontalStack.addArrangedSubview(rightRow)
        
        
        for item in FillingData.data {
            switch item {
            case .story(let object):
                leftRow.addArrangedSubview(buildButton(title: object.title, coverImage: object.coverImage, subtitle: "Story"))
            case .gallery(let object):
                rightRow.addArrangedSubview(buildButton(title: object.title, coverImage: object.coverImage, subtitle: "Gallery"))
            }
        }
    }
    
    func buildButton(title: String, coverImage: UIImage, subtitle: String) -> ImageButton {
        let button = ImageButton(title: title, coverImage: coverImage, subtitle: subtitle)
        //button.addTarget(self, action: #selector(paletteButtonHandler(_:)), for: .touchUpInside)
        return button
    }
    
    let horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let leftRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    let rightRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(landscape!)
            NSLayoutConstraint.activate(portrait!)

        } else if traitCollection.verticalSizeClass == .compact {
            
            NSLayoutConstraint.deactivate(portrait!)
            NSLayoutConstraint.activate(landscape!)
        }
    }
    
}
