local composer = require( "composer" )
local scene = composer.newScene()

local widget = require "widget"

local function irParaOMenu()
	playSomJogo = audio.pause( somJogo )
	composer.gotoScene( "jogo", "fade", 500 )
	
end

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect( "background.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	local iniciar = display.newImageRect("iniciar.png",220,90)
	iniciar.x = display.contentCenterX
	iniciar.y = 820

	iniciar:addEventListener("touch", irParaOMenu)

	local sair2 = display.newImageRect("saida.png", 90,90)
	sair2.x = 65
	sair2.y = 1125

	somJogo = audio.loadSound( "somJogo.mp3" )
	playSomJogo = audio.play( somJogo, { channel=1, loops=-1, fadein=5000 } )

	somLigado = display.newImageRect("somLigado.png", 90,90)
	somLigado.x = 700
	somLigado.y = -100

	s = 1
	function desligarLigarSom(event)
		if event.phase == "began" then
			if(s == 1)then
				playSomJogo = audio.pause( somJogo )
				somLigado:removeSelf()
				somLigado = display.newImageRect("somDesligado.png", 90,90)
				somLigado.x = 700
				somLigado.y = -100
				sceneGroup:insert(somLigado)	
				s = 2
				somLigado:addEventListener("touch", desligarLigarSom)
			else
				playSomJogo = audio.resume( somJogo )
				somLigado:removeSelf()
				somLigado = display.newImageRect("somLigado.png", 90,90)
				somLigado.x = 700
				somLigado.y = -100
				sceneGroup:insert(somLigado)	
				s = 1
				somLigado:addEventListener("touch", desligarLigarSom)
			end	
		end
	end
	
	somLigado:addEventListener("touch", desligarLigarSom)

	function encerarJogo(event)	
    	os.exit()
	end
	
	sair2:addEventListener("touch", encerarJogo)

	local score = display.newImageRect("score.png", 90,90)
		  score.x = 700
		  score.y = 1125

	sceneGroup:insert( background )
	sceneGroup:insert(iniciar)
	sceneGroup:insert(sair2)
	sceneGroup:insert(somLigado)	
	sceneGroup:insert(score)	

end

scene:addEventListener( "create", scene )

return scene