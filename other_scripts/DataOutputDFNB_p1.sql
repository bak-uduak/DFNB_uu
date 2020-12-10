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