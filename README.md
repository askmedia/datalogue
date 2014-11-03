datalogue
=========

Catalogue des données que nous avons utilisées

* [Les campagnes sont-elles si désertes ?](http://www.parismatch.com/Actu/Societe/Datamatch-Les-campagnes-sont-elles-si-desertes-545849)
	* DataMatch
	* janvier 2014 	
	* data
		* [coordonnes_communes.csv](communes/coordonnes_communes.csv) donne la latitude et la longitude de toutes les communes de France. Le fichier a été obtenu à partir du fichier [ Correspondance entre les codes postaux et codes INSEE des communes Françaises](https://www.data.gouv.fr/fr/dataset/correspondance-entre-les-codes-postaux-et-codes-insee-des-communes-francaises) publié par OpenDataSoft.
		* [data_coordonnees.R](communes/data_coordonnees.R) est le programme R qui permet d'obtenir le fichier coordonnes_communes.csv.

* [Cannes : La palme d'or est-elle la poule aux œufs d'or ?](http://www.parismatch.com/Actu/Economie/Datamatch-Cannes-La-palme-d-or-est-elle-la-poule-aux-oeufs-d-or-564797)
	* DataMatch
	* mai 2014
	* data : [Nombre d'entrées de l'ensemble des films des réalisateurs ayant obtenu la palme d'or du festival de Cannes au cours des 20 dernières années](cannes/filmographies.csv)
	* Sources : Allocine + JPBoxOffice

* [Consommation : Les prix baissent-ils vraiments ?](http://www.parismatch.com/Actu/Economie/Inflation-deflation-les-prix-baissent-ils-vraiment-604292)
	* DataMatch 	
	* date : octobre 2014
	* data : 
		* [Indice des prix mensuel en août 2013 et août 2014 pour tous les produits](deflation/alldata.csv) 
		* [Indice des prix mensuel en août 2013 et août 2014 pour les produits sélectionnés dans la visualisation](deflation/data.csv)
	* sources : [Indice des prix à la consommation harmonisé](http://www.bdm.insee.fr/bdm2/choixCriteres.action?codeGroupe=158)
		
			
* [Les déserts médicaux vont ils disparaître ?](http://www.parismatch.com/Actu/Societe/DataMatch-Les-deserts-medicaux-vont-ils-disparaitre-644798)
	* DataMatch
	* date : octobre 2014
	* data : 
		* [Données représentées](desertsmedicaux/data.csv)
	* sources : 
		* [La démographie des médecins](https://www.data.gouv.fr/fr/datasets/la-demographie-des-medecins-rpps/) (Drees)
		* [Estimation de la population au 1er janvier par région, département (1975-2013), sexe et âge (quinquennal, classes d'âge)](http://www.insee.fr/fr/themes/detail.asp?ref_id=estim-pop&reg_id=99) (Insee)
	