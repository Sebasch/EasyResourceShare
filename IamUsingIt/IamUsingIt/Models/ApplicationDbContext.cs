using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using IamUsingIt.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;

namespace IamUsingIt.Context
{
    public partial class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {

        public ApplicationDbContext()
            : base("Sequelizer", throwIfV1Schema: false)
        {
        }

        public ApplicationDbContext(string connectionstring)
            : base(connectionstring, throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            var result = new ApplicationDbContext();
            return result;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            if (modelBuilder == null)
            {
                throw new ArgumentNullException("ModelBuilder is NULL");
            }

            base.OnModelCreating(modelBuilder);

            //Defining the keys and relations

            //Identity stuff
            modelBuilder.Entity<ApplicationUser>().ToTable("AspNetUsers");
            modelBuilder.Entity<ApplicationRole>().HasKey<string>(r => r.Id).ToTable("AspNetRoles");
            modelBuilder.Entity<ApplicationUser>().HasMany<ApplicationUserRole>((ApplicationUser u) => u.UserRoles);
            modelBuilder.Entity<ApplicationUserRole>().HasKey(r => new { UserId = r.UserId, RoleId = r.RoleId }).ToTable("AspNetUserRoles");
            
            //Entities
            modelBuilder.Entity<Resource>().HasKey(r => r.ResourceId).ToTable("Resources");
            modelBuilder.Entity<Resource>()
                .HasRequired(r => r.User)
                .WithMany(u => u.Resources)
                .HasForeignKey(r => r.UserGuid);

            modelBuilder.Entity<Reservation>().HasKey(r => r.ReservationId).ToTable("Reservations");
            modelBuilder.Entity<Reservation>()
                .HasRequired(r => r.Resource)
                .WithMany(r => r.Reservations)
                .HasForeignKey(r => r.ResourceId);
        }

        public bool Seed(ApplicationDbContext context)
        {
#if DEBUG
            bool success = false;

            ApplicationRoleManager _roleManager = new ApplicationRoleManager(new RoleStore<ApplicationRole>(context));

            success = this.CreateRole(_roleManager, "Admin", "Global Access");
            if (!success == true) return success;

            success = this.CreateRole(_roleManager, "User", "Restricted to business domain activity");
            if (!success) return success;

            ApplicationUserManager userManager = new ApplicationUserManager(new UserStore<ApplicationUser>(context));

            ApplicationUser adminUser = new ApplicationUser();
            PasswordHasher passwordHasher = new PasswordHasher();

            adminUser.UserName = "admin";
            adminUser.Email = "none@none.com";

            IdentityResult result = userManager.Create(adminUser, "Test123!");

            success = this.AddUserToRole(userManager, adminUser.Id, "Admin");

            var user = new ApplicationUser();

            user.UserName = "user";
            user.Email = "none@none.com";

            result = userManager.Create(user, "Test123!");

            success = this.AddUserToRole(userManager, user.Id, "User");

            if (!success) return success;

            

            //success = this.AddUserToRole(userManager, user.Id, "User");
            //if (!success) return success;

            return success;
#endif
            return true;
        }

        public bool RoleExists(ApplicationRoleManager roleManager, string name)
        {
            return roleManager.RoleExists(name);
        }

        public bool CreateRole(ApplicationRoleManager _roleManager, string name, string description = "")
        {
            var idResult = _roleManager.Create<ApplicationRole, string>(new ApplicationRole(name, description));
            return idResult.Succeeded;
        }

        public bool AddUserToRole(ApplicationUserManager _userManager, string userId, string roleName)
        {
            var idResult = _userManager.AddToRole(userId, roleName);
            return idResult.Succeeded;
        }

        public void ClearUserRoles(ApplicationUserManager userManager, string userId)
        {
            var user = userManager.FindById(userId);
            var currentRoles = new List<IdentityUserRole>();

            currentRoles.AddRange(user.UserRoles);
            foreach (ApplicationUserRole role in currentRoles)
            {
                userManager.RemoveFromRole(userId, role.Role.Name);
            }
        }

        public void RemoveFromRole(ApplicationUserManager userManager, string userId, string roleName)
        {
            userManager.RemoveFromRole(userId, roleName);
        }

        public void DeleteRole(ApplicationDbContext context, ApplicationUserManager userManager, string roleId)
        {
            var roleUsers = context.Users.Where(u => u.UserRoles.Any(r => r.RoleId == roleId));
            var role = context.Roles.Find(roleId);

            foreach (var user in roleUsers)
            {
                this.RemoveFromRole(userManager, user.Id, role.Name);
            }
            context.Roles.Remove(role);
            context.SaveChanges();
        }
    }


    /// <summary>
    /// Context Initializer
    /// </summary>
    public class DropCreateAlwaysInitializer : DropCreateDatabaseAlways<ApplicationDbContext>
    {
        public override void InitializeDatabase(ApplicationDbContext context)
        {
#if DEBUG
            context.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction
                , string.Format("ALTER DATABASE [{0}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE", context.Database.Connection.Database));
#endif

            base.InitializeDatabase(context);
        }

        protected override void Seed(ApplicationDbContext context)
        {
            context.Seed(context);

            base.Seed(context);
        }
    }

    public class ApplicationRoleManager : RoleManager<ApplicationRole>
    {
        public ApplicationRoleManager(IRoleStore<ApplicationRole, string> roleStore)
            : base(roleStore)
        {
        }

        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            return new ApplicationRoleManager(new RoleStore<ApplicationRole>(context.Get<ApplicationDbContext>()));
        }
    }
}