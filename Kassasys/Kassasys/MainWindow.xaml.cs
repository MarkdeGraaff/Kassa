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
        DatabaseDataContext db = new DatabaseDataContext();
        public MainWindow()
        {            
            InitializeComponent();
            var lijst = (from klanten in db.klantens select klanten).ToList();
        }

        private void Panels_Onzichtbaar()
        {
            Canvas_Fris.Visibility = Visibility.Hidden;
            Canvas_Salade.Visibility = Visibility.Hidden;
            canvas_Snacks.Visibility = Visibility.Hidden;
            canvas_bieren.Visibility = Visibility.Hidden;
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

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void ButOnderhoud_Click(object sender, RoutedEventArgs e)
        {
            Onderhoud frmOnderhoud = new Onderhoud();
            frmOnderhoud.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            
        }

        private void But_Snacks_Click(object sender, RoutedEventArgs e)
        {
            Panels_Onzichtbaar();
            canvas_Snacks.Visibility = Visibility.Visible;
        }

        private void But_Bieren_Click(object sender, RoutedEventArgs e)
        {
            Panels_Onzichtbaar();
            canvas_bieren.Visibility = Visibility.Visible;
        }

        private void But_Weg_Click(object sender, RoutedEventArgs e)
        {
            Panels_Onzichtbaar();
        }
    }
}
