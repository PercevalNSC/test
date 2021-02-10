require 'matrix'

class Simplex
    def initialize
        @ary = Matrix[[1, -1, 1, 0],
                [1, 1, 0, -1]]
        @b = Vector[1, 1]
        @c = Vector[2, 1, 1, 0]
        @basis = [1, 3]
        @nonbasis = [2, 4]
    end
    def solve
        z0 = z0()
        zx = zx()
        xb0 = xb0()
        xbx = xbx()
        pivot = [@basis[0] , @nonbasis[0]]
        p pivot
        zx.each_with_index do |e, row, col|
            if e > 0 && pivot[1] < col+1 then
                pivot[1] = col+1
            end
            puts col
        end
        zx.each_with_index do |e, row, col|
            if e > 0 && pivot[1] < col+1 then
                pivot[1] = col+1
            end
            puts col
        end
        p pivot
    end
    def print
        p @ary
        p @b
        p @c
        p z0()
        p zx()
        p xb0()
        p xbx()
    end
    def ab
        return Matrix.columns([@ary.column(@basis[0]-1), @ary.column(@basis[1]-1)])
    end
    def an
        return Matrix.columns([@ary.column(@nonbasis[0]-1), @ary.column(@nonbasis[1]-1)])
    end
    def cb
        return Vector[@c[@basis[0]-1], @c[@basis[1]-1]]
    end
    def cn
        return Vector[@c[@nonbasis[0]-1], @c[@nonbasis[1]-1]]
    end
    def ab_inv
        return ab.inverse().map{|x| x.to_i}
    end
    def z0
        return cb().covector * ab_inv() * @b
    end
    def zx
        return cn().covector - cb().covector * ab_inv() * an()
    end
    def xb0
        return ab_inv() * @b
    end
    def xbx
        return ab_inv() * an()
    end
end

s = Simplex.new()
s.print()
s.solve()