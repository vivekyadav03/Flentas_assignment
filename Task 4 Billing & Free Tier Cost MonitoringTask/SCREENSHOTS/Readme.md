# Task 4 – Billing & Free Tier Cost Monitoring

## Objective
The purpose of this task is to configure billing alerts and Free Tier monitoring in AWS to avoid unexpected charges and to understand cost control mechanisms in cloud environments.

---

## Requirements
- Set a CloudWatch Billing Alarm at ₹100
- Enable AWS Free Tier usage alerts
- Capture screenshots for validation

---

## Step 1: Enable Billing Access for CloudWatch

> This step is required before creating a billing alarm.

Steps:
1. Login to AWS using the **Root User Account**
2. Click on the **Account name (top-right corner)** → Select **Account**
3. Scroll to **IAM User and Role Access to Billing Information**
4. Click **Edit**
5. Enable the setting
6. Click **Update**


## Step 2: Create Billing Alarm in CloudWatch (₹100)

### Open CloudWatch
1. Search for **CloudWatch** in AWS Console
2. Click **Alarms**
3. Click **Billing**
4. Click **Create Alarm**


## Step 3: Select Billing Metric

1. Click **Select Metric**
2. Choose **AWS Billing**
3. Select **Total Estimated Charge**
4. Choose **EstimatedCharges**
5. Set Currency = **INR**
6. Click **Select Metric**


## Step 4: Configure Alarm Conditions

Set the following:
- Period: **6 Hours**
- Statistic: **Maximum**
- Threshold Type: **Static**
- Condition:
  - EstimatedCharges
  - Greater Than
  - ₹100

Click **Next**


## Step 5: Configure Notification

1. Under notification section, choose **In Alarm**
2. Click **Create new SNS Topic**
3. Topic name: `billing_alert_topic`
4. Enter your Email ID
5. Click **Create Topic**
6. Check your email and **Confirm Subscription**


## Step 6: Create Alarm

1. Alarm Name: `Billing-Alarm-100-INR`
2. Description: `Billing alert when cost exceeds ₹100`
3. Click **Create Alarm**


## Step 7: Enable Free Tier Usage Alerts

1. Open **Billing and Cost Management Dashboard**
2. Click **Free Tier** from the left menu
3. Select **Usage Alerts**
4. Enable **Free Tier Usage Alert**
5. Add Email ID
6. Click **Save**


## Billing Preferences AWS
![Billing]()

## Billing Alarms AWS
![Billing]()

