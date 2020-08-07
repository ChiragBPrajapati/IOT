package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;

public class macAdress {

	
	public static String getMacAddrHost(String host) throws IOException, InterruptedException {
        //
		System.out.println("Class called :");
        boolean ok = ping3(host);
        //
        if (ok) {
            InetAddress address = InetAddress.getByName(host);
            String ip = address.getHostAddress();
            return run_program_with_catching_output("arp -a " + ip);
        }
        //
        return null;
        //
    }


 public static boolean ping3(String host) throws IOException, InterruptedException {
        boolean isWindows = System.getProperty("os.name").toLowerCase().contains("win");

        System.out.println("Class called1 :");
        ProcessBuilder processBuilder = new ProcessBuilder("ping", isWindows ? "-n" : "-c", "1", host);
        Process proc = processBuilder.start();

        int returnVal = proc.waitFor();
        return returnVal == 0;
    }

    public static String run_program_with_catching_output(String param) throws IOException {
    	System.out.println("Class called2 param :"+param);
        Process p = Runtime.getRuntime().exec(param);
        
        BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line;
        while ((line = input.readLine()) != null) {
            if (!line.trim().equals("")) {
                // keep only the process name
                line = line.substring(1);
                System.out.println("line "+line); 
                String mac = extractMacAddr(line);
                if (mac.isEmpty() == false) {
                    return mac;
                }
            }

        }
        return null;
    }

    public static String extractMacAddr(String str) {
    	System.out.println("Class called3 :"+str);
        String arr[] = str.split("   ");
        for (String string : arr) {
            if (string.trim().length() == 22) {
                return string.trim().toUpperCase();
            }
        	System.out.println("String :"+string.toString());
        }
        return  str;
    }
	
}



/*192.168.182.181       48-0f-cf-49-10-1d     dynamic*/