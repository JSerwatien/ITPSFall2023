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
            throw new NotImplementedException();
        }

        private static List<TicketEntity> LoadDetailData(DataTable dataTable)
        {
            throw new NotImplementedException();
        }
    }
}
