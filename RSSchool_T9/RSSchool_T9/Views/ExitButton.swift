//
//  ExitButton.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 2.08.21.
//

import UIKit

class ExitButton: UIButton {

    private(set) var coverImage: UIImage = UIImage("story-1")
    
    private lazy var backImage: UIImageView = {
        let imageView = UIImageView(image: coverImage)
        return imageView
    }()

    init(coverImage: UIImage) {
        super.init(frame: .zero)
        self.coverImage = coverImage
        setup()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.point(inside: point, with: event) {
            return self
        }
        return super.hitTest(point, with: event)
    }
    
    func setup() {        
        tintColor = .white
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .clear

        backImage.contentMode = .scaleToFill
        addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        layer.cornerRadius = frame.width / 2
    }
    
    override var isHighlighted: Bool {
            didSet {
                tintColor = isHighlighted ? UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1) : .white
            }
        }
    
}
