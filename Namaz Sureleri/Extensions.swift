//
//  Extensions.swift
//  Namaz Sureleri
//
//  Created by Hasan onur Can on 20.08.2022.
//

import Foundation
import UIKit
import CoreLocation
import Lottie

class Utils{
    static var fullScreenAdId = "ca-app-pub-3940256099942544/4411468910"
    static var  bannerId = "ca-app-pub-3940256099942544/2934735716"
    static var isPremium : String?
    static var isFirstOpen = true
    
    
    
    static var abdestText = ["Önce \"Niyet ettim Allah rızası için abdest almaya\" diye niyet ederiz.Önce eller bileklere kadar ve parmak araları da ovuşturularak üç defa yıkanır.","Sağ elimize üç defa su alarak ağzımıza veririz. Her su alışta ağzımızı çalkalayarak ağızdaki suyu dökeriz. Tekrar avucumuza su alarak üç defa burnumuza veririz. Sol el ile de sümkürür temizleriz.","Sonra iki avucumuza su alarak saç bitiminden çene altına kadar yüzümüzü üç defa yıkarız.","Önce sağ kolu dirsekle beraber üçer defa yıkarız.Sonra sol kolu dirsekle beraber üçer defa yıkarız.","Sağ elimizle başımızın dörtte birini mesh ederiz. Yani sağ elimizi ıslatıp başın dörtte birini sıvazlayarak ıslatırız.","Her iki eli de ıslatıp serçe parmaklarımızla kulaklarımızın içini mesh ederiz. Kulakların arka kısmını ise baş parmaklarımızla mesh ederiz.Sonra orta ve yüzük parmaklarımızın dışı ile boynumuzu da mesh ederiz.","Ayaklara gelince, parmaklardan başlayarak önce sağ sonra sol ayağımızı topuk kemiği ile beraber üçer kez yıkarız.Ayaklarımızı yıkarken parmak aralarımızın iyice yıkanmasına dikkat etmemiz gerekir."]
    
    static var namazText = ["Anlatım sabah namazı üzerinden yapılacaktır ancak vakit ve rekat sayıları değişsede namaz kılış şekli aynıdır.Önce \"Niyet ettim Allah rızası için sabah namazının iki rekat sünnetini kılmaya\" diye niyet ederiz. \"Allahu Ekber\" diyerek tekbirle namaza başlarız.","Eller bağlandıktan sonra Sübhaneke'yi okuruz.Sonra Eûzu Besmele çekip: \"Eûzubillahimineşşeytanirracim, Bismillahirrahmanirrahim\" Fatiha Suresi'ni okuruz ve \"Amin\" deriz.Ardından namaz surelerinden birini okuruz","Sonra \"Allahu Ekber\" diyerek rükûya gideriz. Rükûda üç defa \"Sübhâne Râbbiye'l-Azim\" dedikten sonra doğruluruz.","Doğrulurken \"Semi Allahu li-men hamideh\" deriz. Tam doğrulunca da \"Rabbenâ leke'l hamd\" dedikten sonra...","\"Allahu Ekber\" deyip secdeye gideriz. Secdede üç defa: \"Sübhâne rabbiyel-a 'lâ\" deriz.","\"Allahu Ekber\" diyerek otururuz. Tekrar....","\"Allahu Ekber\" deyip secdeye gideriz. Secdede üç defa: \"Sübhâne rabbiyel-a 'lâ\" deriz.","\"Allahu Ekber\" deyip: \"Tahiyyata otururuz. Oturduktan sonra Ettehiyyâtü, Allâhumme Salli, Allâhumme Bârik ve Rabbenâ dualarını okuruz.","Dualar bitince yüzümüzü önce sağ tarafa çevirerek \"Es selâmu aleyküm ve rahmet'ullah\" diyerek selam veririz.","Sonra sola çevirip yine \"Es selâmu aleyküm ve rahmet'ullah\" diyerek selam veririz.Böylece Sabah namazının iki rekatlık farzi sona ermiş olur."]
    
