using System;
using System.Collections.Generic;
using System.Data;
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
        int Laatste_Geselecteerde_Regel = -1;
        int Klant_Id = -1;
        string sBarcode = "";

        public MainWindow()
        {            
            InitializeComponent();
            grid_bestelitems.ItemsSource = db.bestelitems;
            Initialize_Producten_Canvas(1);
            Ververs_Grid_Bestelling();
            EventManager.RegisterClassHandler(typeof(System.Windows.Controls.Control), FrameworkElement.KeyDownEvent, new KeyEventHandler(Win_Main_KeyDown));
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
            frmOnderhoud.ShowDialog();
            Ververs_Grid_Bestelling();

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

            decimal totaalbedrag = 0;
            db.Dispose();
            db = new DatabaseDataContext();
            var bestelling = db.bestelitems.Where(item => item.bestelling_id == Bestelling_Id);
            var PrijzenSource = (CollectionViewSource)grid_bestelitems.FindResource("prijshistories");
            var actuele_prijs = db.prijshistories.Where(item => item.eind_datum >= DateTime.Today && item.start_datum <= DateTime.Today);
            PrijzenSource.Source = actuele_prijs.ToList();
            var ProductenSource = (CollectionViewSource)grid_bestelitems.FindResource("producten");
            ProductenSource.Source = db.productens;

            grid_bestelitems.ItemsSource = null;
            grid_bestelitems.ItemsSource = bestelling; // db.bestelitems;
            grid_bestelitems.Items.Refresh();

            var items = (from bestelitem in db.bestelitems where (bestelitem.bestelling_id == Bestelling_Id) select bestelitem).ToList();
            foreach (bestelitem item in items)
            {
                var prijzen = (from prijshistory in db.prijshistories where (prijshistory.product_id == item.product_id && prijshistory.eind_datum >= DateTime.Today && prijshistory.start_datum <= DateTime.Today) select prijshistory).FirstOrDefault();
                if (prijzen != null)
                {
                    totaalbedrag += prijzen.prijs * item.aantal;
                }
            }
            txtTotaal.Content = string.Format("{0:C2}", totaalbedrag);
        }

        private void Ververs_Txt_Klant()
        {
            txtBestelling.Content = "Kies knop 'Nieuwe Bestelling' om door te gaan..";
            if ((Klant_Id >= 0) && (Bestelling_Id >= 0))
            {
                var klant = (from klanten in db.klantens where (klanten.id == Klant_Id) select klanten).FirstOrDefault();
                if (klant != null)

                    txtBestelling.Content = string.Format("Bestelling nummmer {0} voor klant {1} {2}", Bestelling_Id, klant.voornaam,klant.achternaam);
            }

        }

        private void Artikel_Aantal_Ophogen(int product_id, int bestelling_id)
        {
            if (product_id >= 0 && bestelling_id >= 0)
            {
                Bestelling_Id = bestelling_id;
                bestelitem item = (from bestelitem in db.bestelitems where (bestelitem.product_id == product_id && bestelitem.bestelling_id == bestelling_id) select bestelitem).SingleOrDefault();
                if (item != null)
                {
                    item.aantal += 1;
                }
                else
                {
                    Nieuw_BestelItem = new bestelitem();
                    Nieuw_BestelItem.product_id = product_id;
                    Nieuw_BestelItem.bestelling_id = bestelling_id;
                    Nieuw_BestelItem.aantal = 1;
                    db.bestelitems.InsertOnSubmit(Nieuw_BestelItem);
                }
                db.SubmitChanges();
                Ververs_Grid_Bestelling();
            }
            else
            {
                MessageBox.Show("Selecteer eerst een klant");
            }
        }

        private void Artikel_Aantal_Verlagen(int product_id, int bestelling_id)
        {
            if (product_id >= 0 && bestelling_id >= 0)
            {
                Bestelling_Id = bestelling_id;
                bestelitem item = (from bestelitem in db.bestelitems where (bestelitem.product_id == product_id && bestelitem.bestelling_id == bestelling_id) select bestelitem).SingleOrDefault();
                if (item != null)
                {
                    if (item.aantal > 1)
                    {
                        item.aantal -= 1;
                    }
                    else
                    {
                        db.bestelitems.DeleteOnSubmit(item);
                    }
                    db.SubmitChanges();
                    Ververs_Grid_Bestelling();
                }
                else
                {
                    MessageBox.Show("Selecteer een bestelitem");
                }
            }
            else
            {
                MessageBox.Show("Selecteer eerst een klant");
            }
         }


        private void Btn_Artikel_Click(object sender, RoutedEventArgs e)
        {
            int product_id;
            product_id = int.Parse((sender as Button).Tag.ToString());
            Artikel_Aantal_Ophogen(product_id, Bestelling_Id);
        }

        private void btnBestellen_Click(object sender, RoutedEventArgs e)
        {
            Nieuwe_bestelling frmNieuweBestelling = new Nieuwe_bestelling();
            if (frmNieuweBestelling.ShowDialog() == true)
            {
                Bestelling_Id = frmNieuweBestelling.result[0];
                Klant_Id = frmNieuweBestelling.result[1];
                Ververs_Grid_Bestelling();
                Ververs_Txt_Klant();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Ververs_Grid_Bestelling();
        }

        private void btnPlus_Click(object sender, RoutedEventArgs e)
        {
            if (grid_bestelitems.SelectedItems.Count > 0)
            {
                Laatste_Geselecteerde_Regel = grid_bestelitems.SelectedIndex;
                bestelitem item = (bestelitem)grid_bestelitems.SelectedItems[0];
                if (item != null)
                {
                    Artikel_Aantal_Ophogen(item.product_id, item.bestelling_id);
                    grid_bestelitems.SelectedIndex = Laatste_Geselecteerde_Regel;
                }
            }
            else
            {
                MessageBox.Show("Selecteer een bestelregel om het aantal te verhogen!");
            }
        }

        private void btnMin_Click(object sender, RoutedEventArgs e)
        {
            if (grid_bestelitems.SelectedItems.Count > 0)
            {   
                Laatste_Geselecteerde_Regel = grid_bestelitems.SelectedIndex;
                bestelitem item = (bestelitem)grid_bestelitems.SelectedItems[0];
                if (item != null)
                {
                    Artikel_Aantal_Verlagen(item.product_id, item.bestelling_id);
                    grid_bestelitems.SelectedIndex = Laatste_Geselecteerde_Regel;
                }
            }
            else
            {
                MessageBox.Show("Selecteer een bestelregel om het aantal te verlagen!");
            }
        }

        private void btnBestelling_Gereed_Click(object sender, RoutedEventArgs e)
        {
            Bestelling_Id = -1;
            Klant_Id = -1;
            Ververs_Grid_Bestelling();
            Ververs_Txt_Klant();
        }
        
        private void Win_Main_KeyDown(object sender, KeyEventArgs e)
        {
            Window actWnd = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);


            //var window = Window.GetWindow(this);
            if (this == actWnd)
            {
                if (e.Key == Key.Return)
                {
                    producten product = (from producten in db.productens where (producten.barcode == sBarcode) select producten).FirstOrDefault();
                    if (product != null)
                    {
                        Artikel_Aantal_Ophogen(product.id, Bestelling_Id);
                    }
                    else
                    {
                        MessageBox.Show("Onbekende barcode!");
                    }
                    sBarcode = "";
                    e.Handled = true;
                }
                else
                {
                    if (e.Key >= Key.D0 && e.Key <= Key.D9)
                    {
                        var strKey = new KeyConverter().ConvertToString(e.Key);
                        sBarcode = sBarcode + strKey;
                        e.Handled = true;
                    }
                }
            }
        }
    }
}
