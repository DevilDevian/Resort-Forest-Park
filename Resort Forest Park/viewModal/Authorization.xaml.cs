using System;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;
using Resort_Forest_Park.entities;
using Resort_Forest_Park.viewModal;

namespace Resort_Forest_Park
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        int login_error_count = 0;
        DispatcherTimer timer = new DispatcherTimer();
        int s = 10;

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
                DragMove();
        }

        private void closeProgramm_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show(
                "Вы действительно хотите закрыть программу?",
                "Выход",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
                Close();
        }

        private void help_pr_Click(object sender, RoutedEventArgs e)
        {
            About_us about_Us = new About_us();
            about_Us.ShowDialog();
        }
        private void PassTb_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (PassTb.Password == "" | PassTb.Password == null)
                Passtextblock.Visibility = Visibility.Visible;
            else
                Passtextblock.Visibility=Visibility.Hidden;
        }
        private void LogBtn_Click(object sender, RoutedEventArgs e)
        {
            Administrator admin = new Administrator();
            Shift_Supervisor shift_Supervisor = new Shift_Supervisor();
            Seller seller = new Seller();
            Captcha captcha = new Captcha();

            App.db_ForestPark = new db_ForestParkEntities3();

            if (logTb.Text == "" | PassTb.Password == "")
                MessageBox.Show(
                    "Введите все данные", 
                    "Ошибка", 
                    MessageBoxButton.OK, 
                    MessageBoxImage.Error);
            else
            {
                try
                {
                    var staff = AppCon.db_ForestParkEntities.Staffs.FirstOrDefault
                        (x => x.login == logTb.Text && x.password == PassTb.Password);

                    if(staff == null)
                    {
                        MessageBox.Show(
                            "Неверное имя аккаунта или пароль",
                            "Ошибка авторизации!",
                            MessageBoxButton.OK,
                            MessageBoxImage.Error);

                        login_error_count++;

                        if (login_error_count == 3)
                        {
                            captcha.ShowDialog();
                        }
                        if(login_error_count > 3)
                        {
                            MessageBox.Show(
                            "Вход не выполнен, вход будет заблокирован 10 секунд",
                            "Ошибка авторизации!",
                            MessageBoxButton.OK,
                            MessageBoxImage.Error);

                            s = 20;

                            login_error_count = 0;

                            timer.Interval = TimeSpan.FromSeconds(1);
                            timer.Tick += Timer_Tick;
                            timer.Start();
                        }
                    }
                    else
                    {
                        switch (staff.id_type)
                        {
                            case 1: MessageBox.Show(
                                    "Вход выполнен",
                                    "Login",
                                    MessageBoxButton.OK,
                                    MessageBoxImage.Information);
                                    
                                    admin.Show();
                                    Close();
                                break;

                            case 2: MessageBox.Show(
                                    "Вход выполнен",
                                    "Login",
                                    MessageBoxButton.OK,
                                    MessageBoxImage.Information);

                                    shift_Supervisor.Show();
                                    Close();
                                break;

                            case 3: MessageBox.Show(
                                    "Вход выполнен",
                                    "Login",
                                    MessageBoxButton.OK,
                                    MessageBoxImage.Information);

                                    seller.Show();
                                    Close();
                                break;

                            default: MessageBox.Show(
                                     "Данные не обнаружены", 
                                     "Уведомление",
                                     MessageBoxButton.OK, 
                                     MessageBoxImage.Warning);

                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(
                        ex.Message.ToString(),
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);
                }
            }
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            BlockTime.Visibility = Visibility.Visible;
            BlockTime.Text = "Время блокировки: " + Convert.ToString(s);

            if (s > 0)
            {
                s = s - 1;
                BlockTime.Text = "Время блокировки: " + Convert.ToString(s);

                logTb.IsEnabled = false;
                PassTb.IsEnabled = false;
                LogBtn.IsEnabled = false;
            }
            else
            {
                logTb.IsEnabled = true;
                PassTb.IsEnabled = true;
                LogBtn.IsEnabled = true;
            }
            if (s == 0)
            {
                BlockTime.Visibility = Visibility.Hidden;
            }
        }
    }
}