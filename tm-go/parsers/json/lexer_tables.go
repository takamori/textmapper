package json

var tmNumClasses = 23

var tmRuneClass = []int32{
	1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 1, 1, 16, 1, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	16, 1, 8, 1, 1, 1, 1, 1, 1, 1, 1, 22, 7, 11, 13, 17,
	12, 15, 15, 15, 15, 15, 15, 15, 15, 15, 6, 1, 1, 1, 1, 1,
	1, 19, 19, 19, 19, 21, 19, 14, 14, 14, 14, 14, 14, 14, 14, 14,
	14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 9, 5, 1, 1,
	1, 19, 20, 19, 19, 21, 20, 14, 14, 14, 14, 14, 14, 14, 18, 14,
	14, 14, 18, 14, 18, 10, 14, 14, 14, 14, 14, 2, 1, 3, 1, 1,
}

var tmStateMap = []int{
	0,
}

var tmToken = []Token{
	10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13,
}

var tmLexerAction = []int32{
	-2, -1, 1, 2, 3, 4, 5, 6, 7, -1, 8, 9, 10, -1, 8, 11,
	12, -1, 8, 8, 8, 8, -1, -4, -4, -4, -4, -4, -4, -4, -4, -4,
	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -5, -5,
	-5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5,
	-5, -5, -5, -5, -5, -6, -6, -6, -6, -6, -6, -6, -6, -6, -6, -6,
	-6, -6, -6, -6, -6, -6, -6, -6, -6, -6, -6, -6, -7, -7, -7, -7,
	-7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7,
	-7, -7, -7, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -8,
	-8, -8, -8, -8, -8, -8, -8, -8, -8, -8, -9, -9, -9, -9, -9, -9,
	-9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9,
	-9, -1, 7, 7, 7, 7, 7, 7, 7, 13, 14, 7, 7, 7, 7, 7,
	7, 7, 7, 7, 7, 7, 7, 7, -3, -3, -3, -3, -3, -3, -3, -3,
	-3, -3, 8, -3, 8, -3, 8, 8, -3, -3, 8, 8, 8, 8, -3, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 10, -1, -1, 11, -1,
	-1, -1, -1, -1, -1, -1, -12, -12, -12, -12, -12, -12, -12, -12, -12, -12,
	-12, -12, -12, 15, -12, -12, -12, -12, -12, -12, -12, 16, -12, -12, -12, -12,
	-12, -12, -12, -12, -12, -12, -12, -12, -12, 11, 15, -12, 11, -12, -12, -12,
	-12, -12, 16, -12, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10,
	-10, -10, -10, -10, 12, -10, -10, -10, -10, -10, -10, -11, -11, -11, -11, -11,
	-11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11, -11,
	-11, -11, -1, -1, -1, -1, -1, -1, -1, -1, 7, 7, 17, -1, -1, -1,
	-1, -1, -1, 7, 7, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, 18, -1, -1, 18, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 19, 20, -1, -1, 20,
	-1, -1, -1, -1, -1, -1, 19, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, 21, -1, -1, 21, -1, -1, -1, 21, 21, 21, -1, -12, -12,
	-12, -12, -12, -12, -12, -12, -12, -12, -12, -12, 18, -12, -12, 18, -12, -12,
	-12, -12, -12, 16, -12, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, 20, -1, -1, 20, -1, -1, -1, -1, -1, -1, -1, -12, -12, -12, -12,
	-12, -12, -12, -12, -12, -12, -12, -12, 20, -12, -12, 20, -12, -12, -12, -12,
	-12, -12, -12, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 22,
	-1, -1, 22, -1, -1, -1, 22, 22, 22, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, 23, -1, -1, 23, -1, -1, -1, 23, 23, 23,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 7, -1, -1,
	7, -1, -1, -1, 7, 7, 7, -1,
}
