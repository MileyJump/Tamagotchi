//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tamagotchiManager: [TamagotchiModel] = TamagotchiManager().tamagotchiModel
    
    private let tamagotchiCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 10
        let cellspacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (sectionSpacing * 2 ) - (cellspacing * 2 )
        layout.itemSize = CGSize(width: width/3, height: width/3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = sectionSpacing
        layout.minimumLineSpacing = sectionSpacing
        // 섹션의 인셋(여백)을 설정합니다.
        layout.sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        configureHierarchy()
        configureLayout()
    }
    
    private func configureView() {
        view.backgroundColor = .customBackgroundColor
    }
    
    
    private func configureCollectionView() {
        tamagotchiCollectionView.register(TamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.identifier)
        tamagotchiCollectionView.delegate = self
        tamagotchiCollectionView.dataSource = self
        
    }
    
    private func configureHierarchy() {
        view.addSubview(tamagotchiCollectionView)
    }
    
    private func configureLayout() {
        tamagotchiCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchiManager.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tamagotchiCollectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as! TamagotchiCollectionViewCell
        cell.configrueCell(tamagotchiManager[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let vc = DetailPopupViewController()
        //        
        //        present(vc, animated: true)
        
       
        let detailview = DetailPopupView()
        view.addSubview(detailview)
        
        
//        
//        detailview.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset(160)
//            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(60)
//        }
        detailview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}


