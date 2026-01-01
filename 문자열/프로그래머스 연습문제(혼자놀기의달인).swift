import Foundation

// 내가 쓴 코드
/*
import Foundation

func solution(_ cards:[Int]) -> Int {
    let seen = Set<String>()
    var ansIndex = -1
    
    for (i, num) in cards.enumerated() {
        let boxNum = cards[i]
        let seen.insert = boxNum
        if seen.contains(num) {
            ansIndex = boxNum
            break
        }
        seen.insert(num)
    }
    
    return 0
}

해당 문제는 set으로 중복을 따지는 문제가 아니라 방문했냐 안했냐로 바로 판별이 가능 -> BOOL로 처리가능
따라서 중복 판별이 아닌 방문 판별로 처리가 가능하다.
그래서 visited 배열을 만들어서 방문 판별을 처리하고 방문하지 않은 상자면 계속 따라가는 방식으로 처리하면 된다.
그리고 방문한 상자의 개수를 세어서 sizes 배열에 추가하고 가장 큰 두 수를 곱해서 출력하면 된다.
*/

// 해답
func solution(_ cards: [Int]) -> Int {
    let n = cards.count
    var visited = Array(repeating: false, count: n)
    var sizes: [Int] = []

    for start in 0..<n {
        if visited[start] { continue }

        var cur = start
        var count = 0

        // 아직 열지 않은 상자면 계속 따라가기
        while !visited[cur] {
            visited[cur] = true
            count += 1
            cur = cards[cur] - 1   // cards는 1-based 번호이므로 -1
        }

        if count > 0 { sizes.append(count) }
    }

    sizes.sort(by: >)
    if sizes.count < 2 { return 0 }
    return sizes[0] * sizes[1]
}