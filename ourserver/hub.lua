local channelNum = 2001
local computerLabel = os.getComputerLabel()

local function getSettings(compLabel)
	local thisSetting = {}
	
	if compLabel == "station_1" then
		thisSetting.user = "Ramathor"
		thisSetting.myPort = 13100
		thisSetting.tarPort = 13101
	elseif compLabel == "station_2" then
		thisSetting.user = "thecynicalson"
		thisSetting.myPort = 23100
		thisSetting.tarPort = 23101
	elseif compLabel == "station_3" then
		thisSetting.user = "flamingsnowman"
		thisSetting.myPort = 33100
		thisSetting.tarPort = 33101
	elseif compLabel == "station_4" then
		thisSetting.user = "Alchemy_69"
		thisSetting.myPort = 43100
		thisSetting.tarPort = 43101
	elseif compLabel == "station_5" then
		thisSetting.user = "Rawwberrt"
		thisSetting.myPort = 53100
		thisSetting.tarPort = 53101
	elseif compLabel == "station_6" then
		thisSetting.user = "Rawwberrt"
		thisSetting.myPort = 63100
		thisSetting.tarPort = 63101
	end
	
	if compLabel == "station_1_driveDumper" then
		thisSetting.channelNum = 13101
		thisSetting.conduitSide = "left"
	elseif compLabel == "station_2_driveDumper" then
		thisSetting.channelNum = 23101
		thisSetting.conduitSide = "left"
	elseif compLabel == "station_3_driveDumper" then
		thisSetting.channelNum = 33101
		thisSetting.conduitSide = "left"
	elseif compLabel == "station_4_driveDumper" then
		thisSetting.channelNum = 43101
		thisSetting.conduitSide = "left"
	elseif compLabel == "station_5_driveDumper" then
		thisSetting.channelNum = 53101
		thisSetting.conduitSide = "left"
	elseif compLabel == "station_6_driveDumper" then
		thisSetting.channelNum = 63101
		thisSetting.conduitSide = "left"
	end
	
	return thisSetting
end

local function run()
	print("Beginning server: " .. computerLabel)
	print("Establishing modem")
	local modem = peripheral.find("modem")
	
	print("Opening modem on channel number " .. channelNum)
	modem.open(channelNum)

	while true do
		local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
		
		if message.compLabel ~= nil then
			if message.action == "setting" then 
				print("Transmitting settings to " .. message.compLabel)
				modem.transmit(replyChannel, senderChannel, getSettings(message.compLabel))
			end
		end
	end
end

run()
