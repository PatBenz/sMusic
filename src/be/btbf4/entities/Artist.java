package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the artist database table.
 * 
 */
@Entity
@NamedQuery(name="Artist.findAll", query="SELECT a FROM Artist a")
public class Artist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idArtist;

	private String name;

	//bi-directional many-to-one association to Album
	@OneToMany(mappedBy="artist")
	private List<Album> albums;

	//bi-directional many-to-one association to ArtistType
	@ManyToOne
	private ArtistType artisttype;

	//bi-directional many-to-one association to SongArtist
	@OneToMany(mappedBy="artist")
	private List<SongArtist> songartists;

	public Artist() {
	}
	
//	public Artist(String name, String type) {
//		
//		this.name = name;
//		this.artisttype.setLabel(type);
//		
//	}

	public int getIdArtist() {
		return this.idArtist;
	}

	public void setIdArtist(int idArtist) {
		this.idArtist = idArtist;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Album> getAlbums() {
		return this.albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public Album addAlbum(Album album) {
		getAlbums().add(album);
		album.setArtist(this);

		return album;
	}

	public Album removeAlbum(Album album) {
		getAlbums().remove(album);
		album.setArtist(null);

		return album;
	}

	public ArtistType getArtisttype() {
		return this.artisttype;
	}

	public void setArtisttype(ArtistType artisttype) {
		this.artisttype = artisttype;
	}

	public List<SongArtist> getSongartists() {
		return this.songartists;
	}

	public void setSongartists(List<SongArtist> songartists) {
		this.songartists = songartists;
	}

	public SongArtist addSongartist(SongArtist songartist) {
		getSongartists().add(songartist);
		songartist.setArtist(this);

		return songartist;
	}

	public SongArtist removeSongartist(SongArtist songartist) {
		getSongartists().remove(songartist);
		songartist.setArtist(null);

		return songartist;
	}

}