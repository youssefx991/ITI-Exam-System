using System.Configuration;


public static class DB
{
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ITI_ExamSystem_DB"].ConnectionString;
    }
}
