package bookshop.shopping;

import java.sql.Timestamp;

public class BuyDataBean {
	private Long buy_id;//援щℓ�븘�씠�뵒
	private String buyer;//援щℓ�옄
	private int book_id;//援щℓ�맂 梨낆븘�씠�뵒
	private String book_title;//援щℓ�맂 梨낅챸
	private int buy_price;//�뙋留ㅺ�
	private byte buy_count;//�뙋留ㅼ닔�웾
	private String book_image;//梨낆씠誘몄�
	private Timestamp buy_date;//援щℓ�씪�옄
	private String account;//寃곗젣怨꾩쥖
	private String deliveryName;//諛곗넚吏�
	private String deliveryTel ;//諛곗넚吏� �쟾�솕踰덊샇
	private String deliveryAddress;//諛곗넚吏� 二쇱냼
	private String sanction;//諛곗넚�긽�솴
	
	public Long getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(Long buy_id) {
		this.buy_id = buy_id;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public byte getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(byte buy_count) {
		this.buy_count = buy_count;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryTel() {
		return deliveryTel;
	}
	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getSanction() {
		return sanction;
	}
	public void setSanction(String sanction) {
		this.sanction = sanction;
	}
}