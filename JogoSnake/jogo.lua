local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

frutas = {}
cobra = {}
direcoes = {}
tabuleiro = {}
direcao = "direita"

function scene:create( event )
    local sceneGroup = self.view
 
local function determinarDirecao(event)
    
    if event.phase == "began" then
        direcao = event.target.id
    end
end

-- botão para cima
local moverParaCima = widget.newButton(
    {
        width = 220,
        height = 175,
        id = "cima",
        defaultFile = "seta.png",
        overFile = "seta2.png",
        onEvent = determinarDirecao
    }
)
    moverParaCima.x = display.contentCenterX
    moverParaCima.y = display.contentCenterY + 363
    sceneGroup:insert( moverParaCima )

-- botão para baixo
local moverParaBixo = widget.newButton(
    {
        width = 220,
        height = 175,
        id = "baixo",
        defaultFile = "seta.png",
        overFile = "seta2.png",
        onEvent = determinarDirecao
    }
)
    moverParaBixo.x = display.contentCenterX
    moverParaBixo.y = display.contentCenterY + 537
    moverParaBixo.rotation = 180
    sceneGroup:insert( moverParaBixo )

--botão para direita
local moverParaADireita = widget.newButton(
    {
        width = 220,
        height = 175,
        id = "direita",
        defaultFile = "seta.png",
        overFile = "seta2.png",
        onEvent = determinarDirecao
    }
)
    moverParaADireita.x = display.contentCenterX + 200
    moverParaADireita.y = display.contentCenterY + 450
    moverParaADireita.rotation = 90
    sceneGroup:insert( moverParaADireita )

-- botão para esquerda
local moverParaAEsquerda = widget.newButton(
    {
        width = 220,
        height = 175,
        id = "esquerda",
        defaultFile = "seta.png",
        overFile = "seta2.png",
        onEvent = determinarDirecao
    }
)
    moverParaAEsquerda.x = display.contentCenterX - 200
    moverParaAEsquerda.y = display.contentCenterY + 450
    moverParaAEsquerda.rotation = - 90
    sceneGroup:insert( moverParaAEsquerda )

c = 0
l = 0
function tabuleiro:gerar()
	for linha = 1, 12 do
		tabuleiro[linha] = {}
        
        for coluna = 1, 12 do
			tabuleiro[linha][coluna]= display.newRect(55 + c,0 + l,55,55)
            tabuleiro[linha][coluna]:setFillColor(0.28,0.28,0.28)
            sceneGroup:insert( tabuleiro[linha][coluna] )
            c = c + 60
        end
            c = 0
            l = l + 60
    end
        c = 0
        l = 0
    return tabuleiro
end

linhas = {}
function tabuleiro:linhasDeLimiteDoJogo()

    linhas[1] = display.newLine(20, 100, 770, 100)
        linhas[1]:setStrokeColor( 0,255,255 )
        linhas[1].y = -45
        linhas[1].x =  contentCenterX
        linhas[1].strokeWidth = 20
        sceneGroup:insert( linhas[1] )

    linhas[2] = display.newLine(20, 100, 770, 100)
        linhas[2]:setStrokeColor( 0,255,255)
        linhas[2].y = 705
        linhas[2].x =  contentCenterX
        linhas[2].strokeWidth = 20
        sceneGroup:insert( linhas[2] )

    linhas[3] = display.newLine(100, 20, 100, 789)
        linhas[3]:setStrokeColor( 0,255,255 )
        linhas[3].x = 10
        linhas[3].y = -55
        linhas[3].strokeWidth = 20
        sceneGroup:insert( linhas[3] )

    linhas[4] = display.newLine(100, 20, 100, 789)
        linhas[4]:setStrokeColor( 0,255,255)
        linhas[4].x = 760
        linhas[4].y = -55
        linhas[4].strokeWidth = 20
        sceneGroup:insert( linhas[4] )

        return linhas
end

tabuleiro:gerar()
tabuleiro:linhasDeLimiteDoJogo()

