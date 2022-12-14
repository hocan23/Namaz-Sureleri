//
//  ViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit
import StoreKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var topRightTrailingConstant: NSLayoutConstraint!
    @IBOutlet weak var topLeftLeadingConstant: NSLayoutConstraint!
    
    @IBOutlet weak var topRightViewWidthCons: NSLayoutConstraint!
    @IBOutlet weak var removeBackView: UIView!
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
    
    @IBOutlet weak var removeBottomCons: NSLayoutConstraint!
    
    
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
    var isAd = false

    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    
    
    @IBOutlet weak var topHeightProportionConstant: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    func setupUi(){
        Utils.addSure()
        Utils.isPremium = Utils.readLocal(key: "purchase")
        topLeftLeadingConstant.constant = view.frame.width*0.09
        topRightTrailingConstant.constant = view.frame.width*0.09
        OneTwoLineConstant.constant = view.frame.height*0.011
        twoThreeLineConstant.constant = view.frame.height*0.011
        threeFourLineCONSTANT.constant = view.frame.height*0.011
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
            topHeightConstant.constant = view.frame.height*0.016
            removeBottomCons.constant = 100
        }else{
            topRightTrailingConstant.constant = view.frame.width*0.07
            topLeftLeadingConstant.constant = view.frame.width*0.07
            topRightViewWidthCons.constant =  view.frame.width*0.05
        }


    }
//    override func viewDidAppear(_ animated: Bool) {
//        if Utils.isPremium == "premium"{
//            bannerView.isHidden = true
//            removeView.isHidden = true
//            removeBackView.isHidden = true
//            
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        if Utils.isPremium == "premium"{
            removeView.isHidden = true
            removeBackView.isHidden = true
            topHeightConstant.constant = view.frame.height*0.022
            if UIDevice.current.userInterfaceIdiom == .pad  {
                topHeightConstant.constant = view.frame.height*0.04

            }
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
        
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            
                if Utils.isFirstOpen == true{
                    if self.interstitial != nil {
                        self.interstitial?.present(fromRootViewController: self)
                        self.isAd = true
                        Utils.isFirstOpen = false
                    } else {
                        print("Ad wasn't ready")
                    }
                }
                }
            
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
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    @objc func topLeftViewTapped(){
        topLeftView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "NamazViewController") as! NamazViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.pageType = .namaz
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func topRightViewTapped(){
        topRightView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "NamazViewController") as! NamazViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.pageType = .abdest
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func secondRightViewTapped(){
        secondRightView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "AdhanViewController") as! AdhanViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func secondLeftViewTapped(){
        secondLeftView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SureViewController") as! SureViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
    }
    @objc func thirdLeftViewTapped(){
        thirdLeftView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "KibleViewController") as! KibleViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func thirdRightViewTapped(){
        thirdRightView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "HadisViewController") as! HadisViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func forthLeftViewTapped(){
        forthLeftView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "OtherAppsViewController") as! OtherAppsViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    @objc func forthRightViewTapped(){
        forthRightView.zoomIn()

        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
        
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
    
}

extension ViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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
                removeBackView.isHidden = true
                bannerView.isHidden = true
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
                removeView.isHidden = true
                removeBackView.isHidden = true
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
extension ViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
