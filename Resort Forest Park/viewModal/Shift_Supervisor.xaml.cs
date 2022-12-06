using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Resort_Forest_Park.entities;

namespace Resort_Forest_Park.viewModal
{
    /// <summary>
    /// Логика взаимодействия для Shift_Supervisor.xaml
    /// </summary>
    public partial class Shift_Supervisor : Window
    {
        public Shift_Supervisor()
        {
            InitializeComponent();

            OrdersDgv.ItemsSource = App.db_ForestPark.Orders.ToList();

            idClientsCMB.ItemsSource = App.db_ForestPark.Clients.ToList();
            statusCMB.ItemsSource = App.db_ForestPark.StatusOrders.ToList();

        }

        private void CreareOrder_Click(object sender, RoutedEventArgs e)
        {
            //AppCon.db_ForestParkEntities = new db_ForestParkEntities3();

            //Order order = new Order();
            //order.dateAdd = dateAddOrder.SelectedDate.Value;
            //order.time = Convert(timeOrder.Text);
            //order.id_clients = patronymicTb.Text;
            //order.id_status = LoginTb.Text;
            //order.dateEnd = PasswordTb.Password;
            //order.time_rental_in_minutes = Convert.ToInt16(TypeUsers_tb.Text);

            //AppCon.db_ForestParkEntities.Staffs.Add(staff);
            //AppCon.db_ForestParkEntities.SaveChanges();

            MessageBox.Show("Сотрудник добален", "Добавление",
                MessageBoxButton.OK, MessageBoxImage.Information);

            
        }
    }
}
