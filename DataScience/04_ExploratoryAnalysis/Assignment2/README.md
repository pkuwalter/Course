# Introduction

Exploratory Data Analysis Peer Assessment 2. 

Empty repository at https://github.com/rdpeng/ExData_PeerAssessment2  
I chose to create my own instead.

Assignment at https://class.coursera.org/exdata-017/human_grading/view/courses/974177/assessments/4/submissions
I would prefer to use the Markdown (?) file there as a starting point, but I do not see the source code.

���

ϸ������(PM2.5)Ϊ����������Ⱦ��г�ֵ�֤�ݱ��������ʶ����ཡ���к���������������������(EPA)�����ƶ����ϸ������Ĺ��һ�������������׼�����Ҹ��ٴ����и���Ⱦ����ŷ�������Լÿ3�꣬EPA�ᷢ������PM2.5�ŷ��������ݿ⡣�����ݿⱻ��Ϊ�����ŷ��嵥(National Emissions Inventory, NEI)���й�NEI�ĸ�����Ϣ�������EPA�����ŷ��嵥��վ��

����ÿ����ݣ�NEI�����¼����һ����ÿ��PMԴ���ŷ��˶��ٶ�PM2.5���ڱ���ҵ�У��㽫ʹ��1999�ꡢ2002�ꡢ2005���2008������ݡ�
����

���ڱ���ҵ�����ݣ�����Դӿγ���վ�Ե���zip�ļ�����ʽ��ȡ��

   * [������ҵ����](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) [29Mb]

zip�ļ��������������ļ���

PM2.5�ŷ�������(summarySCC_PM25.rds)�����ļ�����һ������֡��������֡����1999�ꡢ2002�ꡢ2005���2008������PM2.5�ŷ������ݡ�����ÿ����ݣ�����а�������һ����ĳ�ض�������Դ��PM2.5�ŷŶ�����������ǰ��ļ��С�

##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999

   * fips: һ����λ������ʾΪ�ַ�������������������

   * SCC: �����ִ���ʾ����Դ���ƣ���μ���Դ��������

   * Pollutant: ������Ⱦ����ַ���

   * Emissions: PM2.5�ŷ������Զ�Ϊ��λ

   * type: ��Դ���ͣ�point��non-point��on-road��non-road��

   * year: �ŷ�����¼���������

��Դ��������(Source_Classification_Code.rds)���ñ��ָ�����ŷ�������SCC���ִ���PM2.5Դʵ������֮���ӳ���ϵ����Դ��һ�㵽���尴���ֲ�ͬ�ķ�ʽ���֣������ѡ������Լ���Ϊ�����õ�������磬��Դ��10100101�������ⲿȼ����/����/����ú/��ú����

�����ʹ��R�е�readRDS()��������ȡ�������ļ������磬�����ʹ�����´�������ȡÿ���ļ���

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ֻҪ��Щ�ļ���λ����Ŀǰ�Ĺ���Ŀ¼���ɣ�����dir()���һ�£�������Щ�ļ��Ƿ����б��У���
��ҵ

����ҵ������Ŀ������������ŷ��嵥���ݿ⣬�˽��1999�굽2008����10���ڼ�����ϸ��������Ⱦ����������ʹ���κ������R����֧����ķ�����
����

�����̽���Է����У���������������������񡣶���ÿ������/��������Ҫ������һ��ͼ�Ρ��������й涨�����������ʹ��R�е��κλ�ͼϵͳ���л�ͼ��

    ��1999�굽2008�꣬������PM2.5���ŷ����Ƿ�ʵݼ����ƣ� ʹ�û�����ͼϵͳ����һ��ͼ�Σ���ʾ1999�ꡢ2002�ꡢ2005���2008������������Դ��PM2.5���ŷ�����

    ��1999�굽2008�꣬�������ݰͶ���Ħ�У�fips ==��24510������PM2.5�ŷ����Ƿ�ʵݼ����ƣ�ʹ�û�����ͼϵͳ���������ڽ��������ͼ�Ρ�

    �ڡ�type����point��nonpoint��onroad��nonroad������ָ����������Դ�У�������Դ��֤�˰Ͷ���Ħ�д�1999�굽2008����ŷ����ʵݼ����ƣ� ������Դ��֤�˴�1999�굽2008����ŷ����ʵ������ƣ� ʹ��ggplot2��ͼϵͳ���������ڽ��������ͼ�Ρ�

    ��������������1999�굽2008��úȼ���ŷ����ı仯�����Σ�

    �ڰͶ���Ħ�У���1999�굽2008��������ŷ����ı仯�����Σ�

    �ԱȰͶ���Ħ�еĻ������ŷ������������������ɼ��أ�fips ==��06037�����Ļ������ŷ������ĸ������ڻ������ŷ�������ı仯����

��ͼ���ύͼ��

����ÿ��ͼ�Σ����Ӧ

    ����ͼ�β����䱣�浽PNG�ļ���
    �������ڹ�����Ӧͼ�εĶ���R�����ļ���plot1.R��plot2.R�ȣ�������plot1.R�еĴ������ڹ���plot1.pngͼ�Ρ���Ĵ����ļ�Ӧ�ð������ڶ�ȡ���ݵĴ��룬����ͼ�βŻᱻ��ȫ���֡��㻹Ӧ�ð������ڴ���PNG�ļ��Ĵ��롣����������ͼ�εĴ��루���磬plot1.RӦ�ý�������������plot1.png�Ĵ��룩
    ����ҵ�ύҳ���ϴ�PNG�ļ�

    ����Ӧ��R�ļ��и���R���룬������ճ����������ҵ��Ӧ���ı����С�


* English Version *

Assignment

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999�C2008. You may use any R package you want to support your analysis.
Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

    Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

    Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

    Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999�C2008 for Baltimore City? Which have seen increases in emissions from 1999�C2008? Use the ggplot2 plotting system to make a plot answer this question.

    Across the United States, how have emissions from coal combustion-related sources changed from 1999�C2008?

    How have emissions from motor vehicle sources changed from 1999�C2008 in Baltimore City?

    Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

Making and Submitting Plots

For each plot you should

    Construct the plot and save it to a PNG file.

    Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)

    Upload the PNG file on the Assignment submission page

    Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.