    static var hadiths = ["1- (Allah Rasûlü) ”Din nasihattır/samimiyettir” buyurdu. ”Kime Yâ Rasûlallah?” diye sorduk. O da; ”Allah’a, Kitabına, Peygamberine, Müslümanların yöneticilerine ve bütün müslümanlara” diye cevap verdi. (Müslim, İmân, 95.)", "2- ”İslâm, güzel ahlâktır.” (Kenzü’l-Ummâl, 3/17, HadisNo: 5225.)", "3- ”İnsanlara merhamet etmeyene Allah merhamet etmez.” (Müslim, Fedâil, 66; Tirmizî, Birr, 16.)", "4- ”Kolaylaştırınız, güçleştirmeyiniz, müjdeleyiniz, nefret ettirmeyiniz.” (Buhârî, İlm, 12; Müslim, Cihâd, 6.)", "5- ”İnsanların Peygamberlerden öğrenegeldikleri sözlerden biri de: ‘Utanmadıktan sonra dilediğini yap!’ sözüdür.” (Buhârî, Enbiyâ, 54; EbuDâvûd, Edeb, 6.)", "6- ”Hayra vesile olan, hayrı yapan gibidir.” (Tirmizî, İlm, 14.)", "7- ”Mümin, bir delikten iki defa sokulmaz.(Mümin, iki defa aynı yanılgıya düşmez)” (Buhârî, Edeb, 83; Müslim, Zühd, 63.)", "8- ”Nerede olursan ol Allah’a karşı gelmekten sakın; yaptığın kötülüğün arkasından bir iyilik yap ki bu onu yok etsin. İnsanlara karşı güzel ahlakın gereğine göre davran.” (Tirmizî, Birr, 55.)", "9- ”Allah, sizden birinizin yaptığı işi, ameli ve görevi sağlam ve iyi yapmasından hoşnut olur.” (Taberânî, el-Mu’cemü’l-Evsat, 1/275; Beyhakî, ﬁu’abü’l-Îmân, 4/334.)", "10- ”İman, yetmiş küsur derecedir. En üstünü ‘Lâ ilâhe illallah (Allah’tan başka ilah yoktur)’ sözüdür, en düşük derecesi de rahatsız edici bir şeyi yoldan kaldırmaktır. Haya da imandandır.” (Buhârî, Îmân, 3; Müslim, Îmân, 57, 58.)", "11- ”Kim kötü ve çirkin bir iş görürse onu eliyle düzeltsin; eğer buna gücü yetmiyorsa diliyle düzeltsin; buna da gücü yetmezse, kalben karşı koysun. Bu da imanın en zayıf derecesidir.” (Müslim, Îmân, 78; Ebû Dâvûd, Salât, 248.)", "12- ”İki göz vardır ki, cehennem ateşi onlara dokunmaz: Allah korkusundan ağlayan göz, bir de gecesini Allah yolunda, nöbet tutarak geçiren göz.” (Tirmizî, Fedâilü’l-Cihâd, 12.)", "13- ”Zarar vermek ve zarara zararla karşılık vermek yoktur.” (İbn Mâce, Ahkâm, 17; Muvatta’, Akdıye, 31.)", "14- ”Hiçbiriniz kendisi için istediğini (mü’min) kardeşi için istemedikçe (gerçek) iman etmiş olamaz.” (Buhârî, Îmân, 7; Müslim, Îmân, 71.)", "15- ”Müslüman müslümanın kardeşidir. Ona zulmetmez, onu (düşmanına) teslim etmez. Kim, (mümin) kardeşinin bir ihtiyacını giderirse Allah da onun bir ihtiyacını giderir. Kim müslümanı bir sıkıntıdan kurtarırsa, bu sebeple Allah da onu kıyamet günü sıkıntılarının birinden kurtarır. Kim bir müslümanı(n kusurunu) örterse, Allah da Kıyamet günü onu(n kusurunu) örter.” (Buhârî, Mezâlim, 3; Müslim, Birr, 58.)", "16- ”İman etmedikçe cennete giremezsiniz, birbirinizi sevmedikçe de (gerçek anlamda) iman etmiş olamazsınız.” (Müslim, Îmân, 93; Tirmizî, Sıfâtu’l-Kıyâme, 56.)", "17- ”Müslüman, insanların elinden ve dilinden emin olduğu kimsedir.” (Tirmizî, Îmân, 12; Nesâî, Îmân, 8.)", "18- ”Birbirinize buğuz etmeyin, birbirinize haset etmeyin, birbirinize arka çevirmeyin; ey Allah’ın kulları, kardeş olun. Bir müslümana, üç günden fazla (din) kardeşi ile dargın durması helal olmaz.” (Buhârî, Edeb, 57, 58.)", "19- ”Hiç şüphe yok ki doğruluk iyiliğe götürür. İyilik de cennete götürür. Kişi doğru söyleye söyleye Allah katında sıddîk (doğru sözlü) diye yazılır. Yalancılık kötüye götürür. Kötülük de cehenneme götürür. Kişi yalan söyleye söyleye Allah katında kezzâb (çok yalancı) diye yazılır.” (Buhârî, Edeb, 69; Müslim, Birr, 103, 104.)", "20- ”(Mümin) kardeşinle münakaşa etme, onun hoşuna gitmeyecek şakalar yapma ve ona yerine getirmeyeceğin bir söz verme.” (Tirmizî, Birr, 58.)", "21- ”(Mümin) kardeşine tebessüm etmen sadakadır. İyiliği emredip kötülükten sakındırman sadakadır. Yolunu kaybeden kimseye yol göstermen sadakadır. Yoldan taş, diken, kemik gibi şeyleri kaldırıp atman da senin için sadakadır.” (Tirmizî, Birr, 36.)", "22- ”Allah sizin ne dış görünüşünüze ne de mallarınıza bakar. Ama o sizin kalplerinize ve işlerinize bakar.” (Müslim, Birr, 33; İbn Mâce, Zühd, 9; Ahmed b. Hanbel, 2/285, 539.)", "23- ”Allah’ın rızası, anne ve babanın rızasındadır. Allah’ın öfkesi de anne babanın öfkesindedir.” (Tirmizî, Birr, 3.)", "24- ”Üç dua vardır ki, bunlar şüphesiz kabul edilir: Mazlumun duası, yolcunun duası ve babanın evladına duası.” (İbn Mâce, Dua, 11.)", "25- ”Hiçbir baba, çocuğuna, güzel terbiyeden daha üstün bir hediye veremez.” (Tirmizî, Birr, 33.)", "26- ”Sizin en hayırlılarınız, hanımlarına karşı en iyi davrananlarınızdır. (Tirmizî, Radâ’, 11; İbn Mâce, Nikâh, 50.)", "27- ”Küçüklerimize merhamet etmeyen, büyüklerimize saygı göstermeyen bizden değildir.” (Tirmizî, Birr, 15; Ebû Dâvûd, Edeb, 66.)", "28- ”Peygamberimiz işaret parmağı ve orta parmağıyla işaret ederek: ”Gerek kendisine ve gerekse başkasına ait herhangi bir yetimi görüp gözetmeyi üzerine alan kimse ile ben, cennette işte böyle yanyanayız” buyurmuştur. (Buhârî, Talâk, 25, Edeb, 24; Müslim, Zühd, 42.)", "29- Peygamber Efendimiz ”(İnsanı) helâk eden şu yedi şeyden kaçının.” buyurdu. Onlar nelerdir ya Resulullah dediler. Bunun üzerine Efendimiz şöyle buyurdu: ”Allah’a şirk koşmak, sihir, Allah’ın haram kıldığı cana kıymak, faiz yemek, yetim malı yemek, savaştan kaçmak, suçsuz ve namuslu mümin kadınlara iftirada bulunmak.” (Buhârî, Vasâyâ, 23, Tıbb, 48; Müslim, Îmân, 144.)", "30- ”Allah’a ve ahiret gününe imân eden kimse, komşusuna eziyet etmesin. Allah’a ve ahiret gününe imân eden misafirine ikramda bulunsun. Allah’a ve ahiret gününe imân eden kimse, ya hayır söylesin veya sussun.” (Buhârî, Edeb, 31, 85; Müslim, Îmân, 74, 75.)", "31- ”Cebrâil bana komşu hakkında o kadar çok tavsiyede bulundu ki; ben (Allah Teâlâ) komşuyu komşuya mirasçı kılacak zannettim.” (Buhârî, Edeb, 28; Müslim, Birr, 140, 141.)", "32- ”Dul ve fakirlere yardım eden kimse, Allah yolunda cihad eden veya gündüzleri (nafile) oruç tutup, gecelerini (nafile) ibadetle geçiren kimse gibidir.” (Buhârî, Nafakât, 1; Müslim, Zühd, 41; Tirmizî, Birr, 44; Nesâî, Zekât, 78.)", "33- ”Her insan hata eder. Hata işleyenlerin en hayırlıları tevbe edenlerdir.” (Tirmizî, Kıyâme, 49; İbn Mâce, Zühd, 30.)", "34- ”Mü’minin başka hiç kimsede bulunmayan ilginç bir hali vardır; O’nun her işi hayırdır. Eğer bir genişliğe (nimete) kavuşursa şükreder ve bu onun için bir hayır olur. Eğer bir darlığa (musibete) uğrarsa sabreder ve bu da onun için bir hayır olur.” (Müslim, Zühd, 64; Dârim”, Rikâk, 61.)", "35- ”Bizi aldatan bizden değildir.” (Müslim, Îmân, 164.)", "36- ”Söz taşıyanlar (cezalarını çekmeden ya da affedilmedikçe) cennete giremezler.” (Müslim, Îmân, 168; Tirmizî, Birr, 79.)", "37- ”İşçiye ücretini, (alnının) teri kurumadan veriniz.” (İbn Mâce, Ruhûn, 4.)", "38- ”Bir müslümanın diktiği ağaçtan veya ektiği ekinden insan, hayvan ve kuşların yedikleri şeyler, o müslüman için birer sadakadır.” (Buhârî, Edeb, 27; Müslim, Müsâkât, 7, 10.)", "39- ”İnsanda bir organ vardır. Eğer o sağlıklı ise bütün vücut sağlıklı olur; eğer o bozulursa bütün vücut bozulur. Dikkat edin! O, kalptir.” (Buhârî, Îmân, 39; Müslim, Müsâkât, 107.)", "40- ”Rabbinize karşı gelmekten sakının, beş vakit namazınızı kılın, Ramazan orucunuzu tutun, mallarınızın zekatını verin, yöneticilerinize itaat edin. (Böylelikle) Rabbinizin cennetine girersiniz.” (Tirmizî, Cum’a, 80)"]
    
