//
//  AdhanViewController.swift
//  IslamicWallpaper
//
//  Created by fdnsoft on 8.07.2022.
//

import UIKit
import Lottie
import GoogleMobileAds
import CoreLocation
import StoreKit

class AdhanViewController: UIViewController, CLLocationManagerDelegate {
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    var animationView = AnimationView ()
    var isAd : Bool = false
    let locationManager = CLLocationManager()
    @IBOutlet weak var removeView: UIImageView!
    
    @IBOutlet weak var adhanBottomCons: NSLayoutConstraint!
    @IBOutlet weak var backWidthCons: NSLayoutConstraint!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var viewLeadingConstant: NSLayoutConstraint!
    
    @IBOutlet weak var viewTrailingCons: NSLayoutConstraint!
    @IBOutlet weak var backView: UIImageView!
    @IBOutlet weak var adhanView6: UIView!
    @IBOutlet weak var adhanView1: UIView!
    @IBOutlet weak var ishaTime: UILabel!
    @IBOutlet weak var ishaLbl: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var ASRtİME: UILabel!
    @IBOutlet weak var asrLbl: UILabel!
    @IBOutlet weak var dhuhreTime: UILabel!
    @IBOutlet weak var dhuhrLbl: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var fajrTimeLbl: UILabel!
    @IBOutlet weak var fajrLbl: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var altViewHeight: NSLayoutConstraint!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prayerAnimation()
        altViewHeight.constant = view.bounds.height*0.45
        arrangeShadowforViews(vieww: stackView)
        adhanView6.layer.cornerRadius = 20
        adhanView6.layer.masksToBounds = true
        adhanView6.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        
        adhanView1.layer.cornerRadius = 20
        adhanView1.layer.masksToBounds = true
        adhanView1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
       
