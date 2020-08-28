require_relative 'request'

api_key = 'JIhY3E31fwkE7JgDaQOK6qpo2oPgfwZunDXL0O4N'

if File.exist?('./weather.data')
    data_weather = File.open('./weather.data').read
else 
    `touch weather.data`
    data_weather = File.open('./weather.data').read 
end

def get_mars_weather(key)
    weather = get_data("https://api.nasa.gov/insight_weather/?api_key=#{key}&feedtype=json&ver=1.0")

    return weather
end 

def show_weather(api_key)

    data = get_mars_weather(api_key)

    data.each do |day, info|

        if day.to_i > 0

            weather += "Fecha: #{info["First_UTC"]}" 
            weather += "Estacion: #{info["Season"]}" 

            info['AT'].each do |key, value|
                min_temp = (value - 32) * 5/9 if key == 'mn'
                max_temp = (value - 32) * 5/9 if key == 'mx'


                weather += "Temp min (C°): #{value}" if key == 'mn'
                weather += "Temp max (C°): #{value}" if key == 'mx'
            end
            

            info['HWS'].each do |key, value|
                weather += "Presion Atmosferica #{value.round(1)} Pa" if key == 'av'


            end    

            

        end
    end        
        
    return weather
end

data_weather += show_weather(api_key)

File.write('./weather.data', data_weather)



        



       