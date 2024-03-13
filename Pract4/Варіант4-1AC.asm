.model small

.data
    array dw 12 dup(0)

.code
main PROC
    
    ;(1A: 1.5 бали)
    ;Визначити одновимірний масив довжиною 12 слів.
    ;Заповнити цей масив значеннями, що є парними числами від 2 до 24.

    ;число яке збільшиться від 2 до 24
    mov ax, 0

    ;індекс масива в який запишеться наступне число (збільшиться від 0 до 12)
    mov bx, 0

    ;лічильник цикла (зменшиться від 11 до 0)
    mov cx, 11
    
    @fill_array:
        ;збільшити число що запишеться в наступну комірку
        add ax, 2
        ;записати наступне число в цикл
        mov [array + bx], ax
        ;збільшити індекс комірки масива
        inc bx
        loop @fill_array

    ;(1C: +1 бал) 
    ;Потім обнулити масив і заповнити його числами Фібоначчі
    ;(тобто перші 12 чисел послідовності)

    ;повернути лічильники цикла та масива в початкове положення
    mov bx, 0
    mov cx, 11

    @clear_array:
        ;обнулити наступну комірку масива
        mov [array + bx], 0
        inc bx
        loop @clear_array
    
    ;перші два числа 0 і 1 записуємо відразу в масив без циклу
    mov [array], 0
    mov [array+1], 1

    ;лічильник масива почнеться з 2, адже елменти 0 та 1 вже записані
    mov bx, 2

    ;перші з 12 елементів вже встановлені, тому залишається 12 - 2 ітерацій цикла
    mov cx, 9

    @fibonacci_array:
        ;записати суму попередніх двох елементів
        mov ax, [array + bx - 1]
        add ax, [array + bx - 2]
        mov [array + bx], ax 
        ;збільшити індекс масива
        inc bx
    loop @fibonacci_array

main endp
end main