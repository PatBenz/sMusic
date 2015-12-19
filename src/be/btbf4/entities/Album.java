package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the album database table.
 * 
 */
@Entity
@NamedQuery(name="Album.findAll", query="SELECT a FROM Album a")
public class Album implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAlbum;

	private String imageURL;

	private double price;

	private String title;

	private int year;

	//bi-directional many-to-one association to Artist
	@ManyToOne
	private Artist artist;

	//bi-directional many-to-one association to Editor
	@ManyToOne
	private Editor editor;

	//bi-directional many-to-one association to Genre
	@ManyToOne
	private Genre genre;

	//bi-directional many-to-one association to AlbumSong
	@OneToMany(mappedBy="album", fetch = FetchType.EAGER)
	private List<AlbumSong> albumsongs;

	public Album() {
	}

	public int getIdAlbum() {
		return this.idAlbum;
	}

	public void setIdAlbum(int idAlbum) {
		this.idAlbum = idAlbum;
	}

	public String getImageURL() {
		return this.imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getYear() {
		return this.year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Artist getArtist() {
		return this.artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public Editor getEditor() {
		return this.editor;
	}

	public void setEditor(Editor editor) {
		this.editor = editor;
	}

	public Genre getGenre() {
		return this.genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public List<AlbumSong> getAlbumsongs() {
		return this.albumsongs;
	}

	public void setAlbumsongs(List<AlbumSong> albumsongs) {
		this.albumsongs = albumsongs;
	}

	public AlbumSong addAlbumsong(AlbumSong albumsong) {
		getAlbumsongs().add(albumsong);
		albumsong.setAlbum(this);

		return albumsong;
	}

	public AlbumSong removeAlbumsong(AlbumSong albumsong) {
		getAlbumsongs().remove(albumsong);
		albumsong.setAlbum(null);

		return albumsong;
	}

}