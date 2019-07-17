def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split(" ")[0]
    end
  end
end

def get_contestants(data)
  contestants = []
  data.each_key do |season|
    contestants << data[season]
  end
  return contestants.flatten()
end

def find_contestant(data)
  contestants = get_contestants(data)
  output = []
  contestants.each do |person|
    if person[yield[0]] == yield[1]
      output << person
    end
  end
  return output
end

def get_contestant_name(data, occupation)
  return find_contestant(data){["occupation",occupation]}[0]["name"]
end

def count_contestants_by_hometown(data, hometown)
  return find_contestant(data){["hometown",hometown]}.length
end

def get_occupation(data, hometown)
  return find_contestant(data){["hometown",hometown]}[0]["occupation"]
end

def get_average_age_for_season(data, season)
  total = 0.0
  data[season].each do |person|
    total += person["age"].to_i
  end
  return (total / data[season].length).round(0)
end
