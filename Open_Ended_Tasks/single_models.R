
lang_only_wave1 <- bam(dur ~ lang + 
                 s(word_len) + s(log_frequency) +
                 s(surprisal, by = lang_orth_depth_code) +
                 s(subj_id, bs = "re"),
               data = wave1_clean,
               method = "fREML",
               discrete = TRUE,
               select = FALSE,
               nthreads = 4)

summary(lang_only_wave1)

lang_fam_only_wave1 <- bam(dur ~ lang_fam + 
                       s(word_len) + s(log_frequency) +
                       s(surprisal, by = lang_orth_depth_code) +
                       s(subj_id, bs = "re"),
                     data = wave1_clean,
                     method = "fREML",
                     discrete = TRUE,
                     select = FALSE,
                     nthreads = 4)

summary(lang_fam_only_wave1)

lang_script_only_wave1 <- bam(dur ~ lang_script + 
                       s(word_len) + s(log_frequency) +
                       s(surprisal, by = lang_orth_depth_code) +
                       s(subj_id, bs = "re"),
                     data = wave1_clean,
                     method = "fREML",
                     discrete = TRUE,
                     select = FALSE,
                     nthreads = 4)

summary(lang_script_only_wave1)

lang_orth_depth_only_wave1 <- bam(dur ~ lang_orth_depth + 
                          s(word_len) + s(log_frequency) +
                          s(surprisal, by = lang_orth_depth_code) +
                          s(subj_id, bs = "re"),
                        data = wave1_clean,
                        method = "fREML",
                        discrete = TRUE,
                        select = FALSE,
                        nthreads = 4)

summary(lang_orth_depth_only_wave1)


lang_only_wave2 <- bam(dur ~ lang + 
                   s(word_len) + s(log_frequency) +
                   s(surprisal, by = lang_orth_depth_code) +
                   s(subj_id, bs = "re"),
                 data = wave2_clean,
                 method = "fREML",
                 discrete = TRUE,
                 select = FALSE,
                 nthreads = 4)

summary(lang_only_wave2)

lang_fam_only_wave2 <- bam(dur ~ lang_fam + 
                       s(word_len) + s(log_frequency) +
                       s(surprisal, by = lang_orth_depth_code) +
                       s(subj_id, bs = "re"),
                     data = wave2_clean,
                     method = "fREML",
                     discrete = TRUE,
                     select = FALSE,
                     nthreads = 4)

summary(lang_fam_only_wave2)

lang_script_only_wave2 <- bam(dur ~ lang_script + 
                          s(word_len) + s(log_frequency) +
                          s(surprisal, by = lang_orth_depth_code) +
                          s(subj_id, bs = "re"),
                        data = wave2_clean,
                        method = "fREML",
                        discrete = TRUE,
                        select = FALSE,
                        nthreads = 4)

summary(lang_script_only_wave2)

lang_orth_depth_only_wave2 <- bam(dur ~ lang_orth_depth + 
                              s(word_len) + s(log_frequency) +
                              s(surprisal, by = lang_orth_depth_code) +
                              s(subj_id, bs = "re"),
                            data = wave2_clean,
                            method = "fREML",
                            discrete = TRUE,
                            select = FALSE,
                            nthreads = 4)

summary(lang_orth_depth_only_wave2)

saveRDS(lang_only_wave1, file="GAM_models/lang_only_wave1.rds")
saveRDS(lang_only_wave2, file="GAM_models/lang_only_wave2.rds")
saveRDS(lang_fam_only_wave1, file="GAM_models/lang_fam_only_wave1.rds")
saveRDS(lang_fam_only_wave2, file="GAM_models/lang_fam_only_wave2.rds")
saveRDS(lang_script_only_wave1, 
        file="GAM_models/lang_script_only_wave1.rds")
saveRDS(lang_script_only_wave2, 
        file="GAM_models/lang_script_only_wave2.rds")
saveRDS(lang_orth_depth_only_wave1, 
        file="GAM_models/lang_orth_depth_only_wave1.rds")
saveRDS(lang_orth_depth_only_wave2, 
        file="GAM_models/lang_orth_depth_only_wave2.rds")

