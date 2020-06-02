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
        bestelitem Nieuw_BestelItem;
        int Bestelling_Id = -1;

        public MainWindow()
        {            
            InitializeComponent();
            grid_bestelitems.ItemsSource = db.bestelitems;
            var PrijzenSource = (CollectionViewSource)grid_bestelitems.FindResource("prijshistories");
            PrijzenSource.Source = db.prijshistories;
            var ProductenSource = (CollectionViewSource)grid_bestelitems.FindResource("producten");
            ProductenSource.Source = db.productens;

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
                NewButton.Tag = lijst[i].id.ToString();
                NewButton.Height = 64;
                NewButton.Width = 110;
                NewButton.Click += Btn_Artikel_Click;
                Grid_Producten.Children.Add(NewButton);
                NewButton.SetValue(Grid.ColumnProperty, i % 3);
                NewButton.SetValue(Grid.RowProperty, i / 3);

            }
            //Canvas_Salade.
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

        private void Ververs_Grid_Bestelling()
        {
            grid_bestelitems.ItemsSource = null;
            grid_bestelitems.ItemsSource = db.bestelitems;
        }

        private void Btn_Artikel_Click(object sender, RoutedEventArgs e)
        {
            int product_id;
            product_id = int.Parse((sender as Button).Tag.ToString());
            if (product_id >= 0 && Bestelling_Id >= 0)
            {

                Nieuw_BestelItem = new bestelitem();
                Nieuw_BestelItem.product_id = product_id;
                Nieuw_BestelItem.bestelling_id = Bestelling_Id;
                Nieuw_BestelItem.aantal = 1;
                db.bestelitems.InsertOnSubmit(Nieuw_BestelItem);
                db.SubmitChanges();

                Ververs_Grid_Bestelling();
                //grid_bestelitems.
                //MessageBox.Show(lijst[0].naam);
            }
            else
            {
                MessageBox.Show("Selecteer eerst een klant");
            }
            
                    
        }

        private void btnBestellen_Click(object sender, RoutedEventArgs e)
        {
            Nieuwe_bestelling frmNieuweBestelling = new Nieuwe_bestelling();
            if (frmNieuweBestelling.ShowDialog() == true)
            {
                Bestelling_Id = frmNieuweBestelling.result;
               // MessageBox.Show(frmNieuweBestelling.result.ToString());
            }
        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
