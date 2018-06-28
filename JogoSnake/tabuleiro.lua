--[[
tabuleiro = {}
c = 0
l = 0
--cria um tabuleiro que e usado como referencia para a cobra e plano de fundo
function tabuleiro:gerar()
	for linha = 1, 12 do
		tabuleiro[linha] = {}
        
        for coluna = 1, 12 do
			tabuleiro[linha][coluna]= display.newRect(55 + c,0 + l,55,55)
            tabuleiro[linha][coluna]:setFillColor(0.28,0.28,0.28)
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
--linhas que demilitam a area de jogo
function tabuleiro:linhasDeLimiteDoJogo()

    linhas[1] = display.newLine(20, 100, 770, 100)
        linhas[1]:setStrokeColor( 0,255,255 )
        linhas[1].y = -45
        linhas[1].x =  contentCenterX
        linhas[1].strokeWidth = 20

    linhas[2] = display.newLine(20, 100, 770, 100)
        linhas[2]:setStrokeColor( 0,255,255)
        linhas[2].y = 705
        linhas[2].x =  contentCenterX
        linhas[2].strokeWidth = 20

    linhas[3] = display.newLine(100, 20, 100, 789)
        linhas[3]:setStrokeColor( 0,255,255 )
        linhas[3].x = 10
        linhas[3].y = -55
        linhas[3].strokeWidth = 20

    linhas[4] = display.newLine(100, 20, 100, 789)
        linhas[4]:setStrokeColor( 0,255,255)
        linhas[4].x = 760
        linhas[4].y = -55
        linhas[4].strokeWidth = 20
        return linhas
end]]