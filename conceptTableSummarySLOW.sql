/* CONCEPT TABLE  Summary of Concepts (Runs slow! took 7 minutes to run!!!!!!!!!!!!!!!!  */
 
SELECT 
     DOMAIN_ID,
     VOCABULARY_ID,
     CONCEPT_CLASS_ID,
     COUNT(*) as CNT
     FROM CONCEPT
     GROUP BY 
        DOMAIN_ID,
        VOCABULARY_ID,
        CONCEPT_CLASS_ID    
     ORDER BY DOMAIN_ID;
