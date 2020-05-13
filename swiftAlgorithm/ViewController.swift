//
//  ViewController.swift
//  swiftAlgorithm
//
//  Created by black on 2020/4/7.
//  Copyright © 2020 black. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    

    var arr:Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var arr = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//        setZeroes(&arr)

        let tableView = UITableView.init()
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        tableView.delegate = self
        tableView.dataSource = self
        arr = ["设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈"]
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - 旋转矩阵90度
    func rotate(_ matrix: inout [[Int]]) {
        let row = matrix.count
        for i in 0..<row {
            for j in 0..<Int(row/2) {
                (matrix[j][i], matrix[row - j - 1][i]) = (matrix[row - j - 1][i], matrix[j][i])
            }
        }
        
        for i in 0..<row {
            for j in 0..<i {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
        print(matrix)
    }
    
    /// 0数组 ,矩阵数组, 若有一个数为零,则该数的行与列的数都置0
    func setZeroes(_ matrix: inout [[Int]]) {
        
        var hen = false
        var shu = false
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == 0 {
                    if i == 0 {
                        hen  = true
                    }
                    if j == 0 {
                        shu = true
                    }
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        
        for i in 1..<matrix.count {
            if matrix[i][0] == 0 {
                for j in 1..<matrix[0].count {
                    matrix[i][j] = 0
                }
            }
        }
        
        for i in 1..<matrix[0].count {
            if matrix[0][i] == 0 {
                for j in 1..<matrix.count {
                    matrix[j][i] = 0
                }
            }
        }
        
        if hen {
            for i in 1..<matrix[0].count {
                matrix[0][i] = 0
            }
        }
        
        if shu {
            for i in 1..<matrix.count {
                matrix[i][0] = 0
            }
        }
        
    }
    
    /// 判断数组是否单调
    func isMonotonic(_ A: [Int]) -> Bool {
        var isAdd = false
        var isReduce = false
        for i in 0..<A.count - 1 {
            if A[i] < A[i + 1] {
                isAdd = true
            } else  {
                isReduce = true
            }
        }
        
        if isAdd && isReduce {
            return false
        }
        
        return true
    }
    
    // MARK: - 湍流子数组
    func maxTurbulenceSize(_ A: [Int]) -> Int {
        var max = 0
        var left = 0
        for i in 1..<A.count {
            let flag = compare(A[i - 1], b: A[i])
            if i == A.count - 1 || flag*compare(A[i],b: A[i + 1]) != -1 {
                if flag != 0 {
                    max = maxi(max, b: i - left + 1)
                }
                left = i
            }
        }
        print(max)
        return max
    }
    
    func compare(_ a: Int, b: Int) -> Int {
        return (a>b) ? 1 : (a==b) ? 0 : -1
    }
    
    func maxi(_ a: Int, b: Int) -> Int {
        return a>b ? a : b
    }
    
    // MARK: 判断圆和矩形是否重叠
    func checkOverlap(_ radius: Int, _ x_center: Int, _ y_center: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
        
        var dist = 0
        if x_center < x1 || x_center > x2 {
            dist += min((x1 - x_center) * (x1 - x_center), (x_center - x2) * (x_center - x2))
        }
        if y_center < y1 || y_center > y2 {
            dist += min((y1 - y_center) * (y1 - y_center), (y_center - y2) * (y_center - y2))
        }
        
        return dist <= radius * radius
    }
    
    // MARK: - 贪心算法
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let sortedNums = satisfaction.sorted(by: >)
        var parmes = 0
        var ans    = 0
        for i in 0..<sortedNums.count {
            if parmes + sortedNums[i] > 0 {
                parmes += sortedNums[i]
                ans += parmes
            } else {
                break
            }
        }
        return ans
    }
    
    // MARK: - 1403. 非递增顺序的最小子序列
    func minSubsequence(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted(by: >)
        let returnArr: [Int] = []
        
        for i in 0..<sortedNums.count {
            var arr: [Int] = []
            var maxNums = 0
            var num = 0
            for j in 0...i {
                arr.append(sortedNums[j])
                maxNums += arr[j]
            }
            for k in (i+1)..<sortedNums.count {
                num += sortedNums[k]
            }
            if maxNums > num {
                return arr
            }
        }
        return returnArr;
    }
}

