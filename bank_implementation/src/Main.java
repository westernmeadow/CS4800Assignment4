public class Main {
    public static void main(String[] args) {
	    IndividualHolder john = new IndividualHolder(AccountHolder.getNextID(),
                "0000 StreetA, CityA, CA 00000", "John Smith", "000-00-0000");
	    CorporateHolder apple = new CorporateHolder(AccountHolder.getNextID(),
                "1111 StreetB, CityB, CB 11111", "(111)111-1111");
	    Account johnAct = new Account(100.0, john);
	    Account appleAct = new Account(1000000000.0, apple);

	    System.out.println(john.convertNameUpperCase(john.getName()));
	    johnAct.deposit(100.0);
	    System.out.println(johnAct.getBalance());

	    appleAct.withdraw(1.0);
	    System.out.println(appleAct.getBalance());
    }
}
