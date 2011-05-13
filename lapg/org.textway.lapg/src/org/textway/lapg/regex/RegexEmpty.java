/**
 * Copyright 2002-2010 Evgeny Gryaznov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.textway.lapg.regex;

import org.textway.lapg.regex.RegexDefTree.TextSource;

/**
 * Gryaznov Evgeny, 5/6/11
 */
public class RegexEmpty extends RegexPart {

	public RegexEmpty(TextSource source, int offset) {
		super(source, offset, offset);
	}

	@Override
	public void accept(RegexVisitor visitor) {
		visitor.visit(this);
	}

	@Override
	protected void toString(StringBuilder sb) {
	}

	@Override
	public boolean isConstant() {
		return true;
	}

	@Override
	public String getConstantValue() {
		return "";
	}
}