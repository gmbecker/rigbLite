
igbTrackList = function(..., genome)
  {
    els = list(...)
    if(missing(genome))
      {

        if(length(els))
          genome = genome(els[[1]])
        else
          stop("Unable to determine genome of new igbTrackList to be created.")
      }  

    new("igbTrackList", genome = genome,  els)
  }

igbTrack = function(genome, uri, loadmode="REGION_IN_VIEW", refresh=TRUE)
  new("igbTrack", genome=genome, loadmode=loadmode, refresh = refresh, uri=uri)
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
