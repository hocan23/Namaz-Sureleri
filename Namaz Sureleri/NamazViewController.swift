//
//  NamazViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit

class NamazViewController: UIViewController {

    
    
    
    enum PageType{
        case namaz
        case abdest
    }
    
    
    @IBOutlet weak var blueView: UIImageView!
    @IBOutlet weak var grayImage: UIImageView!
    @IBOutlet weak var afterButton: UILabel!
    @IBOutlet weak var previousButton: UILabel!
    @IBOutlet weak var namazTextView: UITextView!
    @IBOutlet weak var namazView: UIImageView!
    @IBOutlet weak var removeView: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    
    var pageType : PageType?
    var index = 1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    

    func setupUi (){
        afterButton.isUserInteractionEnabled = true
        afterButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(afterButtonTapped)))
        previousButton.isUserInteractionEnabled = true
        previousButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(previousButtonTapped)))
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        afterButton.layer.cornerRadius = afterButton.frame.height*0.5
        previousButton.layer.cornerRadius = previousButton.frame.height*0.5
        grayImage.layer.cornerRadius = grayImage.frame.height*0.5
        blueView.layer.cornerRadius = blueView.frame.height*0.5

        namazView.layer.cornerRadius = 20
        if pageType == .namaz{

        namazView.image = UIImage(named: "namaz\(index)")
        namazTextView.text = Utils.namazText[index-1]
        }else{
            namazView.image = UIImage(named: "abdest\(index)")
            namazTextView.text = Utils.abdestText[index-1]
        }
        namazTextView.font = namazTextView.font!.withSize(UIScreen.main.bounds.size.height*0.025)

    }
    @objc func afterButtonTapped(){
        index+=1

       
        
        if pageType == .namaz{
            if index == 11{
                index=1
            }
            if index == -1{
                index = 10
            }
        namazTextView.text = Utils.namazText[index-1]
        namazView.image = UIImage(named: "namaz\(index)")
            
        }else{
            if index == 8{
                index=1
            }
            if index == -1{
                index = 7
            }
            namazTextView.text = Utils.abdestText[index-1]
            namazView.image = UIImage(named: "abdest\(index)")
        }
        
    }
    
    @objc func previousButtonTapped(){
        index-=1
        if pageType == .namaz{

        if index == 11{
            index=1
        }
        if index == 0{
            index = 10
        }
        namazTextView.text = Utils.namazText[index-1]
        namazView.image = UIImage(named: "namaz\(index)")
        }else{
            if index == 8{
                index=1
            }
            if index == 0{
                index = 7
            }
            namazTextView.text = Utils.abdestText[index-1]
            namazView.image = UIImage(named: "abdest\(index)")
            
        }
    }
    
    @objc func removeViewTapped(){
        
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
        
    }
    

}
