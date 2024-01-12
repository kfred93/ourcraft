local thisSetting = {
	tarPort = 0, 
	thisPort = 0, 
	user = ""
}

local function getSettings()
	local computerLabel = os.getComputerLabel()

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
  print("Hello, " .. thisSetting.user .. ". I am Jenson - your personal assistant.")
  sleep(1)
end


local function prompt()
    print("")
    print("")
    print("How can I assist you? Enter from the following commands:")
    print("")
    print("dump - dump your ME into the Ourcraft ME.")
    print("exit - exit back to the main terminal")
    print("help - get this list of commands?")
    print("restart - restarts the program with 122.8% vigor!")
    print("")
    print("Make a selection...")
end


local function runIntro()
	intro()
	prompt()
end

local function run()
	getSettings()
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
		elseif userInput == "restart" then
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
			os.reboot()
		else
			print("type 'help' to receive the list of commands'")
		end
	end
end

run()
