using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WeddingsPlanner.Startup))]
namespace WeddingsPlanner
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
