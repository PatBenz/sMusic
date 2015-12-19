package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the albumsong database table.
 * 
 */
@Entity
@NamedQuery(name="AlbumSong.findAll", query="SELECT a FROM AlbumSong a")
public class AlbumSong implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAlbumSong;

	//bi-directional many-to-one association to Album
	@ManyToOne
	private Album album;

	//bi-directional many-to-one association to Song
	@ManyToOne
	private Song song;

	private int trackNumber;
	
	public AlbumSong() {
	}

	public int getIdAlbumSong() {
		return this.idAlbumSong;
	}

	public void setIdAlbumSong(int idAlbumSong) {
		this.idAlbumSong = idAlbumSong;
	}

	public Album getAlbum() {
		return this.album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public Song getSong() {
		return this.song;
	}

	public void setSong(Song song) {
		this.song = song;
	}

	public int getTrackNumber() {
		return trackNumber;
	}

	public void setTrackNumber(int trackNumber) {
		this.trackNumber = trackNumber;
	}

}