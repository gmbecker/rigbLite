
#manually programmed class(es)

setOldClass("sockconn")


igbSession = setRefClass("igbSession",
  fields = list(
    .port = "numeric",
    port = function(value){
      if(!missing(value))
        .port <<- value
      else
        .port
    },
    .host = "character",
    host = function(value){
      if(!missing(value))
        .host <<- value
      else
        .host
    },
    #.connection = "sockOrNULL",
    .connection = "sockconn",
    connection = function(value){
      if(!missing(value))
        .connection <<- value
      else
        .connection
    }),
  methods = list(
    'showTrack' = function(x, ...)
    {
      ViewInIGB(x, ..., con = .self$connection)
    },
    'setRegion' = function(x)
    {
      ViewInIGB(region = x, con = .self$connection)
    },
    initialize = function(...)
    {
      args = list(...)
      tmpport = args$port
      if(is.null(tmpport))
        tmpport = 7085
        
      .port <<- tmpport
      if(is.null(args$host))
        myhost = "localhost"
      else
        myhost = args$host
      .host <<- myhost
      if(is.null(args$connection))
        {
          tmpcon <- tryCatch(socketConnection(host = myhost, port = tmpport, open = "wa"), error = function(e) stop(sprintf("Unable to connect to IGB on host %s through port %d. Is it running at that location?", myhost, tmpport)))          
        } else {
          tmpcon <- args$connection
        }
      .connection <<- tmpcon
      
    })
  )

