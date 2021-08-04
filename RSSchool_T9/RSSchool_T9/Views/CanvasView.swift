//
//  CanvasView.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 4.08.21.
//

import UIKit

class CanvasView: UIView {

    private(set) var path: CGPath?
    
    init(path: CGPath) {
        super.init(frame: .zero)
        self.path = path
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
