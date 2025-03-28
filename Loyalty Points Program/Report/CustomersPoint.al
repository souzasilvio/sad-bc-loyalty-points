report 60004 CustomerPointsReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutExcel;

    dataset
    {
        dataitem("Customer"; Customer)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; "Name")
            {
                IncludeCaption = true;
            }
            column(LoyaltyPoints; LoyaltyPoints) { IncludeCaption = true; }

        }
    }

    rendering
    {
        layout(LayoutExcel)
        {
            Type = Excel;
            LayoutFile = 'Report\CustomerPoints.xlsx';
        }
    }

    labels
    {
        PageNo = 'Page';
        BCReportName = 'Customer Points';

    }

}