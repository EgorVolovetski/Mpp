class Cake
   
    def print_cake(array) 
        puts ("cake is :")      
        #puts array.map { |x| x.join(' ') }
        for i in (0...array.size)
            for j in (0...array[i].length)
             print array[i][j]
            end
            print "\n"
           end
        puts ("\n\n\n")
    end 

    def cutter (array)
        arr1 = [[]]
        for i in (0...array.size)
                arr1[i] = array[i]
                if array[i].include? "o"
                    break
                end
        end

        for i in (0...arr1.size)
            array = array[1..-1]
        end
        puts ("1st slice: ")
        for i in (0...arr1.size)
            for j in (0...arr1[i].length)
             print arr1[i][j]
            end
            print "\n"
           end
           print "\n\n\n"
           puts ("2nd slice: ")
           for i in (0...array.size)
            for j in (0...array[i].length)
             print array[i][j]
            end
            print "\n"
           end

    end

end

cake = [[".",".",".",".",".",".","."],
        [".",".","o",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".","o","."]]

cakee = Cake.new
cakee.print_cake(cake)
cakee.cutter(cake)