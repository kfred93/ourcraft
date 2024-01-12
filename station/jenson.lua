local thisSetting = {}

local function getSettings()
	local computerLabel = os.getComputerLabel()
	local modem = peripheral.find("modem")
	
	local msg = {
		action = "setting",
		compLabel = computerLabel
	}
	
	local timerId = os.startTimer(10)
	modem.open(os.getComputerID())
	modem.transmit(2001, os.getComputerID(), msg)
	
	local event, param1, senderChannel, replyChannel, message, senderDistance = os.pullEvent()
	
	if event == "modem_message" then
		thisSetting = message
		modem.close()
	elseif event == "timer" then
		if param1 == timerId then
			modem.close()
			term.clear()
			print("Error. Could not reach hub server.")
		end
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
