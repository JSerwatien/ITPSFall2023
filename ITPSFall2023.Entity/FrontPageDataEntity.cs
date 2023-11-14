using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Entity
{
    public class FrontPageDataEntity
    {
        public List<TicketEntity> MostRecentTickets { get; set; }
        public List<TicketEntity> WaitingForUserTickets { get; set; }
        public List<TicketEntity> AssignedToMeTickets { get; set; }
        public List<MonthEntity> MonthlyCount { get; set; }
        public List<MonthEntity> DepartmentMonthlyCount { get; set; }
        public int TotalTicketCount { get; set; }
        public int TotalOpenTicketCount { get; set; }
        public int UserTicketCount { get; set; }
        public int MyOpenTicketCount { get; set; }
        public int MyClosedTicketCount { get; set; }
        public List<StringIntEntity> PastDueCountList { get; set; }
        public Exception ErrorObject { get; set; }
        public string PageMessage { get; set; }
    }
}