        locationManager.delegate = self
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backViewTapped)))
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightCons.constant = 60
            backWidthCons.constant = 60
            viewLeadingConstant.constant = 200
            viewTrailingCons.constant = 200
            adhanBottomCons.constant = 150
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

        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            isAd = true
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }    }
    
    @objc func appMovedToForeground() {
        locationPermissionControl()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
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
    
    override func viewWillAppear(_ animated: Bool) {
        locationPermissionControl()
//        backButton.setTitle(Helper.adhanTimes[Helper.SelectedlanguageNumber], for: .normal)
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        
        if Utils.isPremium == "premium"{
//            removeView.isHidden = true
        }else{
            createAdd()
//            removeView.isHidden = false
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
    
   
  
    func networkService (){
        var flag = false
        
        LocationManager.shared.getCurrentReverseGeoCodedLocation { [weak self] location, placemark, error in
            if let placemark = placemark {
                DispatchQueue.main.async {
                    print(placemark.locality)
                    //                    self?.cityLabel.text = placemark.locality
                }
            }
            
            NetworkManager.shared.fetchData { result in
                if (flag == false) {
                    switch result {
                    case .success(let namazVakitleri):
                        DispatchQueue.main.async {
                            print()
                            print(Int(namazVakitleri.data.timings.Fajr) )
                            self?.updateUI(namaz: namazVakitleri)
                            self?.calculateCurrentAdhanTime(namaz: namazVakitleri)

                            //                            self?.namazVakitleri = namazVakitleri
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
                flag = true
            }
        }
    }
    
    func updateUI (namaz: Response){
        fajrTimeLbl.text = namaz.data.timings.Fajr
        sunriseTime.text = namaz.data.timings.Sunrise
        dhuhreTime.text = namaz.data.timings.Dhuhr
        ASRtİME.text = namaz.data.timings.Asr
        ishaTime.text = namaz.data.timings.Isha
        sunsetTime.text = namaz.data.timings.Sunset
        
        fajrLbl.text = "İmsak"
        sunsetLbl.text = "Akşam"
        asrLbl.text = "İkindi"
        dhuhrLbl.text = "Öğle"
        ishaLbl.text = "Yatsı"
        sunriseLbl.text = "Güneş"
    }
    func calculateCurrentAdhanTime (namaz: Response){
        let fajrTimer = createAdhanTime(time: namaz.data.timings.Fajr )
        let sunriseTimer = createAdhanTime(time: namaz.data.timings.Sunrise)
        let dhuhrTimer = createAdhanTime(time: namaz.data.timings.Dhuhr)
        let asrTimer = createAdhanTime(time: namaz.data.timings.Asr)
        let ishaTimer = createAdhanTime(time: namaz.data.timings.Isha)
        let sunsetTimer = createAdhanTime(time: namaz.data.timings.Sunset)
        print(ishaTimer)
        print(sunsetTimer)
        // *** create calendar object ***
        var calendar = Calendar.current
        let date = Date()
        // *** Get components using current Local & Timezone ***
        let currentTime = calendar.dateComponents([.hour, .minute], from: date)
        let currentHour = Int(currentTime.hour!)
        let currentMinute = Int(currentTime.minute!)
        let currenttimer = currentHour*60+currentMinute
        switch currenttimer{
        case let x where x >= fajrTimer && x <= sunriseTimer:
          fajrLbl.textColor = .systemCyan
          fajrTimeLbl.textColor = .systemCyan
        case let x where x >= sunriseTimer && x <= dhuhrTimer:
          sunriseLbl.textColor = .systemCyan
          sunriseTime.textColor = .systemCyan
        case let x where x >= dhuhrTimer && x <= asrTimer:
          dhuhrLbl.textColor = .systemCyan
          dhuhreTime.textColor = .systemCyan
        case let x where x >= asrTimer && x <= sunsetTimer:
          asrLbl.textColor = .systemCyan
          ASRtİME.textColor = .systemCyan
        case let x where x >= sunsetTimer && x <= ishaTimer:
          sunsetLbl.textColor = .systemCyan
          sunsetTime.textColor = .systemCyan
        case let x where x >= ishaTimer && x <= 1440:
          ishaLbl.textColor = .systemCyan
          ishaTime.textColor = .systemCyan
        case let x where x >= 0 && x <= fajrTimer:
          ishaLbl.textColor = .systemCyan
          ishaTime.textColor = .systemCyan
        default:
          print("this is impossible")
        }
        print(currenttimer)
      }
    
    func createAdhanTime (time:String)->Int{
        let hour = Int(time.prefix(2))!
        let minute = Int(time.suffix(2))!
        let adhantime = hour*60+minute
        return adhantime
    }
    func prayerAnimation () {
        animationView.animation = Animation.named("prayer")
        animationView.frame = CGRect(x: 0, y: 60, width: 300, height: view.bounds.height*0.3)
        if view.bounds.height > 650{
          animationView.frame = CGRect(x: 0, y:90, width: 300, height: view.bounds.height*0.3)
        }
        animationView.center.x = view.center.x
        animationView.loopMode = .loop
        self.animationView.isHidden = false
        animationView.play()
        view.addSubview(animationView)
      }
    override func viewDidDisappear(_ animated: Bool) {
        animationView.stop()
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
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
    func setLocationActive(){
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        locationPermissionControl()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     print("sad")
        networkService()
    }
    func locationPermissionControl (){
        let authState = CLLocationManager.authorizationStatus()
        
        if authState == .authorizedAlways || authState == .authorizedWhenInUse  {
//            self.setLocationActive()
            networkService()
        }else if authState == .notDetermined{
            self.setLocationActive()
//            self.setLocationActive()
        } else {
            //            popup çıkılacak
            showAlertAction(titleText: "IslamicWallpaper HD Would Like to Access Your Location. ", messages: "IslamicWallpaper HD  asks for permission to find your correct Location. ", alertTitle: "Settings",buttonAction: { UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!) })
            
        }
       
    }
    
    
    func showAlertAction(titleText:String,messages:String,alertTitle:String,buttonAction: (() -> Void)? = nil){
        let alertController = UIAlertController(title: titleText, message: messages, preferredStyle: .alert)
        let alertTitle = alertTitle
        let phoneAction = UIAlertAction(title: alertTitle, style: .default, handler: {
            alert -> Void in
            buttonAction!()
            
        })
        alertController.addAction(phoneAction)
        let cancelAction = UIAlertAction(title: "Deny", style: .destructive, handler: {
            alert -> Void in
                        self.dismiss(animated: true)
        })
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
      MARK: - Navigation
     
      In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      Get the new view controller using segue.destination.
      Pass the selected object to the new view controller.
     }
     */
    
}
extension AdhanViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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
extension AdhanViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
