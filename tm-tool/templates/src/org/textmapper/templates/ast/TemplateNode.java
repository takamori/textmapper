/**
 * Copyright 2002-2015 Evgeny Gryaznov
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
package org.textmapper.templates.ast;

import java.util.List;

import org.textmapper.templates.api.EvaluationContext;
import org.textmapper.templates.api.EvaluationException;
import org.textmapper.templates.api.IEvaluationStrategy;
import org.textmapper.templates.bundle.IBundleEntity;
import org.textmapper.templates.api.ITemplate;
import org.textmapper.templates.ast.TemplatesTree.TextSource;

public class TemplateNode extends CompoundNode implements ITemplate {
	private final String name;
	private final ParameterNode[] parameters;
	private final String templatePackage;
	private ITemplate base;
	private String contextType;

	public TemplateNode(String name, List<ParameterNode> parameters, String contextType, String templatePackage, TextSource source, int offset, int endoffset) {
		super(source, offset, endoffset);
		this.contextType = contextType;
		int dot = name.lastIndexOf('.');
		this.name = dot > 0 ? name.substring(dot + 1) : name;
		if (templatePackage == null) {
			this.templatePackage = dot > 0 ? name.substring(0, dot) : "";
		} else {
			this.templatePackage = templatePackage;
		}
		this.parameters = parameters != null ? parameters.toArray(new ParameterNode[parameters.size()]) : null;
	}

	public int getKind() {
		return KIND_TEMPLATE;
	}

	public String getName() {
		return name;
	}

	public String getContextType() {
		return contextType;
	}

	public String apply(EvaluationContext context, IEvaluationStrategy env, Object[] arguments) throws EvaluationException {
		int paramCount = parameters != null ? parameters.length : 0, argsCount = arguments != null ? arguments.length
				: 0;

		if (paramCount != argsCount) {
			throw new EvaluationException("Wrong number of arguments used while calling `" + toString()
					+ "`: should be " + paramCount + " instead of " + argsCount);
		}

		StringBuilder sb = new StringBuilder();
		if (paramCount > 0) {
			for (int i = 0; i < paramCount; i++) {
				context.setVariable(parameters[i].getName(), arguments[i] != null ? arguments[i] : EvaluationContext.NULL_VALUE);
			}
		}
		emit(sb, context, env);
		return sb.toString();
	}

	@Override
	public String toString() {
		return getSignature();
	}

	public String getPackage() {
		return templatePackage;
	}

	public String getSignature() {
		StringBuilder sb = new StringBuilder();
		sb.append(name);
		if (parameters != null) {
			sb.append('(');
			for (int i = 0; i < parameters.length; i++) {
				if (i > 0) {
					sb.append(',');
				}
				parameters[i].toString(sb);
			}
			sb.append(')');
		}
		return sb.toString();
	}

	public IBundleEntity getBase() {
		return base;
	}

	public void setBase(IBundleEntity template) {
		this.base = (ITemplate) template;
	}
}
