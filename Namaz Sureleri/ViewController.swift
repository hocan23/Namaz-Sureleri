//
//  ViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topRightTrailingConstant: NSLayoutConstraint!
    @IBOutlet weak var topLeftLeadingConstant: NSLayoutConstraint!
    
    @IBOutlet weak var topHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var twoThreeLineConstant: NSLayoutConstraint!
    
    @IBOutlet weak var threeFourLineCONSTANT: NSLayoutConstraint!
    
    @IBOutlet weak var bottomRightLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var thirdRightLabel: UILabel!
    @IBOutlet weak var removeView: UIImageView!
    @IBOutlet weak var thirdLefLabel: UILabel!
    
    @IBOutlet weak var topRightLabel: UILabel!
    
    @IBOutlet weak var secondLeftLabel: UILabel!
    
    @IBOutlet weak var secondRightLabel: UILabel!
    
    
    
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var OneTwoLineConstant: NSLayoutConstraint!
    
    @IBOutlet weak var forthRightView: UIView!
    
    @IBOutlet weak var topLeftView: UIView!
    
    @IBOutlet weak var secondRightView: UIView!
    @IBOutlet weak var topRightView: UIView!
    
    @IBOutlet weak var thirdRightView: UIView!
    @IBOutlet weak var forthLeftView: UIView!
    @IBOutlet weak var thirdLeftView: UIView!
    @IBOutlet weak var secondLeftView: UIView!
    
    @IBOutlet weak var topHeightProportionConstant: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    func setupUi(){
        topLeftLeadingConstant.constant = view.frame.width*0.1
        topRightTrailingConstant.constant = view.frame.width*0.1
        OneTwoLineConstant.constant = view.frame.height*0.02
        twoThreeLineConstant.constant = view.frame.height*0.02
        threeFourLineCONSTANT.constant = view.frame.height*0.02
//        removeView.layer.cornerRadius = removeView.frame.height*0.5
        topLeftView.isUserInteractionEnabled = true
        topLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(topLeftViewTapped)))
        topRightView.isUserInteractionEnabled = true
        topRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(topRightViewTapped)))
        secondRightView.isUserInteractionEnabled = true
        secondRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondRightViewTapped)))
        secondLeftView.isUserInteractionEnabled = true
        secondLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondLeftViewTapped)))
        thirdLeftView.isUserInteractionEnabled = true
        thirdLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thirdLeftViewTapped)))
        thirdRightView.isUserInteractionEnabled = true
        thirdRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thirdRightViewTapped)))
        forthLeftView.isUserInteractionEnabled = true
        forthLeftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forthLeftViewTapped)))
        forthRightView.isUserInteractionEnabled = true
        forthRightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forthRightViewTapped)))
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        topLeftLabel.font = topLeftLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        topRightLabel.font = topRightLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        secondLeftLabel.font = secondLeftLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        secondRightLabel.font = secondRightLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        thirdLefLabel.font = thirdLefLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        thirdRightLabel.font = thirdRightLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        bottomLeftLabel.font = bottomLeftLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        bottomRightLabel.font = bottomRightLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        arrangeShadowforViews(vieww: topRightView)
        arrangeShadowforViews(vieww: topLeftView)
        arrangeShadowforViews(vieww: secondLeftView)
        arrangeShadowforViews(vieww: secondRightView)
        arrangeShadowforViews(vieww: thirdLeftView)
        arrangeShadowforViews(vieww: thirdRightView)
        arrangeShadowforViews(vieww: forthLeftView)
        arrangeShadowforViews(vieww: forthRightView)


        

        if UIDevice.current.userInterfaceIdiom == .pad  {
//            topHeightProportionConstant.constant = 0.25
            topHeightConstant.constant = view.frame.height*0.02
        }


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
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "NamazViewController") as! NamazViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.pageType = .namaz
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func topRightViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "NamazViewController") as! NamazViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.pageType = .abdest
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func secondRightViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "AdhanViewController") as! AdhanViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func secondLeftViewTapped(){
        
    }
    @objc func thirdLeftViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "KibleViewController") as! KibleViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func thirdRightViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "HadisViewController") as! HadisViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func forthLeftViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "OtherAppsViewController") as! OtherAppsViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func forthRightViewTapped(){
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func removeViewTapped(){
        
    }
    
}

