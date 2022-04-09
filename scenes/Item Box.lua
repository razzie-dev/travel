-- loads csv loading library
local csv = require "libs/csv"

local Item_Box = {
	extends = "Control",
}

function Item_Box:_ready()

	-- sets isMatched variable for the two filters to false
	isMatched_1 = false
	isMatched_2 = false
	
	-- loads globalfunctions node to function variable
	-- we are using this to load our functions from gdscript!
	functions = self:get_node("/root/GlobalFunctions")
	
	-- loads file.csv (the file that contains location data) to f variable
	local f = csv.open("data/file.csv")
	
	-- uses a 'for' statement on each column
	for fields in f:lines() do
	  for i, data in ipairs(fields) do
	
			-- the 'i' represents each column
			-- the 'data' represents the contents of the cell
	
			--checks if the 3rd column is loaded
			if i == 3 then
			
				-- checks if 'data' is equal to filter_1 from globalfunctions node
				if tonumber(data) == functions.filter_1 then
					
					-- sets isMatched_1 to true
					isMatched_1 = true
				else
				
					-- sets isMatched_1 to false
					isMatched_1 = false
					
				end
			
			end
			
			--checks if the 4rd column is loaded
			if i == 4 then
			
				-- checks if 'data' is equal to filter_2 from globalfunctions node
				if tonumber(data) == functions.filter_2 then
				
					-- sets isMatched_2 to true
					isMatched_2 = true
					
				else
					
					-- sets isMatched_2 to false
					isMatched_2 = false
					
				end
				
			end
	
			--checks if the 1st column is loaded
			if i == 1 then
				
				-- sets 'data' to title variable
				title = data
			
			end
			
			--checks if the 2nd column is loaded
			if i == 2 then
				
				-- sets 'data' to location variable
				location = data
				
			end
			
		end
		
		-- checks if filter_1 is 0, 0 represents displaying all the results
		if functions.filter_1 == 0 then
		
			-- sets isMatched_1 to true
			isMatched_1 = true
		
		end
		
		-- checks if filter_2 is 0, 0 represents displaying all the results
		if functions.filter_2 == 0 then
		
			-- sets isMatched_2 to true
			isMatched_2 = true
		
		end
		
		-- checks if both isMatched variables are true
		if isMatched_1 == true and isMatched_2 then
		
			-- uses create_box from globalfunctions node to create a box from a template
			functions:create_box(title, location)
			
		end
		
	end	
	
end


return Item_Box
