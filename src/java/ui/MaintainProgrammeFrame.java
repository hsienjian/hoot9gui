package ui;

import control.MaintainProgrammeControl;
import domain.Programme;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MaintainProgrammeFrame extends JFrame {

    private MaintainProgrammeControl progControl;
    private JTextField jtfUsername = new JTextField();
    private JTextField jtfPassword = new JTextField();
   
    private JButton jbtLogin = new JButton("Login");
    private JButton jbtRegister = new JButton("Register");
    

    public MaintainProgrammeFrame() {
        progControl = new MaintainProgrammeControl();
        
        JPanel jpCenter = new JPanel(new GridLayout(3, 2));
        jpCenter.add(new JLabel("User Name"));
        jpCenter.add(jtfUsername);
        jpCenter.add(new JLabel("Password"));
        jpCenter.add(jtfPassword);
        
        add(jpCenter);

        JPanel jpSouth = new JPanel();
        jpSouth.add(jbtLogin);
        jpSouth.add(jbtRegister);
        
        add(jpSouth, BorderLayout.SOUTH);

        

        
    }

    private class RetrieveListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            String code = jtfCode.getText();
            Programme programme = progControl.selectRecord(code);
            if (programme != null) {
                jtfName.setText(programme.getName());
                jtfFaculty.setText(programme.getFaculty());
            } else {
                JOptionPane.showMessageDialog(null, "No such programme code.", "RECORD NOT FOUND", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public static void main(String[] args) {
          MaintainProgrammeFrame frm=new MaintainProgrammeFrame();   
          frm.setTitle("Hoot 9 E");
          frm.setSize(600, 200);
          frm.setLocationRelativeTo(null);
          frm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
          frm.setVisible(true);
    }
}
