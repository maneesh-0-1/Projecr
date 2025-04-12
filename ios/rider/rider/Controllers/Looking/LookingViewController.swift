//
//  LookingViewController.swift
//  rider
//
//  Copyright © 2021 minimalistic apps. All rights reserved.
//

import UIKit
import Apollo
import Lottie

class LookingViewController: UIViewController {
    @IBOutlet weak var ViewLoading: UIView!
    var animationView: AnimationView!
    @IBOutlet weak var textStatus: UILabel!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var buttonCancel: ColoredButton!
    private var subscriptionOrderUpdate: Cancellable?
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurView.addSubview(blurEffectView)
        animationView = AnimationView(name: "car")
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.backgroundColor = UIColor.clear
        ViewLoading.addSubview(animationView)
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        subscriptionOrderUpdate?.cancel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.animationView.play(completion: nil)
            self.refreshPage()
        }
        subscriptionOrderUpdate = Network.shared.apollo.subscribe(subscription: UpdatedOrderSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let graphQLResult):
                if let order = graphQLResult.data?.orderUpdated.fragments.currentOrder {
                    self.refreshUI(status: order.status)
                }
                
            case .failure(_):
                print("Failed to connect to socket")
                //self.dismiss(animated: true, completion: nil)
            }
        }
        self.animationView.play()
        refreshPage()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        subscriptionOrderUpdate?.cancel()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        let horizontalConstraint = NSLayoutConstraint(item: animationView!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ViewLoading, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: animationView!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ViewLoading, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: animationView!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ViewLoading, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: animationView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ViewLoading, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        ViewLoading.addConstraints([horizontalConstraint,verticalConstraint,widthConstraint,heightConstraint])
    }
    
    @objc func refreshPage() {
        LoadingOverlay.shared.showOverlay(view: self.view)
        Network.shared.apollo.fetch(query: GetCurrentOrderQuery()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let response):
                guard let status = response.data?.currentOrderWithLocation.order.status else {
                    self.dismiss(animated: true)
                    return
                }
                self.refreshUI(status: status)
                
            case .failure(_):
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func refreshUI(status: OrderStatus) {
        switch(status) {
        case .driverAccepted, .finished, .waitingForPostPay, .waitingForReview, .started, .waitingForPrePay, .arrived:
            self.dismiss(animated: true, completion: nil)
            break
            
        case .driverCanceled, .riderCanceled:
            self.dismiss(animated: true, completion: nil)
            break
            
        case .booked:
            self.buttonCancel.isEnabled = true
            self.animationView.animation = Animation.named("check")
            self.animationView.loopMode = .playOnce
            self.animationView.play()
            self.textStatus.text = NSLocalizedString("Trip is booked & will be dispatched 30 minutes before pickup time. You can send app to background now.", comment: "")
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            
        case .expired:
            let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("Sadly your request wasn't accepted in appropriate time and it is expired now.", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { action in
                self.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true)
            
        case .found, .notFound, .noCloseFound, .requested:
            self.buttonCancel.isEnabled = true
            self.animationView.animation = Animation.named("car")
            self.animationView.loopMode = .loop
            self.animationView.play()
            self.textStatus.text = NSLocalizedString("Looking for drivers...", comment: "")
            
        case .__unknown(_):
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func onCancelRequestClicked(_ sender: UIButton) {
        LoadingOverlay.shared.showOverlay(view: self.view)
        Network.shared.apollo.perform(mutation: CancelOrderMutation()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(_):
                self.dismiss(animated: true, completion: nil)
                
            case .failure(let error):
                error.showAlert()
            }
        }
        
    }
}
