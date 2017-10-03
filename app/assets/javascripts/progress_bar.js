function progress_handling(e){
    if(e.lengthComputable){
        var prog = Math.round(e.loaded / e.total * 100);
        $('.progress-bar').css('width',prog.toString()+'%');
        $('#file_progress').html(prog.toString()+'%');
    }
}

function init_upload() {
    $('#new_document').on('submit', function (e) {
        e.preventDefault();
        formData = jQuery(this);
        var fileInput = document.getElementById('document_file');
        var file = fileInput.files[0];
        data = new FormData();
        data.append('authenticity_token', $('#authenticity_token').val())
        data.append('document[file]',file);
        $.ajax({
            url: formData.attr('action'),
            type: formData.attr('method'),
            processData: false,
            contentType: false,
            xhr: function() {
                $('#file_progress_bar').show();
                $('#file_progress_bar').removeClass('hidden');
                var myXhr = $.ajaxSettings.xhr();
                if(myXhr.upload){
                    myXhr.upload.addEventListener('progress',progress_handling, false);
                }
                return myXhr;
            },
            data: data
        });
    });
}

$(document).ready(function () {
    init_upload();
});