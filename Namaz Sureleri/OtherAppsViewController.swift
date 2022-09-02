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
    @IBOutlet weak var midrightbottombottomcons: NSLayoutConstraint!
    
    @IBOutlet weak var bottomrighttoptop: NSLayoutConstraint!
    @IBOutlet weak var midrighttoptopcons: NSLayoutConstraint!
    @IBOutlet weak var toprighttopcons: NSLayoutConstraint!
    
    @IBOutlet weak var bottomrightbottombottom: NSLayoutConstraint!
    @IBOutlet weak var toprightBottomcons: NSLayoutConstraint!
    @IBOutlet weak var toptopımagetop: NSLayoutConstraint!
    @IBOutlet weak var topleftbottomcons: NSLayoutConstraint!
    
    @IBOutlet weak var bottomlefttoptop: NSLayoutConstraint!
    @IBOutlet weak var bottomleftbottombottom: NSLayoutConstraint!
    @IBOutlet weak var midlefttoptop: NSLayoutConstraint!
    @IBOutlet weak var midleftbottombottom: NSLayoutConstraint!
    @IBOutlet weak var bottomleftdowntop: NSLayoutConstraint!
    @IBOutlet weak var bottomlefttraildown: NSLayoutConstraint!
    @IBOutlet weak var bottomleftdownlead: NSLayoutConstraint!
    @IBOutlet weak var bottomrightdowntop: NSLayoutConstraint!
    @IBOutlet weak var bottomrighttrail: NSLayoutConstraint!
    @IBOutlet weak var bottomrightlead: NSLayoutConstraint!
    @IBOutlet weak var midrightdowntop: NSLayoutConstraint!
    @IBOutlet weak var midrightdownlead: NSLayoutConstraint!
    @IBOutlet weak var midrightdowntrail: NSLayoutConstraint!
    @IBOutlet weak var midlefttop: NSLayoutConstraint!
    @IBOutlet weak var midlefttrail: NSLayoutConstraint!
    @IBOutlet weak var middownlead: NSLayoutConstraint!
    @IBOutlet weak var topleftdowntop: NSLayoutConstraint!
    @IBOutlet weak var topleftdowntrail: NSLayoutConstraint!
    @IBOutlet weak var topleftdownlead: NSLayoutConstraint!
    @IBOutlet weak var toprightdowntop: NSLayoutConstraint!
    @IBOutlet weak var toprightdownleading: NSLayoutConstraint!
    @IBOutlet weak var toprightdowntrailing: NSLayoutConstraint!
    @IBOutlet weak var topRightWidthConstant: NSLayoutConstraint!
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
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
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
       
            bottomlefttoptop.constant = 20
            bottomleftbottombottom.constant = 20
            
            bottomrighttoptop.constant = 20
            bottomrightbottombottom.constant = 20
            midleftbottombottom.constant = 20
            midlefttoptop.constant = 20
            midrightbottombottomcons.constant = 20
            midrighttoptopcons.constant = 20
            toprighttopcons.constant = 20
            toprightBottomcons.constant = 20
            toptopımagetop.constant = 20
            topleftbottomcons.constant = 20
            
            backHeightCons.constant = 60
            backWidthCons.constant = 60
            topLeftLeadingConstant.constant = view.frame.width*0.1
            topRightTrailingConstant.constant = view.frame.width*0.1
            topRightWidthConstant.constant = 0.01
            toprightdowntop.constant = 10
            toprightdownleading.constant = 30
            toprightdowntrailing.constant = 30
            topleftdowntop.constant = 10
            topleftdownlead.constant = 30
            topleftdownlead.constant = 30
            middownlead.constant = 30
            midlefttop.constant = 10
            midlefttrail.constant = 30
            midrightdowntop.constant = 10
            midrightdownlead.constant = 30
            midrightdowntrail.constant = 30
            bottomleftdowntop.constant = 10
            bottomleftdownlead.constant = 30
            bottomlefttraildown.constant = 30
            bottomrightdowntop.constant = 10
            bottomrightlead.constant = 30
            bottomrighttrail.constant = 30
            
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

        if let url = URL(string: "https://apps.apple.com/us/app/elif-ba-%C3%B6%C4%9Freniyorum-sesli/id1491565588?platform=iphone") {
            UIApplication.shared.open(url)
        }
   
    }
    @objc func topRightViewTapped(){
        topRightView.zoomIn()

        if let url = URL(string: "https://apps.apple.com/us/app/3d-gerçek-tesbih-ve-zikirmatik/id1641592564") {
            UIApplication.shared.open(url)
        }
    }
    @objc func midLeftViewTapped(){
        midLeftView.zoomIn()

        if let url = URL(string: "https://apps.apple.com/us/app/islamic-wallpaper-hd-pro/id1632238123") {
            UIApplication.shared.open(url)
        }
    }
    @objc func middleRightViewTapped(){
        middleRightView.zoomIn()

        if let url = URL(string: "https://apps.apple.com/us/app/listen-quran-turkish-ofline/id1450080130?platform=iphone") {
            UIApplication.shared.open(url)
        }
    }
    @objc func bottomRightViewTapped(){
        bottomRightView.zoomIn()

        if let url = URL(string: "https://apps.apple.com/us/app/learn-abc-kids/id1412549968?platform=iphone") {
            UIApplication.shared.open(url)
        }
    }
    @objc func bottomLeftViewTapped(){
        bottomLeftView.zoomIn()

        if let url = URL(string: "https://apps.apple.com/us/app/baby-sleep-sound-white-noise/id1638514663?platform=iphone") {
            UIApplication.shared.open(url)
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
    @objc func backViewTapped(){
        backView.zoomIn()
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
