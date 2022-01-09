package DAO.data_JavaBean;

public class orders {
    private String o_num;
    private String username;
    private String identifier;
    private double new_price;
    private Integer quantity;
    private double order_price;
    private String o_date;
    private String book_pic;
    private String depiction;

    public String getO_num(){
        return o_num;
    }

    public void setO_num(String o_num){
        this.o_num = o_num;
    }

    public String getUsername(){
        return username;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public String getIdentifier(){
        return identifier;
    }

    public void setIdentifier(String identifier){
        this.identifier = identifier;
    }

    public Double getNew_price(){
        return new_price;
    }

    public void setNew_price(Double new_price){
        this.new_price = new_price;
    }

    public Integer getQuantity(){
        return quantity;
    }

    public void setQuantity(Integer quantity){
        this.quantity = quantity;
    }

    public Double getOrder_price(){
        return order_price;
    }

    public void setOrder_price(Double order_price){
        this.order_price = order_price;
    }

    public String getO_date(){
        return o_date;
    }

    public void setO_date(String o_date){
        this.o_date = o_date;
    }

    public String getBook_pic() {
        return book_pic;
    }

    public void setBook_pic(String book_pic) {
        this.book_pic = book_pic;
    }

    public String getDepiction() {
        return depiction;
    }

    public void setDepiction(String depiction) {
        this.depiction = depiction;
    }
}
