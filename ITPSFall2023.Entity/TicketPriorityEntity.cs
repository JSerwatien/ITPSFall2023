using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Entity
{
    public class TicketPriorityEntity
    {
        public List<TicketEntity> TicketEntities { get; set; }
        public string PageMessage { get; set; }

        public Exception ErrorObject { get; set; }
    }
}
