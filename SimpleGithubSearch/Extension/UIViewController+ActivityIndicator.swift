//
//  UIViewController+ActivityIndicator.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 21/09/21.
//

import UIKit

extension UIViewController {

    func startLoading(with view: UIView, overlayView: UIView, activityView: UIActivityIndicatorView) {

        overlayView.frame = view.bounds
        overlayView.center = CGPoint(x: view.bounds.width / 2.0, y:view.bounds.height / 2.0)
        overlayView.backgroundColor = UIColor.white
        overlayView.alpha = 0.8
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10

        activityView.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width:40, height:40))
        activityView.style = .large
        activityView.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)

        overlayView.addSubview(activityView)
        view.addSubview(overlayView)

        activityView.startAnimating()
    }


    func stopLoading(overlayView: UIView, activityView: UIActivityIndicatorView) {
        activityView.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
