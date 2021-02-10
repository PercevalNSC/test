class RandomSort
    def initialize(debug = 0)
        @initArray = generateRandomArray(10)
        @debug = debug
    end
    def min(array = @initArray)
        if @debug == 1 then puts "array:" + array.to_s end
        selectedNum = randomSelect(array)
        if @debug == 1 then puts "selected:" + selectedNum.to_s end
        if array.length == 1 then return selectedNum end
        array.delete(selectedNum)
        x = min(array)

        if selectedNum < x then 
            x = selectedNum
        end
        return x
    end
    #小さくなるまで試行するパターン
    def min2(array = @initArray)
        selectedNum = randomSelect(array)
        if @debug == 1 then puts "selected:" + selectedNum.to_s end
        if array.length == 1 then return selectedNum end

        reducedArray = deleteSelectNum(array, selectedNum)
        if @debug == 1 then puts "array:" + array.to_s + " reduced_array:" + reducedArray.to_s end
        x = min2(reducedArray)
        
        if selectedNum < x then 
            if @debug == 1 then puts "reselected" end
            x = min2(array)
        end
        return x
    end
    #ランダムにarrayの数字を選んで返す
    def randomSelect(array)
        i = rand(0..array.length-1)
        return array[i]
    end
    #numに一致するarrayの最初の要素を選んで消した配列を返す
    def deleteSelectNum(array, num)
        temp = array.clone
        temp.delete_at(temp.index(num))
        return temp
    end

    #length分の1..10の配列を作成
    def generateRandomArray(length)
        ary = Array.new()
        for i in 1 .. length
            ary.push(rand(1..10))
        end
        return ary
    end
        
end

rs = RandomSort.new(1)
puts "Minimum number is " + rs.min2().to_s