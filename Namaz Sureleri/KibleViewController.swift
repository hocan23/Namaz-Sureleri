//
//  KıbleViewController.swift
//  IslamicWallpaper
//
//  Created by fdnsoft on 6.07.2022.
//

import UIKit
import CoreLocation
import Adhan
import GoogleMobileAds
import Lottie
import StoreKit

class KibleViewController: UIViewController,GADBannerViewDelegate, GADFullScreenContentDelegate  {
    
    @IBOutlet weak var backHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var backWidthCons: NSLayoutConstraint!
    
    
    let animationView = AnimationView()
    @IBOutlet weak var backView: UIImageView!
    
    var isFirstOpen = true
    @IBOutlet weak var qiblaArrow: UIImageView!
    @IBOutlet weak var removeView: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var compassImageView: UIImageView!
    
    @IBOutlet weak var compass: UIImageView!
    @IBOutlet weak var kiblaArrow: UIImageView!
    
    @IBOutlet weak var kibleView: UIImageView!
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var isAd : Bool = false

    private let loadingVC = LoadingViewController()
    
    @IBOutlet weak var kibleTop: NSLayoutConstraint!
    private let defaults = UserDefaults.standard
    private let locationManager = CLLocationManager()
    //qibla direction in radians. Will be used by heading updating method to compute rotation of qibla arrow once coordinates are determined.
    private var qiblaRad: Double = 0
    private var facingQibla: Bool = false
    var latitude: Double?
    var longitude: Double?
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        print(view.bounds.height)
        locationManager.delegate = self
        //initially, before getting location to get qibla direction, arrow not visible
        qiblaArrow.layer.opacity = 0
        createAdd()
        //programmatically add the indicator line for current direction.
        let lineView = UIView()
        lineView.backgroundColor = .systemOrange
        view.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: lineView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: lineView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: compassImageView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: compassImageView.frame.size.height/3.91)
        
        let widthConstraint = NSLayoutConstraint(item: lineView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 3)
        
        let heightConstraint = NSLayoutConstraint(item: lineView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        
        //constraints: centerX, width=3, height=50, aligned with compass image's "lines"
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        //set qibla arrow blending mode.
        qiblaArrow.layer.compositingFilter = "differenceBlendMode"
        lineView.layer.compositingFilter = "differenceBlendMode"
        
        let automaticLocation = defaults.bool(forKey: "automaticLocation")
        if let lat = latitude, let lon = longitude, !automaticLocation {
            kibleView.isHidden = false
            kiblaArrow.isHidden = false
            compass.isHidden = false
            animationView.isHidden = true
            startQiblaDirection(latitude: lat, longitude: lon)
        } else {
            //            add(loadingVC)
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.requestLocation()
//            locationPermissionControl()
        }
        
        //start real-time updating of heading (= degrees from true/magnetic north)
        if CLLocationManager.headingAvailable() {
            //update every change of 1 degree.
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
        }
        if view.bounds.height<750{
            kibleTop.constant = 5
        }
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = Utils.bannerId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backHeightCons.constant = 60
            backWidthCons.constant = 60
        }
    }
    
    @objc func appMovedToForeground() {
        locationManager.startUpdatingLocation()
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localAnimation()

        locationPermissionControl()
        kibleView.isHidden = true
        kiblaArrow.isHidden = true
        compass.isHidden = true

//        backButton.setTitle(Helper.qiblafinder[Helper.SelectedlanguageNumber], for: .normal)
        if isAd == true {
            self.dismiss(animated: true)
            
        }
        if self.traitCollection.userInterfaceStyle == .dark {
        }
        if isFirstOpen == true{
            isFirstOpen = false
            self.tabBarController?.selectedIndex = 2
        }
    }
   
    func setupUi (){
        removeView.isUserInteractionEnabled = true
        removeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeViewTapped)))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backViewTapped)))
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
    func localAnimation () {
        animationView.animation = Animation.named("local")
        animationView.frame = CGRect(x: 0, y: 60, width: 300, height: 300)
        animationView.center.y = view.center.y
        animationView.center.x = view.center.x
        animationView.loopMode = .loop
        self.animationView.isHidden = false
        animationView.play()
        view.addSubview(animationView)
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
   
    
    func locationPermissionControl (){
        let authState = CLLocationManager.authorizationStatus()
        
        if authState == .authorizedAlways || authState == .authorizedWhenInUse  {
//            self.setLocationActive()
            locationManager.startUpdatingLocation()

        }else if authState == .notDetermined{
            setLocationActive()
            //            self.setLocationActive()
        } else {
            //            popup çıkılacak
            showAlertAction(titleText: "IslamicWallpaper HD Would Like to Access Your Location. ", messages: "IslamicWallpaper HD  asks for permission to find your correct Location. ", alertTitle: "Settings",buttonAction: { UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!) })
            
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
    
    func startQiblaDirection(latitude: Double, longitude: Double) {
        //once we can get qibla direction, make qibla arrow appear again

        UIView.animate(withDuration: 0.35) {
            self.qiblaArrow.layer.opacity = 100
        }
        //init. coordinates as Adhan library wants them.
        let coordinates = Coordinates(latitude: latitude, longitude: longitude)
        //use Adhan library to get Qibla direction relative to true north
        let qiblaDirection = Qibla(coordinates: coordinates)
        qiblaRad = degreesToRadians(qiblaDirection.direction)
        //call didUpdateHeading() now in case it isn't changing (i.e device set on table or something)
        if let heading = locationManager.heading {
            self.locationManager(locationManager, didUpdateHeading: heading)
        }
    }
    
    //animated rotation to a defined rotation angle (radians).
    func rotate(view: UIView, to angle: Double) {
        UIView.animate(withDuration: 0.35) {
            view.transform = CGAffineTransform(rotationAngle: CGFloat(-angle))
        }
    }
    //animated rotation a certain value in radians.
    func rotate(view: UIView, radians: Double) {
        UIView.animate(withDuration: 0.35) {
            view.transform = view.transform.rotated(by: CGFloat(radians))
        }
    }
    
    //converts degrees to radians
    func degreesToRadians(_ number: Double) -> Double {
        return number * .pi / 180
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            isAd = true
            
        } else {
            print("Ad wasn't ready")
            self.dismiss(animated: true)
        }
        
    }
}

