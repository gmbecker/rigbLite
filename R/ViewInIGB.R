
igbTrackList = function(...)
  {
    els = list(...)
    new("igbTrackList", region = region(els[[1]]), genome = genome(els[[1]]),  els)
  }

igbTrack = function(genome, region, uri, loadmode="REGION_IN_VIEW", refresh=TRUE)
  new("igbTrack", genome=genome, region=region, loadmode=loadmode, refresh = refresh, uri=uri)

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
      if(is.null(args$connection))
        {
          tmpcon <- tryCatch(socketConnection(host = "localhost", port = port, open = "wa"), error = function(e) stop("Unable to connect to IGB. Is it running on the the selected port?"))          
        } else {
          tmpcon <- args$connection
        }
      .connection <<- tmpcon
      
    })
  )

setGeneric("track<-", function(object, ..., value) standardGeneric("track<-"))

setMethod("track<-", representation(object = "igbSession", value="igbTrack"), function(object, ..., value)
          {

            object$showTrack(value, ...)
            object
          })

setGeneric("trackList<-", function(object, ..., value) standardGeneric("trackList<-"))

setMethod("trackList<-", representation(object = "igbSession", value = "igbTrackList"), function(object, ... , value)
          {
            sapply(value@.Data, function(val)
                   object$showTrack(val, ...))
            object
          })

#I should decide whether region means just aa position, or aa position + chromosome. Not being consistent!
setMethod("region<-", representation(object = "igbSession"),
          function(object, ..., value)
          {
            object$setRegion(value, ...)
            object
          }
 )

showInIGB =   function( con,
                        genome = NULL,
                        goto = NULL,
                        dataFile = NULL, 
                        loadMode,
                        refresh = TRUE, 
                        select = NULL, 
                        sleep = NULL)
{
  if(is.null(con))
    stop("Must have a connection to IGB.")
  if(!isOpen(con))
    stop("Connection to IGB is not open.")
  
  script = NULL
  if(!is.null(genome))
    script = c(script, paste("genome", genome))
  if(!is.null(goto))
    {
      goto = paste(as.character(seqnames(goto)), ":", paste(start(goto), end(goto), sep="-"), sep="")
      script = c(script, paste("goto", goto))
    }
    if(!is.null(dataFile))
    {
      script = c(script, paste("load", dataFile))
      if(!missing(loadMode))
        script = c(script, paste("loadmode", loadMode, dataFile ))
    }
  if(refresh)
    script = c(script, "refresh")
  if(!is.null(select))
    script = c(script, paste("select", select))
  script = c(script, "\n\n")
  cat(paste(script, collapse = "\n\n"), file = con)
} 

setGeneric("ViewInIGB",
           function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
           {
             standardGeneric("ViewInIGB")
           })


setMethod("ViewInIGB", representation(x = "QuickloadGenome", dataFile = "character"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            showInIGB(genome = genome(x),
                      goto = region,
                      loadMode = loadMode,
                      dataFile = paste(uri(x), dataFile, sep="/"),
                      refresh = refresh,
                      con = con)
          })



setMethod("ViewInIGB", representation(x = "Quickload", genome = "character", dataFile = "character"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE,con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            
            if(is.null(genome))
              stop("No genome selected.")
            showInIGB(genome = genome,
                      goto = region,
                      loadMode = loadMode,
                      dataFile = paste(uri(x), genome, dataFile, sep="/"),
                      refresh = refresh,
                      con = con)
          })



setMethod("ViewInIGB", representation(x = "ANY", dataFile = "character"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            
            
            showInIGB(genome = genome,
                      goto = region,
                      loadMode = loadMode,
                      dataFile =  dataFile,
                      refresh = refresh,
                      con = con)
          })


setMethod("ViewInIGB", representation(x="igbTrack"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            showInIGB(genome = genome(x),
                      goto= region(x),
                      loadMode = loadmode(x),
                      dataFile = uri(x),
                      refresh = refresh(x),
                      con = con)


          })

setMethod("ViewInIGB", representation(x="ANY"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            showInIGB(genome = genome,
                      goto= region,
                      loadMode = loadMode,
                      dataFile = dataFile,
                      refresh = refresh,
                      con = con)
          })

setMethod("ViewInIGB", representation(x = "igbTrackList"),
          function(x, genome = NULL, dataFile = NULL, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            sapply(x@.Data, ViewInIGB, con = con)
          })
