require 'date'

class PersonalSquares
  COMMIT_COUNT = {
    "#" => 15,
    "*" => 7,
    "-" => 1,
  }

  def initialize(start_date)
    @date = start_date
    @canvas = generate_canvas
    draw_squares
  end

  def generate_canvas
    %w(
      ---#######----#######--**---###-----#####----**--#--
      ---#-**--##---#-----##--#-##---##---#---##-------#-*
      -*-#---*--#---#--*---#----#-----#---#-*---#---#--**#
      *--#--####--*-#--####---*-#-#####---#--*--#-----**-*
      #--#------#---#-----#--*--#-----#---#-----#------#-#
      -#-#-*---##---#--*--##----#--*--#---#---##---#-#-***
      ---#######----#---*--#---##-----##--#####------#**-#
      ).map { |l| l.split('') }.transpose.flatten
  end

  def commit(date)
    text = "Let's play personal squares!\n"
    File.open('personalize.txt', 'a') { |file| file << text }
    system("git add -A; git commit -m 'personal squares!' --date '#{date}'")
  end

  def draw_squares
    @canvas.each do |char|
      COMMIT_COUNT[char].times do
        commit(@date)
      end
      @date += 1
    end
  end

end

# PersonalSquares.new(Date.new(2014, 10, 12))
