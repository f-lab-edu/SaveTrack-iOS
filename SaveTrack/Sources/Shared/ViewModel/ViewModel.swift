//
//  ViewModel.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

protocol ViewModel: ObservableObject {
    associatedtype State
    associatedtype Input

    var state: State { get }
    func trigger(_ input: Input)
}
