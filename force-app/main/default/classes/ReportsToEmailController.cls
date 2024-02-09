public class ReportsToEmailController {
    public Id rptId { get; set; } // Here we will get the report Id from the VF Component
    private transient Reports.ReportResults results; // It will hold the entire data of a report
 
    /*********************
     // Method Name : getReportResult
     // Description : Here we will get the data of a report and send to the VF Component
    /********************/
 
    public Reports.ReportResults getReportResult() {
        // Here it will run the report with that report ID and adding the report data into results
        results = Reports.ReportManager.runReport(rptId, true);
        return results;
    }
}