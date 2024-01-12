local website = http.get(url)

if website then
	func, err = loadstring(website.readAll())
	
	if not func then
		error(err)
	else
		setfenv(func, getfenc())
		func()
	end
end
