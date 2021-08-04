//
//  MainImage.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 3.08.21.
//

import UIKit

class MainImage: UIView {
    
    private(set) var mainImage: UIImage = UIImage("story-1")
    private(set) var title: String = "string"
    private(set) var type: String = "type"
    private(set) var gradientView = UIView(frame: CGRect.zero)
    private(set) var gradient = CAGradientLayer()
    
    private lazy var backImage: UIImageView = {
        let imageView = UIImageView(image: mainImage)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(mainImage: UIImage, title: String, type: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.mainImage = mainImage
        self.title = title
        self.type = type
        setup()
        setupTitle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupTitle()
    }
    
    func setup() {
        layer.borderWidth = 1
        layer.borderColor = (UIColor.white).cgColor
        layer.cornerRadius = 8

        addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        setupGradient()
    }
    
    func setupTitle() {
        let font = UIFont(name: "Rockwell-Regular", size: 48)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ]
        let heading = title
        
        let attributedHeading = NSAttributedString(string: heading, attributes: attributes)
        
        let label = UILabel(frame: CGRect.zero)
        label.attributedText = attributedHeading
        label.numberOfLines = 2
        
        gradientView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.widthAnchor.constraint(equalTo: gradientView.widthAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    }
    
    func setupGradient() {
        gradient.locations = [0.5, 1]
        gradient.cornerRadius = 8
        gradient.colors = [ UIColor.clear.cgColor, UIColor.black.cgColor ]
        gradientView.layer.addSublayer(gradient)
        self.addSubview(gradientView)
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.bottomAnchor.constraint(equalTo: self.subviews[0].bottomAnchor).isActive = true
        gradientView.topAnchor.constraint(equalTo: self.subviews[0].topAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: self.subviews[0].leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.subviews[0].trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        gradientView = UIView(frame: self.subviews[0].bounds)
        gradient.frame = gradientView.frame
    }


}
