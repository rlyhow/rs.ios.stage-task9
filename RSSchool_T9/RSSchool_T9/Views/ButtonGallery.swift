//
//  ButtonGallery.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 3.08.21.
//

import UIKit

class ButtonGallery: UIButton {

    var coverImage: UIImage?
    
    private lazy var backImage: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: self.coverImage)
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
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
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.23).isActive = true
        layer.borderWidth = 1
        layer.borderColor = (UIColor.white).cgColor
        layer.cornerRadius = 8
        
        //backgroundColor = .black

        addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        backImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        backImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

}
