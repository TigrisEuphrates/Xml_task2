using System.Reflection.Metadata;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System;
using System.IO;
using System.Text;
using System.Reflection.PortableExecutable;
using System.Xml.Xsl;

public class Program
{
    public static void Main(string[] args)
    {
        ValidateDTD("hardware.xml");
        ValidateXSD("hardwareForXSDValidation.xml", "hardware.xsd");
        ToText("hardware.xml");
        if(args.Length>0)
        {
            XPathSelection(args[0]);
            if (args.Length == 3)
            {
                TransformXML("hardware_for_xslt.xml", args[1], args[2]);
            }
            else if (args.Length == 2)
            {
                TransformXML("hardware_for_xslt.xml", args[1], "xml");
            }
            else if(args.Length == 1)
            {
                TransformXML("hardware_for_xslt.xml", "To_HTML_Table.xslt", "html");
            }

        }
        else if(args.Length == 0)
        {
            XPathSelection("XPath_List.txt");
            TransformXML("hardware_for_xslt.xml", "To_HTML_Table.xslt", "html");
        }
    }



    public static void TransformXML(string inputXml, string xsltString, string format)
    {
        string txtName = xsltString.Remove(xsltString.Length-5,5);
        txtName = txtName.Insert(txtName.Length, "."+format);
        StreamWriter sW = System.IO.File.CreateText($"..\\..\\..\\{txtName}");
        sW.Close();
        Console.WriteLine($"Created File {txtName}");
        XslCompiledTransform transform = new XslCompiledTransform();
        transform.Load($"..\\..\\..\\{xsltString}");
        transform.Transform($"..\\..\\..\\{inputXml}", $"..\\..\\..\\{txtName}");
    }




    public static void XPathSelection(string XPathFile)
    {
        XmlDocument doc = new XmlDocument();
        doc.PreserveWhitespace = true;
        doc.Load($"..\\..\\..\\hardware.xml");
        XmlElement? data = doc.DocumentElement;
        using (StreamReader sR = new($"..\\..\\..\\{XPathFile}"))
        {
            string? line;
            while ((line = sR.ReadLine()) != null)
            {
                
                string txtName = line;
                txtName = txtName.Replace('<', '_');
                txtName = txtName.Replace('>', '_');
                txtName = txtName.Replace(':', '_');
                txtName = txtName.Replace('"', '_');
                txtName = txtName.Replace('/', '_');
                txtName = txtName.Replace('\\', '_');
                txtName = txtName.Replace('|', '_');
                txtName = txtName.Replace('?', '_');
                txtName = txtName.Replace('*', '_');
                txtName = txtName.Insert(txtName.Length, ".txt");
                StreamWriter sW = System.IO.File.CreateText($"..\\..\\..\\{txtName}");
                sW.Close();
                Console.WriteLine($"Created Text File {txtName}");

                printResult(data.SelectNodes(line), txtName , "", false);
            }
        }
    }

    public static async void printResult(XmlNodeList nodeList, string txtName, String tab = "", bool needRecursion = true)
    {
        foreach (XmlNode node in nodeList)
        {
            if (node.NodeType == XmlNodeType.Whitespace || node.NodeType == XmlNodeType.Text)
            {
                continue;
            }

            Console.WriteLine(tab + node.NodeType + " -> " + node.Name + " -> " + node.InnerText);

            using (StreamWriter file = new($"..\\..\\..\\{txtName}", true))
            {
                await file.WriteLineAsync(tab + node.NodeType + " -> " + node.Name + " -> " + node.InnerText);
            }
            
            if (node.NodeType == XmlNodeType.Element && needRecursion)
            {
                printResult(node.ChildNodes, txtName, tab + "   ", needRecursion);
            }
        }
    }


    public static async void ToText(string XMLDoc)
    {
        StreamWriter sW= System.IO.File.CreateText($"..\\..\\..\\XMLText.txt");
        sW.Close();
        Console.WriteLine("Created Text File XMLText.txt");


        using StreamWriter file = new($"..\\..\\..\\XMLText.txt");
        XmlTextReader? reader = null;
        try
        {
            reader = new XmlTextReader($"..\\..\\..\\{XMLDoc}");
            reader.WhitespaceHandling = WhitespaceHandling.None;

            while (reader.Read())
            {
                switch (reader.NodeType)
                {
                    case XmlNodeType.Element:
                        await file.WriteLineAsync(reader.Name + ":" + Environment.NewLine);
                        break;
                    case XmlNodeType.Text:
                        await file.WriteLineAsync("     " + reader.Value + Environment.NewLine);
                        break;
                }
            }
        }
        finally
        {
            if (reader != null)
                reader.Close();
        }
    }


    public static void ValidateDTD(string XMLName)
    {
        XmlReaderSettings settings = new XmlReaderSettings();
        settings.DtdProcessing = DtdProcessing.Parse;
        settings.ValidationType = ValidationType.DTD;
        settings.XmlResolver = new XmlUrlResolver();
        settings.ValidationEventHandler += new ValidationEventHandler(ValidationCallBack);

        XmlReader reader = XmlReader.Create($"..\\..\\..\\{XMLName}", settings);

        while (reader.Read());
    }

    private static void ValidationCallBack(object sender, ValidationEventArgs e)
    {
        Console.WriteLine("Validation Error: {0}", e.Message);
    }


    static void ValidateXSD(string XMLName, string XSDName)
    {
        XmlReaderSettings settings = new XmlReaderSettings();
    settings.Schemas.Add("https://www.company.com", $"..\\..\\..\\{XSDName}");
        settings.ValidationType = ValidationType.Schema;
        settings.ValidationEventHandler += XSDValidationCallBack;

        XmlReader reader = XmlReader.Create($"..\\..\\..\\{XMLName}", settings);

        while (reader.Read()) { }
    }

    static void XSDValidationCallBack(object sender, ValidationEventArgs e)
    {
        if (e.Severity == XmlSeverityType.Warning)
        {
            Console.Write("WARNING: ");
            Console.WriteLine(e.Message);
        }
        else if (e.Severity == XmlSeverityType.Error)
        {
            Console.Write("ERROR: ");
            Console.WriteLine(e.Message);
        }
    }
}