function cobra:criarDirecoes()
--[[    direcoes[2] = "direita" direcoes[3] = "direita" direcoes[4] = "direita" direcoes[5] = "direita"
    direcoes[6] = "direita" direcoes[7] = "direita" direcoes[8] = "direita" direcoes[9] = "direita"
    direcoes[10] = "direita" direcoes[11] = "direita" direcoes[12] = "direita"direcoes[13] = "direita" 
    direcoes[14] = "direita" direcoes[15] = "direita" direcoes[16] = "direita" direcoes[17] = "direita" 
    direcoes[18] = "direita" direcoes[19] = "direita" direcoes[20] = "direita"direcoes[21] = "direita"
    direcoes[22] = "direita" direcoes[23] = "direita" direcoes[24] = "direita" direcoes[25] = "direita"
    direcoes[26] = "direita" direcoes[27] = "direita" direcoes[28] = "direita" direcoes[29] = "direita"
    direcoes[30] = "direita" direcoes[31] = "direita" direcoes[32] = "direita"direcoes[33] = "direita" 
    direcoes[34] = "direita" direcoes[35] = "direita" direcoes[36] = "direita" direcoes[37] = "direita" 
    direcoes[38] = "direita" direcoes[39] = "direita" direcoes[40] = "direita"direcoes[41] = "direita"
    direcoes[42] = "direita" direcoes[43] = "direita" direcoes[44] = "direita" direcoes[45] = "direita"
    direcoes[46] = "direita" direcoes[47] = "direita" direcoes[48] = "direita" direcoes[49] = "direita"
    direcoes[50] = "direita" direcoes[51] = "direita" direcoes[52] = "direita"direcoes[53] = "direita" 
    direcoes[54] = "direita" direcoes[55] = "direita" direcoes[56] = "direita" direcoes[57] = "direita" 
    direcoes[58] = "direita" direcoes[59] = "direita" direcoes[60] = "direita"direcoes[61] = "direita"
]]--
    for as = 2, 145 do
    direcoes[as] = "direita"
    end
end
    
    cobra:criarDirecoes()

    pi = 175
function cobra:cobraInicial() 
    for i = 2, 145 do
        if i < 5 then
            cobra[i] = display.newRect(pi,0,55,55)
            cobra[i].isVisible = true
            sceneGroup:insert( cobra[i] )
            pi = pi - 60
        else
            cobra[i] = display.newRect(pi,0,55,55)
            cobra[i].isVisible = false
            sceneGroup:insert( cobra[i] )
            pi = pi - 60
        end
    end
    cobra[2]:setFillColor(0.9,0.9,0.9)
    pi = 175
end
    
local pausa = display.newImageRect("pausa.png", 90,90)
      pausa.x = 60
      pausa.y = 1130
      sceneGroup:insert( pausa )

function reiniciar(event)
    if event.phase == "began" then
        direcao = "direita"
        cobra:criarDirecoes()
        
        for i = 2, 145 do
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
        zerarTodasAsVariaveis()
        pausa.isVisible = true
    end
end

function zerarTodasAsVariaveis()
    pi = 175
    cont = 1
    cobra:placar(0)
    perdeu.isVisible = false
    msg.isVisible = false
    dnovo.isVisible = false
    contFrutas = 0
    score[1] = 0
    fundo.isVisible = nil
    timer.resume(tempo)
    audio.stop(af)
end

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
    
function cobra:movimentarCobra()
    for a = 2, #direcoes do
        direcao = direcoes[a]
        cobra:direcaoDaCabeca(a)
    end
        direcao = direcoes[2]
end
    
b = #direcoes
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
function cobra:almentarTamanho()
    cobra[4 + cont].isVisible = true
    cont = cont + 1
end
    
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

sair = display.newImageRect("saida.png", 90,90)
sair.x = 700
sair.y = 1130
sceneGroup:insert( sair )
   
pr = 0
function pausarEresume(event)
    if event.phase == "began" then
        if pr == 0 then
            timer.pause(tempo)
            pr = 1
        else
            timer.resume(tempo)
            pr = 0
        end
    end
end 

pausa:addEventListener("touch", pausarEresume)
somPerdeu = audio.loadSound( "perdeu.mp3" )

function cobra:desejaContinuar()
	fundo = display.newImageRect( "fundo.jpg", display.actualContentWidth, display.actualContentHeight )
	fundo.anchorX = 0
	fundo.anchorY = 0
	fundo.x = 0 + display.screenOriginX 
	fundo.y = 0 + display.screenOriginY
        sceneGroup:insert( fundo )

    perdeu = display.newRect(display.contentCenterX,370,500,300)
    perdeu:setFillColor(0,0,0)
    perdeu:setStrokeColor(0,255,255)
    perdeu.strokeWidth = 15
    sceneGroup:insert( perdeu )
    
    msg = display.newText("   -----(`-´)-----\nFim de Jogo", display.contentCenterX, 300, native.systemFont, 60)
    sceneGroup:insert( msg )

    dnovo = display.newImageRect("dnovo.png", 90,90)
    dnovo.x = display.contentCenterX
    dnovo.y = 450
    sceneGroup:insert( dnovo )
    
    timer.pause(tempo)
    pausa.isVisible = false
    dnovo:addEventListener("touch", reiniciar)
    if(s == 1)then
    af = audio.play(somPerdeu)
    end
