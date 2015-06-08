Asteroid = require 'asteroid'

# TODO:   need to grab these values from process.env[]

_msgsubtopic = 'messages'
_msgsublimit = 10   # this is not actually used right now
_messageCollection = 'messages'

# driver specific to nullchat hubot integration
# plugs into generic meteorchatbotadapter

class NullchatDriver
  constructor: (url, @logger) ->
    @asteroid = new Asteroid(url)

  joinRoom: (userid, uname, roomid) =>
    @logger.info "joined room"
    @asteroid.call 'joinRoom', roomid  

  sendMessage: (text, roomid) =>
    @logger.info "send message " 
    @asteroid.call 'message', message:text, roomId:roomid

  login: (username, password) =>
    @logger.info "login"
    # promise returned
    return @asteroid.loginWithPassword username, password

  prepMeteorSubscriptions: (data) =>
    # use data to cater for param differences - until we learn more
    #    data.uid
    #    data.roomid
    # return promise
    @logger.info "prepare meteor subscriptions"
    msgsub = @asteroid.subscribe _msgsubtopic, data.roomid, _msgsublimit
    return msgsub.ready

  setupReactiveMessageList: (receiveMessageCallback) =>
    @logger.info "setup reactive message list"
    @messages = @asteroid.getCollection _messageCollection  
    rQ = @messages.reactiveQuery {}
    rQ.on "change", (id) =>
      # awkward syntax due to asteroid limitations
      # - it ain't no minimongo cursor
      @logger.info "change received"
      changedMsgQuery = @messages.reactiveQuery {"_id": id}
      if changedMsgQuery.result
        changedMsg = changedMsgQuery.result[0]
        if changedMsg and changedMsg.message
          # TODO: need a server-side helper to lookup username by id
          receiveMessageCallback({_id: changedMsg._id, rid: changedMsg.roomId, u: {username: 'hey', _id: changedMsg.authorId}, msg: changedMsg.message})

module.exports = NullchatDriver

