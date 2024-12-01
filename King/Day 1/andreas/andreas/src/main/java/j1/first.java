package j1;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class first {
    public static void main(String[] args) {
        ArrayList<Integer> left = new ArrayList<Integer>();
        ArrayList<Integer> right = new ArrayList<Integer>();
        try {
            File myObj = new File("doc.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                String[] split = data.split("   ");
                if(split.length > 0){
                    System.out.println(data + " " + split[0]);
                    left.add(Integer.parseInt(split[0]));
                    right.add(Integer.parseInt(split[1]));
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }


        int sum = 0;
        int smallLeft = 0;
        int smallRight = 0;
        while(left.size() > 0){
            smallLeft = findMin(left);
            smallRight = findMin(right);
            if(smallRight > smallLeft){
                sum += smallRight - smallLeft;
            }else{
                sum += smallLeft - smallRight;
            }
        }
        System.out.println(sum);
    }
    public static int findMin(ArrayList<Integer> list){
        int value = 99999999;
        int index = 0;
        for(int i =0; i < list.size(); i++){
            if(value >= list.get(i)){
                value = list.get(i);
                index = i;
            }
        }
        list.remove(index);
        return value;
    }
}
