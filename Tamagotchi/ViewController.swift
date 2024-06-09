//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    let tamagotchiCollectionView: UICollectionView = {
//        UICollectionView는 레이아웃을 관리하기 위해 별도의 레이아웃 객체가 필요
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical

        // 섹션의 인셋(여백)을 설정합니다.
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
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
    
    func configureView() {
        view.backgroundColor = UIColor(cgColor: CGColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1))
    }
    
    
    func configureCollectionView() {
        tamagotchiCollectionView.register(TamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.identifier)
        tamagotchiCollectionView.delegate = self
        tamagotchiCollectionView.dataSource = self
        
    }
    
    func configureHierarchy() {
        view.addSubview(tamagotchiCollectionView)
    }
    
    func configureLayout() {
        tamagotchiCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        80
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tamagotchiCollectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as! TamagotchiCollectionViewCell
        return cell
    }
}



extension ViewController: UICollectionViewDelegateFlowLayout {
    // 위 아래 간격
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
        ) -> CGFloat {
        return 10
    }

//     옆 간격
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      minimumInteritemSpacingForSectionAt section: Int
      ) -> CGFloat {
          return 10
      }

//     cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let minimumItemSpacing: CGFloat = 15
        let availableWidth = collectionView.frame.width - padding - (minimumItemSpacing * 2)
        let width = availableWidth / 3
        return CGSize(width: width, height: width)
        }
}
