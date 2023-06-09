$(document).ready(function() {
    // GET CSRF token from cookies
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.startsWith(name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    // define csrftoken
    var csrftoken = getCookie('csrftoken');
    
    // setup RequestHeder
    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            if (!settings.crossDomain && !this.crossDomain) {
                xhr.setRequestHeader('X-CSRFToken', csrftoken);
            }
        }
    });

    // setup ajax error handler with delete function 
    $('.delete-event-btn').click(function() {
        var eventId = $(this).data('event-id');
        var confirmation = confirm('Êtes-vous sûr de vouloir supprimer cet événement ?');
        
        if (confirmation) {
            $.ajax({
                url: '/delete/event/' + eventId + '/',
                method: 'POST',
                success: function(response) {
                    alert(response.message);
                    window.location.href = '/';  // Redirect to homepage
                },
                error: function() {
                    alert('Une erreur s\'est produite lors de la suppression de l\'événement.');
                }
            });
            
        }
    });

    $('#inscription-button').click(function() {
        var eventId = $(this).data('event-id');
        
        $.ajax({
          url: '/add/event/user/' + eventId + '/',
          type: 'POST',
          dataType: 'json',
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
          },
          success: function(response) {
            if (response.error) {
              // Afficher le message d'erreur dans une alerte
              alert(response.message);
            } else {
              // Rediriger vers la page de détail de l'événement
              alert(response.message);
              window.location.href = '/event/' + eventId;
            }
          },
          error: function(xhr, textStatus, errorThrown) {
            alert('Erreur lors de l\'inscription. Vous êtes déjà inscrit.e.');
          }
        });
    });
   
    
    $('#desinscription-button').click(function() {
        var eventId = $(this).data('event-id');
        
        $.ajax({
            url: '/remove/event/user/' + eventId + '/',
            type: 'POST',
            dataType: 'json',
            headers: {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            },
            success: function(response) {
                if (response.error) {
                // Afficher le message d'erreur dans une alerte
                alert(response.message);
                } else {
                // Rediriger vers la page de détail de l'événement
                alert(response.message);
                window.location.href = '/event/' + eventId;
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                alert('Erreur lors de la désinscription.');
            }
        });
    });      

});