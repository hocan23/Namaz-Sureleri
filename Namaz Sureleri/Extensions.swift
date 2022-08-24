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
    static var fullScreenAdId = "ca-app-pub-1501030234998564/7344504294"
    static var  bannerId = "ca-app-pub-1501030234998564/2283749303"
    static var isPremium : String?
    static var isFirstOpen = true
    static var sureIcerigi = [String]()
    static var sureİsimleri  = [String]()
    static var soundtag = [String]()
    
    static var sureMetin = ["RABBENA ATİNA VE RABBENAĞFİRLİ\n\nRabbenâ âtina fid'dunyâ haseneten ve fil'âhirati haseneten ve kınâ azâbennâr. Rabbenâğfirlî ve li-vâlideyye ve lil-Mu'minine yevme yekûmu'l hisâb.\n\nRABBENA ATİNA VE RABBENAĞFİRLİ ANLAMI\n\nAllah'ım! Bize dünyada iyilik ve güzellik, ahirette de iyilik, güzellik ver. Bizi ateş azabından koru.\nEy bizim Rabbimiz! Beni, anamı ve babamı ve bütün mü'minleri hesap gününde (herkesin sorguya çekileceği günde) bağışla.","KUNUT DUALARI\n\n1- Allâhumme innâ nesteînuke ve nestağfiruke ve nestehdik. Ve nu'minu bike ve netûbu ileyk. Ve netevekkelu aleyke ve nusni aleykel-hayra kullehu neşkuruke ve lâ nekfuruke ve nahleu ve netruku men yefcuruk\n2- Allâhumme iyyâke na'budu ve leke nusalli ve nescudu ve ileyke nes'a ve nahfidu nercû rahmeteke ve nahşâ azâbeke inne azâbeke bilkuffâri mulhık\n\nKUNUT DUALARI ANLAMI\n\n1- Allahım! Senden yardım isteriz, günahlarımızı bağışlamanı isteriz, razı olduğun şeylere hidayet etmeni isteriz. Sana inanırız, sana tevbe ederiz. Sana güveniriz. Bize verdiğin bütün nimetleri bilerek seni hayır ile överiz. Sana şükrederiz. Hiçbir nimetini inkar etmez ve onları başkasından bilmeyiz. Nimetlerini inkar eden ve sana karşı geleni bırakırız.\n2- Allahım! Biz yalnız sana kulluk ederiz. Namazı yalnız senin için kılarız, ancak sana secde ederiz. Yalnız sana koşar ve sana yaklaştıracak şeyleri kazanmaya çalışırız. İbadetlerini sevinçle yaparız. Rahmetinin devamını ve çoğalmasını dileriz. Azabından korkarız, şüphesiz senin azabın kafirlere ve inançsızlara ulaşır."]
    
    static var abdestText = ["Önce \"Niyet ettim Allah rızası için abdest almaya\" diye niyet ederiz.\nÖnce eller bileklere kadar ve parmak araları da ovuşturularak üç defa yıkanır.","Sağ elimize üç defa su alarak ağzımıza veririz. Her su alışta ağzımızı çalkalayarak ağızdaki suyu dökeriz.\n Tekrar avucumuza su alarak üç defa burnumuza veririz. Sol el ile de sümkürür temizleriz.","Sonra iki avucumuza su alarak saç bitiminden çene altına kadar yüzümüzü üç defa yıkarız.","Önce sağ kolu dirsekle beraber üçer defa yıkarız.\nSonra sol kolu dirsekle beraber üçer defa yıkarız.","Sağ elimizle başımızın dörtte birini mesh ederiz. Yani sağ elimizi ıslatıp başın dörtte birini sıvazlayarak ıslatırız.","Her iki eli de ıslatıp serçe parmaklarımızla kulaklarımızın içini mesh ederiz. \nKulakların arka kısmını ise baş parmaklarımızla mesh ederiz.Sonra orta ve yüzük parmaklarımızın dışı ile boynumuzu da mesh ederiz.","Ayaklara gelince, parmaklardan başlayarak önce sağ sonra sol ayağımızı topuk kemiği ile beraber üçer kez yıkarız.\nAyaklarımızı yıkarken parmak aralarımızın iyice yıkanmasına dikkat etmemiz gerekir."]
    
    static var namazText = ["Anlatım sabah namazı üzerinden yapılacaktır ancak vakit ve rekat sayıları değişsede namaz kılış şekli aynıdır.\nÖnce \"Niyet ettim Allah rızası için sabah namazının iki rekat sünnetini kılmaya\" diye niyet ederiz. \"Allahu Ekber\" diyerek tekbirle namaza başlarız.","Eller bağlandıktan sonra Sübhaneke'yi okuruz.\nSonra Eûzu Besmele çekip: \"Eûzubillahimineşşeytanirracim, Bismillahirrahmanirrahim\" Fatiha Suresi'ni okuruz ve \"Amin\" deriz.\nArdından namaz surelerinden birini okuruz","Sonra \"Allahu Ekber\" diyerek rükûya gideriz. Rükûda üç defa \"Sübhâne Râbbiye'l-Azim\" dedikten sonra doğruluruz.","Doğrulurken \"Semi Allahu li-men hamideh\" deriz. Tam doğrulunca da \"Rabbenâ leke'l hamd\" dedikten sonra...","\"Allahu Ekber\" deyip secdeye gideriz. Secdede üç defa: \"Sübhâne rabbiyel-a 'lâ\" deriz.","\"Allahu Ekber\" diyerek otururuz. Tekrar....","\"Allahu Ekber\" deyip secdeye gideriz. Secdede üç defa: \"Sübhâne rabbiyel-a 'lâ\" deriz.","\"Allahu Ekber\" deyip: \"Tahiyyata otururuz. Oturduktan sonra Ettehiyyâtü, Allâhumme Salli, Allâhumme Bârik ve Rabbenâ dualarını okuruz.","Dualar bitince yüzümüzü önce sağ tarafa çevirerek \"Es selâmu aleyküm ve rahmet'ullah\" diyerek selam veririz.","Sonra sola çevirip yine \"Es selâmu aleyküm ve rahmet'ullah\" diyerek selam veririz.\nBöylece Sabah namazının iki rekatlık farzi sona ermiş olur."]
    
    static var hadiths = ["1- (Allah Rasûlü) ”Din nasihattır/samimiyettir” buyurdu. ”Kime Yâ Rasûlallah?” diye sorduk. O da; ”Allah’a, Kitabına, Peygamberine, Müslümanların yöneticilerine ve bütün müslümanlara” diye cevap verdi. (Müslim, İmân, 95.)", "2- ”İslâm, güzel ahlâktır.” (Kenzü’l-Ummâl, 3/17, HadisNo: 5225.)", "3- ”İnsanlara merhamet etmeyene Allah merhamet etmez.” (Müslim, Fedâil, 66; Tirmizî, Birr, 16.)", "4- ”Kolaylaştırınız, güçleştirmeyiniz, müjdeleyiniz, nefret ettirmeyiniz.” (Buhârî, İlm, 12; Müslim, Cihâd, 6.)", "5- ”İnsanların Peygamberlerden öğrenegeldikleri sözlerden biri de: ‘Utanmadıktan sonra dilediğini yap!’ sözüdür.” (Buhârî, Enbiyâ, 54; EbuDâvûd, Edeb, 6.)", "6- ”Hayra vesile olan, hayrı yapan gibidir.” (Tirmizî, İlm, 14.)", "7- ”Mümin, bir delikten iki defa sokulmaz.(Mümin, iki defa aynı yanılgıya düşmez)” (Buhârî, Edeb, 83; Müslim, Zühd, 63.)", "8- ”Nerede olursan ol Allah’a karşı gelmekten sakın; yaptığın kötülüğün arkasından bir iyilik yap ki bu onu yok etsin. İnsanlara karşı güzel ahlakın gereğine göre davran.” (Tirmizî, Birr, 55.)", "9- ”Allah, sizden birinizin yaptığı işi, ameli ve görevi sağlam ve iyi yapmasından hoşnut olur.” (Taberânî, el-Mu’cemü’l-Evsat, 1/275; Beyhakî, ﬁu’abü’l-Îmân, 4/334.)", "10- ”İman, yetmiş küsur derecedir. En üstünü ‘Lâ ilâhe illallah (Allah’tan başka ilah yoktur)’ sözüdür, en düşük derecesi de rahatsız edici bir şeyi yoldan kaldırmaktır. Haya da imandandır.” (Buhârî, Îmân, 3; Müslim, Îmân, 57, 58.)", "11- ”Kim kötü ve çirkin bir iş görürse onu eliyle düzeltsin; eğer buna gücü yetmiyorsa diliyle düzeltsin; buna da gücü yetmezse, kalben karşı koysun. Bu da imanın en zayıf derecesidir.” (Müslim, Îmân, 78; Ebû Dâvûd, Salât, 248.)", "12- ”İki göz vardır ki, cehennem ateşi onlara dokunmaz: Allah korkusundan ağlayan göz, bir de gecesini Allah yolunda, nöbet tutarak geçiren göz.” (Tirmizî, Fedâilü’l-Cihâd, 12.)", "13- ”Zarar vermek ve zarara zararla karşılık vermek yoktur.” (İbn Mâce, Ahkâm, 17; Muvatta’, Akdıye, 31.)", "14- ”Hiçbiriniz kendisi için istediğini (mü’min) kardeşi için istemedikçe (gerçek) iman etmiş olamaz.” (Buhârî, Îmân, 7; Müslim, Îmân, 71.)", "15- ”Müslüman müslümanın kardeşidir. Ona zulmetmez, onu (düşmanına) teslim etmez. Kim, (mümin) kardeşinin bir ihtiyacını giderirse Allah da onun bir ihtiyacını giderir. Kim müslümanı bir sıkıntıdan kurtarırsa, bu sebeple Allah da onu kıyamet günü sıkıntılarının birinden kurtarır. Kim bir müslümanı(n kusurunu) örterse, Allah da Kıyamet günü onu(n kusurunu) örter.” (Buhârî, Mezâlim, 3; Müslim, Birr, 58.)", "16- ”İman etmedikçe cennete giremezsiniz, birbirinizi sevmedikçe de (gerçek anlamda) iman etmiş olamazsınız.” (Müslim, Îmân, 93; Tirmizî, Sıfâtu’l-Kıyâme, 56.)", "17- ”Müslüman, insanların elinden ve dilinden emin olduğu kimsedir.” (Tirmizî, Îmân, 12; Nesâî, Îmân, 8.)", "18- ”Birbirinize buğuz etmeyin, birbirinize haset etmeyin, birbirinize arka çevirmeyin; ey Allah’ın kulları, kardeş olun. Bir müslümana, üç günden fazla (din) kardeşi ile dargın durması helal olmaz.” (Buhârî, Edeb, 57, 58.)", "19- ”Hiç şüphe yok ki doğruluk iyiliğe götürür. İyilik de cennete götürür. Kişi doğru söyleye söyleye Allah katında sıddîk (doğru sözlü) diye yazılır. Yalancılık kötüye götürür. Kötülük de cehenneme götürür. Kişi yalan söyleye söyleye Allah katında kezzâb (çok yalancı) diye yazılır.” (Buhârî, Edeb, 69; Müslim, Birr, 103, 104.)", "20- ”(Mümin) kardeşinle münakaşa etme, onun hoşuna gitmeyecek şakalar yapma ve ona yerine getirmeyeceğin bir söz verme.” (Tirmizî, Birr, 58.)", "21- ”(Mümin) kardeşine tebessüm etmen sadakadır. İyiliği emredip kötülükten sakındırman sadakadır. Yolunu kaybeden kimseye yol göstermen sadakadır. Yoldan taş, diken, kemik gibi şeyleri kaldırıp atman da senin için sadakadır.” (Tirmizî, Birr, 36.)", "22- ”Allah sizin ne dış görünüşünüze ne de mallarınıza bakar. Ama o sizin kalplerinize ve işlerinize bakar.” (Müslim, Birr, 33; İbn Mâce, Zühd, 9; Ahmed b. Hanbel, 2/285, 539.)", "23- ”Allah’ın rızası, anne ve babanın rızasındadır. Allah’ın öfkesi de anne babanın öfkesindedir.” (Tirmizî, Birr, 3.)", "24- ”Üç dua vardır ki, bunlar şüphesiz kabul edilir: Mazlumun duası, yolcunun duası ve babanın evladına duası.” (İbn Mâce, Dua, 11.)", "25- ”Hiçbir baba, çocuğuna, güzel terbiyeden daha üstün bir hediye veremez.” (Tirmizî, Birr, 33.)", "26- ”Sizin en hayırlılarınız, hanımlarına karşı en iyi davrananlarınızdır. (Tirmizî, Radâ’, 11; İbn Mâce, Nikâh, 50.)", "27- ”Küçüklerimize merhamet etmeyen, büyüklerimize saygı göstermeyen bizden değildir.” (Tirmizî, Birr, 15; Ebû Dâvûd, Edeb, 66.)", "28- ”Peygamberimiz işaret parmağı ve orta parmağıyla işaret ederek: ”Gerek kendisine ve gerekse başkasına ait herhangi bir yetimi görüp gözetmeyi üzerine alan kimse ile ben, cennette işte böyle yanyanayız” buyurmuştur. (Buhârî, Talâk, 25, Edeb, 24; Müslim, Zühd, 42.)", "29- Peygamber Efendimiz ”(İnsanı) helâk eden şu yedi şeyden kaçının.” buyurdu. Onlar nelerdir ya Resulullah dediler. Bunun üzerine Efendimiz şöyle buyurdu: ”Allah’a şirk koşmak, sihir, Allah’ın haram kıldığı cana kıymak, faiz yemek, yetim malı yemek, savaştan kaçmak, suçsuz ve namuslu mümin kadınlara iftirada bulunmak.” (Buhârî, Vasâyâ, 23, Tıbb, 48; Müslim, Îmân, 144.)", "30- ”Allah’a ve ahiret gününe imân eden kimse, komşusuna eziyet etmesin. Allah’a ve ahiret gününe imân eden misafirine ikramda bulunsun. Allah’a ve ahiret gününe imân eden kimse, ya hayır söylesin veya sussun.” (Buhârî, Edeb, 31, 85; Müslim, Îmân, 74, 75.)", "31- ”Cebrâil bana komşu hakkında o kadar çok tavsiyede bulundu ki; ben (Allah Teâlâ) komşuyu komşuya mirasçı kılacak zannettim.” (Buhârî, Edeb, 28; Müslim, Birr, 140, 141.)", "32- ”Dul ve fakirlere yardım eden kimse, Allah yolunda cihad eden veya gündüzleri (nafile) oruç tutup, gecelerini (nafile) ibadetle geçiren kimse gibidir.” (Buhârî, Nafakât, 1; Müslim, Zühd, 41; Tirmizî, Birr, 44; Nesâî, Zekât, 78.)", "33- ”Her insan hata eder. Hata işleyenlerin en hayırlıları tevbe edenlerdir.” (Tirmizî, Kıyâme, 49; İbn Mâce, Zühd, 30.)", "34- ”Mü’minin başka hiç kimsede bulunmayan ilginç bir hali vardır; O’nun her işi hayırdır. Eğer bir genişliğe (nimete) kavuşursa şükreder ve bu onun için bir hayır olur. Eğer bir darlığa (musibete) uğrarsa sabreder ve bu da onun için bir hayır olur.” (Müslim, Zühd, 64; Dârim”, Rikâk, 61.)", "35- ”Bizi aldatan bizden değildir.” (Müslim, Îmân, 164.)", "36- ”Söz taşıyanlar (cezalarını çekmeden ya da affedilmedikçe) cennete giremezler.” (Müslim, Îmân, 168; Tirmizî, Birr, 79.)", "37- ”İşçiye ücretini, (alnının) teri kurumadan veriniz.” (İbn Mâce, Ruhûn, 4.)", "38- ”Bir müslümanın diktiği ağaçtan veya ektiği ekinden insan, hayvan ve kuşların yedikleri şeyler, o müslüman için birer sadakadır.” (Buhârî, Edeb, 27; Müslim, Müsâkât, 7, 10.)", "39- ”İnsanda bir organ vardır. Eğer o sağlıklı ise bütün vücut sağlıklı olur; eğer o bozulursa bütün vücut bozulur. Dikkat edin! O, kalptir.” (Buhârî, Îmân, 39; Müslim, Müsâkât, 107.)", "40- ”Rabbinize karşı gelmekten sakının, beş vakit namazınızı kılın, Ramazan orucunuzu tutun, mallarınızın zekatını verin, yöneticilerinize itaat edin. (Böylelikle) Rabbinizin cennetine girersiniz.” (Tirmizî, Cum’a, 80)"]
    
    
    static func addSure (){
        sureIcerigi.append("SÜBHANEKE DUASI \n\nSubhânekellâhumme ve bi hamdik ve tebârakesmuk ve teâlâ cedduk ve lâ ilâhe ğayruk. \n\nSÜBHANEKE ANLAMI \n\nAllah'ım! Sen eksik sıfatlardan pak ve uzaksın. Seni daima böyle tenzih eder ve överim. Senin adın mübarektir. Varlığın her şeyden üstündür. Senden başka ilah yoktur.")
        
        sureIcerigi.append("ETTEHİYATU DUASI \n\nEttehiyyâtu lillâhi vessalevâtu vettayibât. Esselâmu aleyke eyyuhen-Nebiyyu ve rahmetullahi ve berakâtuhu. Esselâmu aleynâ ve alâ ibâdillâhis-Sâlihîn. Eşhedu en lâ ilâhe illallâh ve eşhedu enne Muhammeden abduhû ve Rasuluh.\n\nETTEHİYATU DUASI ANLAMI \n\nDil ile, beden ve mal ile yapılan bütün ibadetler Allah'a dır. Ey Peygamber! Allah'ın selamı, rahmet ve bereketleri senin üzerine olsun. Selam bizim üzerimize ve Allah'ın bütün iyi kulları üzerine olsun. Şahitlik ederim ki, Allah'tan başka ilah yoktur. Yine şahitlik ederim ki, Muhammed, O'nun kulu ve elçisidir.")
        sureIcerigi.append("ALLAHUMME SALLİ DUASI \n\nAllâhumme salli alâ Muhammedin ve alâ âli Muhammed. Kemâ salleyte alâ İbrahime ve alâ âli İbrahim. İnneke hamidun mecîd.\n\nALLAHUMME SALLİ DUASI ANLAMI\n\nAllah'ım! Muhammed'e ve Muhammed'in ümmetine rahmet eyle; şerefini yücelt. İbrahim'e ve İbrahim'in ümmetine rahmet ettiğin gibi. Şüphesiz övülmeye layık yalnız sensin, şan ve şeref sahibi de sensin.")
        sureIcerigi.append("ALLAHUMME BARİK DUASI\n\nAllâhumme barik alâ Muhammedin ve alâ âli Muhammed. Kemâ barekte alâ İbrahîme ve alâ âli İbrahim. İnneke hamidun mecîd\nALLAHUMME BARİK DUASI ANLAMI\n\nAllah'ım! Muhammed'e ve Muhammed'in ümmetine hayır ve bereket ver. İbrahim'e ve İbrahim'in ümmetine verdiğin gibi. Şüphesiz övülmeye layık yalnız sensin, şan ve şeref sahibi de sensin.")
        sureIcerigi.append("RABBENA ATİNA VE RABBENAĞFİRLİ\n\nRabbenâ âtina fid'dunyâ haseneten ve fil'âhirati haseneten ve kınâ azâbennâr. Rabbenâğfirlî ve li-vâlideyye ve lil-Mu'minine yevme yekûmu'l hisâb.\n\nRABBENA ATİNA VE RABBENAĞFİRLİ ANLAMI\n\nAllah'ım! Bize dünyada iyilik ve güzellik, ahirette de iyilik, güzellik ver. Bizi ateş azabından koru.\nEy bizim Rabbimiz! Beni, anamı ve babamı ve bütün mü'minleri hesap gününde (herkesin sorguya çekileceği günde) bağışla.")
        sureIcerigi.append("KUNUT DUALARI\n\n1- Allâhumme innâ nesteînuke ve nestağfiruke ve nestehdik. Ve nu'minu bike ve netûbu ileyk. Ve netevekkelu aleyke ve nusni aleykel-hayra kullehu neşkuruke ve lâ nekfuruke ve nahleu ve netruku men yefcuruk\n2- Allâhumme iyyâke na'budu ve leke nusalli ve nescudu ve ileyke nes'a ve nahfidu nercû rahmeteke ve nahşâ azâbeke inne azâbeke bilkuffâri mulhık\n\nKUNUT DUALARI ANLAMI\n\n1- Allahım! Senden yardım isteriz, günahlarımızı bağışlamanı isteriz, razı olduğun şeylere hidayet etmeni isteriz. Sana inanırız, sana tevbe ederiz. Sana güveniriz. Bize verdiğin bütün nimetleri bilerek seni hayır ile överiz. Sana şükrederiz. Hiçbir nimetini inkar etmez ve onları başkasından bilmeyiz. Nimetlerini inkar eden ve sana karşı geleni bırakırız.\n2- Allahım! Biz yalnız sana kulluk ederiz. Namazı yalnız senin için kılarız, ancak sana secde ederiz. Yalnız sana koşar ve sana yaklaştıracak şeyleri kazanmaya çalışırız. İbadetlerini sevinçle yaparız. Rahmetinin devamını ve çoğalmasını dileriz. Azabından korkarız, şüphesiz senin azabın kafirlere ve inançsızlara ulaşır.")
    sureIcerigi.append("FATİHA SURESİ\n \n1- Bismillâhi’r-Rahmâni’r-Rahîm.\n \n2- Elhamdulillâhi Rabbi’l-âlemîn.\n \n3- Er-Rahmâni’r-Rahîm.\n \n4- Mâliki yevmi’d-dîn.\n \n5- İyyâke na’budu ve iyyâke neste’în.\n \n6- İhdine’s-sırâta’l-mustakîm.\n \n7- Sırâta’l-lezîne en’amte aleyhim. Ğayri’l-meğdûbi aleyhim ve le’d-dâllîn.\n \n FATİHA SURESİNİN ANLAMI\n \n1- Rahmân ve Rahîm olan Allah’ın adıyla.\n \n2- Hamd; Âlemlerin Rabbi olan Allah’a aittir.\n \n3- (O Allah) Rahmân ve Rahîm’dir.\n \n4- Din (ödül ve ceza) gününün sahibidir.\n \n5- (Ey Allah’ım) Biz yalnızca Sana ibadet eder ve yalnızca Sen’den yardım dileriz.\n \n6- Bizi dosdoğru yola ilet.\n \n7- Kendilerine nimet verdiğin kimselerin yoluna ilet, gazaba uğrayanların ve sapıkların yoluna değil.\n")
    
    sureIcerigi.append("FİL SURESİ\n  \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Elemtera keyfe fe’ale Rabbuke bi-ashâbi’l-fîl.\n \n2- Elem yec’al keydehum fî tadlîl.\n \n3- Ve ersele ’aleyhim tayran ebâbîl.\n \n4- Termîhim bi-hicâratin min siccîl.\n \n5- Fece’alehum ke’asfin me’kûl.\n \nFİL SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Rabbin fil sahiplerine neler etti, görmedin mi?\n \n2- Onların kötü planlarını boşa çıkarmadı mı?\n \n3- Onların üstüne ebabil kuşları gönderdi.\n \n4- O kuşlar, onların üzerlerine pişkin tuğladan yapılmış taşlar atıyordu.\n \n5- Böylece Allah onları yenilip çiğnenmiş ekine çevirdi.")
    
    
    sureIcerigi.append("KUREYŞ SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- Li îlâfi kurayş.\n \n2- Îlâfihim rihlete’ş-şitâi ve’s-sayf.\n \n3- Felya’budû Rabbe hâze’l-beyt.\n \n4- Ellezî et’amehum min cû’in ve âmenehum min havf.\n \nKUREYŞ SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Kureyş’in emniyetini sağladığı,\n \n2- Yaz ve kış yolculuğunda onları (güvenliğe ulaştırıp başkalarıyla) ısındırıp yakınlaştırdığı için onlar,\n \n3- Bu evin (mabed’in, Kâbe’nin) Rabbine kulluk etsinler.\n \n4- Ki O (Allah) kendilerini açlıktan (kurtarıp) doyuran ve her çeşit korkudan güvenliğe kavuşturandır.")
    
    
    sureIcerigi.append("MAUN SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Eraeytellezî yukezzibu bi’d-dîn.\n \n2- Fezâlike’l-lezî yedu’ul-yetîm.\n \n3- Ve lâ yehuddu alâ ta’âmi’l-miskîn.\n \n4- Feveylun lil-musallîn.\n \n5- Ellezînehum an salâtihim sâhûn.\n \n6- Ellezînehum yurâûn.\n \n7- Ve yemne’ûne’l-mâ’ûn.\n \nMAUN SURESİ\n \nANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Din gününü (İslam’ı, ahirette ceza ve mükâfatı) yalanlayanı gördün mü?\n \n2- İşte o, yetimi itip kakar.\n \n3- Yoksulu doyurmayı teşvik etmez (önayak olmaz).\n \n4- Şu namaz kılanların vay haline!\n \n5- Onlar namazlarından gafildirler (önem vermezler).\n \n6- Onlar gösteriş (için ibadet) yaparlar.\n \n7- Ve onlar en küçük bir yardımı (zekâtı) da engellerler.")
    
    sureIcerigi.append("KEVSER SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “İnnâ a’taynâ ke’l-kevser.\n \n2- Fesalli li-Rabbike ve’nhar.\n \n3- İnne şâni’eke huve’l-ebter\n \nKEVSER SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Şüphesiz biz sana Kevser’i verdik.\n \n2- Öyleyse Rabbin için namaz kıl ve kurban kes.\n \n3- Asıl sonu kesik olan, senin düşmanın (sana buğzeden)dir")
    
    
    sureIcerigi.append("KAFİRUN SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Gul yâ eyyuhe’l-kâfirûn.\n \n2- Lâ a’budu mâ ta’budûn.\n \n3- Ve lâ entum âbidûne mâ a’bud.\n \n4- Velâ ene âbidun mâ abettum.\n \n5- Velâ entum âbidûne mâ a’bud.\n \n6- Lekum dînukum veliye dîn.\n \nKAFİRUN SURESİ ANLAMI \n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “De ki: Ey kâfirler.\n \n2- Ben sizin taptıklarınıza tapmam.\n \n3- Siz de benim ibadet ettiğime ibadet edecek değilsiniz.\n \n4- Ben de sizin taptıklarınıza tapacak değilim.\n \n5- Siz de benim ibadet ettiğime, ibadet edecek değilsiniz.\n \n6- Sizin dininiz size, benim dinim bana.")
    
    
    sureIcerigi.append("NASR SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “İzâ câe nasrullâhi ve’l-fethu.\n \n2- Ve raeyte’n-nâse yedhulûne fî dînillâhi efvâcâ.\n \n3- Fe sebbih bi-hamdi Rabbike vestağfirhu innehû kâne tevvâbâ.\n \nNASR SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Allah’ın yardımı ve fetih geldiği zaman,\n \n2- Ve insanların, Allah’ın dinine dalga dalga girdiklerini gördüğün zaman,\n \n3- Hemen Rabbini överek tesbih et ve O’ndan mağfiret dile. Çünkü O, tevbeleri çok kabul edendir.")
    
    
    sureIcerigi.append("TEBBET SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Tebbet yedâ ebî lehebin ve tebb.\n \n2- Mâ ağnâ ‘anhu mâluhû ve mâ keseb.\n \n3- Seyaslâ nâran zâte leheb.\n \n4- Vemraetuhû hammâlete’l-hatab.\n \n5- Fî cîdihâ hablun min mesed.\n \nTEBBET SURESİ ANLAMI\n  \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “Ebu Leheb’in elleri kurusun, (yok olsun) zaten yok oldu ya.\n \n2- Malı da, kazandıkları da kendisine bir yarar sağlamadı. (kurtarmadı)\n \n3- (O) alevli bir ateşe girecektir.\n \n4- Karısı da, odun hamalı (ve),\n \n5- Boynunda bükülmüş bir ip olarak (ateşe girecektir.)")
    
    sureIcerigi.append("İHLAS SURESİ\n  \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Gul huvallâhu ehad.\n \n2- Allâhu’s-samed.\n \n3- Lem yelid ve lem yûled.\n \n4- Ve lem yekun lehû kufuven ahad.\n \nİHLAS SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “De ki: O Allah birdir.\n \n2- Allah samed (her şey O’na muhtaç, O kimseye muhtaç değil)’dir.\n \n3- O doğurmamıştır ve doğurulmamıştır.\n \n4- Ve hiçbir şey O’nun dengi değildir.")
    
    
    sureIcerigi.append("FELAK SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Gul e’ûzu bi-Rabbi’l-felak.\n \n2- Min şerri mâ halak.\n \n3- Ve min şerri ğâsikın izâ vekab.\n \n4- Ve min şerri’n-neffâsâti fi’l-ukad.\n \n5- Ve min şerri hâsidin izâ hased.\n \nFELAK SURESİ ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “De ki: ben, karanlığı yarıp sabahı ortaya çıkaran Rabbe sığınırım,\n \n2- Yarattığı şeylerin şerrinden,\n \n3- Karanlığı çöktüğü zaman gecenin şerrinden,\n \n4- Düğümlere üfleyenlerin şerrinden,\n \n5- Ve hased ettiği zaman hasedçinin şerrinden. (Allah’a sığınırım).")
    
    
    sureIcerigi.append("NAS SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- “Gul e’ûzu bi-Rabbi’n-nâs.\n \n2- Meliki’n-nâs.\n \n3- İlâhi’n-nâs. 4- Min şerri’l-vesvâsi’l-hânnâs.\n \n5- Ellezî yuvesvisu fî sudûri’n-nâs.\n \n6- Mine’l-cinneti ve’n-nâs.\n \nNAS SURESİ\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- “De ki: İnsanların Rabbine sığınırım.\n \n2- İnsanların malikine,\n \n3- İnsanların (gerçek) ilahına;\n \n4- İnsanlara kötü şeyler fısıldayan o sinsi vesvesecinin şerrinden.\n \n5- O ki, insanların göğüslerine (kötü düşünce, şüphe) vesvese verir.\n \n6- Gerek cin, gerekse insanlardan (olan vesvesecilerin şerrinden Allah’a sığınırım.)")
    
    
    
    sureIcerigi.append("AYET-EL KÜRSİ\n \nAllâhu lâ ilâhe illâ huve’l-hayyu’l-kayyûm. Lâ te’huzuhû sinetun ve lâ nevm. Lehû mâ fi’s-semâvâti ve mâ fi’l-ardı men zellezî yeşfe’u ‘ındehû illâ bi iznih. Ya’lemu mâ beyne eydîhim ve mâ halfehum ve lâ yuhîtûne bi şey’in min ‘ılmihî illâ bimâ şâe vesi’a kursiyyuhu’s-semâvâti ve’larda ve lâ yeûduhû hıfzuhumâ ve huve’l-‘aliyyu’l-‘azîm.\n \nAYET-EL KÜRSİ ANLAMI\n \nAllah, kendisinden başka hiçbir ilâh olmayandır. Diridir, kayyumdur. O’nu ne bir uyuklama tutabilir, ne de bir uyku. Göklerdeki her şey, yerdeki her şey O’nundur. İzni olmaksızın O’nun katında şefaatte bulunacak kimdir? O, kulların önlerindekileri ve arkalarındakileri (yaptıklarını ve yapacaklarını) bilir. Onlar O’nun ilminden, kendisinin dilediği kadarından başka bir şey kavrayamazlar. O’nun kürsüsü, bütün gökleri ve yeri kaplayıp kuşatmıştır. (O, göklere, yere, bütün evrene hükmetmektedir.) Gökleri ve yeri koruyup gözetmek O’na güç gelmez. O, yücedir, büyüktür.")
    
    
    sureIcerigi.append("AMENERRASULÜ\n \nBismillahirrahmanirrahim\n \nAmenerrasûlü bimâ unzile ileyhi min rabbihî vel mu’minûn(mu’minûne), kullun âmene billâhi ve melâiketihî ve kutubihî ve rusulih(rusulihî), lâ nüferrigu beyne ehadin min rusulih(rusulihî), ve gâlû semi’nâ ve eta’nâ ğufrâneke Rabbenâ ve ileykel masîr(masîru). Lâ yükellifullâhu nefsen illâ vüs’ahâ lehâ mâ kesebet ve aleyhâ mektesebet rabbenâ lâ tuâhıznâ in nesînâ ev ahta’nâ, rabbenâ ve lâ tahmil aleynâ ısran kemâ hameltehu alellezîne min gablinâ, rabbenâ ve lâ tuhammilnâ mâ lâ tâkate lenâ bih(bihî), va’fu annâ, vağfir lenâ, verhamnâ, ente mevlânâ fensurnâ alel gavmil kâfirîn(kâfirîne).\n \nAMERRASULÜ ANLAMI\n \nPeygamber, Rabbinden kendisine indirilene iman etti, mü’minler de (iman ettiler). Her biri; Allah’a, meleklerine, kitaplarına ve peygamberlerine iman ettiler ve şöyle dediler: “Onun peygamberlerinden hiçbirini (diğerinden) ayırt etmeyiz.” Şöyle de dediler: “İşittik ve itaat ettik. Ey Rabbimiz! Senden bağışlama dileriz. Sonunda dönüş yalnız sanadır.” Bakara 285 Allah bir kimseyi ancak gücünün yettiği şeyle yükümlü kılar. Onun kazandığı iyilik kendi yararına, kötülük de kendi zararınadır. (Şöyle diyerek dua ediniz): “Ey Rabbimiz! Unutur, ya da yanılırsak bizi sorumlu tutma! Ey Rabbimiz! Bize, bizden öncekilere yüklediğin gibi ağır yük yükleme. Ey Rabbimiz! Bize gücümüzün yetmediği şeyleri yükleme! Bizi affet, bizi bağışla, bize acı! Sen bizim Mevlâmızsın. Kâfirler topluluğuna karşı bize yardım et.” Bakara 285 ve 286 ayetleri.\n")
    
    
    sureIcerigi.append("ASR SURESİ\n \nBismillâhi’r-Rahmâni’r-Rahîm.\n \n1- Vel'asr.\n \n2- İnnel'insâne lefî husr.\n \n3- İllellezîne âmenû ve amilûssâlihâti vetevâ savbilhakkı vetevâ savbissabr.\n \nASR SURESİNİN ANLAMI\n \nRahmân ve Rahîm olan Allah’ın adıyla.\n \n1- Asr´a yemin olsun ki,\n \n2- insan mutlaka bir ziyandadır.\n \n3- Ancak iman edenler, salih amel (iyi işler) işleyenler, birbirlerine hakkı tavsiye eden ve sabrı tavsiye edenler bunun dışındadır")
    
        
        sureİsimleri.append("Sübhaneke Duası")
        sureİsimleri.append("Ettehiyatu Duası")
        sureİsimleri.append("Allahümme Salli Duası")
        sureİsimleri.append("Allahümme Barik Duası")
        sureİsimleri.append("Rabbena Atina Ve Rabbenağfirli Duası")
        sureİsimleri.append("Konut Duası")

        
        
        
    sureİsimleri.append("Fatiha Suresi")
    sureİsimleri.append("Fil Suresi")
    sureİsimleri.append("Kureyş Suresi")
    sureİsimleri.append("Maun Suresi")
    sureİsimleri.append("Kevser Suresi")
    sureİsimleri.append("Kafirun Suresi")
    sureİsimleri.append("Nasr Suresi")
    sureİsimleri.append("Tebbet Suresi")
    sureİsimleri.append("İhlas Suresi")
    sureİsimleri.append("Felak Suresi")
    sureİsimleri.append("Nas Suresi")
    sureİsimleri.append("Ayet-el Kürsi")
    sureİsimleri.append("Amenerrasulü")
    sureİsimleri.append("Asr Suresi")
    
        soundtag.append("Sübhaneke Duası")
        soundtag.append("Ettehiyyatü Duası")

        
        soundtag.append("Allahümme Salli Duası")
        soundtag.append("Allahumme Barik Duası")
        soundtag.append("Rabbenâ Duaları")
      
        soundtag.append("Kunut Duaları")

        
        
        
    soundtag.append("fatiha")
    soundtag.append("fil")
    soundtag.append("kurayş")
    soundtag.append("maun")
    soundtag.append("kevser")
    soundtag.append("kafirun")
    soundtag.append("nasr")
    soundtag.append("tebbet")
    soundtag.append("ihlas")
    soundtag.append("felak")
    soundtag.append("nas")
    soundtag.append("ayetelkürsi")
    soundtag.append("amenerrasulü")
    soundtag.append("asr")
    
    }
    

    

    
    
    
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
