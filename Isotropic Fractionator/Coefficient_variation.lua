--[[ CV script for Isotropic Fractionator cell counting (Herculano-Houzel & Lent, 2005) ]] -- 

-- Just in case: http://www.tutorialspoint.com/execute_lua_online.php ; http://www.scilua.org/

-- Table to hold statistical functions
stats={}

-- Get the mean value of a table
function stats.mean( t )
  local sum = 0
  local count= 0

  for k,v in pairs(t) do
    if type(v) == 'number' then
      sum = sum + v
      count = count + 1
    end
  end

  return (sum / count)
end

-- Get the standard deviation of a table
function stats.standardDeviation( t )	
  local m
  local vm
  local sum = 0
  local count = 0
  local result

  m = stats.mean( t )

  for k,v in pairs(t) do
    if type(v) == 'number' then
      vm = v - m
      sum = sum + (vm * vm)
      count = count + 1
    end
  end

  result = math.sqrt(sum / (count-1))

  return result
end

print ("CV script for Isotropic Fractionator cell counting."); print ("Please insert your first value!")

v1 = io.read("*n")

print ("\n Please insert your second value!")

v2 = io.read("*n")

print ("\n Please insert your third value!")

v3 = io.read("*n")

print ("\n Please insert your fourth value!")

v4 = io.read("*n")

t = {v1, v2, v3, v4}

print ("\n Your mean is: ", stats.mean(t))

print (" \n Your SD is:", stats.standardDeviation(t))

print ("\n Your CV is:", stats.standardDeviation(t)/stats.mean(t)) 


