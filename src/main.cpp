/* MORADAMUS */
/* Created 1/3/2024 */
#include "include/game.h"
#include "include/render.h"

int main(){
    // display the main window
    sf::RenderWindow window(sf::VideoMode(640,360), "Moradamus");
    sf::Event ev;

    // game loop
    while (window.isOpen()){
        // event polling
        while(window.pollEvent(ev)){
            switch(ev.type){
                case sf::Event::Closed:
                    window.close();
                    break;
                case sf::Event::KeyPressed:
                    if(ev.key.code == sf::Keyboard::Escape){
                        window.close();
                    }
                    break;
            }
        }

        // update
        

        // render
        window.clear(sf::Color::Black); // clear old frame
        // draw the game
        window.display(); // tell app that window is done drawing
    }

    // end
    return 0;
}