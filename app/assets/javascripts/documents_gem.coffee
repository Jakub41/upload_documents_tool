$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
           <div class="modal" id="confirmationDialog">
             <div class="modal-dialog">
               <div class="modal-content">
                 <div class="modal-header">
                   <a class="close" data-dismiss="modal">×</a>
                   <h1>#{message}</h1>
                 </div>
                 <div class="modal-body">
                  <p>You are about to delete. Do you want to proceed?</p>
                </div>
                 <div class="modal-footer">
                   <a data-dismiss="modal" class="btn">No</a>
                   <a data-dismiss="modal" class="btn btn-danger confirm">Yes</a>
                 </div>
               </div>
             </div>
           </div>
           """
    $(html).modal()
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)