//
//  LoginViewModel.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/11/24.
//

import Foundation

import KakaoSDKAuth
import KakaoSDKUser

@Observable
final class LoginViewModel {
    /// 카카오톡 로그인과 기본 브라우저로 로그인을 연달아 시도
    /// - Returns: accessToken 옵셔널
    func kakaoLogin() async -> String? {
        var oauthToken: OAuthToken?
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) { // 카톡 로그인
            do {
                oauthToken = try await UserApi.shared.loginWithKakaoTalk()
            } catch {
                print("\(error)")
            }
        } else { // 기본 브라우저 로그인
            do {
                oauthToken = try await UserApi.shared.loginWithKakaoAccount()
            } catch {
                print("\(error)")
            }
        }
        return oauthToken?.accessToken
    }
}