    static func readLocal (key: String)->String{
        let defaults = UserDefaults.standard
        let myarray = defaults.string(forKey: key) ?? String()
        return myarray
    }
  
    static func saveLocal (array:String, key : String){
    let defaults = UserDefaults.standard
    defaults.set(array, forKey: key)
}
}
struct Keys {
    static let hasOnboarded = "hasOnboarded"
    static let automaticLocation = "automaticLocation"
    static let manualCity = "manualCity"
    static let manualCountry = "manualCountry"
    static let showMidnightTime = "showMidnightTime"
    static let showImsakTime = "showImsakTime"
    static let calculationMethod = "calculationMethod"
    static let appearance = "appearance"
    static let needUpdatingSettings = "needUpdatingSettings"
}
struct NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchData(completion: @escaping (Result<Response, Error>) -> Void)  {

        let headers = [
            "X-RapidAPI-Key": "a6d01c3038msh6f00c91c5e8fbd9p1df598jsnd0cf1a094f10",
            "X-RapidAPI-Host": "aladhan.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://aladhan.p.rapidapi.com/timingsByCity?country=TR&city=Istanbul")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared

        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                do {
                    let decoder = JSONDecoder()
                    let actualData = try decoder.decode(Response.self, from: data!)
                    completion(.success(actualData))
                } catch {
                    completion(.failure(error))
                }
            }
        })

        dataTask.resume()
    }
}
struct Response: Codable {
    let data: PrayerTime
}

