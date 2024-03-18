﻿using System.Text.RegularExpressions;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Canvas.Parser;
using iText.Kernel.Pdf.Canvas.Parser.Listener;
using Serilog;

namespace PDFDataExtraction
{

    class Program
    {


        // global instance of Producer
        static Producer dbHelper = new Producer();

        static Serilog.Core.Logger log = new LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.File("logs/invoiceprocessing.txt", rollingInterval: RollingInterval.Day)//file name change every day
            .CreateLogger();

        static void Main(string[] args)
        {
            log.Information("Application Starting");

            // Get the base directory of the project
            string baseDirectory = Directory.GetCurrentDirectory();

            // Navigate up 3 levels to reach invoice-processing-automation-main directory
            /*for (int i = 0; i <= 3; i++)
            {
                baseDirectory = Directory.GetParent(baseDirectory).FullName;
            }*/
            var parentDirectory = Directory.GetParent(baseDirectory);
            if (parentDirectory != null)
            {
                baseDirectory = parentDirectory.FullName;
            }

            log.Information("Base directory: " + baseDirectory);
            Console.WriteLine("Base directory: " + baseDirectory);
            string folderPath = Path.Combine(baseDirectory, "pdfs");
            string outputFolderPath = Path.Combine(baseDirectory, "output");
            string validatedFolderPath = Path.Combine(baseDirectory, "validated");

            // Start a separate thread to monitor the PDF folder
            System.Threading.Tasks.Task.Run(() => MonitorPdfFolder(folderPath, outputFolderPath, validatedFolderPath));
            while (true)
            {
                System.Threading.Thread.Sleep(1000); // Sleep for 1 second
            }
        }
        //Method to check the file to see what company it belongs to
        static string CheckCompany(string text, List<string> companyNames)
        {

            foreach (string company in companyNames)
            {
                Match match = Regex.Match(text, company, RegexOptions.IgnoreCase);
                if (match.Success)
                {
                    return match.Value;
                }
            }
            return "N/A";
        }
        static void MonitorPdfFolder(string folderPath, string outputFolderPath, string validatedFolderPath)
        {
            // Create a timer with a 5-minute interval
            System.Timers.Timer timer = new System.Timers.Timer(5 * 60 * 1000);
            timer.Elapsed += (sender, e) => CheckFolderForNewPDFs(folderPath, outputFolderPath, validatedFolderPath);
            timer.AutoReset = true;
            timer.Start();

            // Initial check when starting the program
            CheckFolderForNewPDFs(folderPath, outputFolderPath, validatedFolderPath);
        }

        static void CheckFolderForNewPDFs(string folderPath, string outputFolderPath, string validatedFolderPath)
        {
            if (!Directory.Exists(folderPath))
            {
                Console.WriteLine("PDF folder does not exist: " + folderPath);
                return;
            }
            string[] newPdfFiles = Directory.GetFiles(folderPath, "*.pdf");
            foreach (string pdfFilePath in newPdfFiles)
            {
                OnPdfFileCreated(pdfFilePath, outputFolderPath, validatedFolderPath);
            }
        }

