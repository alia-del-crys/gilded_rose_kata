def update_quality(items)
  names=['Aged Brie','Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros', 'Normal Item', 'Conjured']

  items.each do |item|
    puts "/n"
    puts "dentro de items.each"
    puts item.inspect
    
    max_quality(item)
  end
end

def max_quality(item_n)
  puts "dentro de max quality"
  if item_n.quality == 80
    puts "apaño para sulfuras"
    puts item_n.inspect
  elsif item_n.quality >= 50 
    puts "ITEM QUALITY MAYOR DE 50"
    item.sell_in -=1
    puts item.inspect
  elsif item_n.quality >=0
    puts "item qualiy menor de 50"
    item.sell_in -=1
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
end

def rule_bakstage_passes(item)
  puts "dentro de backstage"
  if item.sell_in > 5 && item.sell_in < 11
    item.quality +=1
  elsif item.sell_in >= 0 && item.sell_in < 6
    item.quality += 2
  else item.sell_in < 0
    item.quality = 0
  end
    puts item.inspect
  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end

def rule_conjured(item)
  puts "dentro de conjured"
  item.quality -= 2
    puts item.inspect
  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end

def apply_rules(item)
  puts "he llegado a apply_rules"
  if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
    if item.quality > 0
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.quality -= 1
      end
    end
  else
    #if item.quality < 50
      item.quality += 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        if item.sell_in < 11
          #if item.quality < 50
            item.quality += 1
          #end
        end
        if item.sell_in < 6
          #if item.quality < 50
            item.quality += 1
          #end
        end
      end
    #end
  end
  if item.name != 'Sulfuras, Hand of Ragnaros'
    item.sell_in -= 1
  end
  if item.sell_in < 0
    if item.name != "Aged Brie"
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality -= 1
          end
        end
      else
        item.quality = item.quality - item.quality
      end
    else
      #if item.quality < 50
        item.quality += 1
      #end
    end
  end
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

