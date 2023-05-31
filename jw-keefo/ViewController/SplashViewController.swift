//
//  SplashViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import Lottie
import SnapKit

class SplashViewController: UIViewController {
    
    private var viewModel: SplashViewModel
    private var datum: [Datum]
    
    //MARK: - UI Component
    private lazy var keefoBackgroundView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(named: "splash3")
        ImageView.contentMode = .scaleAspectFill
        return ImageView
    }()
    
    private lazy var lottieView: LottieAnimationView = {
        let view = LottieAnimationView(name: "heart_rain")
        view.contentMode = .scaleAspectFill
        view.loopMode = .playOnce
        view.animationSpeed = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addLottieView()
        userLogin()
    }
    
    //MARK: - Initialize
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        self.datum = [Datum].init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SplashViewController {
    // MARK: - Function
    private func configure() {
        self.view.addSubview(keefoBackgroundView)
        keefoBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addLottieView() {
        self.view.addSubview(lottieView)
        lottieView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func animateAndNext() {
        DispatchQueue.main.async {
            self.lottieView.play(toFrame: 120) { (value) in
                Task {
                    do {
                        self.datum = try await self.viewModel.getNewsData()
                        let rootViewController = CustomTabBarController(datum: self.datum)
                        self.view.window?.rootViewController = rootViewController
                        self.view.window?.makeKeyAndVisible()
                    } catch {
                        // 오류 처리
                        print("Error: \(error)")
                        return
                    }
                }
            }
        }
    }
    
    private func userLogin() {
        viewModel.loginSDK(completion: { result in
            if result == true {
                self.viewModel.userCheck()
                self.animateAndNext()
            } else {
                print("SDK 실패")
                // SDK를 못받아 왔을 때 실행되는 로직
            }
        })
    }
}

