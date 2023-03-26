//
//  OutputView.swift
//  MyCreditManager
//
//  Created by 김영선 on 2023/03/26.
//

import Foundation

class OutputView {
    func printMenu() {
        print("""
            원하는 기능을 입력해주세요.
            1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
            """)
    }
    
    func printInvalidInput() {
        print("잘못된 입력입니다.")
    }
    
    //MARK: - 학생 추가 메뉴
    func printMenuAddingStudent() {
        print("추가할 학생의 이름을 입력해주세요.")
    }
    
    func printCompleteAddingStudent(name: String) {
        print("\(name) 학생을 추가했습니다.")
    }
    
    func printMenuDeletingStudent() {
        print("삭제할 학생의 이름을 입력해주세요.")
    }
    
    func printCompleteDeletingStudent(name: String) {
        print("\(name) 학생을 삭제했습니다.")
    }
    
    func printMenuAddingSubject() {
        print("""
            성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, ..., F)을 띄어쓰기로 구분하여 차례로 입력해주세요.
            입력 예) Mickey Swift A+
            만약에 학생 성적 중 해당 과목이 존재한다면 기존 점수가 갱신됩니다.
        """)
    }
    
    func printCompleteAddingSubject(studentName: String, subject: String, score: String) {
        print("\(studentName) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다.")
    }
    
    func printMenuDeletingSubject() {
        print("""
            성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 입력해주세요.
            입력 예) Mickey Swift
        """)
    }
    
    func printCompleteDeletingSubject(studentName: String, subject: String) {
        print("\(studentName) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
    
    func printMenuGrade() {
        print("평점을 알고 싶은 학생의 이름을 입력해주세요")
    }
    
    func printGrade(studentName: String, scoreList: [(String, String)], grade: Double) {
        print(studentName)
        for score in scoreList {
            print("\(score.0): \(score.1)")
        }
        let gradeTruncated = String(format: "%.2f", grade)
        print("평점: \(gradeTruncated)")
    }
    
    func printMenuTerminate() {
        print("프로그램을 종료합니다...")
    }
}
