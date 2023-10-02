//
//  ViewController.swift
//  MVVM
//
//  Created by Павел Петров on 02.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var flashButton: UIButton!
    @IBOutlet private var livePhotoButton: UIButton!
    
    var viewModel: CameraViewModeProtocol = CameraViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configFlashButton()
        configLivePhotoButton()
    }
    
    @IBAction func didTapFlashButton() {
        viewModel.isFlashEnable = !viewModel.isFlashEnable
        configFlashButton()
    }
    
    @IBAction func didTapLivePhotoButton() {
        viewModel.isLivePhotoEnable = !viewModel.isLivePhotoEnable
        configLivePhotoButton()
    }

    private func configFlashButton() {
        let systemName = viewModel.isFlashEnable ? "lighbilb" : "lightbulb.slash"
        flashButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    private func configLivePhotoButton() {
        let systemName = viewModel.isFlashEnable ? "livephoto" : "livephoto.slash"
        livePhotoButton.setImage(UIImage(systemName: systemName), for: .normal)
    }
}

