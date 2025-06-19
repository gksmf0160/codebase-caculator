//
//  ContentView.swift
//  TeamIntroApp
//
//  Created by 송명균 on 5/20/25.
//

import SwiftUI

// MARK: - 모델 정의
struct Member: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let who: String
    let motivation: String
    let tmi: String
}

// MARK: - 인트로 뷰
struct IntroView: View {
    @Binding var showIntro: Bool

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image("spartaLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)

            Text("안녕하세요!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            Text("우리는 창의력과 실행력을 갖춘\n내 꿈은 마스터 팀입니다 💪")
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            Button(action: {
                withAnimation {
                    showIntro = false
                }
            }) {
                Text("우리 팀 만나보기")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }

            Spacer()
        }
        .padding()
        .background(Color(.darkGray).ignoresSafeArea())
    }
}

// MARK: - 팀원 카드 뷰
struct MemberCard: View {
    let member: Member

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            // 이미지 유효성 검사
            if let uiImage = UIImage(named: member.name) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .foregroundColor(.gray)
                    .background(Circle().fill(Color.white.opacity(0.2)))
            }

            Text(member.name)
                .font(.title2)
                .bold()
                .foregroundColor(.white)

            Text(member.role)
                .font(.headline)
                .foregroundColor(.gray)

            VStack(alignment: .leading, spacing: 12) {
                Group {
                    Text("1. 나는 누구인가요?")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                    Text(member.who)
                        .foregroundColor(.white)

                    Text("2. 지원동기")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                    Text(member.motivation)
                        .foregroundColor(.white)

                    Text("3. TMI 방출!")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                    Text(member.tmi)
                        .foregroundColor(.white)
                }
            }
            .font(.body)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.2)))
        .padding(.horizontal)
    }
}

// MARK: - 메인 뷰
struct ContentView: View {
    @State private var showIntro = true
    @State private var selectedIndex: Int = 0

    let teamMembers = [
        Member(
            name: "송명균",
            role: "iOS 개발자 1",
            who: "사용자 경험을 중요하게 생각하는 iOS 개발자입니다.",
            motivation: "모바일 개발에 대한 열정과 협업의 즐거움으로 지원하게 되었습니다.",
            tmi: "운동을 좋아해서 점심시간마다 헬스장에 갑니다!"
        ),
        Member(
            name: "김이든",
            role: "iOS 개발자 2",
            who: "세련된 UI/UX 구현을 즐기는 디자이너 겸 개발자입니다.",
            motivation: "사람들이 감탄할 만한 앱을 만들고 싶어서 지원했습니다.",
            tmi: "커피 없이 하루를 못 살아갑니다 ☕️"
        ),
        Member(
            name: "이태경",
            role: "iOS 개발자 3",
            who: "논리적인 사고와 팀워크를 중요시하는 개발자입니다.",
            motivation: "좋은 팀과 함께 성장하고 싶어서 지원했어요!",
            tmi: "고양이를 3마리 키우고 있습니다 🐱🐱🐱"
        )
    ]

    var body: some View {
        ZStack {
            if showIntro {
                IntroView(showIntro: $showIntro)
                    .transition(.opacity)
            } else {
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("👨‍👩‍👧‍👦 팀원 소개")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Text("각자의 개성으로 똘똘 뭉친 세 명의 팀원입니다.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    Picker("팀원 선택", selection: $selectedIndex) {
                        ForEach(0..<teamMembers.count, id: \.self) { index in
                            Text(teamMembers[index].name).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .animation(.easeInOut, value: selectedIndex)

                    MemberCard(member: teamMembers[selectedIndex])
                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: selectedIndex)

                    Spacer()
                }
                .padding(.top)
                .background(Color(.darkGray).ignoresSafeArea())
                .transition(.move(edge: .trailing))
            }
        }
    }
}

// MARK: - 프리뷰
#Preview {
    ContentView()
}
