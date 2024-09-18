local Module = ModuleBase:createModule('recvCustom')

function Module:onLoad()
	self:logInfo('load')
	self:regCallback('ProtocolOnRecv', Func.bind(self.OnRecv, self), 'CUSTOMXB');
end

function Module:OnRecv(fd, head, data)
  if data[1] then
		local charIndex = Protocol.GetCharByFd(fd)
		if data[1] == "1" then
			self:sortButton(charIndex)
		end
	end
	-- 服务器不处理自定义封包
	return 0
end

function Module:sortButton(charIndex)
	NLG.SortItem(charIndex)
end

function Module:onUnload()
  self:logInfo('unload');
end

return Module;