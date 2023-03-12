-- Version: 1.0.0
-- https://gameguardian.net/forum/files/file/30-pointer-scan/

gg.require('8.31.2')

local d = {'', '512'}

while true do
	d = gg.prompt({'Address of value in hex. E.g. BAADBEEF', 'Maximal possible offset. E.g. "100" or "100h" for hex'}, d, {'number', 'number'})
	if d == nil then
		break
	end
	
	local address = tonumber(d[1], 16)
	if address == nil then
		gg.alert('Address must be hex number')
		goto continue_1
	end
	local offset, hex = string.gsub(d[2], 'h', '')
	if hex == 0 then
		offset = tonumber(offset)
	else
		offset = tonumber(offset, 16)
	end
	if offset == nil then
		gg.alert('Offset must be decimal or hex number')
		goto continue_1
	end
	
	local search = (address - offset)..'~'..address
	gg.searchNumber(search, gg.TYPE_DWORD)
	break;
	
	::continue_1::
end