struct PrayerTime: Codable {
    let timings: Timings
    let date: Today
}

struct Timings: Codable {
    let Fajr: String
    let Sunrise: String
    let Dhuhr: String
    let Asr: String
    let Sunset: String
    let Isha: String
}

struct Today: Codable {
    let readable: String
}

final class LocationManager: NSObject {
    
    enum LocationErrors: String {
        case denied = "Locations are turned off. Please turn it on in Settings"
        case restricted = "Locations are restricted"
        case notDetermined = "Locations are not determined yet"
        case notFetched = "Unable to fetch location"
        case invalidLocation = "Invalid Location"
        case reverseGeocodingFailed = "Reverse Geocoding Failed"
        case unknown = "Some Unknown Error occurred"
    }
    
    typealias LocationClosure = ((_ location:CLLocation?,_ error: NSError?)->Void)
    private var locationCompletionHandler: LocationClosure?
    
    typealias ReverseGeoLocationClosure = ((_ location:CLLocation?, _ placemark:CLPlacemark?,_ error: NSError?)->Void)
    private var geoLocationCompletionHandler: ReverseGeoLocationClosure?
    
    private var locationManager:CLLocationManager?
    var locationAccuracy = kCLLocationAccuracyBest
    
    private var lastLocation:CLLocation?
    private var reverseGeocoding = false
    
