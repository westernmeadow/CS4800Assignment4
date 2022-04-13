public abstract class AccountHolder {
    protected int id;
    protected String address;

    public AccountHolder(int ID, String address) {
        id = ID;
        this.address = address;
    }

    public static int getNextID() {
        return (int)(Math.random() * 1000000 + 1);
    }
}
