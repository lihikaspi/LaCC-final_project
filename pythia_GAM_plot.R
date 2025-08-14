
predict_partial <- function(model, df, feature) {
  other_features <- setdiff(c("word_length_no_punctuation","word_logfrequency","pythia_surprisal"), feature)
  base_vals <- sapply(df[other_features], mean, na.rm = TRUE)
  
  # Create grid for the varying feature
  grid <- data.frame(seq(min(df[[feature]]), max(df[[feature]]), length.out=100))
  names(grid)[1] <- feature  # important: must match model predictor
  
  # Add other features at mean
  for(f in other_features) grid[[f]] <- base_vals[f]
  
  # Predict
  grid$pred <- predict(model, newdata = grid, type = "response")
  grid$feature <- feature
  grid$feature_value <- grid[[feature]]
  return(grid)
}

features <- c("word_length_no_punctuation","word_logfrequency","pythia_surprisal")
models <- list(
  "IA_DWELL_TIME" = bam_curr_rt,
  "NEXT_IA_DWELL_TIME" = bam_next_rt,
  "IA_FIRST_FIXATION_DURATION" = bam_first_fix_dur,
  "IA_FIRST_RUN_DWELL_TIME" = bam_first_run_dwell
)

all_preds <- lapply(features, function(f) {
  df_list <- lapply(names(models), function(mn) {
    df <- predict_partial(models[[mn]], GAM_vars, f)
    df$model <- mn
    df
  })
  bind_rows(df_list)
})

all_preds <- bind_rows(all_preds)

ggplot(all_preds, aes(x = feature_value, y = pred, color = model)) +
  geom_line() +
  facet_wrap(~feature, scales = "free_x") +
  labs(x = "Feature value", y = "Predicted response")

