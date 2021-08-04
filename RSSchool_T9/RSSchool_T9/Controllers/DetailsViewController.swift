//
//  DetailsViewController.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 2.08.21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var titleOnDetails:String?
    var typeOnDetails:String?
    var textOnDetails:String?
    weak var mainImageOnDetails: UIImage?
    var arrayOfImages: [UIImage]?
    
    var closeButton: ExitButton?
    lazy var scrollView = UIScrollView()
    lazy var stripView = UIView()
    lazy var mainImage = MainImage(mainImage: UIImage("story-1"), title: "", type: "")
    var button: ButtonGallery?
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .top
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
                
        setupScrollView()
        setupCloseButton()
        setupMainImageAndStrip()
        setupSubTitle()
        setupStack()
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupCloseButton() {
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let image = UIImage(systemName: "xmark", withConfiguration: boldConfig)
        closeButton = ExitButton(coverImage: image!)
        closeButton!.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
        
        scrollView.addSubview(closeButton!)
        closeButton!.translatesAutoresizingMaskIntoConstraints = false
        closeButton!.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        closeButton!.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25).isActive = true
        closeButton!.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton!.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupMainImageAndStrip() {
        mainImage = MainImage(mainImage: mainImageOnDetails!, title: titleOnDetails!, type: typeOnDetails!)
        scrollView.addSubview(mainImage)
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        mainImage.heightAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: 1.23).isActive = true
        mainImage.topAnchor.constraint(equalTo: closeButton!.bottomAnchor, constant: 30).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
    
        stripView.backgroundColor = .white
        scrollView.addSubview(stripView)
        stripView.translatesAutoresizingMaskIntoConstraints = false
        stripView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stripView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 58).isActive = true
        stripView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        stripView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupStack() {
        if typeOnDetails == "Gallery" {
            setupGallery()
        } else {
            setupStory()
        }
        
    }
    
    func buildGalleryButton(coverImage: UIImage) -> ButtonGallery {
        button = ButtonGallery(coverImage: coverImage)
        button!.addTarget(self, action: #selector(openDetailsViewController), for: .touchUpInside)
        return button!
    }
        
    func setupSubTitle() {
        
        let typeLabel = UILabel()
        typeLabel.text = typeOnDetails
        typeLabel.textColor = .white
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        
        let viewLabel = UIView()
        viewLabel.layer.borderWidth = 1
        viewLabel.layer.borderColor = UIColor.white.cgColor
        viewLabel.layer.cornerRadius = 8
        viewLabel.backgroundColor = .black
        
        scrollView.addSubview(viewLabel)
        scrollView.bringSubviewToFront(viewLabel)
        viewLabel.addSubview(typeLabel)
        
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.widthAnchor.constraint(equalToConstant: 122).isActive = true
        viewLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        viewLabel.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20).isActive = true
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.centerXAnchor.constraint(equalTo: viewLabel.centerXAnchor).isActive = true
        typeLabel.heightAnchor.constraint(equalTo: viewLabel.heightAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: viewLabel.topAnchor, constant: 3).isActive = true
    }
    
    func setupGallery() {
        scrollView.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        verticalStack.topAnchor.constraint(equalTo: stripView.bottomAnchor, constant: 40).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        
        for item in arrayOfImages! {
            verticalStack.addArrangedSubview(buildGalleryButton(coverImage: item))
        }
    }
    
    func setupStory() {
        let textLabel = UILabel()
        textLabel.text = self.textOnDetails
        textLabel.textColor = .white
        textLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        
        let viewLabel = UIView()
        viewLabel.layer.borderWidth = 1
        viewLabel.layer.borderColor = UIColor.white.cgColor
        viewLabel.layer.cornerRadius = 8
        viewLabel.backgroundColor = .black

        viewLabel.addSubview(textLabel)
        scrollView.addSubview(viewLabel)

        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.topAnchor.constraint(equalTo: stripView.bottomAnchor, constant: 50).isActive = true
        viewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true
        
        viewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        viewLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: viewLabel.topAnchor, constant: 30).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: viewLabel.bottomAnchor,constant: -30).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: viewLabel.leadingAnchor, constant: 30).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: viewLabel.trailingAnchor, constant: -40).isActive = true
    }
    
    @objc func openDetailsViewController(sender: ButtonGallery) {
        let detailView = ImageViewController()
        detailView.image = sender.coverImage
                
        detailView.modalPresentationStyle = .fullScreen
        present(detailView, animated: true)
    }
    
    @objc func closeWindow() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
