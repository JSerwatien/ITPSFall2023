using ITPSFall2023.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Data.Code
{
    public class OverviewReportFactory
    {
        public static OverviewReportEntity LoadReportData(DateTime fromDate, DateTime thruDate, int closedInd, UserEntity currentUser)
        {
            DataSet ds = new();
            string strSQL = "EXEC dbo.OverviewReport_GetData '{0}', '{1}', {2}";
            OverviewReportEntity returnData = new();
            try
            {
                strSQL = string.Format(strSQL, fromDate, thruDate, closedInd < 0 ? "null" : closedInd);
                ds = DataFactory.GetDataSet(strSQL, "OverviewReportData", currentUser);
                returnData.DetailData = LoadDetailData(ds.Tables[0]);
                returnData.DepartmentCompletionData = LoadDepartmentCompletionData(ds.Tables[1]);
            }
            catch (Exception ex)
            {
                returnData.ErrorObject = ex;
            }
            return returnData;
        }

        private static List<OverviewChartEntity> LoadDepartmentCompletionData(DataTable dataTable)
        {
            List<OverviewChartEntity> returnData = new();
            foreach(DataRow newRow in dataTable.Rows)
            {
                OverviewChartEntity newItem = new();
                newItem.DisplayValue = newRow["Department"].ToString();
                newItem.DataCount = Convert.ToInt32(newRow["DaysToCompletion"].ToString());
                returnData.Add(newItem);
            }
            return returnData;
        }

        private static List<TicketEntity> LoadDetailData(DataTable dataTable)
        {
            
            List<TicketEntity> returnData = new();
            foreach(DataRow newRow in dataTable.Rows)
            {
                TicketEntity newItem = new();
                newItem.TicketKey = Convert.ToInt32(newRow["TicketKey"]);
                newItem.ShortDescription = newRow["ShortDescription"].ToString();
                newItem.Priority = Convert.ToInt32(newRow["Priority"]);
                newItem.CreatedDateTime = Convert.ToDateTime(newRow["DateEntered"]);
                newItem.StatusCode = newRow["StatusCode"].ToString();
                newItem.Status = newRow["Description"].ToString();
                newItem.AssignedToDisplayName = newRow["AssignedTo"].ToString();
                newItem.Department = newRow["Department"].ToString();
                returnData.Add(newItem);
               
            }

            return returnData;

        }
    }
}