    //Singleton Instance
    static let shared: LocationManager = {
        let instance = LocationManager()
        // setup code
        return instance
    }()
    
    private override init() {}

    //MARK:- Destroy the LocationManager
    deinit {
        destroyLocationManager()
    }
    
    //MARK:- Private Methods
    private func setupLocationManager() {
        
        //Setting of location manager
        locationManager = nil
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = locationAccuracy
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        
    }
    
    private func destroyLocationManager() {
        locationManager?.delegate = nil
        locationManager = nil
        lastLocation = nil
    }
    
    @objc private func sendPlacemark() {
        guard let _ = lastLocation else {
            
            self.didCompleteGeocoding(location: nil, placemark: nil, error: NSError(
                domain: self.classForCoder.description(),
                code:Int(CLAuthorizationStatus.denied.rawValue),
                userInfo:
                [NSLocalizedDescriptionKey:LocationErrors.notFetched.rawValue,
                 NSLocalizedFailureReasonErrorKey:LocationErrors.notFetched.rawValue,
                 NSLocalizedRecoverySuggestionErrorKey:LocationErrors.notFetched.rawValue]))
                        
            lastLocation = nil
            return
        }
        
        self.reverseGeoCoding(location: lastLocation)
        lastLocation = nil
    }
    
    @objc private func sendLocation() {
        guard let _ = lastLocation else {
            self.didComplete(location: nil,error: NSError(
                domain: self.classForCoder.description(),
                code:Int(CLAuthorizationStatus.denied.rawValue),
                userInfo:
                [NSLocalizedDescriptionKey:LocationErrors.notFetched.rawValue,
                 NSLocalizedFailureReasonErrorKey:LocationErrors.notFetched.rawValue,
                 NSLocalizedRecoverySuggestionErrorKey:LocationErrors.notFetched.rawValue]))
            lastLocation = nil
            return
        }
        self.didComplete(location: lastLocation,error: nil)
        lastLocation = nil
    }
    
//MARK:- Public Methods
    
    /// Check if location is enabled on device or not
    ///
    /// - Parameter completionHandler: nil
    /// - Returns: Bool
    func isLocationEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    /// Get current location
    ///
    /// - Parameter completionHandler: will return CLLocation object which is the current location of the user and NSError in case of error
    func getLocation(completionHandler:@escaping LocationClosure) {
        
        //Resetting last location
        lastLocation = nil
        
        self.locationCompletionHandler = completionHandler
        
        setupLocationManager()
    }
    
    
    /// Get Reverse Geocoded Placemark address by passing CLLocation
    ///
    /// - Parameters:
    ///   - location: location Passed which is a CLLocation object
    ///   - completionHandler: will return CLLocation object and CLPlacemark of the CLLocation and NSError in case of error
    func getReverseGeoCodedLocation(location:CLLocation,completionHandler:@escaping ReverseGeoLocationClosure) {
        
        self.geoLocationCompletionHandler = nil
        self.geoLocationCompletionHandler = completionHandler
        if !reverseGeocoding {
            reverseGeocoding = true
            self.reverseGeoCoding(location: location)
        }

    }
    
