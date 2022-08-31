//
//  NamazViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit
import StoreKit
import GoogleMobileAds

class NamazViewController: UIViewController {

    @IBOutlet weak var backwidthCons: NSLayoutConstraint!
    
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    
    
    
    
    
    @IBOutlet weak var buttonBottomCons: NSLayoutConstraint!
    @IBOutlet weak var textTrailingConstant: NSLayoutConstraint!
    @IBOutlet weak var textLeadingConstant: NSLayoutConstraint!
    
    
    @IBOutlet weak var buttonsHeightCons: NSLayoutConstraint!
    @IBOutlet weak var afterTrailingCons: NSLayoutConstraint!
    @IBOutlet weak var previousLeadingCons: NSLayoutConstraint!
    @IBOutlet weak var textViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    
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
    var isAd = false
    var pageType : PageType?
    var index = 1

    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        namazTextView.isUserInteractionEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        
        if Utils.isPremium == "premium"{
            removeView.isHidden = true
        }else{
            createAdd()
            removeView.isHidden = false
            if UIDevice.current.userInterfaceIdiom == .pad  {
                bannerView = GADBannerView(adSize: GADAdSizeLeaderboard)

            }else{
                bannerView = GADBannerView(adSize: GADAdSizeBanner)

            }
            bannerView.adUnitID = Utils.bannerId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        
    }
    }
    

    func setupUi (){
       
        afterButton.isUserInteractionEnabled = true
        afterButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(afterButtonTapped)))
        previousButton.isUserInteractionEnabled = false
        previousButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(previousButtonTapped)))
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        afterButton.layer.cornerRadius = afterButton.frame.height*0.5
        previousButton.layer.cornerRadius = previousButton.frame.height*0.5
        grayImage.layer.cornerRadius = grayImage.frame.height*0.5
        blueView.layer.cornerRadius = blueView.frame.height*0.5
        UITextView.appearance().backgroundColor = .clear
//        UITextView.appearance().textColor = .black
        namazView.layer.cornerRadius = 20
        if pageType == .namaz{

        namazView.image = UIImage(named: "namaz\(index)")
        namazTextView.text = Utils.namazText[index-1]
        }else{
            namazView.image = UIImage(named: "abdest\(index)")
            namazTextView.text = Utils.abdestText[index-1]
        }
        namazTextView.font = namazTextView.font!.withSize(UIScreen.main.bounds.size.height*0.022)
        
        
        if UIDevice.current.userInterfaceIdiom == .pad  {
            imageTopConstraint.constant = 50
            textViewTopConstraint.constant = 80
            previousLeadingCons.constant = 60
            afterTrailingCons.constant = 60
            buttonsHeightCons.constant = 60
            blueView.layer.cornerRadius = 30
            grayImage.layer.cornerRadius = 30
            backwidthCons.constant = 60
            backHeightCons.constant = 60
            previousButton.font = previousButton.font!.withSize(UIScreen.main.bounds.size.height*0.02)
            afterButton.font = afterButton.font!.withSize(UIScreen.main.bounds.size.height*0.02)
            textLeadingConstant.constant = 100
            textTrailingConstant.constant = 100
            buttonBottomCons.constant = 95
        }
        
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    
    @objc func afterButtonTapped(){
        afterButton.zoomIn()

        index+=1

       
        
        if pageType == .namaz{
            
            if index == 10{
                afterButton.text = "Tamamla"
            }
            
            if index == 11{
                if interstitial != nil {
                    interstitial?.present(fromRootViewController: self)
                    isAd = true
                } else {
                    print("Ad wasn't ready")
                    self.dismiss(animated: true)
                }
                
            
                let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                destinationVC.modalPresentationStyle = .fullScreen
                self.present(destinationVC, animated: true, completion: nil)
                
            }else{
                namazTextView.text = Utils.namazText[index-1]
                namazView.image = UIImage(named: "namaz\(index)")
            }
        }else{
            if index == 7{
                afterButton.text = "Tamamla"
            }
            if index == 8{
                if interstitial != nil {
                    interstitial?.present(fromRootViewController: self)
                    isAd = true
                } else {
                    print("Ad wasn't ready")
                    self.dismiss(animated: true)
                }
                
            
                let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                destinationVC.modalPresentationStyle = .fullScreen
                self.present(destinationVC, animated: true, completion: nil)
                
            }else{
                namazTextView.text = Utils.abdestText[index-1]
                namazView.image = UIImage(named: "abdest\(index)")
            }
        }
        
        if index == 1 {
            previousButton.isUserInteractionEnabled = false
            grayImage.image = UIImage(named: "grayBtnBg")
            previousButton.textColor = .gray
        }else{
            previousButton.isUserInteractionEnabled = true

            grayImage.image = UIImage(named: "blueBtnBg")
            previousButton.textColor = .white
        }
        
    }
    
    @objc func previousButtonTapped(){
        previousButton.zoomIn()

        index-=1
        if index == 1{
            previousButton.isUserInteractionEnabled = false
            grayImage.image = UIImage(named: "grayBtnBg")
        }
        if pageType == .namaz{
//
//        if index == 11{
//            index=1
//        }
//        if index == 0{
//            index = 10
//        }
        namazTextView.text = Utils.namazText[index-1]
        namazView.image = UIImage(named: "namaz\(index)")
        }else{
//            if index == 8{
//                index=1
//            }
//            if index == 0{
//                index = 7
//            }
            namazTextView.text = Utils.abdestText[index-1]
            namazView.image = UIImage(named: "abdest\(index)")
            
        }
       
    }
    
    @objc func removeViewTapped(){
        removeView.zoomIn()
        if SKPaymentQueue.canMakePayments(){
            let set :  Set<String> = [Products.removeAds.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()
            
        }
    }
    
    @objc func backButtonTapped(){
        backButton.zoomIn()
        if Utils.isPremium != "premium"{

        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            isAd = true
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }
        
        }else{
            self.dismiss(animated: true)

        }
    }

}
extension NamazViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print(response.products.first)
        if let oproduct = response.products.first{
            
            self.purchase(aproduct: oproduct)
        }
    }
    
    func purchase ( aproduct: SKProduct){
        let payment = SKPayment(product: aproduct)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState{
            case .purchasing:
                print("pur")
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
                removeView.isHidden = true
                bannerView.isHidden = true
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
                removeView.isHidden = true
                bannerView.isHidden = true
                print("restore")
            case .deferred:
                print("deffered")
            default: break
            }
            
        }
    }
    
    func fetchProducts(){
        let request = SKProductsRequest(productIdentifiers: Set(Products.allCases.compactMap({$0.rawValue})))
        request.delegate = self
        request.start()
    }
    
}
extension NamazViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
    func createAdd() {
        let request = GADRequest()
        interstitial?.fullScreenContentDelegate = self
        GADInterstitialAd.load(withAdUnitID:Utils.fullScreenAdId,
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
        }
        )
    }
    func interstitialWillDismissScreen(_ ad: GADInterstitialAd) {
        print("interstitialWillDismissScreen")
    }
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        // Add banner to view and add constraints as above.
        addBannerViewToView(bannerView)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}
