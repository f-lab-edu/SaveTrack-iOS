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
    let apiService = APIService()
    
    func login() async {
        do {
            print("❇️",Secrets.ProjectURLs.PROJECT_API_URL)
            let kakaoAccessToken = try await kakaoLogin()
            let request = AuthTarget.kakaoLogin(accessToken: kakaoAccessToken)
            let result = try await apiService.request(request: request, response: BaseResponseDTO<LoginResponseDTO>.self)
            
            switch result.code {
            case 200:
                switch result.data {
                case .data(let loginResponse):
                    let accessToken = loginResponse.token
                    TokenManager.saveToken(accessToken)
                default:
                    break
                }
            default:
                break
            }
        } catch {
            print("🚨 \(error)")
        }
    }
    
    /// 카카오톡 로그인과 기본 브라우저로 로그인을 연달아 시도
    /// - Returns: accessToken
    private func kakaoLogin() async throws -> String {
        do {
            var oauthToken: OAuthToken
            if UserApi.isKakaoTalkLoginAvailable() {
                oauthToken = try await UserApi.shared.loginWithKakaoTalk() // 카톡 로그인
            } else {
                oauthToken = try await UserApi.shared.loginWithKakaoAccount() // 기본 브라우저 로그인
            }
            print("✅", oauthToken.accessToken) // TODO: 삭제
            return oauthToken.accessToken
        } catch {
            print("\(error)")
            throw error
        }
    }
}
