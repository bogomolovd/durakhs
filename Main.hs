import Durak.Models
import Durak.UI
import Durak.GameLogic

main :: IO()
main = startGame

{-
 TODO:
    1. инициализация игры +
    2. ход атакующего +
        2.1 выкладывание карты на стол +
        2.2 подкладывание +
        2.3 конец атакующего хода +
    3. ход обороняющегося +
        3.1 покрытие карт на столе +
        3.2 забирание карт в руку +
        3.3 перевод карт на следующего игрока +
    4. смена раунда +
        4.1 смена обороняющегося +
        4.2 добор карт +
    5. конец игры +
    6. компьютерные игроки
    7. валидации

    баги:
        1. сбрасывается состояние защищающегося игрока после отбоя +
        2. алгоритм смены игроков не учитывает выбывших
        3. карты в начале раздаются без рандома
        4. карты не набираются из деки +
        5. игрок отбился и вышел из игры -> должен переключиться curplayer +
        6. игроки почему-то получают руку из начала +
        7. смена игрока работает неправильно (как-то связано с 6) +
-}
