import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct SaveTrackApp: App {
    init() {
        if let appKey = Secrets.Keys.KAKAO_APP_KEY {
            KakaoSDK.initSDK(appKey: appKey)
        }
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
