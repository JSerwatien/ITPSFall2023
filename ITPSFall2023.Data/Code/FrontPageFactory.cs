﻿using ITPSFall2023.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Data.Code
{
    public class FrontPageFactory
    {
        public static FrontPageDataEntity GetFrontPageData(UserEntity currentUser)
        {
            DataSet ds = new ();
            FrontPageDataEntity returnData = new FrontPageDataEntity();
            string strSQL = "EXEC dbo.FrontPageData_SEL " + currentUser.UserProfileKey;

            try
            {
                ds = DataFactory.GetDataSet(strSQL, "FrontPage"); 
                returnData.MonthlyCount = LoadOpenMonthlyCount(ds.Tables[0]);
                returnData.DepartmentMonthlyCount = LoadOpenMonthlyCount(ds.Tables[1]);
                returnData.AssignedToMeTickets = new();
                returnData.WaitingForUserTickets = new();
                returnData.MostRecentTickets = new();
                foreach (DataRow newRow in ds.Tables[2].Rows)
                { returnData.AssignedToMeTickets.Add(TicketFactory.LoadSummaryTicketFromDataRow(newRow)); }
                foreach (DataRow newRow in ds.Tables[3].Rows)
                { returnData.WaitingForUserTickets.Add(TicketFactory.LoadSummaryTicketFromDataRow(newRow)); }
                foreach (DataRow newRow in ds.Tables[4].Rows)
                { returnData.MostRecentTickets.Add(TicketFactory.LoadSummaryTicketFromDataRow(newRow)); }
                returnData.PageMessage = "Welcome Back, " + currentUser.DisplayName;
            }
            catch (Exception ex)
            {
                returnData.ErrorObject = ex;
            }
            return returnData;
        }

     


        private static List<MonthEntity> LoadOpenMonthlyCount(DataTable dataTable)
        {
            List<MonthEntity> returnData = new();
            try
            {
                foreach (DataRow newRow in dataTable.Rows)
                {
                    MonthEntity newMonth = new MonthEntity();
                    newMonth.MonthName = Convert.ToDateTime(newRow["TheMonth"].ToString() + "/1/2000").ToString("MMM");
                    newMonth.MonthNumber = Convert.ToInt16(newRow["TheMonth"]);
                    newMonth.Count = Convert.ToInt32(newRow["C"]);
                    returnData.Add(newMonth);
                }
                return returnData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error loading: " + ex.Message);
            }
        }

    }
}
