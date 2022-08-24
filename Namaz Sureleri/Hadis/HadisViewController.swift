//
//  HadisViewController.swift
//  IslamicWallpaper
//
//  Created by fdnsoft on 6.07.2022.
//

import UIKit
import GoogleMobileAds
import Lottie
import CoreLocation
import StoreKit

class HadisViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableTrailingCons: NSLayoutConstraint!
    @IBOutlet weak var tableLeadingCons: NSLayoutConstraint!
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    @IBOutlet weak var backWidthCons: NSLayoutConstraint!
    
    @IBOutlet weak var removeButtonView: UIImageView!
    @IBOutlet weak var backButtonView: UIImageView!
    
    let animationView = AnimationView()
    
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    var isAd : Bool = false

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HadisTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        arrangeShadowforViews(vieww: tableView)
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius=20
        removeButtonView.isUserInteractionEnabled = true
        removeButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeButtonViewTapped)))
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonViewTapped)))
        
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightCons.constant = 60
            backWidthCons.constant = 60
            tableLeadingCons.constant = 100
            tableTrailingCons.constant = 100
        }
        // Do any additional setup after loading the view. bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = Utils.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        
        if Utils.isPremium == "premium"{
            removeButtonView.isHidden = true
        }else{
            createAdd()
            removeButtonView.isHidden = false
            bannerView = GADBannerView(adSize: GADAdSizeBanner)
            bannerView.adUnitID = Utils.bannerId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        
    }
    }
    @objc func removeButtonViewTapped (){
        removeButtonView.zoomIn()

        if SKPaymentQueue.canMakePayments(){
            let set :  Set<String> = [Products.removeAds.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()
            
        }
    }
    @objc func backButtonViewTapped (){
        backButtonView.zoomIn()

        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            isAd = true
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }    }
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    func arrangeShadowforViews (vieww:UIView){
        vieww.layer.cornerRadius = 20
//        vieww.layer.masksToBounds = false
        vieww.layer.shadowColor = UIColor(red: 35/255, green: 75/255, blue: 113/255, alpha: 0.1).cgColor
        vieww.layer.shadowOffset = CGSize(width: 0, height: 5)
        vieww.layer.shadowRadius = 10
        vieww.layer.shadowOpacity = 1
    }
    func setupDownloadAnimation () {
        animationView.animation = Animation.named("download")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = view.center
        animationView.loopMode = .playOnce
        self.animationView.isHidden = false

        animationView.play()

        view.addSubview(animationView)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.7) {
            self.animationView.isHidden = true

        }

    }



    
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
        {
            let verticalPadding: CGFloat = 8
    
//            let maskLayer = CALayer()
//            maskLayer.borderWidth = 2
//            maskLayer.borderColor = UIColor.red.cgColor
//            maskLayer.backgroundColor = UIColor.clear.cgColor
//            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
//            cell.layer.mask = maskLayer
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HadisTableViewCell{
            cell.textLbl.text = Utils.hadiths[indexPath.row]
            if UIDevice.current.userInterfaceIdiom == .pad  {

            cell.textLbl.font = cell.textLbl.font!.withSize(UIScreen.main.bounds.size.height*0.015)
            }else{
                cell.textLbl.font = cell.textLbl.font!.withSize(UIScreen.main.bounds.size.height*0.018)

            }
            cell.shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
            cell.copyButton.addTarget(self, action: #selector(copyButtonAction), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Utils.hadiths.count
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
      
        return 190
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @objc func shareButtonAction (sender: UIButton) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare =  Utils.hadiths[sender.tag]
        
        if let myWebsite = URL(string: "https://apps.apple.com/tr/app/namaz-surelerini-%C3%B6%C4%9Freniyorum/id1491638476") {//Enter link to your app here
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
            
        }
    }
    
    @objc func copyButtonAction (sender: UIButton) {
        
        UIPasteboard.general.string =  Utils.hadiths[sender.tag]
        setupDownloadAnimation()
        
    }

    
   

    
}
extension HadisViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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
extension HadisViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
