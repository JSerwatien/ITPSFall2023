
namespace ITPSFall2023.Entity
{
    public class StartUpObjectEntity
    {
       public List <StatusEntity> Statuses { get; set; }
       public List <UserEntity> Users { get; set; }
       public List <DepartmentEntity> Departments { get; set; } 
        public List<NotificationTypeEntity> NotificationTypes { get; set; }
        public Exception ErrorObject { get; set; }

        //1)    Select statement to get the user information from UserProfile for the passed-in username
        //2)    Select stateents for 4 start-up lists (above)
    }
}