        static void OnPdfFileCreated(string pdfFilePath, string outputFolderPath, string validatedFolderPath)
        {
            string baseDirectory = Directory.GetCurrentDirectory();
            var parentDirectory = Directory.GetParent(baseDirectory);
            if (parentDirectory != null)
            {
                baseDirectory = parentDirectory.FullName;
            }
            string missingValuesFolderPath = Path.Combine(baseDirectory, "Missing_Values");
            // Console.write the event
            Console.WriteLine($"New PDF file detected: {pdfFilePath}");

            // Get all company names from the database
            List<string> companyNames = dbHelper.GetAllCompanyNames();

            // Extract text from PDF
            string invoiceText = ExtractTextFromPDF(pdfFilePath);

            // Check the company name
            string companyName = CheckCompany(invoiceText, companyNames);
            Console.WriteLine("Company Name: " + companyName);

            //Get supplierID
            int supplierID = dbHelper.getEmpresaID(companyName);
            Console.WriteLine("Supplier ID: " + supplierID);
            if (supplierID == 0)
            {
                log.Error("Supplier not found for file: " + pdfFilePath);
                Console.WriteLine("Supplier not found");
                OnValuesMissing(pdfFilePath);
                return;
            }
            log.Information("Reading invoice : " + pdfFilePath);
            // return if company name is N/A
            if (companyName == "N/A")
            {
                log.Error("Company not found for file: " + pdfFilePath);
                Console.WriteLine("Company not found");
                OnValuesMissing(pdfFilePath);
                return;
            }

            // Get the regex for the company
            List<string> regex = dbHelper.GetAllRegex(companyName);
            Console.WriteLine("Company Name: " + companyName);
        
            //create a condition that based on the company name it will call the correct method;
            string numEncomenda = "N/A";
            string numFatura = "N/A";
            decimal totalSemIVA = 0;
            decimal totalPrice = 0;
            string invoiceDate = "N/A";
            string dueDate = "N/A";
            string IVA = "";

            List<IProduct> products = new List<IProduct>();
            switch (companyName)
            {
                case "Roger & Gallet":
                    invoiceDate = RG.ExtractInvoiceDate(invoiceText, regex[3]);
                    numEncomenda = RG.ExtractNumEncomenda(invoiceText, regex[4]);
                    numFatura = RG.ExtractNumFatura(invoiceText, regex[5]);
                    dueDate = RG.ExtractDueDate(invoiceText, regex[6]);
                    totalSemIVA = RG.ExtractTotalSemIVA(invoiceText, regex[7]);
                    totalPrice = RG.ExtractTotalPrice(invoiceText, regex[11]);
                    IVA = RG.ExtractIVAPercentage(invoiceText, regex[13]);
                    products = RG.ExtractProductDetails(invoiceText, regex[12]);
                    break;
                case "MORENO II":
                    invoiceDate = RG.ExtractInvoiceDate(invoiceText, regex[3]);
                    numEncomenda = RG.ExtractNumEncomenda(invoiceText, regex[4]);
                    numFatura = RG.ExtractNumFatura(invoiceText, regex[5]);
                    dueDate = RG.ExtractDueDate(invoiceText, regex[6]);
                    totalSemIVA = RG.ExtractTotalSemIVA(invoiceText, regex[7]);
                    totalPrice = RG.ExtractTotalPrice(invoiceText, regex[11]);
                    IVA = RG.ExtractIVAPercentage(invoiceText, regex[13]);
                    products = RG.ExtractProductDetailsMoreno(invoiceText, regex[12]);
                    /*foreach (var product in products)
                    {
                        Console.WriteLine("Produtos lidos na hora" + product);
                    }*/
                    break;
                case "LABORATORIOS EXPANSCIENCE":
                    invoiceDate = RG.ExtractInvoiceDate(invoiceText, regex[3]);
                    numEncomenda = RG.ExtractNumEncomenda(invoiceText, regex[4]);
                    numFatura = RG.ExtractNumFatura(invoiceText, regex[5]);
                    dueDate = RG.ExtractDueDate(invoiceText, regex[6]);
                    totalSemIVA = RG.ExtractTotalSemIVA(invoiceText, regex[7]);
                    totalPrice = RG.ExtractTotalPrice(invoiceText, regex[11]);
                    IVA = RG.ExtractIVAPercentage(invoiceText, regex[13]);
                    products = RG.ExtractProductDetailsLEX(invoiceText, regex[12]);
                    Console.WriteLine("");
                    break;
                case "N/A":
                    Console.WriteLine("Company not found");
                    OnValuesMissing(pdfFilePath);
                    break;
            }

            // Generate output file path
            string outputFileName = Path.GetFileNameWithoutExtension(pdfFilePath) + "_data.txt";
            string outputFilePath = Path.Combine(outputFolderPath, outputFileName);

            // Write extracted data to the output file
            using (StreamWriter writer = new StreamWriter(outputFilePath))
            {
                writer.WriteLine(invoiceText); // Write the entire text to the file for debugging purposes (will be deleted later)

                // Write general information
                writer.WriteLine("General Information: ");
                writer.WriteLine("Data da Fatura: " + invoiceDate);
                writer.WriteLine("Nº Encomenda: " + numEncomenda);
                writer.WriteLine("Nº Fatura: " + numFatura);
                writer.WriteLine("Data Vencimento: " + dueDate);
                writer.WriteLine("Total sem IVA: " + totalSemIVA);
                writer.WriteLine("Total com IVA: " + totalPrice);
                writer.WriteLine("Taxa IVA: " + IVA);
                writer.WriteLine("Products:");

                // Write product details
                foreach (var product in products.Distinct())
                {
                    writer.WriteLine(product);
                }
            }

            
            int orderID = dbHelper.getOrderID(numFatura);
            Console.WriteLine("Order ID: " + orderID);
            if (orderID == 0)
            {
                log.Error("Order not found for file: " + pdfFilePath);
                Console.WriteLine("Order not found");
                OnValuesMissing(pdfFilePath);
                return;
            }
           
            // Check if any field is missing
            var fields = new Dictionary<string, object>{
                {"Invoice Date", invoiceDate},
                {"Num Encomenda", numEncomenda},
                {"Num Fatura", numFatura},
                {"Due Date", dueDate},
                {"Total Sem IVA", totalSemIVA},
                {"Total Price", totalPrice},
                {"IVA Percentage", IVA},
                };

            bool isAnyFieldMissing = false;
            int missingFieldsCounter = 0;
            foreach (var field in fields)
            {
                if (field.Value == null || field.Value.ToString() == "N/A")
                {
                    log.Error($"Missing field: {field.Key}");
                    Console.WriteLine($"Missing field: {field.Key}");
                    missingFieldsCounter++;
                    isAnyFieldMissing = true;
                }
            }

            // Special check for products being null or having a count of 0
            if (products == null || products.Count == 0)
            {
                Console.WriteLine("Missing field: Products");
                missingFieldsCounter++;
                isAnyFieldMissing = true;
            }

            if (isAnyFieldMissing)
            {
                log.Error("Number of missing fields: " + missingFieldsCounter);
                OnValuesMissing(pdfFilePath);
            }

            else
            {
                // Move processed PDF file to validated folder
                string fileName = Path.GetFileName(pdfFilePath);
                string destinationFilePath = Path.Combine(validatedFolderPath, fileName);
                //File.Move(pdfFilePath, destinationFilePath);
                Console.WriteLine("Data written to " + outputFilePath);
                Console.WriteLine($"Moved PDF file to Validated folder: {pdfFilePath}");
            }
            regex.Clear();
        }

