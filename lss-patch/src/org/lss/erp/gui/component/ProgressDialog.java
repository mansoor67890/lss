package org.lss.erp.gui.component;

import java.awt.BorderLayout;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.HeadlessException;
import java.util.Date;

import javax.swing.BorderFactory;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.SwingUtilities;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import org.lss.erp.common.Time;
import org.lss.erp.common.Utilities;

/**
 * MySwing: Advanced Swing Utilites
 * Copyright (C) 2005  Santhosh Kumar T
 * <p/>
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * <p/>
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 */
public class ProgressDialog extends JDialog implements ChangeListener {

    JLabel statusLabel = new JLabel();
    JProgressBar progressBar;
    ProgressMonitor monitor;
    long starttime;
    final String ELAPSED_TEXT = "Elapsed Time: ";
    final String REMAINING_TEXT = "Estd. Remaining Time: ";
    private JLabel elapsedLabel = new JLabel(ELAPSED_TEXT);
    private JLabel remainingLabel = new JLabel(REMAINING_TEXT);


    public ProgressDialog(Frame owner, ProgressMonitor monitor) throws HeadlessException {
        super(owner, "Progress", true);
        init(monitor);
    }

    public ProgressDialog(Dialog owner, ProgressMonitor monitor) throws HeadlessException {
        super(owner);
        init(monitor);
    }

    private void init(ProgressMonitor monitor) {
        this.monitor = monitor;

        progressBar = new JProgressBar(0, monitor.getTotal());
        if (monitor.isIndeterminate()) {
            progressBar.setIndeterminate(true);
        } else {
            progressBar.setValue(monitor.getCurrent());
        }
        statusLabel.setText(monitor.getStatus());

        JPanel contents = (JPanel) getContentPane();
        contents.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        contents.add(statusLabel, BorderLayout.NORTH);
        contents.add(progressBar, BorderLayout.CENTER);

        JPanel timeestimatepanel = new JPanel(new GridLayout(1, 2));
        timeestimatepanel.add(elapsedLabel);
        timeestimatepanel.add(remainingLabel);
        contents.add(timeestimatepanel, BorderLayout.SOUTH);

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        monitor.addChangeListener(this);
        Utilities.addCloseEventByEscapeKey(this, rootPane);

        setSize(360, 100);
        setPreferredSize(new Dimension(440, 100));
        starttime = new Date().getTime();
    }

    public void stateChanged(final ChangeEvent ce) {
//        System.out.println("Value changed");
        // to ensure EDT thread
        if (!SwingUtilities.isEventDispatchThread()) {
            SwingUtilities.invokeLater(new Runnable() {

                public void run() {
                    stateChanged(ce);
                }
            });
            return;
        }
        double totalsec = 0d;
        double estimatedtotal = 0d;
        double estimatedremaining = 0d;

        if (monitor.getCurrent() != monitor.getTotal()) {
            statusLabel.setText(monitor.getStatus());
            if (!monitor.isIndeterminate()) {
                long current = new Date().getTime();
                Time t = Utilities.timeDifference(starttime, current);
                String elapsed = t.getMm() + " min:" + t.getSs() + " sec";
                elapsedLabel.setText(ELAPSED_TEXT + elapsed);

                totalsec = (t.getMm() * 60) + t.getSs();
                estimatedtotal = totalsec / monitor.getCurrent() * monitor.getTotal();
                estimatedremaining = estimatedtotal - totalsec;
                t = new Time();
                t.setHh(0);
                t.setMm((int) (estimatedremaining / 60));
                t.setSs((int) (estimatedremaining % 60));
                String remaining = t.getMm() + " min:" + t.getSs() + " sec";
                remainingLabel.setText(REMAINING_TEXT + remaining);


                progressBar.setValue(monitor.getCurrent());
            }

        } else {
            dispose();
        }
    }
}