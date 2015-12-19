package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the song database table.
 * 
 */
@Entity
@NamedQuery(name="Song.findAll", query="SELECT s FROM Song s")
public class Song implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSong;

	private String duration;

	private double songPrice;

	private String songURL;

	private String title;

	private int year;

	//bi-directional many-to-one association to AlbumSong
	@OneToMany(mappedBy="song")
	private List<AlbumSong> albumsongs;

	//bi-directional many-to-one association to Genre
	@ManyToOne
	private Genre genre;

	//bi-directional many-to-one association to SongArtist
	@OneToMany(mappedBy="song")
	private List<SongArtist> songartists;

	public Song() {
	}

	public int getIdSong() {
		return this.idSong;
	}

	public void setIdSong(int idSong) {
		this.idSong = idSong;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public double getSongPrice() {
		return this.songPrice;
	}

	public void setSongPrice(double songPrice) {
		this.songPrice = songPrice;
	}

	public String getSongURL() {
		return this.songURL;
	}

	public void setSongURL(String songURL) {
		this.songURL = songURL;
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

	public List<AlbumSong> getAlbumsongs() {
		return this.albumsongs;
	}

	public void setAlbumsongs(List<AlbumSong> albumsongs) {
		this.albumsongs = albumsongs;
	}

	public AlbumSong addAlbumsong(AlbumSong albumsong) {
		getAlbumsongs().add(albumsong);
		albumsong.setSong(this);

		return albumsong;
	}

	public AlbumSong removeAlbumsong(AlbumSong albumsong) {
		getAlbumsongs().remove(albumsong);
		albumsong.setSong(null);

		return albumsong;
	}

	public Genre getGenre() {
		return this.genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public List<SongArtist> getSongartists() {
		return this.songartists;
	}

	public void setSongartists(List<SongArtist> songartists) {
		this.songartists = songartists;
	}

	public SongArtist addSongartist(SongArtist songartist) {
		getSongartists().add(songartist);
		songartist.setSong(this);

		return songartist;
	}

	public SongArtist removeSongartist(SongArtist songartist) {
		getSongartists().remove(songartist);
		songartist.setSong(null);

		return songartist;
	}

}