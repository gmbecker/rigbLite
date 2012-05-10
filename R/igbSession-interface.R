
igbSession = function(host = "localhost", port = 7085, connection = NULL)
  {
    new("igbSession", host = host, port=port, connection=connection)
  }

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


setGeneric("region<-", function(object, value) standardGeneric("region<-"))
setMethod("region<-", representation(object = "igbSession"),
          function(object, value)
          {
            object$setRegion(value)
            object
          }
 )

setGeneric("snapshot", function(session, filename, ...) standardGeneric("snapshot"))
setMethod("snapshot", "igbSession", function(session, filename, view = "full", labels = TRUE)
          {
            if(!(view %in% c("full", "main", "sliced")))
              stop("view must be one of the following: 'full', 'main', 'sliced'")
            if(view == "full")
              {
                mylab = ""
                myview = ""
              } else {
                mylab = if(labels) "Labels" else ""
                myview = paste(view, "View", sep="")
              }
            cmd = paste("\n","snapshot", myview, mylab, " ", filename, "\n", sep="")
            cat(cmd, file=session$connection)
            
          })
