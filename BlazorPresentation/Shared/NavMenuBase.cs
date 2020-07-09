using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;

namespace BlazorPresentation.Shared
{
    public class NavMenuBase : ComponentBase
    {
        [Inject]
        private NavigationManager NavigationManager { get; set; }

        private int slide = 0;

        public void Navigate(KeyboardEventArgs e)
        {
            if (e.Key == "left")
            {
                slide--;
            }
            else if (e.Key == "right")
            {
                slide++;
            }
            NavigationManager.NavigateTo($"/{slide}");
        }
    }
}