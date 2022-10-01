package Games;

import java.util.Random;
import java.util.Scanner;

public class BS31 {
	public void gameMenu() {
		System.out.println("1.게임시작");
		System.out.println("2.게임 설명");
		System.out.println("3.랭킹 조회");
		System.out.println("4.게임 종료");
	}
	
	public void gameStart() {
		
	}
}


class BaskinsRobins {

	public static void main(String[] args) {
		boolean play = true;
		System.out.println("1.게임시작");
		System.out.println("2.게임 설명");
		System.out.println("3.랭킹 조회");
		System.out.println("4.게임 종료");
		Scanner scanner = new Scanner(System.in);

		while (play) {

			System.out.println("숫자를 입력: ");
			int opt = scanner.nextInt();
			System.out.println(opt);
			switch (opt) {
			case 1:
				Computer cpu = new Computer();
				Random rand = new Random();
				int sum = 0 ;
				int guess = 1;
				while(!(sum == 32)) {
					if(sum==30) {
						System.out.println("패배!");
						break;
					}
					System.out.println("(1~3)의 숫자를 입력: ");
					guess = scanner.nextInt();
					if(!(guess>=1 &&guess<=3)) {
						System.out.println("잘못된 숫자입력! 다시 입력해주세요:");
						guess = scanner.nextInt();
					}
					for(int i=1;i<=guess;i++) {
						sum++;
						System.out.println("플레이어: "+sum);
					}
					if(sum==30) {
						System.out.println("승리!");
						break;
					}
					//cpu 차례
					guess = rand.nextInt(2)+1;
					if(!(sum%4==2)) {
						guess=1;
						while(!((sum+guess)%4==2)&&guess<=3) {
							guess++;
						}
					}
					for(int i=1;i<=guess;i++) {
						sum++;
						System.out.println(cpu.name+": "+sum);
					}
				}
				break;
			case 2:
				System.out.println("최대 1~3의 숫자를 부를 수 있고 숫자를 건너뛸수 없음");
				System.out.println("한 사람이 부르면 다음 사람이 부름");
				System.out.println("31을 부르는 사람이 지는 게임!");
				break;
			// 대충 게임 설명

			case 3:
				break;
			// 대충 랭킹 조회
			case 4:
				play = false;
				break;
			default:
				System.out.println("잘못된 숫자 입력!");
			}
			scanner.nextLine();
		}

	}

}

class Computer{
	String name = "cpu";
	String level = "default";	//난이도 설정때 재설정
}