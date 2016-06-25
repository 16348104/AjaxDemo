package model;

import java.io.Serializable;

/**
 * @author mingfei.net@Gmail.com
 *         21:24, 6/25/16.
 */
public class User implements Serializable {
    private Integer id;
    private String email;
    private String password;

    public User() {
    }

    public User(Integer id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }


    // java.lang.Class
    public static void main(String[] args) throws ClassNotFoundException {
        User user = new User();
        System.out.println(user.getClass());
        System.out.println(Class.forName("model.User"));
        System.out.println(User.class);

        System.out.println(int.class);
        System.out.println(Integer.class);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
