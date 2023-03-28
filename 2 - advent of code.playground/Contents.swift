import UIKit

//0. first some boilerplate to load in a file called day1_sample.input
//   change this to day1 to get the bigger input from advent of code
//   to get stars on advent of code, replace the contents of day1 with "your puzzle input"
if
    let url = Bundle.main.url(forResource: "day1_sample", withExtension: "input"),
    let data = try? String(contentsOf: url)
{
    //the result will be a string called data, that you can do anything with :)
    //print(data)
    
    //this is the "normal" / basic way of doing it
    //following Flynn's pseudo code from lectorial chat (thanks!)
    var elfsArr : [[Int]] = []
    //elfs.append([1000,2000,3000])
    //elfs.append([1200,1200,1200])
    
    //1. keep a track of the current elf
    var currentElf : [Int] = []
    
    //2. split the data into lines
    var lines = data.split(separator: "\n", omittingEmptySubsequences: false)
    print(lines)
    
    //3. for each line
    for line in lines
    {
        //3a. if it is a blank line, store current info and create new elf
        if line == ""
        {
            elfsArr.append(currentElf)
            currentElf = []
        }
        //3b. if it is a normal line, store that for the current elf
        else
        {
            let lineAsAnInt = Int(line)
            currentElf.append(lineAsAnInt!)
        }
    }
    print(elfsArr)
    
    //4. for each elf, get a total value
    var totals : [Int] = []
    for elf in elfsArr
    {
        var sum = 0
        for item in elf
        {
            sum = sum + item
        }
        totals.append(sum)
    }
    print(totals)
    
    //part 1, just get the biggest one (using max())
    print("part 1: \(totals.max()!)")
    
    //part 2, need the top 3
    //5. sort the list
    let sortedTotals = totals.sorted(by: >)
    print(sortedTotals)
    
    //6. grab the top three elements, and add them together
    let sum = sortedTotals[0] + sortedTotals[1] + sortedTotals[2]
    print("part 2: \(sum)")
    
    
    
    //this version uses higher-order functions
    //check out the JS version of this if its easier for you to read:
    //https://github.com/lfwells/aoc2022/blob/main/day1.js
    //1. a neat way to get the data into bags straight away
    let elfs = data.split(separator: "\n\n")
    print(elfs)
     
    //2. split each bag up by its lines, and convert each line to an int
    let elfbags = elfs.map { (elf) -> [Int] in
        return elf.split(separator: "\n").map { (line) -> Int in
            return Int(line)!
        }
    }
    print(elfbags)
    
    //3. turn each bag into a total
    let elfTotals = elfbags.map { (bag) -> Int in
        return bag.reduce(0, { (prev, curr) -> Int in
            return prev + curr
        })
    }
    print(elfTotals)
    
    //the rest of the code is basically the same as before
    let sortedElfBags = elfTotals.sorted(by: >)
    //except for the magic "slice" syntax
    let firstThree = sortedElfBags[0..<3]
    print(firstThree)
    //sum the top three
    let part2 = firstThree.reduce(0, +)
    print(part2)
    
    
    /*
     //illustration of how the reduce function might worik
     [5, 10, 8].reduce(0, { (prev, curr) in prev+curr })
            prev    curr    return (prev+curr)
     0 ->   0       5       5
     1 ->   5       10      15
     2 ->   15      8       23
     
     but turns out, we can just do (thanks leo!)
     .reduce(0, +)
     */
    
    
    //one liner version
    //(this may or may not hang if you uncomment it and run it)
    /*
    var onelinerPt2 = data.split(separator: "\n\n").map { (elf) in
        return elf.split(separator: "\n").map { (line) in
            return Int(line)!
        }.reduce(0, +)
    }.sorted(by: >)[0..<3].reduce(0, +)
    print(onelinerPt2)
     */
}
