 -----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

--------------------------------------------
require("frutas")
require("tabuleiro")

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

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
	function cobra:desejaContinuar()
		dialogo = display.newRect(display.contentCenterX, display.contentCenterY - 100, 690, 400)
		dialogo.strokeWidth = 20
		dialogo:setFillColor( 0,0,0)
		dialogo:setStrokeColor( 0, 255, 255)
	
		mensagem = display.newText("    Bateu!!! \n Game Over", display.contentCenterX, 300, native.systemFont, 60)
	
		continuar = display.newRect(display.contentCenterX - 150, display.contentCenterY, 225, 100)
		continuar.strokeWidth = 10
		continuar:setFillColor(0.28,0.28,0.28)
		continuar:setStrokeColor( 0, 255, 255)
	
		menCont = display.newText("Jogar", display.contentCenterX - 150, display.contentCenterY, native.systemFont, 50)
	
		sair = display.newRect(display.contentCenterX + 150, display.contentCenterY, 225, 100)
		sair.strokeWidth = 10
		sair:setFillColor(0.28,0.28,0.28)
		sair:setStrokeColor( 0, 255, 255)
	
		menSair = display.newText("Sair", display.contentCenterX + 150, display.contentCenterY, native.systemFont, 50)
	
	end
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
	score1 = display.newText("Pontos: ".. score[1],display.contentCenterX, 750, native.systemFont, 40)
	
	function cobra:placar(a)
		pontuacao.isVisible = false
		pontuacao = display.newText("Frutas: " .. a, 100, 750, native.systemFont, 40)
		nivel.isVisible = false
		nivel = display.newText("Nível " .. 1, 690, 750, native.systemFont, 40)
		score1.isVisible = false
		score1 = display.newText("Pontos: ".. score[1],display.contentCenterX, 750, native.systemFont, 40)
	
	end

	--[[sceneGroup:insert(  )
	sceneGroup:insert( grass)
	sceneGroup:insert( crate )]]--
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene