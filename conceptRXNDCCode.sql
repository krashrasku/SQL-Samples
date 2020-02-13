/* Find drug product containing Clopidogrel by NDC code:   (runs fast)
   Bristol Meyer Squibb's Plavix 75mg capsules: NDC 67544050474  */
	
SELECT * FROM concept 
   WHERE concept_code='67544050474';
