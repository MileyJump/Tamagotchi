//
//  TamagotchiModel.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/21/24.
//

import UIKit

struct TamagotchiModel {
    let tamagotchiImage: String
    let tamagotchiName: String
}

struct TamagotchiManager {
    let tamagotchiModel: [TamagotchiModel] = 
    [TamagotchiModel(tamagotchiImage: "1-1", tamagotchiName: "따끔따끔 다마고치"),
     TamagotchiModel(tamagotchiImage: "2-1", tamagotchiName: "방실방실 다마고치"),
     TamagotchiModel(tamagotchiImage: "3-1", tamagotchiName: "반짝반짝 다마고치"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     TamagotchiModel(tamagotchiImage: "noImage", tamagotchiName: "준비중이에요"),
     
    ]
}

struct Bubble {
    static var name: String {
        return UserDatas.name ?? "대장님"
    }
    
    static var bubbleMessages = [
        "\(name), 배가 너무고파요 밥을 주세요",
        "저는 무럭무럭 성장하는 중입니다",
        "\(name), 저는 오늘 너무 졸려서 잠을 많이 자야겠어요",
        "\(name), 코딩 재밌으세요?",
        "쉬시면 안 돼요 더 많이 공부하세요",
        "\(name) ~. 즐거운 하루 보내세요",
        "아 \(name) ~ 코딩 속도가 너무 느리시네요^^ 거북이세요? 거북거북",
    ]
    
    static func randomMessage() -> String {
        let randomIndex = Int.random(in: 0..<bubbleMessages.count)
            return bubbleMessages[randomIndex]
        }
}
