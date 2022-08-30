//
//  SureDetayViewController.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 23.08.2022.
//

import UIKit
import AVFAudio
import GoogleMobileAds
import StoreKit

class SureDetayViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var playerBottomCons: NSLayoutConstraint!
    @IBOutlet weak var backHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var backWidthConstan: NSLayoutConstraint!
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var playButton: UIImageView!
    @IBOutlet weak var removeButton: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
 
    var isPlaying = false

    var musicTime : Int?
    var index : Int?
    var timer: Timer?
    var isAd = false
    var models = [SKProduct]()
    enum Products : String,CaseIterable{
        case removeAds = "com.SIX11.namazRehberiRemoveAds"
    }
    var bannerView: GADBannerView!
    private var interstitial: GADInterstitialAd?
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        soundPlay()
        audioPlayer.stop()
        isPlaying = false
        audioPlayer.delegate = self
        audioSlider.maximumValue = Float(audioPlayer.duration)
        print(Utils.sureMetin[0])
        textView.text = Utils.sureIcerigi[index!]
        if view.frame.height < 715 {
            textView.font = textView.font!.withSize(UIScreen.main.bounds.size.height*0.025)

        }else{
        textView.font = textView.font!.withSize(UIScreen.main.bounds.size.height*0.02)
        }
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        removeButton.isUserInteractionEnabled = true
        removeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeButtonTapped)))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playButtonTapped)))
//        audioSlider.isUserInteractionEnabled = true
//        audioSlider.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(audioSliderTapped)))
        textView.layer.cornerRadius = 20
        arrangeShadowforViews(vieww: textView)
        textView.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        textView.isUserInteractionEnabled = false
        if UIDevice.current.userInterfaceIdiom == .pad  {
            backWidthConstan.constant = 60
            backHeightConstant.constant = 60
            playerBottomCons .constant = 100
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isAd == true {
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SureViewController") as! SureViewController
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.isSeenAd = true
            self.present(destinationVC, animated: true, completion: nil)
        }
        
        if Utils.isPremium == "premium"{
            removeButton.isHidden = true
            playerBottomCons.constant = 30
        }else{
            createAdd()
            removeButton.isHidden = false
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
    func arrangeShadowforViews (vieww:UIView){
        vieww.layer.cornerRadius = 20
//        vieww.layer.masksToBounds = false
        vieww.layer.shadowColor = UIColor(red: 35/255, green: 75/255, blue: 113/255, alpha: 0.1).cgColor
        vieww.layer.shadowOffset = CGSize(width: 0, height: 5)
        vieww.layer.shadowRadius = 10
        vieww.layer.shadowOpacity = 1
    }
    
    
  
    
    
    @objc func updateSlider() {
        
        audioSlider.value = Float(audioPlayer.currentTime)
      
        if isPlaying {
              
            playButton.image = UIImage(systemName: "pause.circle.fill")

            }
            
            
            else {
            
               
                playButton.image = UIImage(systemName: "play.circle.fill")
        }
      
       
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        playButton.image = UIImage(systemName: "play.circle.fill")
    }
    
    func soundPlay (){
    
            
        let soundUrl = Bundle.main.url(forResource: Utils.soundtag[index!], withExtension: "mp3")
            
            do {

                try audioPlayer = AVAudioPlayer(contentsOf: soundUrl!)
            }
                
            catch {
                
                print(error)
                
            }
           
                       audioPlayer.play()
                       isPlaying = true

        }

    
    
    
    
    
    
    
    @objc func backButtonTapped(){
        backButton.zoomIn()
        audioPlayer?.stop()
        dismiss(animated: true)
//        if interstitial != nil {
//            player?.stop()
//            interstitial?.present(fromRootViewController: self)
//            isAd = true
//        } else {
//            print("Ad wasn't ready")
//            self.dismiss(animated: true)
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    
//    @objc func audioSliderTapped (){
//        print(TimeInterval( audioSlider.value))
//        player?.currentTime = TimeInterval( audioSlider.value)
//        player?.play(atTime: 30)
////        player?.play(atTime: timer?.timeInterval ?? 0)
//    }
    
    
    @objc func removeButtonTapped(){
        removeButton.zoomIn()
        audioPlayer?.stop()
        if SKPaymentQueue.canMakePayments(){
            let set :  Set<String> = [Products.removeAds.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()
            
        }
    }
    @IBAction func sliderChanged(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(audioSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @objc func playButtonTapped(){
        playButton.zoomIn()
        
        if isPlaying {
            audioPlayer.pause()
            isPlaying = false
                  playButton.image = UIImage(systemName: "play.circle.fill")

        }
        
        
        else {
            audioPlayer.play()
            isPlaying = true
          playButton.image = UIImage(systemName: "pause.circle.fill")
    }

    }
   
    func stopPlayer() {
        audioPlayer?.stop()
        timer?.invalidate()
        print("Player and timer stopped")
      }

//    public func playMusic (name:String,type:String){
//
//        if let player = player, player.isPlaying{
//            player.stop()
//            playButton.image = UIImage(systemName: "play.circle.fill")
////            audioSlider.value = 0
//        }else{
//
//            let urlString = Bundle.main.path(forResource: name, ofType: type)
//
//
//            do {
//                try AVAudioSession.sharedInstance().setMode(.default)
//                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//                guard let urlString = urlString else{
//                    return
//                }
//                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
//                player?.delegate = self
//
//                guard let player = player else{
//                    return
//                }
//                player.play()
//                playButton.image = UIImage(systemName: "pause.circle.fill")
//
//            }
//            catch{
//                print("not work")
//            }
//        }
//    }
   
    

}

extension SureDetayViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
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
                removeButton.isHidden = true
                bannerView.isHidden = true
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                Utils.saveLocal(array: "premium", key: "purchase")
                Utils.isPremium = "premium"
                removeButton.isHidden = true
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
extension SureDetayViewController: GADBannerViewDelegate, GADFullScreenContentDelegate{
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
