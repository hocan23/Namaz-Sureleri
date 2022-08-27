//
//  SettingsViewController.swift
//  Learn Alphabeth
//
//  Created by fdnsoft on 16.07.2022.
//

import UIKit
import StoreKit
import GoogleMobileAds



class SettingsViewController: UIViewController{
    
    
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    @IBOutlet weak var backWidthCons: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var homeView: UIImageView!
    var headers = ["Share App","Other Apps",  "Rate App",  "Remove Ads - $0.99",  "Restore Purchase"]
    var isAd = false
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUi()
        homeView.isUserInteractionEnabled = true
        homeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exitTapped)))
        SKPaymentQueue.default().add(self)
        tableView.isScrollEnabled = false
//        tableView.layer.cornerRadius = 20
       arrangeShadowforViews(vieww: tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.overrideUserInterfaceStyle = .light
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        
        if Utils.isPremium == "premium"{
//            removeView.isHidden = true
        }else{
            createAdd()
//            removeView.isHidden = false
            bannerView = GADBannerView(adSize: GADAdSizeBanner)
            bannerView.adUnitID = Utils.bannerId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        
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
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    func setupUi(){
        
        homeView.anchor(top:view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: nil, paddingTop: view.frame.height*0.07, paddingBottom: 0, paddingLeft: view.frame.height*0.04, paddingRight: 0, width: view.frame.height*0.05, height: view.frame.height*0.05)
        tableView.anchor(top: homeView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 250)
        tableView.layer.cornerRadius = 20
        
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightCons.constant = 60
            backWidthCons.constant = 60
        }
    }
    @objc func exitTapped (){
        homeView.zoomIn()
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
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        cell.tableLabel.text = headers[indexPath.row]
        cell.tableLabel.textColor = UIColor(red: 38/255, green: 51/255, blue: 117/255, alpha: 1)
        if cell.isSelected {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
         } else {
            tableView.deselectRow(at: indexPath, animated: true)
         }
        cell.selectionStyle = .default;
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    tableView.deselectRow(at: indexPath, animated: true)
                }
        switch indexPath.row{
        case 0 :
            if let urlStr = NSURL(string: "https://apps.apple.com/tr/app/namaz-surelerini-%C3%B6%C4%9Freniyorum/id1491638476") {
                let objectsToShare = [urlStr]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                if UIDevice.current.userInterfaceIdiom == .pad {
                    if let popup = activityVC.popoverPresentationController {
                        popup.sourceView = self.view
                        popup.sourceRect = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 4, width: 0, height: 0)
                    }
                }

                self.present(activityVC, animated: true, completion: nil)
            }

        case 1:
            if let url = URL(string: "https://apps.apple.com/tr/developer/mehmet-rasit-arisu/id1346135076?see-all=i-phonei-pad-apps") {
                UIApplication.shared.open(url)
            }
        case 2:
            if let url = URL(string: "https://apps.apple.com/tr/app/namaz-surelerini-%C3%B6%C4%9Freniyorum/id1491638476") {
                UIApplication.shared.open(url)
            }
        case 3:
            if SKPaymentQueue.canMakePayments(){
                let set :  Set<String> = [Products.removeAds.rawValue]
                let productRequest = SKProductsRequest(productIdentifiers: set)
                productRequest.delegate = self
                productRequest.start()
            }
        case 4:
            SKPaymentQueue.default().restoreCompletedTransactions()
        default: break
        }
        
    }
    
    
}
extension SettingsViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
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
                bannerView.isHidden = true
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .restored:
                print("restore")
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
                bannerView.isHidden = true
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
extension SettingsViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
