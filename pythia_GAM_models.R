library(mgcv)
library(dplyr)
library(ggplot2)
library(tidyr)

GAM_vars <- read.csv("gam_vars.csv")
names(GAM_vars) <- trimws(names(GAM_vars))

GAM_vars <- GAM_vars %>%
  mutate(
    IA_FIRST_FIXATION_DURATION = as.numeric(as.character(IA_FIRST_FIXATION_DURATION)),
    IA_FIRST_RUN_DWELL_TIME = as.numeric(as.character(IA_FIRST_RUN_DWELL_TIME)),
    IA_DWELL_TIME = as.numeric(as.character(IA_DWELL_TIME)),
    NEXT_IA_DWELL_TIME = as.numeric(as.character(NEXT_IA_DWELL_TIME))
  ) %>%
  filter(
    is.finite(IA_FIRST_FIXATION_DURATION),
    is.finite(IA_FIRST_RUN_DWELL_TIME),
    is.finite(IA_DWELL_TIME),
    is.finite(NEXT_IA_DWELL_TIME)
  )

clean_fix <- GAM_vars %>%
  mutate(
    IA_FIRST_FIXATION_DURATION = as.numeric(IA_FIRST_FIXATION_DURATION)
  ) %>%
  filter(
    !is.na(IA_FIRST_FIXATION_DURATION)
  )

clean_run <- GAM_vars %>%
  mutate(
    IA_FIRST_RUN_DWELL_TIME = as.numeric(IA_FIRST_RUN_DWELL_TIME)
  ) %>%
  filter(
    !is.na(IA_FIRST_RUN_DWELL_TIME)
  )

bam_curr_rt <- bam(
  IA_DWELL_TIME ~ s(word_length_no_punctuation, k = 15) +
    s(word_logfrequency, k = 15) +
    s(pythia_surprisal, k = 15),
  data = GAM_vars,
  family = gaussian(),
  discrete = TRUE,        # speeds up fitting for large datasets
  nthreads = 4            # adjust for your CPU
)

summary(bam_curr_rt)
saveRDS(bam_curr_rt, file="pythia_GAM_models/bam_curr_rt.rds")

bam_next_rt <- bam(
  NEXT_IA_DWELL_TIME ~ s(word_length_no_punctuation, k = 10) +
    s(word_logfrequency, k = 10) +
    s(pythia_surprisal, k = 15),
  data = GAM_vars,
  family = gaussian(),
  discrete = TRUE,        # speeds up fitting for large datasets
  nthreads = 4            # adjust for your CPU
)

summary(bam_next_rt)
saveRDS(bam_next_rt, file="pythia_GAM_models/bam_next_rt.rds")

bam_first_fix_dur <- bam(
  IA_FIRST_FIXATION_DURATION ~ s(word_length_no_punctuation, k = 10) +
    s(word_logfrequency, k = 10) +
    s(pythia_surprisal, k = 10),
  data = GAM_vars,
  family = gaussian(),
  discrete = TRUE,        # speeds up fitting for large datasets
  nthreads = 4            # adjust for your CPU
)

summary(bam_first_fix_dur)
saveRDS(bam_first_fix_dur, file="pythia_GAM_models/bam_first_fix_dur.rds")

bam_first_run_dwell <- bam(
  IA_FIRST_RUN_DWELL_TIME ~ s(word_length_no_punctuation, k = 10) +
    s(word_logfrequency, k = 15) +
    s(pythia_surprisal, k = 15),
  data = GAM_vars,
  family = gaussian(),
  discrete = TRUE,        # speeds up fitting for large datasets
  nthreads = 4            # adjust for your CPU
)

summary(bam_first_run_dwell)
saveRDS(bam_first_run_dwell, file="pythia_GAM_models/bam_first_run_dwell.rds")
