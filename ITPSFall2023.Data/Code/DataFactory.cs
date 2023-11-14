using ITPSFall2023.Entity;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Data.Code
{
    public class DataFactory
    {
        private static readonly string connectionString = "Data Source=localhost;Initial Catalog =ITPSFall2023; Integrated Security = True;TrustServerCertificate=True";
        public static DataSet GetDataSet(string strSQL, string tableName, UserEntity currentUser)
        {
            try
            {
                DataSet ds = new DataSet();
                if (IsValidDataToken(currentUser.DataToken))
                {
                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(strSQL, connectionString);
                    sqlAdapter.Fill(ds, tableName);
                    return ds;
                }
                else
                {
                    throw new Exception("Invalid Data Token");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static bool IsValidDataToken(string dataToken)
        {
            string decryptedValue = EncryptionFactory.DecryptString(dataToken);
            if (LocalFunctions.IsDate(decryptedValue))
            {
                return Convert.ToDateTime(decryptedValue) > DateTime.Now.AddDays(-1);
            }
            return false;
        }

    }
}
