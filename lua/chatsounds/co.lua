--setfenv(1,_G)
local meta={}
local co=setmetatable({},meta)
_G.chatsounds_co = co

local costack=setmetatable({},{__index={
	push=function(tbl,val)
		table.insert(tbl,val)
	end,
	pop=function(tbl)
		return table.remove(tbl)
	end,
	current=function(tbl)
		return tbl[#tbl]
	end,
	
}})

local waitticks = {}

co._re=function(thread,...)
	
	local status = coroutine.status(thread)
	if status=="running" then
		--Msg"[CO] Running??? "print(thread)
		
	elseif status=="dead" then
		local rettype = ...
		--Msg"[CO] Dead resume?? "print(thread,rettype)
		return
	elseif status=="suspended" then
	
	else
		error"Unknown coroutine status!?"
	end
	
	costack:push(thread)
	local ok,t,val = coroutine.resume(thread,...)
	costack:pop(thread)
	
	if not ok then
		ErrorNoHalt("Coroutine: "..tostring(t)..'\n')
	end
	
	if t=="sleep" then
		--Msg"[CO] Sleep "print(val)
		timer.Simple(val,function()
			co._re(thread,"wait")
		end)
	elseif t=="waittick" then
		table.insert(waitticks,thread)
	elseif t=="cb" then
		--Msg"[CO] wait for callback "print(val)
		return
	elseif t=="cbone" then
		--Msg"[CO] Yielded for any one callback "print(".")
		return
	elseif t=="END" then
		--Msg"[CO] END "print("OK")
	else
		ErrorNoHalt("[CO] Unhandled "..tostring(t)..'\n')
	end
end


hook.Add("Tick","cs_colib",function()
	local count=#waitticks
	for i=count,1,-1 do
		local thread = table.remove(waitticks,i)
		co._re(thread,"waittick")
	end
end)

function meta:__call(func,...)
	
	assert(isfunction(func),"invalid parameter supplied")
	
	local thread = coroutine.create(function(...)
		func(...)
		return "END"
	end)
	co._re(thread,...)
	
	return thread
end

function co.make(...)
	if coroutine.running() then return end
	local func = debug.getinfo(2).func
	co(func,...)
	return true
end

function co.wait(delay)
	
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	local ret = coroutine.yield("sleep",tonumber(delay) or 0)
	--Msg"[CO] End wait "print(ret)
end

function co.waittick()
	
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	coroutine.yield("waittick")
	--Msg"[CO] End wait "print(ret)
end

co.sleep=co.wait

function co.newcb()
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	local thread = costack:current()
	
	if not thread then error"wot" end
	
	--Msg"[CO] Created cb for thread "print(thread)
	local CB CB = function(...)
		--Msg("[CO] Callback called for thread ",thread)print("OK")
		co._re(thread,"cbret",CB,...)
	end
	return CB
end

function co.waitcb(cbobj)
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	local function wrap(cbret,CB,...)
		--Msg"[CO] WaitCB " print(cbret=="cbret" and "OKRET" or ("WOT"..tostring(cbret)),(not cbobj or CB==cbobj) and "right cb" or "wtf cb?!?!?")
		--Msg"[CO] WaitCB Params " print(...)
		return ...
	end
	return wrap(coroutine.yield("cb",cbobj))
end
function co.waitone()
	
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	local function wrap(cbret,CB,...)
		--Msg"[CO] WaitOne Resume " print(cbret=="cbret" and "OKRET" or ("WOTRET "..tostring(cbret)),CB)
		----Msg"[CO] WaitOne Resume Params " print(...)
		return CB,...
	end
	return wrap(coroutine.yield("cbone"))
end

-- TESTING --

function co.fetch(url)
	
	
	if not coroutine.running() then
		error"youre not even in a coroutine"
	end
	
	local ok,err = co.newcb(),co.newcb()
	http.Fetch(url,ok,err)
	
	local cb,a,b,c,d=co.waitone()
	if cb==ok then
		return true,a,b,c,d
	elseif cb==err then
		return false,a,b,c,d
	end
	error"WTF"
end

co.PlayURL=function(url,params)
	local cb=co.newcb()
	sound.PlayURL(url,params or '',cb)
	return co.waitcb(cb)
end

co.PlayFile=function(url,params)
	local cb=co.newcb()
	sound.PlayFile(url,params or '',cb)
	return co.waitcb(cb)
end