end

function sairDoJogo()
    if(s == 1)then
    playSomJogo = audio.resume( somJogo, { channel=1, loops=-1, fadein=5000 } )
    end
    composer.gotoScene( "menu", "fade", 500 )
    timer.pause(tempo)
    pr = 1

end

sair:addEventListener("touch", sairDoJogo)

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
    
    for a = 3, 145 do
        if(cobra[2].x == cobra[a].x and cobra[2].y == cobra[a].y)then
            if(cobra[a].isVisible ~= false)then
                cobra:desejaContinuar()    
            end
        end
    end 
end
    
pontuacao = display.newText("Frutas: ", 100, 750, native.systemFont, 40)
sceneGroup:insert( pontuacao )

nivel = display.newText("Nível ".. 1, 690, 750, native.systemFont, 40)
sceneGroup:insert( nivel )

score1 = display.newText("Pontos: ",display.contentCenterX, 750, native.systemFont, 40)
sceneGroup:insert( score1 )

function cobra:placar(a)
    if a == 0 then
        pontuacao.isVisible = false
        pontuacao = display.newText("Frutas: ", 100, 750, native.systemFont, 40)
        sceneGroup:insert( pontuacao )
        
        nivel.isVisible = false
        nivel = display.newText("Nível ".. 1, 690, 750, native.systemFont, 40)
        sceneGroup:insert( nivel )
        
        score1.isVisible = false
        score1 = display.newText("Pontos: ",display.contentCenterX, 750, native.systemFont, 40)
        sceneGroup:insert( score1 )
    else
        pontuacao.isVisible = false
        pontuacao = display.newText("Frutas: " .. a, 100, 750, native.systemFont, 40)
        sceneGroup:insert( pontuacao )
        
        nivel.isVisible = false
        nivel = display.newText("Nível " .. 1, 690, 750, native.systemFont, 40)
        sceneGroup:insert( nivel )
        
        score1.isVisible = false
        score1 = display.newText("Pontos: ".. score[1],display.contentCenterX, 750, native.systemFont, 40)
        sceneGroup:insert( score1 )
    end
end

cobra:cobraInicial()

direcaox = {55,115,175,235,295,355,415,475,535,595,655,715}
direcaoY = {0,60,120,180,240,300,360,420,480,540,600,660}

score = {}
score[1] = 0

function frutas:criarFrutasComPontuacoes()
    frutas[1] = display.newRect(100,0,55,55)
    sceneGroup:insert( frutas[1] )
        local cor = math.random(6)
        if(cor == 1)then
            frutas[1]:setFillColor(255,0,255)
            score[1] = score[1] + 10
        elseif(cor == 2)then
            frutas[1]:setFillColor(0,255,255)
            score[1] = score[1] + 20
        elseif(cor == 3)then
            frutas[1]:setFillColor(255,255,0)
            score[1] = score[1] + 40
        elseif(cor == 4)then
            frutas[1]:setFillColor(0,255,0)
            score[1] = score[1] + 60
        elseif(cor == 5)then
            frutas[1]:setFillColor(255,0,0)
            score[1] = score[1] + 80
        elseif(cor == 6)then
            frutas[1]:setFillColor(0,0,255)
            score[1] = score[1] + 100
        end

end
function frutas:criarFrutasAleatorias()
    
    posicaox = direcaox[math.random(1,12)]
    posicaoy = direcaoY[math.random(1,12)]

        frutas:criarFrutasComPontuacoes()
        frutas[1].x = posicaox
        frutas[1].y = posicaoy
    
    for a = 2, 145 do
        if(cobra[a].isVisible ~= false and cobra[a].x == frutas[1].x and cobra[a].y == frutas[1].y)then
            frutas[1].isVisible = false
            frutas:criarFrutasAleatorias()
        end
    end
end 

function iniciarMovimentos()
    cobra:geraPosicoesDoCorpo()
    cobra:comerFrutas()
    cobra:bateuPerdeu()
end


frutas:criarFrutasAleatorias()

tempo = timer.performWithDelay(250, iniciarMovimentos, 0)
timer.resume(tempo)

end

scene:addEventListener( "create", scene )

return scene