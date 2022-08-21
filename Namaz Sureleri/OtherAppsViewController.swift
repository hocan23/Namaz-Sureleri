//
//  OtherAppsViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import UIKit
import StoreKit
import GoogleMobileAds

class OtherAppsViewController: UIViewController {

    
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    @IBOutlet weak var backWidthCons: NSLayoutConstraint!
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
    
    var isAd = false
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.elifba.remove"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
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
            bannerView = GADBannerView(adSize: GADAdSizeBanner)
            bannerView.adUnitID = Utils.bannerId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        
    }
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
        
        topLeftText.font = topLeftText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        topRightText.font = topRightText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        midLefText.font = midLefText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        midRightText.font = midRightText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        bottomLeftText.font = bottomLeftText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        bottomRightText.font = bottomRightText.font!.withSize(UIScreen.main.bounds.size.height*0.016)
        arrangeShadowforViews(vieww: topLeftView)
        arrangeShadowforViews(vieww: topRightView)
        arrangeShadowforViews(vieww: midLeftView)
        arrangeShadowforViews(vieww: middleRightView)
        arrangeShadowforViews(vieww: bottomLeftView)
        arrangeShadowforViews(vieww: bottomRightView)

        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightCons.constant = 60
            backWidthCons.constant = 60
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
        if SKPaymentQueue.canMakePayments(){
            let set :  Set<String> = [Products.removeAds.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()
            
        }
    }
    @objc func backViewTapped(){
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            isAd = true
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }
    }
}
extension OtherAppsViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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

            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"

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
extension OtherAppsViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
