//
//  CustomImageButton.swift
//  PopoverDemo
//
//  Created by zhangwen on 2020/5/1.
//  Copyright © 2020 zhangwen. All rights reserved.
//

import UIKit

enum CustomImageButtonType {
    case leftImage
    case rightImage
}

class CustomImageButton: UIControl {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    var imageSize = CGSize(width: 20, height: 20)
    var type: CustomImageButtonType = .leftImage
    
    init(frame: CGRect, title: String, image: UIImage) {
        super.init(frame: frame)
        titleLabel.text = title
        imageView.image = image
        
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if type == .leftImage {
            imageView.frame = CGRect(x: 0, y: (frame.height - imageSize.height) / 2, width: imageSize.width, height: imageSize.height)
            
            titleLabel.frame = CGRect(x: imageSize.width, y: 0, width: frame.width - imageSize.width, height: frame.height)
        }
        else {
            imageView.frame = CGRect(x: frame.width - imageSize.width, y: (frame.height - imageSize.height) / 2, width: imageSize.width, height: imageSize.height)
            
            titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width - imageSize.width, height: frame.height)
        }
    }
    
}
