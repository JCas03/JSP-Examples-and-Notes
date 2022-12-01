package Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="instructor")
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    protected int id;

    @Column(name="name")
    protected String name;

    @Column(name="email")
    protected String email;

    @Column(name="country")
    protected String country;


    public User(String name, String email, String country) {
        super();
        this.name = name;
        this.email = email;
        this.country = country;
    }

}
