library(mgcv)

wave1 <- read.csv("wave1_GAM.csv")

wave1_clean <- wave1 %>%
  filter(
    !is.na(surprisal), 
    !is.na(word_len),
    !is.na(log_frequency),
    !is.na(lang_code),
    !is.na(lang_fam_code),
    !is.na(lang_script_code),
    !is.na(lang_orth_depth_code),
    !is.na(subj_id)
  ) %>%
  mutate(
    lang = relevel(factor(lang), ref = "en"),
    lang_fam = relevel(factor(lang_fam), ref = "Germanic"),
    lang_script = relevel(factor(lang_script), ref = "Latin"),
    lang_orth_depth = relevel(factor(lang_orth_depth), ref = "Deep"),
    subj_id = factor(subj_id),
    word = factor(word) 
  )

wave2 <- read.csv("wave2_GAM.csv")

wave2_clean <- wave2 %>%
  filter(
    !is.na(surprisal), 
    !is.na(word_len),
    !is.na(log_frequency),
    !is.na(lang_code),
    !is.na(lang_fam_code),
    !is.na(lang_script_code),
    !is.na(lang_orth_depth_code),
    !is.na(subj_id)
  ) %>%
  mutate(
    lang = relevel(factor(lang), ref = "en_uk"),
    lang_fam = relevel(factor(lang_fam), ref = "Germanic"),
    lang_script = relevel(factor(lang_script), ref = "Latin"),
    lang_orth_depth = relevel(factor(lang_orth_depth), ref = "Deep"),
    subj_id = factor(subj_id),
    word = factor(word) 
  )