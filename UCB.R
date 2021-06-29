# Upper COnfidence Bound

#importing the dataset

dataset = read.csv('Ads_CTR_Optimisation.csv')

#implementing the UCB
N = 10000
d = 10
ads_selectd = integer(d)
number_of_selection = integer(d)
sum_of_reward = integer(d)
total_reward = 0
for(n in 1:N){
  ad = 0
  max_upper_bound = 0
  for (i in 1:d){
    if (number_of_selection[i] > 0){
      average_reward = sum_of_reward[i] / number_of_selection[i]
      delta_i = sqrt(3/2*log(n) / number_of_selection[i])
      upper_bound =  average_reward + delta_i 
    }else{
      upper_bound = 1e400
    }

    if (upper_bound > max_upper_bound){
      max_upper_bound = upper_bound
      ad=i
    }
  }
  ads_selectd = append(ads_selectd, ad)
  number_of_selection[ad] = number_of_selection[ad] + 1
  reward = dataset[n, ad]
  sum_of_reward[ad] = sum_of_reward[ad] + reward
  total_reward = total_reward + reward
}


#Visualising the result - Histogram

hist(ads_selectd, col = 'blue',
     main = 'HIstogram of ads Selected',
     xlab = 'ads', 
     ylab = 'Number of time each ad was selected')






























    
  







