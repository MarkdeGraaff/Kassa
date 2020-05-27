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
    /// Interaction logic for Window1.xaml
    /// </summary>
    /// 


    public partial class Nieuwe_bestelling : Window
    {
        DatabaseDataContext db = new DatabaseDataContext(Properties.Settings.Default.dbkassaConnectionString);

        public Nieuwe_bestelling()
        {
            InitializeComponent();
            grid_klanten.ItemsSource = db.klantens;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (grid_klanten.SelectedItems.Count > 0)
            {

                klanten klantsel = (klanten)grid_klanten.SelectedItems[0];
                int klantid = klantsel.id;
                MessageBox.Show(klantid.ToString());
                
                bestellingen Nieuwe_Bestelling = new bestellingen();
                Nieuwe_Bestelling.datum = System.DateTime.Now;
                Nieuwe_Bestelling.klant_id = klantid;
                db.bestellingens.InsertOnSubmit(Nieuwe_Bestelling);
                db.SubmitChanges();
                this.Close();
            }

            else
            {
                MessageBox.Show("Selecteer klant");
            }



        }
    }
}
