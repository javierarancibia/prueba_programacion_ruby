require_relative 'request'
api_key = 'Iyn1tIbreAs3FPbON5buVV67lOHRIMgfgIxBdI3u'


def head()
    head =   '<!DOCTYPE html>
             <html lang="en">
             <head>
                 <meta charset="UTF-8">
                 <meta name="viewport" content="width=device-width, initial-scale=1.0">
                 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
                 <title>Informacin Rover en Marte</title>
             </head>
             <body>
                   <h1 class="text-center">Rover en Marte</h1>'
                 
     return head
 
 end

 


def request(key)
    rover = get_data("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=#{api_key}")

    return rover
end 

def build_web_page(api_key)

    data = request(api_key)

    cards = '<div class="row container-fluid mx-auto">'


    data.each do |photos, info|
        info.each do |cat|
                cat["img_src"]

                cards += "

                <div class='card' style='width: 18rem;'>
                    <img src='#{img_src}'img']}' class='card-img-top' alt='#{digimon['name']}'>
                    <div class='card-body'>
                    <h5 class='card-title'>'#{"full_name"}'</h5>
                    <p class='card-text'>'#{"name"]}'</p>
                    </div>
                </div>
                
                "
            end
            cards += '</div>'

            return cards


        end
    end

            

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



index = head + build_web_page(api_key) + foot

File.write('./index.html', index)



        



       