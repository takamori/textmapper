/**
 * This file is part of Lapg.UI project.
 *
 * Copyright (c) 2010 Evgeny Gryaznov
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *    Evgeny Gryaznov - initial API and implementation
 */
package org.textway.lapg.ui.editor;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.jface.preference.IPreferenceStore;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.IDocumentExtension3;
import org.eclipse.jface.text.source.IAnnotationModel;
import org.eclipse.jface.text.source.ISourceViewer;
import org.eclipse.jface.text.source.IVerticalRuler;
import org.eclipse.swt.widgets.Composite;
import org.textway.lapg.common.ui.editor.StructuredTextEditor;
import org.textway.lapg.common.ui.editor.StructuredTextReconciler.IReconcilingListener;
import org.textway.lapg.common.ui.editor.StructuredTextViewerConfiguration;
import org.textway.lapg.common.ui.editor.colorer.DefaultHighlightingManager;
import org.textway.lapg.common.ui.editor.colorer.ISemanticHighlighter;
import org.textway.lapg.ui.LapgUIActivator;
import org.textway.lapg.ui.editor.colorer.LapgHighlightingManager;
import org.textway.lapg.ui.editor.colorer.LapgSemanticHighlighter;

public class LapgSourceEditor extends StructuredTextEditor implements IReconcilingListener {

	public LapgSourceEditor() {
		super();
		setRulerContextMenuId("#LapgSourceEditorContext"); //$NON-NLS-1$
		setEditorContextMenuId("#LapgSourceEditorContext"); //$NON-NLS-1$
	}

	@Override
	protected void initializeKeyBindingScopes() {
		setKeyBindingScopes(new String[] { "org.textway.lapg.ui.scope" }); //$NON-NLS-1$
	}

	public IAnnotationModel getAnnotationModel() {
		ISourceViewer sourceViewer = getSourceViewer();
		return sourceViewer != null ? sourceViewer.getAnnotationModel() : null;
	}

	@Override
	public StructuredTextViewerConfiguration createSourceViewerConfiguration() {
		return new LapgSourceViewerConfiguration(this, getPreferenceStore());
	}

	@Override
	protected ISourceViewer createSourceViewer(Composite parent, IVerticalRuler ruler, int styles) {
		fAnnotationAccess = getAnnotationAccess();
		fOverviewRuler = createOverviewRuler(getSharedColors());

		ISourceViewer viewer = new LapgSourceViewer(parent, ruler, getOverviewRuler(), isOverviewRulerVisible(), styles);
		// ensure decoration support has been created and configured.
		getSourceViewerDecorationSupport(viewer);
		return viewer;
	}

	@Override
	protected void performSave(boolean overwrite, IProgressMonitor progressMonitor) {
		super.performSave(overwrite, progressMonitor);
		forceReconciling();
	}

	@Override
	protected String[] collectContextMenuPreferencePages() {
		String[] inheritedPages = super.collectContextMenuPreferencePages();
		String[] result = new String[inheritedPages.length + 2];
		result[0] = "org.textway.lapg.ui.preferences.RootPreferencePage"; //$NON-NLS-1$
		result[1] = "org.textway.lapg.ui.preferences.ColorPreferencePage"; //$NON-NLS-1$
		System.arraycopy(inheritedPages, 0, result, 2, inheritedPages.length);
		return result;
	}

	@Override
	public ISemanticHighlighter createSemanticHighlighter() {
		return new LapgSemanticHighlighter();
	}

	@Override
	protected DefaultHighlightingManager createHighlightingManager() {
		return new LapgHighlightingManager(getPreferenceStore(), LapgUIActivator.getDefault().getColorManager());
	}

	@Override
	protected IPreferenceStore getPluginPreferenceStore() {
		return LapgUIActivator.getDefault().getPreferenceStore();
	}

	@Override
	public void setup(IDocument document) {
		IDocumentExtension3 extension = (IDocumentExtension3) document;
		if (extension.getDocumentPartitioner(IPartitions.LAPG_PARTITIONING) == null)
			new LapgSourceSetupParticipant().setup(document);
	}
}
