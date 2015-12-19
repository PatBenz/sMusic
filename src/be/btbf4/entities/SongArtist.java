package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the songartist database table.
 * 
 */
@Entity
@NamedQuery(name="SongArtist.findAll", query="SELECT s FROM SongArtist s")
public class SongArtist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSongArtist;

	//bi-directional many-to-one association to Artist
	@ManyToOne
	private Artist artist;

	//bi-directional many-to-one association to Song
	@ManyToOne
	private Song song;

	public SongArtist() {
	}

	public int getIdSongArtist() {
		return this.idSongArtist;
	}

	public void setIdSongArtist(int idSongArtist) {
		this.idSongArtist = idSongArtist;
	}

	public Artist getArtist() {
		return this.artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public Song getSong() {
		return this.song;
	}

	public void setSong(Song song) {
		this.song = song;
	}

}