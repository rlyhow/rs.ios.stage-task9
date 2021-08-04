//
//  ImageButton.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 1.08.21.
//

import UIKit

class ImageButton: UIButton {
    
    private(set) var images: [UIImage] = []
    private(set) var title: String = "string"
    private(set) var subTitle: String = "string"
    private(set) var text: String?
    private(set) var coverImage: UIImage = UIImage("story-1")
    private(set) var gradientView = UIView(frame: CGRect.zero)
    private(set) var gradient = CAGradientLayer()
    
    private lazy var backImage: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: self.coverImage)
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(title: String, coverImage: UIImage, subtitle: String, images: [UIImage], text: String) {
        super.init(frame: .zero)
        self.title = title
        self.coverImage = coverImage
        self.subTitle = subtitle
        self.images = images
        self.text = text
        setup()
        setupTitle()
        setupSubtitle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupTitle()
        setupSubtitle()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.point(inside: point, with: event) {
            return self
        }
        return super.hitTest(point, with: event)
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.23).isActive = true
        
        layer.borderWidth = 1
        layer.borderColor = (UIColor.black).cgColor
        layer.cornerRadius = 18
        
        //backgroundColor = .black

        addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        backImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        backImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        backImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        setupGradient()
        
    }
    
    func setupTitle() {
        let font = UIFont(name: "Rockwell-Regular", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 10.0
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ]
        let heading = title
        
        let attributedHeading = NSAttributedString(string: heading, attributes: attributes)
        
        let label = UILabel(frame: CGRect.zero)
        label.attributedText = attributedHeading
        label.lineBreakMode = .byTruncatingTail
        
        gradientView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: gradientView.widthAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
    }
    
    func setupSubtitle() {
        let font2 = UIFont(name: "Rockwell-Regular", size: 12)
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.firstLineHeadIndent = 10.0
        let attributes2: [NSAttributedString.Key: Any] = [
            .font: font2!,
            .foregroundColor: UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1),
            .paragraphStyle: paragraphStyle2
        ]
        let heading2 = subTitle
        
        let attributedHeading2 = NSAttributedString(string: heading2, attributes: attributes2)
        
        let label2 = UILabel(frame: CGRect.zero)
        label2.attributedText = attributedHeading2
        
        gradientView.addSubview(label2)
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label2.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label2.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.28).isActive = true
        
    }
    
    func setupGradient() {
        gradient.locations = [0.7, 1]
        gradient.cornerRadius = 10
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
