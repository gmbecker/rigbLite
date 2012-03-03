setClassUnion("sockOrNULL", list("sockconn", "NULL"))
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
    'setRegion' = function(x, chromosome="1")
    {
      ViewInIGB(region = x, chromosome = chromosome, con = .self$connection)
    },
    initialize = function(...)
    {
      args = list(...)
      port = args$port
      if(is.null(port))
        {
          port = 7085
          args$port = port
        }
      .port <<- port
      if(is.null(args$connection))
        {
          
          con <- tryCatch(socketConnection(host = "localhost", port = port, open = "wa"), error = function(e) stop("Unable to connect to IGB. Is it running on the the selected port?"))
          
        } else {
          con <- args$connection
        }
      .connection <<- con
      
    })
  )



setMethod("track<-", representation(object = "igbSession", value="igbTrack"), function(object, ..., value)
          {

            object$showTrack(value, ...)
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

if(FALSE)
  {
setClass("igbTrack", representation(genome = "character", region = "numeric", chromosome = "character", loadMode = "character", dataFile = "character"))

setMethod("genome<-", "igbTrack", function(object, ..., value)
          {
            object@genome = track
            object
          })

setMethod("genome", "igbTrack", function(object, ...)
          object@genome
          )

setGeneric("loadmode", function(object) standardGeneric("loadmode"))
setMethod("loadmode", "igbTrack", function(object) object@loadMode)

setGeneric("loadmode<-", function(object, ..., value) standardGeneric("loadmode<-"))
setMethod("loadmode<-", "igbTrack", function(object, ..., value) {
  object@loadMode = value
  object
})

setGeneric("chromosome", function(object) standardGeneric("chromosome"))
setMethod("chromosome", "igbTrack", function(object) object@chromosome)

setGeneric("chromosome<-", function(object, ..., value) standardGeneric("chromosome<-"))
setMethod("chromosome<-", "igbTrack", function(object, ..., value)
          {
            object@chromosome = value
            object
          })

setGeneric("region", function(object, ...) standardGeneric("region"))
setMethod("region", "igbTrack", function(object, ...) object@region)

setGeneric("region<-", function(object, ..., value) standardGeneric("region<-"))
setMethod("region<-", "igbTrack", function(object, ..., value)
          {
            object@region = value
            object
          })



}
ConnectToIGB = function(port = 7085)
  igbCon <<-socketConnection(host = "localhost", port = port, open ="wa")


showInIGB =   function( con,
                        genome = NULL,
                        goto,
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
  if(!missing(goto))
    script = c(script, paste("goto", goto))
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
           function(x, genome = NULL, dataFile = NULL, chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
           {
             if(!is.null(region))
               {
                 if (is.numeric(region))
                   region = paste(region, collapse = "-")
                 region = paste(chromosome, region, sep=":")
               }
             standardGeneric("ViewInIGB")
           })


setMethod("ViewInIGB", representation(x = "QuickloadGenome", dataFile = "character"),
          function(x, genome = NULL, dataFile = NULL,chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            showInIGB(genome = genome(x),
                      goto = region,
                      loadMode = loadMode,
                      dataFile = paste(uri(x), dataFile, sep="/"),
                      refresh = refresh,
                      con = con)
          })



setMethod("ViewInIGB", representation(x = "Quickload", genome = "character", dataFile = "character"),
          function(x, genome = NULL, dataFile = NULL, chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE,con = socketConnection("localhost", port = 7085, open ="wa"))
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
          function(x, genome = NULL, dataFile = NULL, chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            
            
            showInIGB(genome = genome,
                      goto = region,
                      loadMode = loadMode,
                      dataFile =  dataFile,
                      refresh = refresh,
                      con = con)
          })


setMethod("ViewInIGB", representation(x="igbTrack"),
          function(x, genome = NULL, dataFile = NULL, chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            goto = paste(chromosome(x), ":", paste(region(x), collapse="-"))
            showInIGB(genome = genome(x),
                      goto= goto,
                      loadMode = loadmode(x),
                      dataFile = uri(x),
                      refresh = refresh(x),
                      con = con)


          })

setMethod("ViewInIGB", representation(x="ANY"),
          function(x, genome = NULL, dataFile = NULL, chromosome = 1, region = NULL, loadMode = "REGION_IN_VIEW", refresh = TRUE, con = socketConnection("localhost", port = 7085, open ="wa"))
          {
            #if (!is.null(region))
            #  goto = paste(chromosome, ":", paste(region, collapse="-"), collapse = "")
           # else
           #   goto = NULL
            print(region)
            showInIGB(genome = genome,
                      goto= region,
                      loadMode = loadMode,
                      dataFile = dataFile,
                      refresh = refresh,
                      con = con)


          })
