minetest.register_privilege("unisay", "Allows say as any player and as a server")
minetest.register_chatcommand("ssay", {
  description = "Say message as a server",
  params = "<message>",
  privs = {unisay=true},
  func = function(name, param)
    minetest.chat_send_all(minetest.colorize("#F00","server")..": "..param)
  end,
})

minetest.register_chatcommand("usay", {
  description = "Say message as any player",
  params = "<name> <message>",
  privs = {unisay=true},
  func = function(name, param)
   local nick, message = param:match("^(%S+)%s(.+)$")
	if not nick then
		return false, minetest.colorize("#F00","Invalid usage, see /help usay")
	end
   minetest.chat_send_all(nick..": "..message)
  end,
})

minetest.register_chatcommand("rawsay", {
  description = "Say raw text in the chat",
  params = "<text>",
  privs = {unisay=true},
  func = function(name, param)
    minetest.chat_send_all(param)
  end,
})
