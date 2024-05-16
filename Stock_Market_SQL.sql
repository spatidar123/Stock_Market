create database Stock_Market;

use Stock_Market; 


                                 #---------------Average Daily Trading Volume-------------#

		select Ticker, concat(round(sum(`Volume`)/10000000,1),"M") 
          from stock_market_dataset
			group by Ticker;
                  
                  #-------------------------Most Volatile Stocks---------------#

		select distinct Ticker, max(Beta) from stock_market_dataset
			group by Ticker
              order by max(Beta);

                        #-------------Stocks with Highest Dividend and Lowest Dividend---------------#

              Select Ticker, sum(`Dividend Amount`) 
                from stock_market_dataset
                  group by Ticker
				    order by sum(`Dividend Amount`) desc;

                                                  #-------------Highest and Lowest P/E Ratios-------------------#

            select Ticker, max(`PE Ratio`), min(`PE Ratio`) from stock_market_dataset
                 group by Ticker
                   order by max(`PE Ratio`);

                                         #-----------Stocks with Highest Market Cap------------#

         select Ticker, concat(round(sum(`Market Cap`)/1000000000,0),"T") as Highest_Market_Cap 
           from stock_market_dataset
		     group by Ticker
				order by 'Ticke', sum(`Market Cap`) desc;

						#---------Stocks with Strong Buy Signals and stocks with Strong Selling Signa--------#
                                        
        select Ticker, Date,
           case
              when ('RSI (14 days)' < 45 and MACD > 0) then "Buy the stock"
			    when (`RSI (14 days)` >= 69 and `MACD` < 0) then "sell the stock"
                     else "Hold"
                       end as action
                       from stock_market_dataset;
                       
                                             #--------------------------------------------------#
                      