        static void OnValuesMissing(string pdfFilePath)
        {
            string baseDirectory = Directory.GetCurrentDirectory();
            var parentDirectory = Directory.GetParent(baseDirectory);
            if (parentDirectory != null)
            {
                baseDirectory = parentDirectory.FullName;
            }

            string missingValuesFolderPath = Path.Combine(baseDirectory, "missing");

            string fileName = Path.GetFileName(pdfFilePath);
            Console.WriteLine("Missing values in PDF file: " + pdfFilePath);
            string destinationFilePath = Path.Combine(missingValuesFolderPath, fileName);

            Console.WriteLine("Moving PDF file to Missing_Values folder" + destinationFilePath);
            //File.Move(pdfFilePath, destinationFilePath);
            Console.WriteLine($"Moved PDF file to Missing_Values folder: {destinationFilePath}");

        }


        static string ExtractTextFromPDF(string filePath)
        {
            using (PdfReader reader = new PdfReader(filePath))
            using (PdfDocument pdfDoc = new PdfDocument(reader))
            {
                StringWriter output = new StringWriter();
                for (int i = 1; i <= pdfDoc.GetNumberOfPages(); i++)
                {
                    PdfPage page = pdfDoc.GetPage(i);
                    ITextExtractionStrategy strategy = new LocationTextExtractionStrategy();
                    string text = PdfTextExtractor.GetTextFromPage(page, strategy);
                    output.WriteLine(text);
                }
                return output.ToString();
            }
        }

    }
}