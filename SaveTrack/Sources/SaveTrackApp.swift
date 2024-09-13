import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct SaveTrackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage(TokenManager.tokenKey) private var accessToken: String?
    
    var body: some Scene {
        WindowGroup {
//            if let accessToken {
                HomeView(viewModel: .init(state: .init()))
//            } else {
//                LoginView()
//                    .onOpenURL(perform: { url in
//                        if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                            _ = AuthController.handleOpenUrl(url: url)
//                        }
//                    })
//            }
        }
    }
}
