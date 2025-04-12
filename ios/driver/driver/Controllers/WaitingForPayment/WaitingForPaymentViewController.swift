//
//  WaitingForPaymentViewController.swift
//  driver
//
//  Created by Manly Man on 1/1/20.
//  Copyright © 2020 minimal. All rights reserved.
//

import UIKit
import Lottie
import Apollo

class WaitingForPaymentViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var buttonCash: ColoredButton!
    var currentOrder: CurrentOrder?
    private var observer: NSObjectProtocol?
    private var subscriptionOrderUpdate: Cancellable?
    
    var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        self.backgroundView.addSubview(blurEffectView)
        animationView = AnimationView(name: "cash")
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.backgroundColor = UIColor.clear
        animationView.play()
        viewLoading.addSubview(animationView)
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.animationView.play()
            self.requestRefresh()
        }
        subscriptionOrderUpdate = Network.shared.apollo.subscribe(subscription: OrderUpdatedSubscription()) { [weak self] result in
            guard let self = self else {
              return
            }
            switch result {
                      case .success(let graphQLResult):
                if let order = graphQLResult.data?.orderUpdated.fragments.currentOrder {
                    if order.status == .finished || order.status == .waitingForReview {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
                
            case .failure(_):
                print("Can not connect to socket")
            }
        }
        requestRefresh()
    }
    
    deinit {
        subscriptionOrderUpdate?.cancel()
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    
    @IBAction func onCashPaidTouched(_ sender: Any) {
        LoadingOverlay.shared.showOverlay(view: self.view)
        Network.shared.apollo.perform(mutation: UpdateOrderStatusMutation(orderId: currentOrder!.id, status: OrderStatus.finished, cashPayment: currentOrder!.costAfterCoupon)) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(_):
                self.dismiss(animated: true, completion: nil)
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    @objc private func requestRefresh() {
        animationView.play()
        self.buttonCash.isEnabled = false
        LoadingOverlay.shared.showOverlay(view: self.view)
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let data):
                self.currentOrder = data.data?.driver?.orders.nodes.first?.fragments.currentOrder
                if data.data?.driver?.orders.nodes.count == 1 {
                    self.buttonCash.isEnabled = true
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
                
                
            case .failure(_):
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
