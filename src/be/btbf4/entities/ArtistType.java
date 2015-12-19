package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the artisttype database table.
 * 
 */
@Entity
@NamedQuery(name="ArtistType.findAll", query="SELECT a FROM ArtistType a")
public class ArtistType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idArtistType;

	private String label;

	//bi-directional many-to-one association to Artist
	@OneToMany(mappedBy="artisttype")
	private List<Artist> artists;

	public ArtistType() {
	}

	public int getIdArtistType() {
		return this.idArtistType;
	}

	public void setIdArtistType(int idArtistType) {
		this.idArtistType = idArtistType;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public List<Artist> getArtists() {
		return this.artists;
	}

	public void setArtists(List<Artist> artists) {
		this.artists = artists;
	}

	public Artist addArtist(Artist artist) {
		getArtists().add(artist);
		artist.setArtisttype(this);

		return artist;
	}

	public Artist removeArtist(Artist artist) {
		getArtists().remove(artist);
		artist.setArtisttype(null);

		return artist;
	}

}