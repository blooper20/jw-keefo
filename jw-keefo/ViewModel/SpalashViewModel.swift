//
//  SpalashViewModel.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation
import LabCodeSDK

class SplashViewModel {
    let network: Network = Network()
    var userResponse: UserResponse?
    private var newsResponse: NewsResponse?
}

extension SplashViewModel {
    /// SDK 연동이 잘 되었는지 확인하는 함수
    func loginSDK(completion: @escaping((Bool) -> Void)) {
        LabCodeSDK.LoginManager.shared.labcode(
            apiKey: "0483e5fc-19e1-4669-a994-d3c5d9255dff",
            apiSecret: "18a300f8-e201-42f3-accd-a491838d1cad",
            completion: { (result) in
                if result == .success {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        )
    }
    
    /// 유저를 성공적으로 받아오는지 검증하는 함수
    func userCheck() {
        Task {
            userResponse = await network.getUserData()
            guard let userResponse = userResponse else { return }
            if userResponse.statusCode == 200 {
                print("<User> Verification",userResponse.message)
            } else {
                print("user 생성")
            }
        }
    }
    
    func getNewsData() async throws -> [Datum] {
        newsResponse = try await network.getNewsData()
        guard let newsResponse = newsResponse else { return [] }
        if newsResponse.statusCode == 200 {
            print("<Data> Load Success")
            return newsResponse.data
        } else {
            print("<Data> Load Failed")
            return []
        }
    }
    
    /// RootViewController를 CustomTabBarController로 변경하는 함수
//    func goCustomTabBarController() -> UIViewController{
//        let homeViewModel = HomeViewModel()
//        let rootViewController = HomeViewController(viewModel: homeViewModel)
//        return rootViewController
//    }
}
