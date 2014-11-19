package br.gov.sibbr.json.response.namecheck;

import java.io.Serializable;

public class OrtographicValidation implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer id;	
	
	private String dwcaId;

	private String nome;
	
	private String rank;

	private String fonteAvaliadora;
	
	private Boolean isNomeEncontrado;
	
	private Boolean isNomeFornecido;
	
	private Boolean isSinonimo;
	
	private String sinonimoDe;
	
	private String classificacaoSuperior;
	
	private String nivelTaxonomico;
	
	public OrtographicValidation() {}

	public OrtographicValidation(Integer id, String dwcaId, String nome,
			String rank, String fonteAvaliadora, Boolean isNomeEncontrado,
			Boolean isNomeFornecido, Boolean isSinonimo, String sinonimoDe,
			String classificacaoSuperior, String nivelTaxonomico) {
		super();
		this.id = id;
		this.dwcaId = dwcaId;
		this.nome = nome;
		this.rank = rank;
		this.fonteAvaliadora = fonteAvaliadora;
		this.isNomeEncontrado = isNomeEncontrado;
		this.isNomeFornecido = isNomeFornecido;
		this.isSinonimo = isSinonimo;
		this.sinonimoDe = sinonimoDe;
		this.classificacaoSuperior = classificacaoSuperior;
		this.nivelTaxonomico = nivelTaxonomico;
	}
	
	/**
	 * Default constructor used by NameCheckResponse
	 * @param classificacaoSuperior
	 * @param fonteAvaliadora
	 * @param isNomeEncontrado
	 * @param isNomeFornecido
	 * @param isSinonimo
	 * @param nome
	 * @param nivelTaxonomico
	 * @param sinonimoDe
	 */
	public OrtographicValidation(String classificacaoSuperior, String fonteAvaliadora, Boolean isNomeEncontrado, 
			Boolean isNomeFornecido, Boolean isSinonimo, String nome, String nivelTaxonomico, String sinonimoDe) {
		super();
		this.nome = nome;
		this.fonteAvaliadora = fonteAvaliadora;
		this.isNomeEncontrado = isNomeEncontrado;
		this.isNomeFornecido = isNomeFornecido;
		this.isSinonimo = isSinonimo;
		this.sinonimoDe = sinonimoDe;
		this.classificacaoSuperior = classificacaoSuperior;
		this.nivelTaxonomico = nivelTaxonomico;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDwcaId() {
		return dwcaId;
	}

	public void setDwcaId(String dwcaId) {
		this.dwcaId = dwcaId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getFonteAvaliadora() {
		return fonteAvaliadora;
	}

	public void setFonteAvaliadora(String fonteAvaliadora) {
		this.fonteAvaliadora = fonteAvaliadora;
	}

	public Boolean getIsNomeEncontrado() {
		return isNomeEncontrado;
	}

	public void setIsNomeEncontrado(Boolean isNomeEncontrado) {
		this.isNomeEncontrado = isNomeEncontrado;
	}

	public Boolean getIsNomeFornecido() {
		return isNomeFornecido;
	}

	public void setIsNomeFornecido(Boolean isNomeFornecido) {
		this.isNomeFornecido = isNomeFornecido;
	}

	public Boolean getIsSinonimo() {
		return isSinonimo;
	}

	public void setIsSinonimo(Boolean isSinonimo) {
		this.isSinonimo = isSinonimo;
	}

	public String getSinonimoDe() {
		return sinonimoDe;
	}

	public void setSinonimoDe(String sinonimoDe) {
		this.sinonimoDe = sinonimoDe;
	}

	public String getClassificacaoSuperior() {
		return classificacaoSuperior;
	}

	public void setClassificacaoSuperior(String classificacaoSuperior) {
		this.classificacaoSuperior = classificacaoSuperior;
	}

	public String getNivelTaxonomico() {
		return nivelTaxonomico;
	}

	public void setNivelTaxonomico(String nivelTaxonomico) {
		this.nivelTaxonomico = nivelTaxonomico;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dwcaId == null) ? 0 : dwcaId.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((rank == null) ? 0 : rank.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrtographicValidation other = (OrtographicValidation) obj;
		if (dwcaId == null) {
			if (other.dwcaId != null)
				return false;
		} else if (!dwcaId.equals(other.dwcaId))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (rank == null) {
			if (other.rank != null)
				return false;
		} else if (!rank.equals(other.rank))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ValidacaoOrtografica [id=" + id + ", dwcaId=" + dwcaId
				+ ", nome=" + nome + ", rank=" + rank + ", fonteAvaliadora="
				+ fonteAvaliadora + ", isNomeEncontrado=" + isNomeEncontrado
				+ ", isNomeFornecido=" + isNomeFornecido + ", isSinonimo="
				+ isSinonimo + ", sinonimoDe=" + sinonimoDe
				+ ", classificacaoSuperior=" + classificacaoSuperior
				+ ", nivelTaxonomico=" + nivelTaxonomico + "]";
	}	
}
