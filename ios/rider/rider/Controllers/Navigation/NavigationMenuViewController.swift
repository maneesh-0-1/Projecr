import UIKit
import Kingfisher

class NavigationMenuViewController : MenuViewController {
    let kCellReuseIdentifier = "MenuCell"
    let menuItems = ["Main"]
    
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCredit: UILabel!
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUser.layer.cornerRadius = imageUser.frame.size.width / 2
        imageUser.clipsToBounds = true
        imageUser.layer.borderColor = UIColor.white.cgColor
        imageUser.layer.borderWidth = 3.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Network.shared.apollo.fetch(query: GetRiderQuery()) { result in
            switch(result) {
            case .success(let data):
                guard let user = data.data?.rider else {
                    return
                }
                if let riderImage = user.media?.address {
                    let processor = DownsamplingImageProcessor(size: self.imageUser.intrinsicContentSize) |> RoundCornerImageProcessor(cornerRadius: self.imageUser.intrinsicContentSize.width / 2)
                    let url = URL(string: Config.Backend + riderImage.replacingOccurrences(of: " ", with: "%20"))
                    self.imageUser.kf.setImage(with: url, placeholder: UIImage(named: "Nobody"), options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.5)),
                        .cacheOriginalImage
                    ], completionHandler: { result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    })
                }
                self.labelName.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
                self.labelCredit.text = user.mobileNumber
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    @IBAction func onTravelsClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TripHistory") as? TripHistoryCollectionViewController {
            (menuContainerViewController.contentViewControllers[0] as! UINavigationController).pushViewController(vc, animated: true)
            menuContainerViewController.hideSideMenu()
        }
    }
    
    @IBAction func onProfileClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.contentViewControllers[0].performSegue(withIdentifier: "showEditProfile", sender: nil)
        menuContainerViewController.hideSideMenu()
    }
    
    @IBAction func onWalletClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Wallet") as? WalletViewController {
            (menuContainerViewController.contentViewControllers[0] as! UINavigationController).pushViewController(vc, animated: true)
            menuContainerViewController.hideSideMenu()
        }
    }
    
    @IBAction func onCouponsClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.contentViewControllers[0].performSegue(withIdentifier: "showCoupons", sender: nil)
        menuContainerViewController.hideSideMenu()
    }
    
    @IBAction func onPromotionsClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.contentViewControllers[0].performSegue(withIdentifier: "showPromotions", sender: nil)
        menuContainerViewController.hideSideMenu()
    }
    
    @IBAction func onTransactionsClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Transactions") as? TransactionsCollectionViewController {
            (menuContainerViewController.contentViewControllers[0] as! UINavigationController).pushViewController(vc, animated: true)
            menuContainerViewController.hideSideMenu()
        }
    }
    
    @IBAction func onFavoritesClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.contentViewControllers[0].performSegue(withIdentifier: "showFavorites", sender: nil)
        menuContainerViewController.hideSideMenu()
    }
    
    @IBAction func onAboutClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.contentViewControllers[0].performSegue(withIdentifier: "showAbout", sender: nil)
        menuContainerViewController.hideSideMenu()
    }
    
    @IBAction func onExitClicked(_ sender: UIButton) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
            self.dismiss(animated: true, completion: nil)
            menuContainerViewController.hideSideMenu()
        }
    }
}

extension NSNotification.Name {
    static let menuClicked = Notification.Name("menuClicked")
}
