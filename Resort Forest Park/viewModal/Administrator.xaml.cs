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
    /// Логика взаимодействия для Administrator.xaml
    /// </summary>
    public partial class Administrator : Window
    {
        public Administrator()
        {
            InitializeComponent();

            LoginsStaff.ItemsSource = App.db_ForestPark.Logins.ToList();
        }

        private void PasswordTb_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if(PasswordTb.Password == "" || PasswordTb.Password == null)
                PasswordTb_txtblock.Visibility = Visibility.Visible;
            else
                PasswordTb_txtblock.Visibility=Visibility.Hidden;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(surnameTb.Text == "" || nameTb.Text == "" 
                || patronymicTb.Text == "" || LoginTb.Text == "" 
                || PasswordTb.Password == "" || TypeUsers_tb.Text == "")
            {
                MessageBox.Show("Введены не все данные", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                AppCon.db_ForestParkEntities = new db_ForestParkEntities3();

                Staff staff = new Staff();
                staff.surname = surnameTb.Text;
                staff.name = nameTb.Text;
                staff.patronymic = patronymicTb.Text;
                staff.login = LoginTb.Text;
                staff.password = PasswordTb.Password;
                staff.id_type = Convert.ToInt16(TypeUsers_tb.Text);

                AppCon.db_ForestParkEntities.Staffs.Add(staff);
                AppCon.db_ForestParkEntities.SaveChanges();

                MessageBox.Show("Сотрудник добален", "Добавление",
                    MessageBoxButton.OK, MessageBoxImage.Information);

                surnameTb.Text = "";
                nameTb.Text = "";
                patronymicTb.Text = "";
                LoginTb.Text = "";
                PasswordTb.Password = "";
                TypeUsers_tb.Text = "";
            }
        }

        private void TypeUsers_tb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = "123".IndexOf(e.Text) < 0;
        }

        private void surnameTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (int.TryParse(e.Text, out int i))
            {
                e.Handled = true;
            }
        }
    }
}