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

namespace Kassasys
{
    /// <summary>
    /// Interaction logic for Onderhoud.xaml
    /// </summary>
    public partial class Onderhoud : Window
    {
        DatabaseDataContext db = new DatabaseDataContext(Properties.Settings.Default.dbkassaConnectionString );

        public Onderhoud()
        {
            InitializeComponent();
            grid_producten.ItemsSource= db.productens;
            grid_klanten.ItemsSource = db.klantens;
            grid_prijzen.ItemsSource = db.prijshistories;
            var ProductSoortSource = (CollectionViewSource)grid_producten.FindResource("productsoorten");
            ProductSoortSource.Source = db.product_soortens;
            var PrijsProductSource = (CollectionViewSource)grid_prijzen.FindResource("productprijzen");
            PrijsProductSource.Source = db.productens;

        }



        private void BtnOpslaan_Klant_Click(object sender, RoutedEventArgs e)
        {
            db.SubmitChanges();
        }

        private void BtnOpslaan_Product_Click(object sender, RoutedEventArgs e)
        {
            db.SubmitChanges();
        }

        private void BtnOpslaan_Prijzen_Click(object sender, RoutedEventArgs e)
        {
            db.SubmitChanges();
        }
    }
}
