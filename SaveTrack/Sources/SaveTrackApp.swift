import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct SaveTrackApp: App {
    init() {
        KakaoSDK.initSDK(appKey: Secrets.Keys.KAKAO_APP_KEY)
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
                .onOpenURL(perform: { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
}
