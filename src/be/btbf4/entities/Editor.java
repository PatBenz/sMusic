package be.btbf4.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the editor database table.
 * 
 */
@Entity
@NamedQuery(name="Editor.findAll", query="SELECT e FROM Editor e")
public class Editor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idEditor;

	private String label;

	//bi-directional many-to-one association to Album
	@OneToMany(mappedBy="editor")
	private List<Album> albums;

	public Editor() {
	}

	public int getIdEditor() {
		return this.idEditor;
	}

	public void setIdEditor(int idEditor) {
		this.idEditor = idEditor;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public List<Album> getAlbums() {
		return this.albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public Album addAlbum(Album album) {
		getAlbums().add(album);
		album.setEditor(this);

		return album;
	}

	public Album removeAlbum(Album album) {
		getAlbums().remove(album);
		album.setEditor(null);

		return album;
	}

}