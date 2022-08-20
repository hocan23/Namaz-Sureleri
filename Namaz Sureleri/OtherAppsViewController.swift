//
//  OtherAppsViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit

class OtherAppsViewController: UIViewController {

    
    @IBOutlet weak var bottomRightText: UILabel!
    @IBOutlet weak var bottomLeftText: UILabel!
    @IBOutlet weak var midRightText: UILabel!
    @IBOutlet weak var topRightText: UILabel!
    @IBOutlet weak var topLeftText: UILabel!
    
    @IBOutlet weak var midLefText: UILabel!
    @IBOutlet weak var topRightTrailingConstant: NSLayoutConstraint!
    @IBOutlet weak var twoThreeLineConstant: NSLayoutConstraint!
    @IBOutlet weak var OneTwoLineConstant: NSLayoutConstraint!
    
    @IBOutlet weak var topLeftLeadingConstant: NSLayoutConstraint!
    @IBOutlet weak var bottomLeftView: UIView!
    
    @IBOutlet weak var removeView: UIImageView!
    @IBOutlet weak var backView: UIImageView!
    @IBOutlet weak var topLeftView: UIView!
    @IBOutlet weak var midLeftView: UIView!
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var middleRightView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    
    func setupUi(){
        topLeftLeadingConstant.constant = view.frame.width*0.06
        topRightTrailingConstant.constant = view.frame.width*0.06
        OneTwoLineConstant.constant = view.frame.height*0.02
        twoThreeLineConstant.constant = view.frame.height*0.02
        topLeftView.isUserInteractionEnabled = true
        topLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(topLeftViewTapped)))
        topRightView.isUserInteractionEnabled = true
        topRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(topRightViewTapped)))
        midLeftView.isUserInteractionEnabled = true
        midLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(midLeftViewTapped)))
        middleRightView.isUserInteractionEnabled = true
        middleRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(middleRightViewTapped)))
        bottomRightView.isUserInteractionEnabled = true
        bottomRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bottomRightViewTapped)))
        bottomLeftView.isUserInteractionEnabled = true
        bottomLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bottomLeftViewTapped)))
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backViewTapped)))
        topLeftView.layer.cornerRadius = 20
        topRightView.layer.cornerRadius = 20
        midLeftView.layer.cornerRadius = 20
        middleRightView.layer.cornerRadius = 20
        bottomLeftView.layer.cornerRadius = 20
        bottomRightView.layer.cornerRadius = 20
        
        topLeftText.font = topLeftText.font!.withSize(UIScreen.main.bounds.size.height*0.014)
        topRightText.font = topRightText.font!.withSize(UIScreen.main.bounds.size.height*0.015)
        midLefText.font = midLefText.font!.withSize(UIScreen.main.bounds.size.height*0.015)
        midRightText.font = midRightText.font!.withSize(UIScreen.main.bounds.size.height*0.015)
        bottomLeftText.font = bottomLeftText.font!.withSize(UIScreen.main.bounds.size.height*0.015)
        bottomRightText.font = bottomRightText.font!.withSize(UIScreen.main.bounds.size.height*0.015)
        arrangeShadowforViews(vieww: topLeftView)
        arrangeShadowforViews(vieww: topRightView)
        arrangeShadowforViews(vieww: midLeftView)
        arrangeShadowforViews(vieww: middleRightView)
        arrangeShadowforViews(vieww: bottomLeftView)
        arrangeShadowforViews(vieww: bottomRightView)

    }
    func arrangeShadowforViews (vieww:UIView){
        vieww.layer.cornerRadius = 20
        vieww.layer.masksToBounds = false
        vieww.layer.shadowColor = UIColor(red: 35/255, green: 75/255, blue: 113/255, alpha: 0.1).cgColor
        vieww.layer.shadowOffset = CGSize(width: 0, height: 5)
        vieww.layer.shadowRadius = 10
        vieww.layer.shadowOpacity = 1
    }
    @objc func topLeftViewTapped(){
        
    }
    @objc func topRightViewTapped(){
        
    }
    @objc func midLeftViewTapped(){
        
    }
    @objc func middleRightViewTapped(){
        
    }
    @objc func bottomRightViewTapped(){
        
    }
    @objc func bottomLeftViewTapped(){
        
    }
    @objc func removeViewTapped(){
        
    }
    @objc func backViewTapped(){
        dismiss(animated: true)
    }
}
