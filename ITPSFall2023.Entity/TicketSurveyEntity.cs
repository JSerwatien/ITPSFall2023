using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITPSFall2023.Entity
{
    public class TicketSurveyEntity
    {
        public int TicketKey { get; set; }
        public List<TicketSurveyItemEntity> SurveyItems { get; set; }
        public Exception ErrorObject { get; set; }
    }
}
