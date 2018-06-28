--[[local composer = require( "composer" )

require("frutas")
require("tabuleiro")

--direção inicial da cabeça
direcao = "direita"
direcoes = {}
cobra = {}

function cobra:criarDirecoes()
direcoes[2] = "direita" direcoes[3] = "direita" direcoes[4] = "direita" direcoes[5] = "direita"
direcoes[6] = "direita" direcoes[7] = "direita" direcoes[8] = "direita" direcoes[9] = "direita"
direcoes[10] = "direita" direcoes[11] = "direita" direcoes[12] = "direita"direcoes[13] = "direita" 
direcoes[14] = "direita" direcoes[15] = "direita" direcoes[16] = "direita" direcoes[17] = "direita" 
direcoes[18] = "direita" direcoes[19] = "direita" direcoes[20] = "direita"direcoes[21] = "direita"
direcoes[22] = "direita" direcoes[23] = "direita" direcoes[24] = "direita" direcoes[25] = "direita"
direcoes[26] = "direita" direcoes[27] = "direita" direcoes[28] = "direita" direcoes[29] = "direita"
direcoes[30] = "direita" direcoes[31] = "direita" direcoes[32] = "direita"direcoes[33] = "direita" 
direcoes[34] = "direita" direcoes[35] = "direita" direcoes[36] = "direita" direcoes[37] = "direita" 
direcoes[38] = "direita" direcoes[39] = "direita" direcoes[40] = "direita"direcoes[41] = "direita"

end

cobra:criarDirecoes()
--contador da posição inicial da cabeça
pi = 175
--cria todas as posições iniciais da cobra
function cobra:cobraInicial()
    for i = 2, 41 do
        if i < 5 then
            cobra[i] = display.newRect(pi,0,55,55)
            cobra[i].isVisible = true
            pi = pi - 60
        else
            cobra[i] = display.newRect(pi,0,55,55)
            cobra[i].isVisible = false
            pi = pi - 60
        end
    end
    pi = 175
end

function reiniciar(event)
    if event.phase == "began" then
        direcao = "direita"
        cobra:criarDirecoes()
    for i = 2, 41 do
        if i < 5 then
            cobra[i].x = pi
            cobra[i].y = 0
            cobra[i].isVisible = true
            pi = pi - 60
        else
            cobra[i].x = pi
            cobra[i].y = 0
            cobra[i].isVisible = false
            pi = pi - 60
        end
    end
    pi = 175
    cont = 1
    cobra:placar(0)
    timer.resume(tempo)
end
end
-- determina proxima posição da cabeça
function cobra:direcaoDaCabeca(id)
    if(direcao == "cima")then
        cobra[id].y = cobra[id].y - 60
    elseif(direcao == "esquerda")then
        cobra[id].x = cobra[id].x -60
    elseif(direcao == "baixo")then
        cobra[id].y = cobra[id].y +60
    elseif(direcao == "direita")then
        cobra[id].x = cobra[id].x +60
    end
end

-- movimeta a cobra de acordo com a nova posição da cabeça
function cobra:movimentarCobra()
    for a = 2, #direcoes do
        direcao = direcoes[a]
        cobra:direcaoDaCabeca(a)
    end
    direcao = direcoes[2]
end

-- armazena a quantidade de direções
b = #direcoes
-- determina a nova posição do corpo a cada movimento da cobra
function cobra:geraPosicoesDoCorpo()

	for a = 0, #direcoes do
    if(a < #direcoes - 2)then
        b = b - 1
        direcoes[#direcoes - a] = direcoes[b]
    else
        direcoes[2] = direcao
    end
		end
b = #direcoes

cobra:movimentarCobra()

end

cont = 1
--almenta o tamanho da cobra ao colidir com uma fruta
function cobra:almentarTamanho()
    cobra[4 + cont].isVisible = true
    cont = cont + 1
end

--some a fruta apos ser comida e cria uma nova
contFrutas = 0
function cobra:comerFrutas()
    if (cobra[2].x == frutas[1].x and cobra[2].y == frutas[1].y)then
        frutas[1]:removeSelf()
        frutas:criarFrutasAleatorias()
        cobra:almentarTamanho()
        contFrutas = contFrutas + 1
        cobra:placar(contFrutas)
    end
end
--local c = composer.getSceneName("main")
sair = display.newImageRect("saida.png", 90,90)
sair.x = 700
sair.y = 1130

dnovo = display.newImageRect("dnovo.png", 90,90)
dnovo.x = 55
dnovo.y = 1130

function cobra:desejaContinuar()
    perdeu = display.newRect(display.contentCenterX,300,500,200)
    perdeu:setFillColor(0,0,0)
    perdeu:setStrokeColor(0,255,255)
    perdeu.strokeWidth = 15

    msg = display.newText("    Bateu!!!\nFim de Jogo", display.contentCenterX, 300, native.systemFont, 60)
timer.pause(tempo)
end

dnovo:addEventListener("touch", reiniciar)

function sairDoJogo()
	
timer.pause(tempo)
    composer.gotoScene( "menu", "fade", 500 )
	
end
sair:addEventListener("touch", sairDoJogo)
-- ao bates nas paredes ou no proprio corpo o jogo deve parar
function cobra:bateuPerdeu()
    if (cobra[2].y < 0)then
        cobra[2].isVisible = false
        cobra:desejaContinuar() 
    elseif (cobra[2].y > 660)then
        cobra[2].isVisible = false
        cobra:desejaContinuar() 
    elseif (cobra[2].x < 55)then
        cobra[2].isVisible = false
        cobra:desejaContinuar() 
    elseif (cobra[2].x > 715)then
        cobra[2].isVisible = false
        cobra:desejaContinuar()     
    end

    for a = 3, 21 do
        if(cobra[2].x == cobra[a].x and cobra[2].y == cobra[a].y)then
            if(cobra[a].isVisible ~= false)then
                cobra:desejaContinuar()    
            end
        end
    end

end

pontuacao = display.newText("Frutas: ", 100, 750, native.systemFont, 40)
nivel = display.newText("Nível ".. 1, 690, 750, native.systemFont, 40)
score1 = display.newText("Pontos: ",display.contentCenterX, 750, native.systemFont, 40)

function cobra:placar(a)
    if a == 0 then
        pontuacao.isVisible = false
        pontuacao = display.newText("Frutas: ", 100, 750, native.systemFont, 40)
        nivel.isVisible = false
        nivel = display.newText("Nível ".. 1, 690, 750, native.systemFont, 40)
        score1.isVisible = false
        score1 = display.newText("Pontos: ",display.contentCenterX, 750, native.systemFont, 40)
        
    else
    pontuacao.isVisible = false
    pontuacao = display.newText("Frutas: " .. a, 100, 750, native.systemFont, 40)
    nivel.isVisible = false
    nivel = display.newText("Nível " .. 1, 690, 750, native.systemFont, 40)
    score1.isVisible = false
    score1 = display.newText("Pontos: ".. score[1],display.contentCenterX, 750, native.systemFont, 40)
    end
end]]