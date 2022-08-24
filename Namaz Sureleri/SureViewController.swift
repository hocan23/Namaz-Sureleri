//
//  SureViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 23.08.2022.
//

import UIKit
import StoreKit
import GoogleMobileAds

class SureViewController: UIViewController {
    @IBOutlet weak var sureTable: UITableView!
    
    @IBOutlet weak var bottomNamazLabel: UILabel!
    @IBOutlet weak var namazLabel: UILabel!
    @IBOutlet weak var table2: UITableView!
    @IBOutlet weak var backHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var backWidthConstant: NSLayoutConstraint!
    @IBOutlet weak var removeButton: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    var isSeenAd = false
    var isAd = false
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    override func viewDidLoad() {
        super.viewDidLoad()
        sureTable.delegate = self
        sureTable.dataSource = self
        table2.delegate = self
        table2.dataSource = self
        setupUi()
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        removeButton.isUserInteractionEnabled = true
        removeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeButtonTapped)))
        sureTable.layer.cornerRadius = 20
        namazLabel.font = namazLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        bottomNamazLabel.font = bottomNamazLabel.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        print(view.frame.height)
//        arrangeShadowforViews(vieww: sureTable)
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightConstant.constant = 60
            backWidthConstant.constant = 60
        }
            }
    override func viewWillAppear(_ animated: Bool) {
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        
        if Utils.isPremium == "premium"{
            removeButton.isHidden = true
        }else{
            createAdd()
            removeButton.isHidden = false
            bannerView = GADBannerView(adSize: GADAdSizeBanner)
            bannerView.adUnitID = Utils.bannerId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        
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
    func arrangeShadowforViews (vieww:UIView){
        vieww.layer.cornerRadius = 20
        vieww.layer.masksToBounds = false
        vieww.layer.shadowColor = UIColor(red: 35/255, green: 75/255, blue: 113/255, alpha: 0.1).cgColor
        vieww.layer.shadowOffset = CGSize(width: 0, height: 5)
        vieww.layer.shadowRadius = 10
        vieww.layer.shadowOpacity = 1
    }
    func setupUi (){
        
    }
    
    @objc func backButtonTapped(){
        backButton.zoomIn()

        if interstitial != nil {
            if isSeenAd == false{
            interstitial?.present(fromRootViewController: self)
            isAd = true
            }else{
                let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                destinationVC.modalPresentationStyle = .fullScreen
                self.present(destinationVC, animated: true, completion: nil)            }
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }
    }
    
    @objc func removeButtonTapped(){
        removeButton.zoomIn()

        if SKPaymentQueue.canMakePayments(){
            let set :  Set<String> = [Products.removeAds.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()
            
        }
    }
    
    
}
extension SureViewController: UITableViewDelegate, UITableViewDataSource {
  
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sureTable{
            return 6
        }else{
            return 13
        }
        Utils.sureİsimleri.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == sureTable{

        let cell = tableView.dequeueReusableCell(withIdentifier: "surecell", for: indexPath) as! SureTableViewCell
        cell.sureNameLbl.text = Utils.sureİsimleri[indexPath.row]
        cell.sureNameLbl.font = cell.sureNameLbl.font!.withSize(UIScreen.main.bounds.size.height*0.02)
            if cell.isSelected {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
             } else {
                tableView.deselectRow(at: indexPath, animated: true)
             }
            cell.selectionStyle = .default;
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "surecell2", for: indexPath) as! Sure2TableViewCell
            cell.label2.text = Utils.sureİsimleri[indexPath.row+6]
            cell.label2.font = cell.label2.font!.withSize(UIScreen.main.bounds.size.height*0.02)
            if cell.isSelected {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
             } else {
                tableView.deselectRow(at: indexPath, animated: true)
             }
            cell.selectionStyle = .default;
            return cell

        }
//        cell.sureNameLbl.textColor = UIColor(red: 38/255, green: 51/255, blue: 117/255, alpha: 1)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sureTable{

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    tableView.deselectRow(at: indexPath, animated: true)
                }
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SureDetayViewController") as! SureDetayViewController
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.index = indexPath.row
        self.present(destinationVC, animated: true, completion: nil)
        }else{
           

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SureDetayViewController") as! SureDetayViewController
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.index = indexPath.row+6
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    
}
extension SureViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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

            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .restored:
                print("restore")
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
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
extension SureViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