    /// Get Latitude and Longitude of the address as CLLocation object
    ///
    /// - Parameters:
    ///   - address: address given by the user in String
    ///   - completionHandler: will return CLLocation object and CLPlacemark of the address entered and NSError in case of error
    func getReverseGeoCodedLocation(address:String,completionHandler:@escaping ReverseGeoLocationClosure) {
        
        self.geoLocationCompletionHandler = nil
        self.geoLocationCompletionHandler = completionHandler
        if !reverseGeocoding {
            reverseGeocoding = true
            self.reverseGeoCoding(address: address)
        }
    }
    
    /// Get current location with placemark
    ///
    /// - Parameter completionHandler: will return Location,Placemark and error
    func getCurrentReverseGeoCodedLocation(completionHandler:@escaping ReverseGeoLocationClosure) {
        
        if !reverseGeocoding {
            
            reverseGeocoding = true
            
            //Resetting last location
            lastLocation = nil
            
            self.geoLocationCompletionHandler = completionHandler
            
            setupLocationManager()
        }
    }

    //MARK:- Reverse GeoCoding
    private func reverseGeoCoding(location:CLLocation?) {
        CLGeocoder().reverseGeocodeLocation(location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                //Reverse geocoding failed
                self.didCompleteGeocoding(location: nil, placemark: nil, error: NSError(
                    domain: self.classForCoder.description(),
                    code:Int(CLAuthorizationStatus.denied.rawValue),
                    userInfo:
                    [NSLocalizedDescriptionKey:LocationErrors.reverseGeocodingFailed.rawValue,
                     NSLocalizedFailureReasonErrorKey:LocationErrors.reverseGeocodingFailed.rawValue,
                     NSLocalizedRecoverySuggestionErrorKey:LocationErrors.reverseGeocodingFailed.rawValue]))
                return
            }
            if placemarks!.count > 0 {
                let placemark = placemarks![0]
                if let _ = location {
                    self.didCompleteGeocoding(location: location, placemark: placemark, error: nil)
                } else {
                    self.didCompleteGeocoding(location: nil, placemark: nil, error: NSError(
                        domain: self.classForCoder.description(),
                        code:Int(CLAuthorizationStatus.denied.rawValue),
                        userInfo:
                        [NSLocalizedDescriptionKey:LocationErrors.invalidLocation.rawValue,
                         NSLocalizedFailureReasonErrorKey:LocationErrors.invalidLocation.rawValue,
                         NSLocalizedRecoverySuggestionErrorKey:LocationErrors.invalidLocation.rawValue]))
                }
                if(!CLGeocoder().isGeocoding){
                    CLGeocoder().cancelGeocode()
                }
            }else{
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    private func reverseGeoCoding(address:String) {
        CLGeocoder().geocodeAddressString(address, completionHandler: {(placemarks, error)->Void in
            if (error != nil) {
                //Reverse geocoding failed
                self.didCompleteGeocoding(location: nil, placemark: nil, error: NSError(
                    domain: self.classForCoder.description(),
                    code:Int(CLAuthorizationStatus.denied.rawValue),
                    userInfo:
                    [NSLocalizedDescriptionKey:LocationErrors.reverseGeocodingFailed.rawValue,
                     NSLocalizedFailureReasonErrorKey:LocationErrors.reverseGeocodingFailed.rawValue,
                     NSLocalizedRecoverySuggestionErrorKey:LocationErrors.reverseGeocodingFailed.rawValue]))
                return
            }
            if placemarks!.count > 0 {
                if let placemark = placemarks?[0] {
                    self.didCompleteGeocoding(location: placemark.location, placemark: placemark, error: nil)
                } else {
                    self.didCompleteGeocoding(location: nil, placemark: nil, error: NSError(
                        domain: self.classForCoder.description(),
                        code:Int(CLAuthorizationStatus.denied.rawValue),
                        userInfo:
                        [NSLocalizedDescriptionKey:LocationErrors.invalidLocation.rawValue,
                         NSLocalizedFailureReasonErrorKey:LocationErrors.invalidLocation.rawValue,
                         NSLocalizedRecoverySuggestionErrorKey:LocationErrors.invalidLocation.rawValue]))
                }
                if(!CLGeocoder().isGeocoding){
                    CLGeocoder().cancelGeocode()
                }
            }else{
                print("Problem with the data received from geocoder")
            }
        })
    }
       
    //MARK:- Final closure/callback
    private func didComplete(location: CLLocation?,error: NSError?) {
        locationManager?.stopUpdatingLocation()
        locationCompletionHandler?(location,error)
        locationManager?.delegate = nil
        locationManager = nil
    }
    
    private func didCompleteGeocoding(location:CLLocation?,placemark: CLPlacemark?,error: NSError?) {
        locationManager?.stopUpdatingLocation()
        geoLocationCompletionHandler?(location,placemark,error)
        locationManager?.delegate = nil
        locationManager = nil
        reverseGeocoding = false
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    //MARK:- CLLocationManager Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           lastLocation = locations.last
           if let location = locations.last {
               let locationAge = -(location.timestamp.timeIntervalSinceNow)
               if (locationAge > 5.0) {
                   print("old location \(location)")
                   return
               }
               if location.horizontalAccuracy < 0 {
                   self.locationManager?.stopUpdatingLocation()
                   self.locationManager?.startUpdatingLocation()
                   return
               }
               if self.reverseGeocoding {
                   self.sendPlacemark()
               } else {
                   self.sendLocation()
               }
           }
       }
       
       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           
           switch status {
               
           case .authorizedWhenInUse,.authorizedAlways:
               self.locationManager?.startUpdatingLocation()
               
           case .denied:
               let deniedError = NSError(
                   domain: self.classForCoder.description(),
                   code:Int(CLAuthorizationStatus.denied.rawValue),
                   userInfo:
                   [NSLocalizedDescriptionKey:LocationErrors.denied.rawValue,
                    NSLocalizedFailureReasonErrorKey:LocationErrors.denied.rawValue,
                    NSLocalizedRecoverySuggestionErrorKey:LocationErrors.denied.rawValue])
               
               if reverseGeocoding {
                   didCompleteGeocoding(location: nil, placemark: nil, error: deniedError)
               } else {
                   didComplete(location: nil,error: deniedError)
               }
               
           case .restricted:
               if reverseGeocoding {
                   didComplete(location: nil,error: NSError(
                       domain: self.classForCoder.description(),
                       code:Int(CLAuthorizationStatus.restricted.rawValue),
                       userInfo: nil))
               } else {
                   didComplete(location: nil,error: NSError(
                       domain: self.classForCoder.description(),
                       code:Int(CLAuthorizationStatus.restricted.rawValue),
                       userInfo: nil))
               }
               
           case .notDetermined:
               self.locationManager?.requestLocation()
               
           @unknown default:
                   didComplete(location: nil,error: NSError(
                   domain: self.classForCoder.description(),
                   code:Int(CLAuthorizationStatus.denied.rawValue),
                   userInfo:
                   [NSLocalizedDescriptionKey:LocationErrors.unknown.rawValue,
                    NSLocalizedFailureReasonErrorKey:LocationErrors.unknown.rawValue,
                    NSLocalizedRecoverySuggestionErrorKey:LocationErrors.unknown.rawValue]))
           }
       }
       
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print(error.localizedDescription)
           self.didComplete(location: nil, error: error as NSError?)
       }
 
}

extension UIView{
    
    func zoomIn(duration: TimeInterval = 0.4) {
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = .identity
            }) { (animationCompleted: Bool) -> Void in
        }
    }
func anchor(top : NSLayoutYAxisAnchor?,
            bottom : NSLayoutYAxisAnchor?,
            leading : NSLayoutXAxisAnchor?,
            trailing : NSLayoutXAxisAnchor?,
            paddingTop : CGFloat,
            paddingBottom : CGFloat,
            paddingLeft : CGFloat,
            paddingRight : CGFloat,
            width : CGFloat,
            height : CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
        self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    if let bottom = bottom {
        self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
    }
    if let leading = leading {
        self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
    }
    if let trailing = trailing {
        self.trailingAnchor.constraint(equalTo: trailing, constant: paddingRight).isActive = true
    }
    
    if width != 0 {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height != 0 {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
}

}
