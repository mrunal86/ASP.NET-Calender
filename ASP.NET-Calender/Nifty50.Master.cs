using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Configuration;

namespace ASP.NET_Calender
{
    public partial class Nifty50 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //File name capture
            string filepath = Path.GetFileName(FileUpload1.FileName);
            //Remove white spaces
            filepath = filepath.Replace(" ", "");
            //FolderPath
            string folderPath = ConfigurationManager.AppSettings["ExcelFolderPath"];
            //File Path
            string ExcelPath = Server.MapPath(folderPath + filepath);
            //save file in project folder

            FileUpload1.SaveAs(ExcelPath);
            //Import to Grid
            ImportToGrid(ExcelPath);
            

        }

        private void ImportToGrid(string excelPath)
        {
            string constr = "";
            constr = ConfigurationManager.ConnectionStrings["Nifty50ConnString"].ConnectionString;
            OleDbConnection ConnExcel = new OleDbConnection(constr);
            OleDbCommand CmdExcel = new OleDbCommand();
            OleDbDataAdapter DAExcel = new OleDbDataAdapter();
            DataTable DTNiftyExcel = new DataTable();
            CmdExcel.Connection = ConnExcel;

            //opeen the connection
            ConnExcel.Open();
            //Get sheet name
            DataTable DataTblExSchema;
            DataTblExSchema = ConnExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string sheetname = DataTblExSchema.Rows[0]["TableName"].ToString();
            ConnExcel.Close();

            //Read Data
            ConnExcel.Open();
            CmdExcel.CommandText = "Select * from [" + sheetname + "]";
            DAExcel.SelectCommand = CmdExcel;
            DAExcel.Fill(DTNiftyExcel);
            ConnExcel.Close();

            //Bind data to grid view
            Nifty50GridView.Caption=Path.GetFileName(excelPath);
            Nifty50GridView.DataSource = DTNiftyExcel;
            Nifty50GridView.DataBind();
        }
    }
}