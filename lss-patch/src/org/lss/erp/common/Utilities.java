/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.lss.erp.common; 

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent; 
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JRootPane;
import javax.swing.KeyStroke; 
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 * @author Muhammad Zubair
 */
public class Utilities {

	private static Logger logger = FormattedLogger.getFormattedLoggerForCurrentUser(Utilities.class);
 
  public static void addCloseEventByEscapeKey(JDialog dialog, JRootPane rootPane) {
		KeyStroke stroke = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
		rootPane.registerKeyboardAction(getCloseEvent(dialog), stroke, JComponent.WHEN_IN_FOCUSED_WINDOW);
	}

	public static ActionListener getCloseEvent(final JDialog dialog) {
		ActionListener actionListener = new ActionListener() {

			public void actionPerformed(ActionEvent actionEvent) {
				dialog.dispose();
			}
		};
		return actionListener;
	} 
	 
	public static Time timeDifference(Long time1, Long time2) {
		Time t = new Time();
		try {
			Long timediff = time2 - time1;
			// reducing to sec
			Long ss = timediff / 1000;
			Long mm = ss / 60;
			if (ss > 59) {
				ss = ss % 60;
			}

			t.setHh(0);
			t.setMm(mm.intValue());
			t.setSs(ss.intValue());
		} catch (Exception e) {
			logger.log(Level.ERROR, e);
		}
		return t;
	} 
}
