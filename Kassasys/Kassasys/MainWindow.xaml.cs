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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kassasys
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Panels_Onzichtbaar()
        {
            Canvas_Fris.Visibility = Visibility.Hidden;
            Canvas_Salade.Visibility = Visibility.Hidden;
        }

        private void But_Salade_Click(object sender, RoutedEventArgs e)
        {
            Panels_Onzichtbaar();
            Canvas_Salade.Visibility = Visibility.Visible;
        }

        private void But_Fris_Click(object sender, RoutedEventArgs e)
        {
            Panels_Onzichtbaar();
            Canvas_Fris.Visibility = Visibility.Visible;
        }

        private void Win_Main_Initialized(object sender, EventArgs e)
        {
            Panels_Onzichtbaar();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //temp
        }
    }
}
