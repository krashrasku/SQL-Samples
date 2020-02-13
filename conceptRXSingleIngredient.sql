/*  &&&&& SLOW SLOW SLOW SLOW &&&&&

D07: Find single ingredient drugs by ingredient
Description
This query accepts accepts an ingredient concept ID and returns all drugs which contain only one 
ingredient specified in the query. This query is useful when studying drug outcomes for ingredients
 where the outcome or drug-drug interaction effect of other ingredients needs to be avoided.
*/



SELECT
      c.concept_id       AS drug_concept_id,
      c.concept_name     AS drug_concept_name,
      c.concept_class_id AS drug_concept_class_id
FROM concept c
INNER JOIN (
  SELECT drug.cid FROM (
    SELECT a.descendant_concept_id cid, count(*) cnt FROM concept_ancestor a
    INNER JOIN (
      SELECT c.concept_id FROM concept c, concept_ancestor a
      WHERE a.ancestor_concept_id = 1000560
      AND a.descendant_concept_id = c.concept_id AND c.domain_id = 'Drug'
    ) cd ON cd.concept_id = a.descendant_concept_id
    INNER JOIN concept c 
	      ON c.concept_id=a.ancestor_concept_id
        WHERE c.concept_class_id = 'Ingredient'
    GROUP BY a.descendant_concept_id
  ) drug WHERE drug.cnt = 1  -- contains only 1 ingredient
) onesie ON onesie.cid = c.concept_id
WHERE (date('now') >= valid_start_date) AND (date('now') <= valid_end_date)
;
