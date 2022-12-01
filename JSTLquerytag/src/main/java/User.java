import javax.persistence.*;

@Entity

public class User {

    @Id
    private int ssn;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "address")
    private String address;

    @Column(name = "telephone")
    private String phoneNum;
}
