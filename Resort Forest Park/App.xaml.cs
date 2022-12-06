using System.Windows;
using Resort_Forest_Park.entities;

namespace Resort_Forest_Park
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static db_ForestParkEntities3 db_ForestPark = 
            new db_ForestParkEntities3();
    }
}