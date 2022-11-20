//
//  main.swift
//  MyCreditManager
//
//  Created by 김영선 on 2022/11/20.
//

import Foundation

struct Student {
    var name : String
    var subject : [Subject]
}

struct Subject {
    var title : String
    var score : String
}

var input = "" //문자열
var student : [Student] = []

func isValidInput(input: String) -> Bool {
    if ("1"..."5") ~= input || input == "X" { return true }
    return false
}

func addStudent(name: String) {
    if student.filter({$0.name == name}).count != 0 { //이미 있는 학생이라면
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else { //없는 학생이라면
        let new = Student(name: name, subject: [])
        student.append(new)
        print("\(name) 학생을 추가했습니다.")
    }
}

func deleteStudent(name: String) {
    if let index = student.firstIndex(where: {$0.name == name}) {
        student.remove(at: index)
        print("\(name) 학생을 삭제하였습니다.")
    } else{
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

func addScore(name: String, subject: String, score: String){
    //해당 이름의 학생이 있는지 체크
    if let stindex = student.firstIndex(where: {$0.name == name}) {
        //해당 과목 성적있는지 체크
        if let sindex = student[stindex].subject.firstIndex(where: {$0.title == subject}) { //있으면 score 변경
            student[stindex].subject[sindex].score = score
        }else { //없으면 subject 추가
            let newSubject = Subject(title: subject, score: score)
            student[stindex].subject.append(newSubject)
        }
        print("\(name) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다")
    }else { //없으면 \(name) 학생을 찾지 못했습니다.
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

func deleteScore(name: String, subject: String){
    //해당 이름의 학생이 있는지 체크
    if let stindex = student.firstIndex(where: {$0.name == name}) {
        if let sindex = student[stindex].subject.firstIndex(where: {$0.title == subject}) { //해당 과목이 있는지 체크
            student[stindex].subject.remove(at: sindex)
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        }else { //없으면 해당 학생의 subject를 찾지 못했습니다.
            print("\(name) 학생의 \(subject) 과목을 찾지 못했습니다.")
        }
    }else { //없으면 \(name) 학생을 찾지 못했습니다.
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

func getScore(grade: String) -> Double {
    switch grade {
    case "A+":
        return 4.5
    case "A":
        return 4.0
    case "B+":
        return 3.5
    case "B":
        return 3.0
    case "C+":
        return 2.5
    case "C":
        return 2.0
    case "D+":
        return 1.5
    case "D":
        return 1.0
    default:
        return 0.0
    }
}

func printGrade(name: String){
    if let index = student.firstIndex(where: {$0.name == name}) { //해당 학생이 있으면
        var sum = 0.0
        student[index].subject.forEach{ s in
            print("\(s.title): \(s.score)")
            sum += getScore(grade: s.score)
        }
        let ave = String(format: "%.2f", sum / Double(student[index].subject.count))
        print("평점 : \(ave)")
    } else{ //없으면
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

repeat {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    input = readLine()!
    if input == "" {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        continue
    }
    if isValidInput(input: input) {
        switch input {
        case "1":
            print("추가할 학생의 이름을 입력해주세요")
            let name = readLine()!
            if name != "" {
                addStudent(name: name)
            }else { //입력없이 return
                print("입력이 잘못되었습니다. 다시 확인해주세요")
                break
            }
        case "2":
            print("삭제할 학생의 이름을 입력해주세요")
            let name = readLine()!
            if name != "" {
                deleteStudent(name: name)
            }else { //입력없이 return
                print("입력이 잘못되었습니다. 다시 확인해주세요")
                break
            }
        case "3":
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift A+")
            print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
            let line = readLine()!
            if line != "" {
                let words = line.split(separator: " ").map{$0}
                if words.count == 3 {
                    let name = String(words[0])
                    let subject = String(words[1])
                    let score = String(words[2])
                    addScore(name: name, subject: subject, score: score)
                }else{
                    print("입력이 잘못되었습니다. 다시 확인해주세요")
                    break
                }
            }else {
                print("입력이 잘못되었습니다. 다시 확인해주세요")
                break
            }
        case "4":
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
            print("입력예) Mickey Swift")
            let line = readLine()!
            if line != "" {
                let words = line.split(separator: " ").map{$0}
                if words.count == 2 {
                    let name = String(words[0])
                    let subject = String(words[1])
                    deleteScore(name: name, subject: subject)
                }else{
                    print("입력이 잘못되었습니다. 다시 확인해주세요")
                    break
                }
            }else {
                print("입력이 잘못되었습니다. 다시 확인해주세요")
                break
            }
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요")
            let name = readLine()!
            if name != "" {
                printGrade(name: name)
            }else { //입력없이 return
                print("입력이 잘못되었습니다. 다시 확인해주세요")
                break
            }
        default:
            break
        }
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
    }
}while(input != "X") //X 입력시 종료
print("프로그램을 종료합니다...")
