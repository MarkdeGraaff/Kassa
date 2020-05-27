using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
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
            Initialize_Producten_Canvas(1);
            var lijst = (from klanten in db.klantens select klanten).ToList();
        }

        private void Initialize_Producten_Canvas (int productsoort)
        {
            Grid_Producten.Children.Clear();
            var lijst = (from producten in db.productens where (producten.ps_id == productsoort) select producten ).ToList();

            for (int i = 0; i < lijst.Count; i++)
            {
                Button NewButton = new Button();
                NewButton.Content = lijst[i].naam;
                NewButton.Uid = lijst[i].id.ToString();
                NewButton.Height = 64;
                NewButton.Width = 110;
                NewButton.Click += Btn_Artikel_Click;
                Grid_Producten.Children.Add(NewButton);
                NewButton.SetValue(Grid.ColumnProperty, i % 3);
                NewButton.SetValue(Grid.RowProperty, i / 3);

            }
            //Canvas_Salade.
        }

        private void Panels_Onzichtbaar()
        {
            Grid_Producten.Children.Clear();
        }


        private void But_Salade_Click(object sender, RoutedEventArgs e)
        {
            Grid_Producten.Children.Clear();
            Initialize_Producten_Canvas(1);
        }

        private void But_Fris_Click(object sender, RoutedEventArgs e)
        {
            Grid_Producten.Children.Clear();
            Initialize_Producten_Canvas(2);
        }

        private void Win_Main_Initialized(object sender, EventArgs e)
        {
            Panels_Onzichtbaar();
        }

        private void ButOnderhoud_Click(object sender, RoutedEventArgs e)
        {
            Onderhoud frmOnderhoud = new Onderhoud();
            frmOnderhoud.Show();
        }

        private void But_Snacks_Click(object sender, RoutedEventArgs e)
        {
            Grid_Producten.Children.Clear();
            Initialize_Producten_Canvas(3);
        }

        private void But_Bieren_Click(object sender, RoutedEventArgs e)
        {
            Grid_Producten.Children.Clear();
            Initialize_Producten_Canvas(4);
        }

        private void Btn_Artikel_Click(object sender, RoutedEventArgs e)
        {
            
            MessageBox.Show((sender as Button).Uid);         
        }

        private void btnBestellen_Click(object sender, RoutedEventArgs e)
        {
            Nieuwe_bestelling frmNieuweBestelling = new Nieuwe_bestelling();
            frmNieuweBestelling.Show();
        }
    }
}
