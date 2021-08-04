//
//  ImageViewController.swift
//  RSSchool_T9
//
//  Created by Mikita Shalima on 3.08.21.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    lazy var scrollView = UIScrollView()
    var closeBtn: ExitButton?
    var image: UIImage?
    var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupScrollView()
        
        let scrollViewTap = UITapGestureRecognizer(target: self, action: #selector(scrollViewTapped))
        scrollView.addGestureRecognizer(scrollViewTap)
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 1
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor).isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor).isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor).isActive = true
        
        
        imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        scrollView.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        
        
        // КРЕСТИК
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let image = UIImage(systemName: "xmark", withConfiguration: boldConfig)
        closeBtn = ExitButton(coverImage: image!)
        closeBtn!.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
        scrollView.addSubview(closeBtn!)

        closeBtn!.translatesAutoresizingMaskIntoConstraints = false
        closeBtn!.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn!.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeBtn!.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        closeBtn!.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            
    }
    
    // ----------------------------
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    
    @objc func scrollViewTapped() {
        if closeBtn?.isHidden == true {
            closeBtn?.isHidden = false
            closeBtn?.isEnabled = true
        } else {
            closeBtn?.isHidden = true
            closeBtn?.isEnabled = false
        }
    }
    
    @objc func closeWindow() {
        self.dismiss(animated: true, completion: nil)
    }

}


