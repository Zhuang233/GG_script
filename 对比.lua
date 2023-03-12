local readFile = function (pathname)
	local Jinn = {}
	for i=1,math.huge do
		Jinn[i] = pathname:read('*l')
		if Jinn[i] == nil then
			return Jinn
		end
	end
end

local File = gg.prompt({'文件1路径','文件2路径','文件3路径'},{gg.getFile(),gg.getFile(),gg.getFile()},{'file','file','file'})
if File then
	    local C1 = io.open(File[1],'r')
	    local C2 = io.open(File[2],'r')
        local C3 = io.open(File[3],'r')
	if C1 == nil or C2 == nil or C3 == nil then
		local C1 = io.open(File[1],'w')
		local C2 = io.open(File[2],'w')
        local C3 = io.open(File[2],'w')
	end
	    local C1 = io.open(File[1],'r'):read('*a')
		local C2 = io.open(File[2],'r'):read('*a')
        local C3 = io.open(File[3],'r'):read('*a')
		local File1 = readFile(io.open(File[1],'r'))
		local File2 = readFile(io.open(File[2],'r'))
        local File3 = readFile(io.open(File[3],'r'))
	io.open('对比之后.txt','w')
	for i=1,math.huge do
		if File1[i] == nil and File2[i] == nil and File3[i] == nil then
            gg.alert('对比完成  文件在同目录  "对比之后.txt"','懂了')
			print('注意  0 已被过滤......\n 对比的文件在同目录下  "对比之后.txt"\n ')
			os.exit()
        elseif File1[i] == File2[i] and File1[i] == File3[i] and File1[i] ~= nil and File1[i] ~= '0.0' then
			io.open('对比之后.txt','a+'):write(File1[i]..'\n')
		else
            io.open('对比之后.txt','a+'):write('\n')
		end
	end
end