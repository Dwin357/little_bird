$(document).ready(function() {
    var isValid = false;
    var valid_password = function() {
        var password_field         = $('#user_password').val();
        var password_field_confirm = $('#user_password_confirm').val();
        if (password_field == password_field_confirm && password_field != null)
            {
                return true;
            };
    };
    var errorFeedback = function() {
        if (valid_password()) {
                $('#password-feedback').html('password valid');
                $('#password-feedback').removeClass('alert alert-danger');
                $('#password-feedback').addClass('alert alert-success');
                isValid = true;
                         } else {
                $('#password-feedback').html('passwords different');
                $('#password-feedback').removeClass('alert alert-success');
                $('#password-feedback').addClass('alert alert-danger');
                isValid = false;
         };
    };
    $('#user_password_confirm').on('keyup', function(){
        errorFeedback();
        $(this).find('submit')
    });
    $('#new_user').on('click', function(event) {
        if (!isValid) {
            event.preventDefault();
        }
    });
});