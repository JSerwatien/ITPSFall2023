using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Data.Code
{
    public class LocalFunctions
    {
        public static string ScrubValueForSQL(string theValue)
        {
            if (!string.IsNullOrEmpty(theValue)) { theValue = theValue.Replace("'", "''"); }
            return theValue;
        }
        public static bool IsNumeric(string s)
        {
            float output;
            return float.TryParse(s, out output);
        }
    }
}
