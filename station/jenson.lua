local function getSettings()
	local computerLabel = os.getComputerLabel()
	local thisSetting = {
		tarPort = 0, 
		thisPort = 0, 
		user = "null"
	}

	if computerLabel == "station_1" then
		thisSetting.user = "Ramathor"
		thisSetting.myPort = 13100
		thisSetting.tarPort = 13101
	elseif computerLabel == "station_2" then
		thisSetting.user = "thecynicalson"
		thisSetting.myPort = 23100
		thisSettingtarPort = 23101
	elseif computerLabel == "station_3" then
		thisSetting.user = "flamingsnowman"
		thisSetting.myPort = 33100
		thisSetting.tarPort = 33101
	elseif computerLabel == "station_4" then
		thisSetting.user = "Alchemy_69"
		thisSetting.myPort = 43100
		thisSetting.tarPort = 43101
	elseif computerLabel == "station_5" then
		thisSetting.user = "Rawwberrt"
		thisSetting.myPort = 53100
		thisSetting.tarPort = 53101
	end
	
	return thisSetting
end
		
		
local function intro()
  print("OURCRAFT SOFTWARE SYSTEMS... INITIATING")
  print(".")
  sleep(1)
  print("..")
  sleep(2)
  print("...")
  sleep(1)
  print("")
  print("Hello, I am Jenson - your personal assistant.")
end


local function prompt()
    print("")
    print("")
    print("How can I assist you? Enter from the following commands:")
    print("")
    print("dump - dump the contents of your private ME network back into the ourcraft ME network.")
    print("exit - exit back to the main terminal")
    print("help - get this list of commands?")
    print("restart - restarts the program and increases efficiency by 22.8% each time.")
    print("")
    print("Make a selection...")
end


local function runIntro()
	intro()
	prompt()
end

local function run()
	local thisSetting = getSettings()

	runIntro()
	userInput = nil
	local modem = peripheral.find("modem")

	while true do
		userInput = read()
		
		if userInput == "dump" then
			print("Dumping!")
			modem.transmit(thisSetting.tarPort, thisSetting.myPort, "dump")
			sleep(5)
			primt("Dumped!")
		elseif userInput == "exit" then
			print("Goodbye, " .. thisSetting.user)
			break
		elseif userInput == "help" then
			prompt()
		elseif userInput == "resart" then
			print("Restarting.")
			sleep(1)
			print("Restarting..")
			sleep(2)
			print("Restarting...")
			sleep(1)
			print("Restarting....")
			sleep(4)
			print("Restarting.....")
			sleep(1)
			print("Restarting......")
			sleep(3)
			print("Restarting.......")
			sleep(2)
			print("lol.")
			sleep(2)
			term.clear()
			runIntro()
		else
			print("type 'help' to receive the list of commands'")
		end
	end
end
			
end
