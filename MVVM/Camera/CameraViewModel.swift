//
//  CameraViewModel.swift
//  MVVM
//
//  Created by Павел Петров on 02.10.2023.
//

import AVFoundation
import Foundation
import UIKit

class CameraViewModel {
    let userDefaults = UserDefaults.standard
    let dbManager = DBService()
}


// MARK: - CameraViewModelProtocol
extension CameraViewModel: CameraViewModeProtocol {
    var isFlashEnable: Bool {
        get {
            userDefaults.bool(forKey: "IsFlashEnable")
        }
        set {
            userDefaults.set(newValue, forKey: "IsFlashEnable")
        }
    }
    
    var isLivePhotoEnable: Bool {
        get {
            userDefaults.bool(forKey: "IsLivePhotoEnable")
        }
        set {
            userDefaults.set(newValue, forKey: "IsLivePhotoEnable")
        }
    }
    
    var isWideScreenAvaible: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnable: Bool {
        get {
            userDefaults.bool(forKey: "IsWideScreenEnable")
        }
        set {
            userDefaults.set(newValue, forKey: "IsWideScreenEnable")
        }
    }
    
    var isCameraFlipAvaible: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvaibleCameraModes() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            modes.append(.portrait)
        }
        if #available(iOS 11.0, *) {
            modes.append(.slowMotion)
        }
        modes.append(.panorama)
        return modes
    }
    
    func getRecentImage() -> UIImage? {
        dbManager.getRecentImage()
    }
    
    
}
