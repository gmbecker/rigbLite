setMethod("show", representation(object="igbSession"),
          function(object)
          {
            con = if(is.null(object$connection))
              "NULL"
            else
              "An open socket connection"
           msg = paste( "IGB Session",
             paste("port:", object$port),
             paste("host:", object$host),
             paste("connection:", con),
             "\n",
             sep="\n")
           cat(msg)
          })

setMethod("show", representation(object = "igbTrackList"),
          function(object)
          {
            msg = paste("IGB Track List",
              paste("genome:", genome(object)),
              paste("(data): a list containing", length(object), "igbTrack objects.\n"), sep="\n")
            cat(msg)
          })

setMethod("show", representation(object = "igbTrack"),
          function(object)
          {
            msg = paste("IGB Track",
              paste("genome:", genome(object)),
              paste("uri:", uri(object)),
              paste("loadmode:", loadmode(object)),
              paste("refresh:", refresh(object)),
              "\n", sep="\n")
            cat(msg)
          })
