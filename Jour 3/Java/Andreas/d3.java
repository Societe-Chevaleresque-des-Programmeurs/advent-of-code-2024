package d3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class d3 {
    static ArrayList<Interval> listInterval = new ArrayList<>();

    public static void main(String[] args) throws FileNotFoundException {
        //part1();
        part2();
    }
    private static void part2() throws FileNotFoundException {
        File myObj = new File("d31.txt");
        int sum = 0;
        Scanner myReader = new Scanner(myObj);
        ArrayList<Multiply> listMult = new ArrayList<>();
        listInterval.add(new Interval(0,true));
        String data ="";
        while (myReader.hasNextLine()) {
             data = data.concat(myReader.nextLine());
        }
        Pattern MY_PATTERN = Pattern.compile("mul\\(\\d+?,\\d+?\\)");
        Matcher m = MY_PATTERN.matcher(data);
        while (m.find()) {
            String s = m.group(0);
            System.out.println(m.start()+" "+s);
            String[] split = s.split(",");
            ArrayList<Integer> list = new ArrayList<>();
            for(String s1 :split){
                String regexPattern = "[^0-9]";
                s1 = s1.replaceAll(regexPattern, "");
                list.add(Integer.parseInt(s1));
            }
            listMult.add(new Multiply(m.start(),list.get(0) * list.get(1)));
            //System.out.println(list.size() +" "+list.get(0)+ " "+ list.get(1));
        }
        Pattern patternDo = Pattern.compile("do\\(\\)");
        Matcher mdo = patternDo.matcher(data);
        while (mdo.find()) {
            listInterval.add(new Interval(mdo.start(),true));
        }
        Pattern patternDont = Pattern.compile("don't\\(\\)");
        Matcher mdont = patternDont.matcher(data);
        while (mdont.find()) {
            listInterval.add(new Interval(mdont.start(),false));
        }
        listInterval.sort(null);
        for(int i = 0; i < listInterval.size() - 1; i++){
            listInterval.get(i).setEnd(listInterval.get(i+1).getStart());
        }
        listInterval.get(listInterval.size()-1).setEnd(data.length() + 1);
        for(Multiply m3 : listMult){
            if(canBeDone(m3)){
                sum += m3.value;
            }
        }
        System.out.println(sum);
    }
    private static void part1() throws FileNotFoundException {
        File myObj = new File("d31.txt");
        int sum = 0;
        Scanner myReader = new Scanner(myObj);
        while (myReader.hasNextLine()) {
            String data = myReader.nextLine();
            Pattern MY_PATTERN = Pattern.compile("mul\\(\\d+?,\\d+?\\)");
            Matcher m = MY_PATTERN.matcher(data);
            while (m.find()) {
                String s = m.group(0);

                String[] split = s.split(",");
                ArrayList<Integer> list = new ArrayList<>();
                for(String s1 :split){
                    String regexPattern = "[^0-9]";
                    s1 = s1.replaceAll(regexPattern, "");
                    list.add(Integer.parseInt(s1));
                }
                sum += list.get(0) * list.get(1);
                //System.out.println(list.size() +" "+list.get(0)+ " "+ list.get(1));
            }
        }
        System.out.println(sum);
    }
    static boolean canBeDone(Multiply m){
        for(Interval i : listInterval){
            if(i.contain(m)){
                return i.value;
            }
        }
        return false;
    }
}
