require './character'

# Hero inherited from Character
class Hero < Character
  def initialize(name, health = 100, strength = 1)
    super(name, health, strength)
    @name = name
    @level = 1
    @cur_health = health
    @max_health = health
    @strength = strength
    @cur_exp = 0
    @max_exp = 100

    @hero_leveled = false
  end

  def win_battle(exp)
    # Reward EXP to player.  Increase EXP and level if enough EXP is gained
    # if level increases, increase max health by 30%, restore current health
    # and let the user know the hero leveled up

    @hero_leveled = false # default to false
    @cur_exp += exp
    while @cur_exp > @max_exp
      @level += 1
      @cur_exp -= @max_exp
      @max_exp *= 2
      @max_health = (@max_health * 1.3).round
      @cur_health = @max_health
      @hero_leveled = true # set to true if hero leveled this fight
    end
  end

  def leveled?
    return @hero_leveled
  end
end
