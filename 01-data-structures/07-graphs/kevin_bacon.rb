require_relative "Node"

$films = []
$actors = []
def find_kevin_bacon(node,start)
  $actors << start.name
  movie_titles = node.film_actor_hash.keys

  if node == start
    return $films
  end

  movie_titles.each do |movie|
    if start.film_actor_hash.keys.include?(movie)
      $films << movie
      result = find_kevin_bacon(node, node)
      return films_length if result
    end
  end

  start.film_actor_hash.each do |movie,actors|
    if $films.include?(movie) == false
      $films << movie
      actors.each do |actor|
        if $actors.include?(actor) == false
          result = find_kevin_bacon(node,actor)
          return films_length if result
        end
      end
    end
  end
end

def films_length
  if $films.length < 7
    return "This actor is #{$films.length} degrees away from Kevin Bacon. Here are the films:\n#{$films}"
  else
    return "This actor is more than 6 degrees away from Kevin Bacon!"
  end
end

lori_singer = Node.new("Lori Singer", {})
dianne_west = Node.new("Dianne West", {})
john_lithgow = Node.new("John Lithgow", {})
anthony_edwards = Node.new("Anthony Edwards", {})
bruce_abbott = Node.new("Bruce Abbott", {})
jake_gyllenhall = Node.new("Jake Gyllenhall", {})
robert_downey_jr = Node.new("Robert Downey Jr", {})
jeff_bridges = Node.new("Jeff Bridges", {})
gwyneth_paltrow = Node.new("Gwyneth Paltrow", {})
jeff_goldblum = Node.new("Jeff Goldblum", {})
olivia_munn = Node.new("Olivia Munn", {})
samuel_l_jackson = Node.new("Samuel L Jackson", {})
bob_peck = Node.new("Bob Peck", {})
john_travolta = Node.new("John Travolta", {})
olivia_newton_john = Node.new("Olivia Newton John", {})
ewan_mcgregor = Node.new("Ewan Mcgregor", {})
halle_berry = Node.new("Halle Berry", {})
hugh_jackman = Node.new("Hugh Jackman", {})
patrick_stewart = Node.new("Patrick Stewart", {})
ninja = Node.new("Ninja", {})
dev_patel = Node.new("Dev Patel", {})
nicole_kidman = Node.new("Nicole Kidman", {})
will_ferrell = Node.new("Will Ferrell", {})

kevin_bacon_hash = {"Footloose":[lori_singer,dianne_west,john_lithgow]}
kevin_bacon = Node.new("Kevin Bacon", kevin_bacon_hash)

lori_singer.film_actor_hash = {"Summer Heat":[anthony_edwards,bruce_abbott],"Footloose":[kevin_bacon,dianne_west,john_lithgow] }
dianne_west.film_actor_hash = {"Footloose":[kevin_bacon, lori_singer,john_lithgow],"Robots":[ewan_mcgregor, halle_berry]}
john_lithgow.film_actor_hash = {"Footloose":[kevin_bacon, lori_singer,dianne_west]}
anthony_edwards.film_actor_hash = {"Summer Heat":[lori_singer,bruce_abbott], "Zodiac":[jake_gyllenhall, robert_downey_jr]}
bruce_abbott.film_actor_hash = {"Summer Heat":[lori_singer,anthony_edwards]}
jake_gyllenhall.film_actor_hash = {"Zodiac":[anthony_edwards,robert_downey_jr]}
robert_downey_jr.film_actor_hash = {"Zodiac":[anthony_edwards, jake_gyllenhall],"Iron Man":[jeff_bridges,gwyneth_paltrow] }
jeff_bridges.film_actor_hash = {"Iron Man":[robert_downey_jr,gwyneth_paltrow]}
gwyneth_paltrow.film_actor_hash = {"Iron Man":[robert_downey_jr, jeff_bridges],"Mortdecai":[jeff_goldblum,olivia_munn]}
jeff_goldblum.film_actor_hash = {"Mortdecai":[gwyneth_paltrow,olivia_munn],"Jurassic Park":[samuel_l_jackson,bob_peck]}
olivia_munn.film_actor_hash = {"Mortdecai":[jeff_goldblum,gwyneth_paltrow]}
samuel_l_jackson.film_actor_hash = {"Jurassic Park":[jeff_goldblum,bob_peck], "Pulp Fiction":[john_travolta]}
bob_peck.film_actor_hash = {"Jurassic Park":[jeff_goldblum,samuel_l_jackson]}
john_travolta.film_actor_hash = {"Pulp Fiction":[samuel_l_jackson],"Grease":[olivia_newton_john]}
olivia_newton_john.film_actor_hash = {"Grease":[john_travolta]}
ewan_mcgregor.film_actor_hash = {"Robots":[dianne_west, halle_berry]}
halle_berry.film_actor_hash = {"Robots":[dianne_west, ewan_mcgregor],"X2":[hugh_jackman,patrick_stewart]}
hugh_jackman.film_actor_hash = {"X2":[halle_berry,patrick_stewart],"Chappie":[ninja, dev_patel]}
patrick_stewart.film_actor_hash = {"X2":[halle_berry,hugh_jackman]}
ninja.film_actor_hash = {"Chappie":[hugh_jackman, dev_patel]}
dev_patel.film_actor_hash = {"Chappie":[hugh_jackman, ninja],"Lion":[nicole_kidman]}
nicole_kidman.film_actor_hash = {"Lion":[dev_patel],"Bewitched":[will_ferrell]}
will_ferrell.film_actor_hash = {"Bewitched":[nicole_kidman]}


# puts find_kevin_bacon(kevin_bacon,lori_singer) #3 degrees from bacon
# puts find_kevin_bacon(kevin_bacon,olivia_newton_john) #more than 6
# puts find_kevin_bacon(kevin_bacon,will_ferrell) #6 degrees from bacon
puts find_kevin_bacon(kevin_bacon,bruce_abbott)
