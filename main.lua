local  Extras = require("Extras")

function love.load()
    circulo = {x = 200, y = 200, tamanho = 30, velocidade = 30}

    perseguidor = 
    {
        x = 300, 
        y = 400, largura = 100, 
        altura = 100, tamanho = 10, 
        velocidade = 30, 
        color ={ 1,1,1}
    }

    math.randomseed(os.time())

    Extras = require("Extras")

    mensagem = ""

   tempo = 106
   pontos = 20

   tempo_mudado = 0
   tempo_Intervalo = 5
   
   
end

 

function love.draw()
    

    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill", circulo.x, circulo.y, circulo.tamanho)
    
    love.graphics.setColor(perseguidor.color)
    love.graphics.rectangle("fill",perseguidor.x, perseguidor.y, perseguidor.largura, perseguidor.altura,perseguidor.tamanho)
     
    love.graphics.setColor(1,1,1)
    love.graphics.print("Temmpo: "..string.format("%d",tempo), 100, 100)
    love.graphics.print("pontuação:"..string.format("%d",pontos), 150, 150)
    
    if tempo <= 0 and pontos <= 0 then
        love.graphics.print(""..string.format("%s",Extras.terminar()))
    end    
end

 
function love.update(dt)

    if tempo > 0 and pontos > 0 then
        tempo = tempo - dt
        tempo_mudado = tempo_mudado + dt

        mover_perseguidor(dt)

        perseguidor.color = {math.random(), math.random(), math.random()}

        if tempo_mudado >= tempo_Intervalo then

            mudar_posicao_perseguidor()
            
          
        else  
    
            mesagem = Extras.terminar()     
            
    
        end

        if Extras.verificar_distancia(circulo, perseguidor) then
            pontos = pontos - 1
        end
    
        if love.keyboard.isDown("up")then
    
            circulo.y = circulo.y - circulo.velocidade * dt
    
        elseif  love.keyboard.isDown("down") then
             
            circulo.y = circulo.y + circulo.velocidade * dt
    
        elseif love.keyboard.isDown("left") then
    
            circulo.x = circulo.x - circulo.velocidade * dt
    
        elseif love.keyboard.isDown("right") then
    
            circulo.x = circulo.x + circulo.velocidade * dt
        end
            
        
    else
        mensagem = Extras.terminar()
    end
      
end


function mover_perseguidor(dt)

    local distanciaX = circulo.x - perseguidor.x
    local distanciaY = circulo.y - perseguidor.y

    local distancia = math.sqrt(distanciaX *distanciaX + distanciaY * distanciaY)
    
    if distancia > 1 then
        perseguidor.x = perseguidor.x * (distanciaX/ distancia) * perseguidor.velocidade * dt
        perseguidor.y = perseguidor.y * (distanciaY / distancia) * perseguidor.velocidade * dt
        
    end
    
    
end

function mudar_posicao_perseguidor()

    if tempo_mudado == 5 then
        
        perseguidor.x = math.random(100, 600)
        perseguidor.y = math.random(100, 600)

        return tempo_acumulado - 5
    end


    
end

 



