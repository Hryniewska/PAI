using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(YourWedding.Startup))]
namespace YourWedding
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
