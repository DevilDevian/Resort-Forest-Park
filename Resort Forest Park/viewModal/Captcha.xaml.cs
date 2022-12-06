using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace Resort_Forest_Park.viewModal
{
    /// <summary>
    /// Логика взаимодействия для Captcha.xaml
    /// </summary>
    public partial class Captcha : Window
    {
        public Captcha()
        {
            InitializeComponent();
        }
        private void Im_Loaded(object sender, RoutedEventArgs e)
        {
            Im.Source = ImageSourceFromBitmap(CreateImage(300, 150));
        }
        private string text = String.Empty;
        private Bitmap CreateImage(int Width, int Height)
        {
            Random rnd = new Random();

            //Создадим изображение
            Bitmap result = new Bitmap(Width, Height);

            //Вычислим позицию текста
            int Xpos = rnd.Next(0, Width - 95);
            int Ypos = rnd.Next(15, Height - 25);

            //Добавим различные цвета
            System.Drawing.Brush[] colors = { System.Drawing.Brushes.Black,
                System.Drawing.Brushes.Red,
                System.Drawing.Brushes.RoyalBlue,
                System.Drawing.Brushes.Green,
                System.Drawing.Brushes.DarkBlue
            };

            //Укажем где рисовать
            Graphics g = Graphics.FromImage((System.Drawing.Image)result);

            //Пусть фон картинки будет серым
            g.Clear(System.Drawing.Color.Gray);

            //Сгенерируем текст
            text = String.Empty;
            string ALF = "1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
            for (int i = 0; i < 5; ++i)
                text += ALF[rnd.Next(ALF.Length)];

            //Сгенерируем формат текста
            string[] st =
            {
                "Arial",
                "Times New Roman",
                "Lucida Calligraphy"
             };

            //Нарисуем сгенирируемый текст
            g.DrawString(text,
            new Font(st[rnd.Next(st.Length)], 15),
            colors[rnd.Next(colors.Length)],
            new PointF(Xpos, Ypos));

            //Добавим немного помех
            //Линии из углов
            g.DrawLine(Pens.Black,
            new System.Drawing.Point(0, 0),
            new System.Drawing.Point(Width - 1, Height - 1));
            g.DrawLine(Pens.Black,
            new System.Drawing.Point(0, Height - 1),
            new System.Drawing.Point(Width - 1, 0));
            ////Белые точки
            for (int i = 0; i < Width; ++i)
                for (int j = 0; j < Height; ++j)
                    if (rnd.Next() % 20 == 0)
                        result.SetPixel(i, j, System.Drawing.Color.White);

            return result;
        }

        [DllImport("gdi32.dll", EntryPoint = "DeleteObject")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool DeleteObject([In] IntPtr hObject);

        public ImageSource ImageSourceFromBitmap(Bitmap bmp)
        {
            var handle = bmp.GetHbitmap();
            try
            {
                return Imaging.CreateBitmapSourceFromHBitmap(handle, IntPtr.Zero, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
            }
            finally { DeleteObject(handle); }
        }

        private void UpdateCaptcha_Click(object sender, RoutedEventArgs e)
        {
            Im.Source = ImageSourceFromBitmap(CreateImage(300, 150));
            CaptchaTextBox.Text = "";
        }

        private void OK_Click(object sender, RoutedEventArgs e)
        {
            string TextCaptchaTextBox = CaptchaTextBox.Text;
            if (text == TextCaptchaTextBox)
            {
                Close();
            }
            else
            {
                MessageBox.Show(
                        "Captcha введена не правильно\nПовторите ввод",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);

                CaptchaTextBox.Text = "";
                Im.Source = ImageSourceFromBitmap(CreateImage(300, 150));
            }
        }

        private void Toolbar_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }
    }
}
