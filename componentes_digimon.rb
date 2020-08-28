require_relative 'request'

def head()
   head =   '<!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
                <title>Digimon</title>
            </head>
            <body>
                  <h1 class="text-center">Digimon</h1>'
                
    return head

end


def content(api)

    data = get_data(api)

    if data.nil? 
        cards = '<h3 class="text-center">No hay Digimons</h3>'
    else

    cards = '<div class="row container-fluid mx-auto">'

    data.each do |digimon|
        cards += "

        <div class='card mx-auto' style='width: 18rem;'>
            <img src='#{digimon['img']}' class='card-img-top' alt='#{digimon['name']}'>
            <div class='card-body'>
            <h5 class='card-title'>'#{digimon['name']}'</h5>
            <p class='card-text'>'#{digimon['name']}'</p>
            </div>
        </div>
        
        "
    end
        cards += '</div>'

        return cards
    
    end   
end

def foot()
    
    foot =     '<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
                </body>
            </html>'
    return foot
end


url = "https://digimon-api.vercel.app/api/digimon"

index = head() +  content(url) + foot()

File.write('./index.html', index)



