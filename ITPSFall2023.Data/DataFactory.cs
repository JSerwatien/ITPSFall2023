using Microsoft.Data.SqlClient;
using System.Data;

namespace ITPSFall2023.Data
{
    public class DataFactory
    {
        private static readonly string connectionString = "Data Source=localhost;Initial Catalog =ITPSFall2023; Integrated Security = True;TrustServerCertificate=True";
        public static DataSet GetDataSet(string strSQL, string tableName)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(strSQL, connectionString);
                sqlAdapter.Fill(ds, tableName);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}