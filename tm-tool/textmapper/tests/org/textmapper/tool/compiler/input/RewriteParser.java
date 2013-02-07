package org.textmapper.tool.compiler.input;

import java.io.IOException;
import java.text.MessageFormat;
import org.textmapper.tool.compiler.input.RewriteLexer.ErrorReporter;
import org.textmapper.tool.compiler.input.RewriteLexer.LapgSymbol;
import org.textmapper.tool.compiler.input.RewriteLexer.Lexems;

public class RewriteParser {

	public static class ParseException extends Exception {
		private static final long serialVersionUID = 1L;

		public ParseException() {
		}
	}

	private final ErrorReporter reporter;

	public RewriteParser(ErrorReporter reporter) {
		this.reporter = reporter;
	}

	private static final boolean DEBUG_SYNTAX = false;
	private static final int[] lapg_action = RewriteLexer.unpack_int(3,
		"\ufffd\uffff\uffff\uffff\ufffe\uffff");

	private static final short[] lapg_lalr = RewriteLexer.unpack_short(4,
		"\0\0\uffff\ufffe");

	private static final short[] lapg_sym_goto = RewriteLexer.unpack_short(26,
		"\0\1\1\1\1\1\1\1\2\2\2\2\2\2\2\2\2\2\2\2\2\2\2\2\2\2");

	private static final short[] lapg_sym_from = RewriteLexer.unpack_short(2,
		"\1\0");

	private static final short[] lapg_sym_to = RewriteLexer.unpack_short(2,
		"\2\1");

	private static final short[] lapg_rlen = RewriteLexer.unpack_short(42,
		"\0\1\1\1\1\1\2\1\2\1\3\1\3\1\4\1\4\4\4\1\1\1\4\4\4\0\1\2\0\2\2\0\2\0\2\0\1\2\1\4" +
		"\0\4");

	private static final short[] lapg_rlex = RewriteLexer.unpack_short(42,
		"\7\10\10\11\12\13\13\14\14\15\15\16\16\17\17\20\20\20\20\21\21\21\21\21\21\22\22" +
		"\22\23\23\23\24\24\25\25\26\26\26\27\27\30\30");

	protected static final String[] lapg_syms = new String[] {
		"eoi",
		"'{'",
		"'}'",
		"','",
		"'.'",
		"'a'",
		"'b'",
		"input",
		"Elem",
		"Elem2",
		"Elem3",
		"ElemPlus1",
		"ElemPlus1rr",
		"ElemPlus2",
		"ElemPlus2rr",
		"ElemPlus3",
		"ElemPlus4",
		"ElemPlus5",
		"ElemStar1",
		"ElemStar1ex",
		"ElemStar2",
		"ElemStar3rr",
		"ElemStar4rr",
		"ElemPlus5rr",
		"ElemSep6rr",
	};

	public interface Tokens extends Lexems {
		// non-terminals
		public static final int input = 7;
		public static final int Elem = 8;
		public static final int Elem2 = 9;
		public static final int Elem3 = 10;
		public static final int ElemPlus1 = 11;
		public static final int ElemPlus1rr = 12;
		public static final int ElemPlus2 = 13;
		public static final int ElemPlus2rr = 14;
		public static final int ElemPlus3 = 15;
		public static final int ElemPlus4 = 16;
		public static final int ElemPlus5 = 17;
		public static final int ElemStar1 = 18;
		public static final int ElemStar1ex = 19;
		public static final int ElemStar2 = 20;
		public static final int ElemStar3rr = 21;
		public static final int ElemStar4rr = 22;
		public static final int ElemPlus5rr = 23;
		public static final int ElemSep6rr = 24;
	}

	protected final int lapg_next(int state) {
		int p;
		if (lapg_action[state] < -2) {
			for (p = -lapg_action[state] - 3; lapg_lalr[p] >= 0; p += 2) {
				if (lapg_lalr[p] == lapg_n.symbol) {
					break;
				}
			}
			return lapg_lalr[p + 1];
		}
		return lapg_action[state];
	}

	protected final int lapg_state_sym(int state, int symbol) {
		int min = lapg_sym_goto[symbol], max = lapg_sym_goto[symbol + 1] - 1;
		int i, e;

		while (min <= max) {
			e = (min + max) >> 1;
			i = lapg_sym_from[e];
			if (i == state) {
				return lapg_sym_to[e];
			} else if (i < state) {
				min = e + 1;
			} else {
				max = e - 1;
			}
		}
		return -1;
	}

	protected int lapg_head;
	protected LapgSymbol[] lapg_m;
	protected LapgSymbol lapg_n;
	protected RewriteLexer lapg_lexer;

	public Object parse(RewriteLexer lexer) throws IOException, ParseException {

		lapg_lexer = lexer;
		lapg_m = new LapgSymbol[1024];
		lapg_head = 0;

		lapg_m[0] = new LapgSymbol();
		lapg_m[0].state = 0;
		lapg_n = lapg_lexer.next();

		while (lapg_m[lapg_head].state != 2) {
			int lapg_i = lapg_next(lapg_m[lapg_head].state);

			if (lapg_i >= 0) {
				reduce(lapg_i);
			} else if (lapg_i == -1) {
				shift();
			}

			if (lapg_i == -2 || lapg_m[lapg_head].state == -1) {
				break;
			}
		}

		if (lapg_m[lapg_head].state != 2) {
			reporter.error(lapg_n.offset, lapg_n.line,
						MessageFormat.format("syntax error before line {0}",
								lapg_lexer.getTokenLine()));
			throw new ParseException();
		}
		return lapg_m[lapg_head - 1].value;
	}

	protected void shift() throws IOException {
		lapg_m[++lapg_head] = lapg_n;
		lapg_m[lapg_head].state = lapg_state_sym(lapg_m[lapg_head - 1].state, lapg_n.symbol);
		if (DEBUG_SYNTAX) {
			System.out.println(MessageFormat.format("shift: {0} ({1})", lapg_syms[lapg_n.symbol], lapg_lexer.current()));
		}
		if (lapg_m[lapg_head].state != -1 && lapg_n.symbol != 0) {
			lapg_n = lapg_lexer.next();
		}
	}

	protected void reduce(int rule) {
		LapgSymbol lapg_gg = new LapgSymbol();
		lapg_gg.value = (lapg_rlen[rule] != 0) ? lapg_m[lapg_head + 1 - lapg_rlen[rule]].value : null;
		lapg_gg.symbol = lapg_rlex[rule];
		lapg_gg.state = 0;
		if (DEBUG_SYNTAX) {
			System.out.println("reduce to " + lapg_syms[lapg_rlex[rule]]);
		}
		LapgSymbol startsym = (lapg_rlen[rule] != 0) ? lapg_m[lapg_head + 1 - lapg_rlen[rule]] : lapg_n;
		lapg_gg.line = startsym.line;
		lapg_gg.offset = startsym.offset;
		applyRule(lapg_gg, rule, lapg_rlen[rule]);
		for (int e = lapg_rlen[rule]; e > 0; e--) {
			lapg_m[lapg_head--] = null;
		}
		lapg_m[++lapg_head] = lapg_gg;
		lapg_m[lapg_head].state = lapg_state_sym(lapg_m[lapg_head - 1].state, lapg_gg.symbol);
	}

	@SuppressWarnings("unchecked")
	protected void applyRule(LapgSymbol lapg_gg, int rule, int ruleLength) {
	}
}