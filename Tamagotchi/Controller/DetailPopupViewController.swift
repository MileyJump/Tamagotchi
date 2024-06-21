//
//  DetailPopupViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/21/24.
//

import UIKit

class DetailPopupViewController: UIViewController {
    
    let detailView = DetailPopupView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    

    func configureView() {
        view.backgroundColor = .customBackgroundColor
    }
    
    private func configureHierarchy() {
        view.addSubview(detailView)
    }
    
    private func configureLayout() {
        detailView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.verticalEdges.equalToSuperview().inset(40)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
