munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
  case v["age"]
  when 0...18
    v["age_group"] = "kid"
  when 18...65
    v["age_group"] = "adult"
  else
    v["age_group"] = "senior"
  end
end

p munsters