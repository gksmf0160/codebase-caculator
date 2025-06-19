//
//  ViewController.swift
//  TeamApp
//
//  Created by 김이든 on 5/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var teamView: UIView!
    @IBOutlet weak var teamMemberView: UIView!
    
    @IBOutlet weak var teamSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var memberImageView: UIImageView!
    
    @IBOutlet weak var blogButton: UIButton!
    
    @IBOutlet weak var mbtiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    
    @IBOutlet weak var teamMemberLabel: UILabel!
    
    struct TeamMember {
        var mbti: String
        var imageName: String
        var name: String
        var explanation: String
        var pros: String
        var style: String
        var blog: String
    }
    
    let myeonggyun = TeamMember(mbti: "ENFP", imageName: "song", name: "송명균", explanation: "앱 개발에 흥미를 느끼며, 집중한 모습", pros: "소통을 하며, 가장 좋은 방향으로 간다.", style: "포옹력이 높으며, 주변을 많이 두리번 거림", blog: "https://gksmf0160.tistory.com/")
    
    let eden = TeamMember(mbti: "INTJ", imageName: "kim", name: "김이든", explanation: "비전공자지만 개발에 흥미를 느껴 더 성장하고 싶다는 마음으로 iOS 개발에 도전하게 됐습니다. MBTI가 I라 낯을 많이 가리는 편이지만,먼저 다가와주는 사람과는 편하게 잘 어울립니다. 팀 프로젝트에서는 책임감을 가지고 적극적으로 참여하고, 열정 있게 함께하는 사람들과 협업하는 걸 좋아합니다.", pros: "포기하지 않고 끝까지 해결하려는 끈기와 문제 해결에 대한 흥미를 바탕으로, 어려운 상황에서도 스스로 답을 찾아가는 힘이 있습니다.", style: "무언가를 빠르게 완성하기보다는, 제대로 이해하고 정리된 결과물을 만들어내는 것을 더 중요하게 생각합니다. 과정 하나하나를 꼼꼼하고 세심하게 접근하는 성격입니다.", blog: "https://velog.io/@edenkim/posts")
    
    let taekyoung = TeamMember(mbti: "ENTP", imageName: "lee", name: "이태경", explanation: "iOS에 내 어플을 개발해서 등록하기 위해 개발을 배우고 있습니다.", pros: "단점이 없는것이 장점이다.", style: "변화가 내 고유의 스타일이다.", blog: "https://www.notion.so/312fe82fdbe94785a3fa76027ca62a3e")
    
    var selectedURL: String = "https://gksmf0160.tistory.com/"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //탭메뉴 스타일
        let boldFont = UIFont.boldSystemFont(ofSize: 18)
        let normalFont = UIFont.systemFont(ofSize: 16)
        
        teamSegmentedControl.setTitleTextAttributes(
            [.foregroundColor: UIColor.black,.font: normalFont],
            for: .normal
        )
        
        // 선택된 상태 텍스트 색상
        teamSegmentedControl.setTitleTextAttributes(
            [.foregroundColor: UIColor(red: 107/255, green: 76/255, blue: 154/255, alpha: 1),.font: boldFont],
            for: .selected
        )
        
        teamView.applyNeumorphism()
        teamMemberView.applyNeumorphism()
        
        teamLabel.applyShadow()
        teamMemberLabel.applyShadow()
        
        let config = UIImage.SymbolConfiguration(pointSize: 28)
        blogButton.setImage(UIImage(systemName: "link.circle.fill", withConfiguration: config), for: .normal)
        blogButton.tintColor = UIColor(red: 0x5C/255, green: 0x2D/255, blue: 0x91/255, alpha: 1.0)
        
    }
    
    
    
    
    @IBAction func nameDidChange(_ sender: Any) {
        guard let segmentedControl = sender as? UISegmentedControl,
              let title = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) else { return }
        
        switch title {
        case "송명균":
            changeMemberView(myeonggyun)
            teamMemberView.applyNeumorphism()
            
        case "김이든":
            changeMemberView(eden)
            teamMemberView.applyNeumorphism()
            
        case "이태경":
            changeMemberView(taekyoung)
            teamMemberView.applyNeumorphism()
        default:
            break
        }
    }
    
    func changeMemberView(_ changeName: ViewController.TeamMember){
        memberImageView.image = UIImage(named: changeName.imageName)
        mbtiLabel.text = changeName.mbti
        nameLabel.text = changeName.name
        explanationLabel.text = changeName.explanation
        prosLabel.text = changeName.pros
        styleLabel.text = changeName.style
        selectedURL = changeName.blog
    }
    
    @IBAction func blogButtonTapped(_ sender: Any) {
        if let url = URL(string: selectedURL) {
            UIApplication.shared.open(url)
        }
    }
    
    
    
}

