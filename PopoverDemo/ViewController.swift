//
//  ViewController.swift
//  PopoverDemo
//
//  Created by zhangwen on 2020/4/30.
//  Copyright © 2020 zhangwen. All rights reserved.
//

import UIKit

extension UIImage {
    func withColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else { return self }
        color.setFill()
        ctx.translateBy(x: 0, y: size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        ctx.clip(to: CGRect(x: 0, y: 0, width: size.width, height: size.height), mask: cgImage)
        ctx.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        guard let colored = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        UIGraphicsEndImageContext()
        return colored
    }
}


class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customImageButton(.leftImage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customImageButton(.rightImage))
        
    }
    
    func customImageButton(_ type: CustomImageButtonType) -> CustomImageButton {
        let image = UIImage(named: "home-arrow-down")!.withColor(.systemBlue)
        let button = CustomImageButton(frame: CGRect(x: 0, y: 0, width: 100, height: 36), title: "aaaaaaaaaaaaaaaaaaaa", image: image)
        button.titleLabel.textColor = .systemBlue
        button.type = type
        button.addTarget(self, action: #selector(addActionForButton(_:)), for: .touchUpInside)

        return button
    }
    
    @objc func addActionForButton(_ sender: UIButton) {
        let viewController = TableViewController(style: .plain)
        viewController.modalPresentationStyle = .popover
        guard let popoverController = viewController.popoverPresentationController else { return }
        popoverController.delegate = self
        popoverController.sourceView = sender
        popoverController.sourceRect = sender.bounds
        
        present(viewController, animated: true, completion: nil)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

