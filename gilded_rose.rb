def update_quality(items)
  names=['Aged Brie','Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros', 'Normal Item', 'Conjured']

  items.each do |item|
    puts "/n"
    puts item.inspect
    
    max_quality(item)
  end
end

def max_quality(item_n)
  if item_n.quality == 80
    puts "Sulfuras"
  elsif item_n.quality >= 50 
    puts "ITEM QUALITY MAYOR DE 50"
    item.sell_in -=1
  elsif item_n.quality >=0
    puts "item qualiy menor de 50"
    
    if item_n.name == "NORMAL ITEM"
     
      rule_normal_item(item_n)
    elsif item_n.name == "Aged Brie"
 
      rule_aged(item_n)
    elsif item_n.name == "Backstage passes to a TAFKAL80ETC concert"

      rule_bakstage_passes(item_n)
    else item_n.name == "Conjured"
    
      rule_conjured(item_n)
    end
  else
    puts "item quality no puede ser menor de 0"  
  end
end

def rule_normal_item(item)

  if item.quality >=50 
    item.quality = 50 
  elsif item.quality == 0
  else
    if item.sell_in > 0
      item.quality -=1
    else
      item.quality -=2
    end
  end
  item.sell_in -=1
end

def rule_aged(item)

  if item.sell_in > 0
    item.quality +=1 unless item.quality >=50
  else
    if item.quality >=48
      item.quality =50
    else
      item.quality +=2 unless item.quality >=48
    end
  end
  item.sell_in -=1
end

def rule_bakstage_passes(item)
  puts "dentro de backstage"
  if item.sell_in >= 11
    "dentro de sell in 11 #{item.inspect}"
    item.quality +=1
    "despues de sell in 11 #{item.inspect}"
  elsif item.sell_in >= 6 && item.sell_in <= 10
    item.quality +=2
  elsif item.sell_in > 0 && item.sell_in <= 5
    item.quality += 3
  else item.sell_in <= 0
    item.quality = 0
  end
  item.sell_in -=1
    puts item.inspect
  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end

def rule_conjured(item)
  puts "dentro de conjured"
  item.quality -= 2
    puts item.inspect
  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end


# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

