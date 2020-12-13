/*****************************************************************************************************************
NAME:    dbo.v_CountTotalAccount
		 dbo.v_CountTotalAccount view
		 dbo.v_TotalLoanAmountByBranch 
	   	 dbo.v_AccountCurrentBalance 
		 dbo.v_LoanDescription 
		 dbo.v_LoanOpenDatesByYear 
PURPOSE: Create the dbo.v_CountTotalAccount view
					dbo.v_TotalLoanAmountByBranch view
					dbo.v_AccountCurrentBalance view
					dbo.v_LoanDescription view
					dbo.v_LoanOpenDatesByYear view
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/02/2020   UUDO       1. Built this table for LDS BC IT240
RUNTIME: 
Approx. 1 min
NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

--(1) Open dates for loans

CREATE VIEW v_LoanOpenDatesByYear AS 
SELECT acd.acct_id, 
       YEAR(acd.open_date) AS open_date_year, 
       SUM(acd.loan_amt) AS _total_loan_amt
FROM dbo.tblAccountsDim AS acd
WHERE acd.open_date = '2018' 
GROUP BY YEAR(acd.open_date), 
         acd.loan_amt,
         acd.acct_id
ORDER BY open_date_year;

--(2) Describe loans by branch

CREATE VIEW v_LoanDescription AS 
SELECT acd.branch_id, COUNT(1) AS total, 
       acd.loan_amt, 
       bd.branch_desc, 
       SUM(acd.loan_amt) AS 'branch_laons'
FROM dbo.tblBranchDim AS bd
     JOIN dbo.tblAccountsDim AS acd ON acd.branch_id = bd.branch_id
WHERE 'loan_amt' >= '5000000.0000' AND 
		bd.branch_desc = 'Franklin' OR 
		bd.branch_desc = 'Springfield'
GROUP BY acd.branch_id, 
         acd.loan_amt, 
         bd.branch_desc
ORDER BY 1;

--(3)Max Current Balance

CREATE VIEW v_MaxAccountCurrentBalance as
SELECT af.as_of_date,  
       MAX(af.cur_bal) AS max_bal
FROM dbo.tblAccountFacts AS af
WHERE (af.as_of_date) > '2017-12-31' AND 
	  (af.cur_bal) > '50000'
GROUP BY af.as_of_date;

--(4) Loan Amounts (copied)

CREATE VIEW v_GeorgeTownLoanAmount as 
SELECT brd.branch_id, 
       brd.branch_desc, 
       acd.pri_cust_id,
       SUM(loan_amt) AS 'total_loan_amt'
FROM dbo.tblAccountsDim AS acd
     JOIN dbo.tblBranchDim AS brd ON brd.branch_id = brd.branch_id
WHERE brd.branch_id = 10
GROUP BY brd.branch_id, 
         brd.branch_desc, 
         acd.pri_cust_id;

--(5) Count of Accounts

CREATE VIEW  v_CountTotalAccountIdByBranch as 
SELECT bd.branch_desc, 
       acd.open_date, 
       COUNT(acd.branch_id) AS 'count_branch'
FROM dbo.tblAccountsDim AS acd
     JOIN dbo.tblBranchDim AS bd ON acd.branch_id = bd.branch_id
WHERE YEAR(acd.open_date) = '2019'
      AND bd.branch_desc = 'Clinton'
      OR bd.branch_desc = 'Greenville'
	  AND acd.open_date > '2018-12-31'
GROUP BY bd.branch_desc, 
         acd.open_date
ORDER BY acd.open_date,
        bd.branch_desc;

  --(6) Branch Transactions

  CREATE VIEW v_MaxTransactionAMountByBranch AS 
SELECT  t.tran_type_desc,  
       MAX(f.tran_amt) AS t_amt, 
       COUNT(f.tran_fee_amt) AS t_fee_amt, 
       b.branch_desc
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON f.tran_type_id = t.tran_type_id
     JOIN dbo.tblBranchDim AS b ON b.branch_id = f.branch_id
WHERE f.tran_fee_amt > '1000'
      AND f.tran_amt > '500000'
GROUP BY t.tran_type_id, 
         t.tran_type_code, 
         t.tran_type_desc,
		 b.branch_desc,
         t.tran_fee_prct;

--(7) Volume of Transation

CREATE VIEW v_VolumeOfTransactionByBranch AS 
SELECT MAX(a.loan_amt) AS laon_amt, 
       a.open_date, 
       COUNT(a.pri_cust_id) AS pri_cust, 
       b.branch_desc,
	   COUNT(t.tran_amt) AS tran_amt
FROM dbo.tblAccountsDim AS a
     JOIN dbo.tblBranchDim AS b ON a.branch_id = b.branch_id
     JOIN dbo.tbltransactionFacts AS t ON t.branch_id = b.branch_id
WHERE a.open_date = '2018-12-31'
      OR a.open_date = '2019-05-31'
GROUP BY a.open_date, 
         b.branch_desc
ORDER BY b.branch_desc;

--(8) Transaction Frequency

CREATE VIEW v_TransactionFrequency AS 
SELECT f.branch_id,
	   t.tran_type_desc,  
       COUNT(f.tran_time) AS tran_time, 
       f.tran_date 
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON f.tran_type_id = t.tran_type_id
 WHERE f.tran_date > '2017-12-31'
GROUP BY  t.tran_type_desc,
		  f.tran_date,
		  f.branch_id
ORDER BY f.branch_id,
	     tran_date;

 --(9)Transaction Type 
 
 CREATE VIEW v_transactionTypeByBranch AS 
SELECT t.tran_type_id, 
       COUNT(t.tran_type_desc) AS count_tran_type,
	   t.tran_type_desc,
       b.branch_desc
FROM dbo.tbltransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
     JOIN dbo.tblBranchDim AS b ON b.branch_id = f.branch_id
GROUP BY t.tran_type_id,
		 t.tran_type_desc,
		 b.branch_desc;

--(10)Transaction Profit

CREATE VIEW v_TransactionProfitByBranch AS 
SELECT (f.tran_amt * f.tran_fee_amt/100) AS profit,         
       t.tran_type_desc, 
       b.branch_id, 
       b.branch_desc 
FROM dbo.tblTransactionstypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
     JOIN dbo.tblBranchDim AS b ON f.branch_id = b.branch_id
WHERE (f.tran_amt * f.tran_fee_amt/100) > 1
GROUP BY t.tran_type_desc,
		 b.branch_id,
		 f.tran_fee_amt,
		 b.branch_desc,
		 f.tran_amt;
ORDER BY b.branch_id;

--(11) Transaction Amounts and Fees

CREATE VIEW v_TransactionAmountAndFees AS 
SELECT --t.tran_type_code, 
       t.tran_type_desc, 
       SUM(f.tran_amt *t.tran_fee_prct/100) AS fee_ratio, 
       SUM(f.tran_amt) AS tran_amt, 
       f.tran_fee_amt,
	   f.branch_id
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
GROUP BY --t.tran_type_code,
		 f.tran_fee_amt,
		 f.branch_id,
         t.tran_type_desc
HAVING SUM(f.tran_amt *t.tran_fee_prct/100) > 1
ORDER BY f.branch_id;

--(12) Customers Branch Transactions

CREATE VIEW v_CustomersBranchTransactions AS 
SELECT TOP (50) c.first_name, 
       c.last_name, 
       --c.cust_since_date, 
       c.gender, 
       MAX(f.tran_amt) AS max_tran_amt, 
       b.branch_desc, 
       t.tran_type_desc
FROM dbo.tblCustomersDim AS c
     JOIN dbo.tblBranchDim AS b ON b.branch_id = c.branch_id
     JOIN dbo.tblTransactionFacts AS f ON f.branch_id = b.branch_id
     JOIN dbo.tblTransactionsTypeDim AS t ON t.tran_type_id = f.tran_type_id
GROUP BY c.first_name, 
       c.last_name, 
       --c.cust_since_date,
       c.gender,
	   --f.tran_amt,
	   b.branch_desc, 
       t.tran_type_desc
HAVING MAX(f.tran_amt) > '1000000';