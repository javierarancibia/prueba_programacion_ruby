require_relative 'request'
url ="https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="
api_key = 'Iyn1tIbreAs3FPbON5buVV67lOHRIMgfgIxBdI3u'


# link url con API_KEY https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=Iyn1tIbreAs3FPbON5buVV67lOHRIMgfgIxBdI3u



def head()
    head =   '<!DOCTYPE html>
             <html lang="en">
             <head>
                 <meta charset="UTF-8">
                 <meta name="viewport" content="width=device-width, initial-scale=1.0">
                 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
                 <title>Informacion Rover en Marte</title>
             </head>
             <body class="container">'
                 
     return head
 
 end



 def navbar()
            '<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand my-3" style="font-size: 2rem"; href="#">FOTOS ROVER NASA EN MARTE</a>
                <div class="navbar-nav">
                    <a class="nav-link ml-auto mt-3 ml-auto" style="font-size: 1rem"; href="#">PRUEBA DE PROGRAMACION CON RUBY</a>
                </div>
            </nav>'

 end

# Metodo Request solicitado con URL y Api_Key concatenadas
 def request(url, api_key)
    rover = get_data("#{url}#{api_key}")

    return rover
end 

def build_web_page(url, api_key)

    data = request(url, api_key)

    cards = '<div class="row container-fluid">'

    


    data.each do |key, value|
        value.each do |cat|
                

                        cards += "

                        <div class='card mx-auto mt-5' style='width: 18rem;'>
                                <img src='#{cat["img_src"]}' class='card-img-top' alt='Rover'>
                            <div class='card-body'>
                                <p class='card-text' style='font-size:1.5rem;'>Planeta: Marte</p>
                                <h5 class='card-title'>Id de la imagen #{cat["id"]}</h5>
                                <p class='card-text'>Fecha: #{cat["earth_date"]}</p>
                            </div>
                        </div>
                            
                        
                        "
            

        end
    end
                
        
        
        return cards
        return rover
        
end
    



def foot()
    
    foot =     '<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
                </body>
            </html>'
    return foot
end



index = head + navbar + build_web_page(url, api_key) + foot

File.write('./index.html', index)



        



       