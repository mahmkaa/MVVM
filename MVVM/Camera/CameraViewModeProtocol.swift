//
//  CameraViewModeProtocol.swift
//  MVVM
//
//  Created by Павел Петров on 02.10.2023.
//

import UIKit

protocol CameraViewModeProtocol {
    var isFlashEnable: Bool { get set }
    var isLivePhotoEnable: Bool { get set }
    var isWideScreenAvaible: Bool { get }
    var isWideScreenEnable: Bool { get set }
    var isCameraFlipAvaible: Bool { get }
    
    func getAvaibleCameraModes() -> [CameraMode]
    func getRecentImage() -> UIImage?
}
