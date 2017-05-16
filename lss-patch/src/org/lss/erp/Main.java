package org.lss.erp;

import org.lss.erp.gui.PatchNewComponentsAddition;

public class Main {

	public static void main(String[] args) {
		java.awt.EventQueue.invokeLater(new Runnable() {

			public void run() {
			 	PatchNewComponentsAddition patch = new PatchNewComponentsAddition();
			 	patch.runPatch();
				//patch.setVisible(true);
			}
		}); 
	}

}
