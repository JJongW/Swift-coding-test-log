/*
import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var seen = Set<String>()
    var ansIndex = -1
    
    var ans = 0
    var num = 0

    for (i, word) in words.enumerated() {
        if seen.contains(word) {
            ansIndex = i
            break
        }
        seen.insert(word)
        
        if i > 0 {
            let prev = words[i - 1]
            let lastChar = prev.last!
            let firstChar = word.first!
            
            if lastChar != firstChar {
                ansIndex = i
                break
            }
        }
    }
    
    if ansIndex == 0 {
        return [0, 0]   
    } else {
        if (ansIndex + 1) % n == 0 {
            ans = (ansIndex + 1) / n
        } else {
            ans = (ansIndex + 1) % n
        }
        if (ansIndex + 1) % n == 0 {
            num = (ansIndex + 1) / n
        } else {
            num = (ansIndex + 1) / n + 1
        }
        return [ans, num]
    }
}

해당 문제는 끝말잇기 중에 앞 단어의 끝과 뒷 단어의 첫글자가 같은지를 확인 
*/

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var seen = Set<String>()
    var ansIndex = -1

    for (i, word) in words.enumerated() {
        // 한 글자 단어 (안 들어온다 해도 안전하게)
        if word.count < 2 {
            ansIndex = i
            break
        }

        // 끝말잇기 체크
        if i > 0 {
            let prev = words[i - 1]
            if prev.last! != word.first! {
                ansIndex = i
                break
            }
        }

        // 중복 체크
        if seen.contains(word) {
            ansIndex = i
            break
        }
        seen.insert(word)
    }

    // ✅ 탈락자 없음
    if ansIndex == -1 { return [0, 0] }

    // ✅ 정답 계산
    let person = (ansIndex % n) + 1
    let turn = (ansIndex / n) + 1
    return [person, turn]
}