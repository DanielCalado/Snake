--[[frutas = {}

-- posiveis lugares que as frutas podem aparecer
direcaox = {55,115,175,235,295,355,415,475,535,595,655,715}
direcaoY = {0,60,120,180,240,300,360,420,480,540,600,660}

score = {}
score[1] = 0
--cria frutas em lugares aleatorios e muda a cor da fruta a cada rodada
function frutas:criarFrutasAleatorias()
    frutas[1] = display.newRect(100,0,55,55)
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

    frutas[1].x = direcaox[math.random(1,12)]
    frutas[1].y = direcaoY[math.random(1,12)]
end]]