extension KibleViewController: CLLocationManagerDelegate {
    //method that gets triggered when location, managed by CLLocationManager, is updated
    //input is self and array of fetched locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //get last location fetched
        if let location = locations.last {
            //stop updating location while fetching from array
            locationManager.stopUpdatingLocation()
            //            DispatchQueue.main.async {
            //                removed
            //            }
            kibleView.isHidden = false
            kiblaArrow.isHidden = false
            compass.isHidden = false
            animationView.isHidden = true
            
            startQiblaDirection(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
    
    //in case updating location fails
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("failed to update location: \(error)")
    }
    
    //called every time heading changes: rotate compass and qibla arrow images to match new heading.
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let newRad = degreesToRadians(newHeading.trueHeading)
        let isVisible = qiblaArrow.layer.opacity == 100
        //only generate haptic feedback if withtin 1 degree of qibla, the qibla arrow is fully opaque and we've already left it or have never reached it
        if abs(newRad-qiblaRad) <= degreesToRadians(5) && isVisible && !facingQibla {
          facingQibla = true
          createAdd()
          kibleView.image = UIImage(named: "kaaba2")
          let generator = UIImpactFeedbackGenerator(style: .rigid)
          generator.impactOccurred()
        }
        if abs(newRad-qiblaRad) >= degreesToRadians(10) || abs(newRad-qiblaRad) <= degreesToRadians(-10) {
          kibleView.image = UIImage(named: "kaaba1")
          facingQibla = false
        }
        //rotate compass image to new true north and qibla arrow along with it
        rotate(view: compassImageView, to: newRad)
        rotate(view: qiblaArrow, to: newRad-qiblaRad)
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
    }

extension KibleViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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
