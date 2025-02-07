
local mod = {}



function mod.terminar()
    
    return"obrigado por jogar"
    
end




function mod.verificar_distancia(c,r)

    local distanciaX = math.abs(c.x - (r.x + r.largura))
    local distanciaY = math.abs(c.y - (r.y + r.altura ))

    if distanciaX < (c.tamanho + r.largura/2) and distanciaY < (c.tamanho + r.altura/2) then
        return true
    else
        return false
    end
    
end

return mod
