library(dplyr)
library(readr)
library(stringr)

# Read the CSV file
loyalty <- read_csv("loyaltypointreport.csv")

# View column names
names(loyalty)

# Clean and standardize column names
loyalty <- loyalty %>%
  rename(
    Total_Spent_raw = `Total dollars spent`,
    Avg_Ticket_raw = `Average ticket`,
    Points_raw = `Point balance as of today`,
    Purchases_raw = `Purchase count`
  ) %>%
  mutate(
    Total_Spent = as.numeric(str_replace_all(Total_Spent_raw, "[$,]", "")),
    Avg_Ticket = as.numeric(str_replace_all(Avg_Ticket_raw, "[$,]", "")),
    Points = as.numeric(Points_raw),
    Purchases = as.numeric(Purchases_raw)
  )

# Define customer segments
loyalty <- loyalty %>%
  mutate(
    Segment = case_when(
      Purchases >= 20 | Total_Spent >= 1000 ~ "High-Value Regulars",
      Purchases >= 5 & Purchases < 20 & Total_Spent >= 100 & Total_Spent < 1000 ~ "Casual Shoppers",
      Purchases == 1 ~ "One-Time / First-Time Buyers",
      Purchases > 1 & Total_Spent < 200 & Points > 200 ~ "Bargain Hunters / Reward Users",
      is.na(Total_Spent) | Purchases == 0 ~ "Dormant Members",
      TRUE ~ "Other"
    )
  )

# Calculate segment percentages
segment_summary <- loyalty %>%
  group_by(Segment) %>%
  summarise(
    Count = n(),
    Avg_Spend = mean(Total_Spent, na.rm = TRUE),
    Avg_Points = mean(Points, na.rm = TRUE)
  ) %>%
  mutate(Percent = round(Count / sum(Count) * 100, 2))

print(segment_summary)

