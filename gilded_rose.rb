def update_quality(items)
  @names_method = { 'Aged Brie' => 'rule_aged',
                    'Backstage passes to a TAFKAL80ETC concert' => 'rule_bakstage',
                    'Sulfuras, Hand of Ragnaros' => 'rule_sulfuras',
                    'NORMAL ITEM' => 'rule_normal_item',
                    'Conjured Mana Cake' => 'rule_conjured' }

  items.each do |item|
    choose_quality(item)
  end
end

def choose_quality(item)
  if item.quality == 50
    item.sell_in -= 1
  elsif item.quality == 0
    item.sell_in -= 1
  else
    @names_method.each do |name, method|
      if item.name == name
        send(method, item)
        # http://stackoverflow.com/questions/13795627/ruby-send-method-passing-multiple-parameters
      end
    end
  end
end

def rule_normal_item(item)
  if item.sell_in > 0
    item.quality -= 1
  else
    item.quality -= 2
  end
  item.sell_in -= 1
end

def rule_sulfuras(_item)
end

def rule_aged(item)
  if item.sell_in > 0
    item.quality += 1 unless item.quality >= 50
  else
    if item.quality >= 48
      item.quality = 50
    else
      item.quality += 2 unless item.quality >= 48
    end
  end
  item.sell_in -= 1
end

def rule_bakstage(item)
  if item.sell_in >= 11
    item.quality += 1
  elsif item.sell_in >= 6 && item.sell_in <= 10
    item.quality += 2
  elsif item.sell_in > 0 && item.sell_in <= 5
    item.quality += 3
  elsif item.sell_in <= 0
    item.quality = 0
  end
  item.sell_in -= 1
end

def rule_conjured(item)
  if item.sell_in > 0
    item.quality -= 2
  elsif item.sell_in <= 0
    item.quality -= 4
  end
  item.sell_in -= 1
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