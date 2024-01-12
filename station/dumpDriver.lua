local thisSetting = {}

local function getSettings()
	local computerLabel = os.getComputerLabel()
	local modem = peripheral.find("modem")
	
	local msg = {
		action = "setting"
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
		
local function run()
	print("Starting driveDumper")
	getSettings()
	
	local modem = peripheral.find("modem")
	modem.open(thisSetting.channelNum)
	print("Started")
	print("")
	local event, side, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
	
	if message == "dump" then
		print("Dumping...")
		redstone.setOutput(thisSetting.conduitSide, true)
		sleep(5)
		redstone.setOutput(thisSetting.conduitSide, false)
		print("Dumped!")
	end
end

run()
