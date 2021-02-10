require 'matrix'

class MatrixCalculate
    def initialize(matrix)
        # 暗黙的に小数に直されるのでRationalで書く意味はない
        # 要素がRationalのときはmatrixPowerの計算量が増大するので非推奨
        @m = matrix
    end

    # 行列mのn乗を計算する
    # n <= 0のとき１を返す
    def matrixPower(n)
        puts "n is " + n.to_s
        result = @m.clone
        if n == 1 then
            return result
        elsif n > 1 then
            for i in 1 .. n-1
                result = result * result
            end
            return result
        else
            puts "enter n < 0 in matrixPower(n)"
            return 1
        end
    end
    # 固有値、固有ベクトルの出力
    def mEigen
        v, d, v_inv = @m.eigensystem
        dinf = d.clone.map{|x| if x >= 0.99 then 1.0 else 0 end}
        puts "-----"
        puts "V: " + v.to_s
        puts "D: " + d.to_s
        puts "V_inv: " + v_inv.to_s
        puts "D^inf: " + dinf.to_s
        puts "-----"
        puts "P (calculated): "  + (v * d * v_inv).to_s
        puts "P^inf (calculated): " + (v * dinf * v_inv).to_s
        puts "-----"
    end
end

mat1 = Matrix[[Rational(1, 2), Rational(1, 2), 0],
[Rational(1, 3), Rational(1, 3), Rational(1, 3)],
[Rational(1, 4), 0, Rational(3, 4)]]
mat2 = Matrix[[1/2.0, 1/2.0, 0.0],
            [1/3.0, 1/3.0, 1/3.0],
            [1/4.0, 0.0, 3/4.0]]
mat3 = Matrix[[1/2.0, 1/3.0, 1/6.0],
            [1/3.0, 1/3.0, 1/3.0],
            [1/4.0, 1/2.0, 1/4.0]]
mat4 = Matrix[[0, 1/2.0, 1/2.0],
            [0, 1, 0],
            [0, 0, 1]]

puts "mat1: Input Rational Matrix in report"
mc = MatrixCalculate.new(mat1)
puts "P^2: " + mc.matrixPower(2).to_s
mc.mEigen()
stat = Matrix[[Rational(4,11), Rational(3,11), Rational(4,11)]]
puts "stational: " + (stat*mat2).to_s
puts "-----"
puts "mat2: Input float Matrix in report"
mc2 = MatrixCalculate.new(mat2)
puts "P^2: " +  mc2.matrixPower(2).to_s
mc2.mEigen()
puts "mat3: Input example 1 in 12th class"
mc3 = MatrixCalculate.new(mat3)
mc3.mEigen()
puts "mat4: Input example 1 in 12th class"
mc4 = MatrixCalculate.new(mat4)
mc4.mEigen()
