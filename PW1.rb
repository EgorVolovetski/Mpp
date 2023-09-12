ARGV

loop do
    if ARGV[0] != "rock" && ARGV[0] != "paper" && ARGV[0] != "scissors"
        puts ("Wrong arguments. Try again")
        break
    elsif ARGV[1] != "rock" && ARGV[1] != "paper" && ARGV[1] != "scissors"
        puts ("Wrong arguments. Try again")
        break
    end

    if ARGV[0] == ARGV[1]
        puts ("Draw")
        break
    end
    
    
    if ARGV[0] == "rock" && ARGV[1] == "paper"
        puts ("U lose")
        break
    elsif ARGV[0] == "rock" && ARGV[1] == "scissors"
        puts ("U Win")
        break
    end
    
    if ARGV[0] == "paper" && ARGV[1] == "scissors"
        puts ("U lose")
        break
    elsif ARGV[0] == "paper" && ARGV[1] == "rock"
        puts ("U Win")
        break
    end
    
    if ARGV[0] == "scissors" && ARGV[1] == "rock"
        puts ("U lose")
        break
    elsif ARGV[0] == "scissors" && ARGV[1] == "paper"
        puts ("U Win")
        break
    end
end




