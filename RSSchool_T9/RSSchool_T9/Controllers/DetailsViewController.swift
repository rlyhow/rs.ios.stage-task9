//
//  DetailsViewController.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 2.08.21.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate {
    
    var titleOnDetails:String?
    var typeOnDetails:String?
    var textOnDetails:String?
    weak var mainImageOnDetails: UIImage?
    var arrayOfImages: [UIImage]?
    var pathsOfImages: [CGPath]?
    var colorForSvg:UIColor?
    var boolSwitch:Bool?
    
    var closeButton: ExitButton?
    lazy var scrollView = UIScrollView()
    lazy var stripView = UIView()
    lazy var mainImage = MainImage(mainImage: UIImage("story-1"), title: "", type: "")
    var button: ButtonGallery?
    var horizontalScrollview: UIScrollView!
    var horizontalStack: UIStackView!
    var canvasImages: [UIView] = []
    
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
        
        //print(self.colorForSvg)
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
    
    func buildCanvas(path: CGPath) -> CanvasView {
        let canvas = CanvasView(path: path)
        return canvas
    }
    
    func setupStory() {
        
        horizontalScrollview = UIScrollView()
        horizontalScrollview.delegate = self
        horizontalScrollview.showsHorizontalScrollIndicator = false
        view.addSubview(horizontalScrollview)
        
        horizontalScrollview.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        horizontalScrollview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        horizontalScrollview.topAnchor.constraint(equalTo: stripView.bottomAnchor, constant: 50).isActive = true
        horizontalScrollview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 100
        horizontalStack.distribution = .fillEqually
        
        horizontalScrollview.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.heightAnchor.constraint(equalTo: horizontalScrollview.heightAnchor, multiplier: 0.75).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: horizontalScrollview.leadingAnchor, constant: 80).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: horizontalScrollview.trailingAnchor, constant: -50).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: horizontalScrollview.topAnchor, constant: 12.5).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: horizontalScrollview.bottomAnchor, constant: -12.5).isActive = true
        
        //        horizontalScrollview.backgroundColor = .red
        //        horizontalStack.backgroundColor = .darkGray
        
        for item in pathsOfImages! {
            let newPic: UIView = buildCanvas(path: item)
            horizontalStack.addArrangedSubview(newPic)
            canvasImages.append(newPic)
        }
        
        for i in canvasImages.indices {
            if horizontalScrollview.bounds.contains(horizontalScrollview.convert(canvasImages[i].bounds, from: canvasImages[i])) {
                if canvasImages[i].layer.sublayers?.count == nil {
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.path = pathsOfImages![i]
                    shapeLayer.strokeStart = 0
                    shapeLayer.strokeEnd = 0
                    shapeLayer.strokeColor = self.colorForSvg?.cgColor
                    shapeLayer.fillColor = UIColor.clear.cgColor
                    shapeLayer.lineWidth = 1
                    
                    canvasImages[i].layer.addSublayer(shapeLayer)
                    if (boolSwitch!){
                        Timer.scheduledTimer(withTimeInterval: 0.0167, repeats: true) { timer in
                            
                            if (shapeLayer.strokeEnd >= 1) {
                                timer.invalidate()
                            }
                            
                            let line:CGFloat = 1.0 / (60.0 * 3)
                            shapeLayer.strokeEnd += line
                        }
                    } else {
                        shapeLayer.strokeEnd = 1
                    }
                    
                }
            }
        }
        
        // ТЕКСТ ИСТОРИИ
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
        viewLabel.topAnchor.constraint(equalTo: horizontalScrollview.bottomAnchor, constant: 50).isActive = true
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if boolSwitch! {
            for i in canvasImages.indices {
                if scrollView.bounds.contains(scrollView.convert(canvasImages[i].bounds, from: canvasImages[i])) {
                    if canvasImages[i].layer.sublayers?.count == nil {
                        
                        let shapeLayer = CAShapeLayer()
                        shapeLayer.path = pathsOfImages![i]
                        shapeLayer.strokeStart = 0
                        shapeLayer.strokeEnd = 0
                        shapeLayer.strokeColor = UIColor.yellow.cgColor
                        shapeLayer.fillColor = UIColor.clear.cgColor
                        shapeLayer.lineWidth = 1

                        canvasImages[i].layer.addSublayer(shapeLayer)

                        Timer.scheduledTimer(withTimeInterval: 0.0167, repeats: true) { timer in

                            if (shapeLayer.strokeEnd >= 1) {
                                timer.invalidate()
                            }

                            let line:CGFloat = 1.0 / (60.0 * 3)
                            shapeLayer.strokeEnd += line
                        }
                        
                    }
                } else {
                    if canvasImages[i].layer.sublayers?.count == 1 {
                        canvasImages[i].layer.sublayers![0].removeFromSuperlayer()
                    }
                }
            }
        }
        
    }
    
}
