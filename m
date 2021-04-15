Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1799B36164C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Apr 2021 01:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237992AbhDOXeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 19:34:15 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:5367 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235216AbhDOXeH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 19:34:07 -0400
X-Greylist: delayed 458 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Apr 2021 19:34:07 EDT
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13FNMhQd025447;
        Thu, 15 Apr 2021 19:26:05 -0400
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com with ESMTP id 37xu4v05mv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Apr 2021 19:26:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OorSoxAccowsPOEj0c2HyaQYEuKT/OEj6qlY9HZoRUFPgY8qJ9SeiUqlwSxyXI2jDidj580dOIPnFm4hFQzQ8iVCKcXl77Y8RkcnlJoC82bcmRa+FJczQrhYnW0wD4uqa0sjs2kGHoI01pa6euk2L/INKXOycAdGnLmURU5GmF9dZcrng+EGekEFQqqMujDU2lWf8lTqLm2SO1hJlRAeMK6gEsyY9rj9oP9NL+asvVHcQWA2yzXclyPL2rDGBKSFmKaqMZMF6YpDFzSfSQsA+p7B2d4c+rVLXYkkzR367l9ArIaf18eAaOQeCaZQbmSGJxSKBB1cRBFw4ndYHnWcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBrfRaCmjrISRAMLlteVktSZVDDL9QQhM/2qKdm+qlM=;
 b=gD+xqWIMbx4wMEYgXLIjJYXkUWBneEfEuURAWwn0rnXzbgYLj/MeiT1SxXJJoyTLVaiwi/MV0a5OwR4YrCKu95v6PsKUMo4hruz/m4IRkjAOXgApPW5P4igpZjzHctcAde5vBby0bBOLeyH9uoYiChEeobd8vuxkjGBrcfLoLuF6aF4zt1+MiLa7N5TkPtbzJegS+hfwBoviLrGntf88oisDktolJm8q7/qEoUkqwX3rKncIoAPx0v3+NvDbzk+h5xKxpZtR74rY1VUz4wbPKZOYdRx9YhaokxdCZL+XBf2KZWQUkoPY47E0HHWw0Ga+oX+MPUjbOVdJxiISEA0TBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBrfRaCmjrISRAMLlteVktSZVDDL9QQhM/2qKdm+qlM=;
 b=CKGiR++Txt5R3uFJq7LqzoXnEPXTcxpEKzhRxrb4eQWgORK/GmL6QH5DvYGNv4QVQboTmfiPMfrc117Wd4u0vCqSpDuZKVjT/J+LJ/2CEdQzKVPc9ftxCVwHKmJZYJUcoQLHThBA2zQzRmprI9XlkquV03p7LHkr5UvlgG1a4VI=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTOPR0101MB1755.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 15 Apr
 2021 23:26:03 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3999.037; Thu, 15 Apr 2021
 23:26:03 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     michal.simek@xilinx.com
Cc:     linux-i2c@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>,
        Chirag Parekh <chiragp@xilinx.com>
Subject: [PATCH] i2c: cadence: Add standard bus recovery support
Date:   Thu, 15 Apr 2021 17:25:32 -0600
Message-Id: <20210415232532.4070366-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR15CA0045.namprd15.prod.outlook.com
 (2603:10b6:300:ad::31) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR15CA0045.namprd15.prod.outlook.com (2603:10b6:300:ad::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 23:26:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7c75a8-0222-4ac6-5905-08d90065d5e4
X-MS-TrafficTypeDiagnostic: YTOPR0101MB1755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTOPR0101MB17556E461ECBF91AF78EDACAEC4D9@YTOPR0101MB1755.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpYw40ceuOkrNd1QMR6OAHX+j8z4H0w1XBLMQGmaj3JUafpAeb9WBySSxZO1CiPdsMd3BkBAnw16t4SwnNk7EWuPui8X+xp9Tx+v3ZkwvK95F1fh8CCopIhSmhBF4ET3IdrUgdaZR8CuD2mhA61ylHBR0lTZVB36i4TYNcJUZgNqrdDwO1XNWwzy0MLjnPVEwZ46yukjodNJ8eiDLujfP82nwNmxtygrzpG8sfjKFr3qNp9pnMTxEiJiUA0YeAqrg/SHiEDsgYZnUT8d2jMf1pWgBRp6TmsF+3UJdGeaOj9bBm2eUjrAWZ8KZi6Ejp4C9O86Z1DN4/veLFahyMBppsI2S33VCDFpc9V6GkMAsy3ajA0FEvSqoHGLbGjC6X2HVaZZpdYNpN2KJLlO00k+0xmrcSVoOohKhXoQxx3+RAqf92VrQYIEgyp//NHWZ1ifI3bPGTWppllxCyWDBrzglUVZ16ppD37BcvEue7JFKZFAmbAmQkBnk6F2DqasI1HtxdZEN3H+aHkNcv377Jj1dOyOKKKJ/idglC/mvy3g0ZVzqxqGKPXQk2UvHzAZcD3Pts2f5g6d5AVccYOxe7A/ywqMuTcVUwZ1eDsx4yAfjc7HhDflsg+5mMsmMW01IJmh/0AjtNhP8PVIzvWLyVvVEuNU+fx1gC0mQyFcCz+VelqXfvXzLYSsOoIlT04DA93g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(16526019)(186003)(6666004)(69590400012)(26005)(54906003)(1076003)(4326008)(36756003)(478600001)(6916009)(2906002)(83380400001)(6506007)(2616005)(8676002)(66946007)(8936002)(5660300002)(52116002)(66556008)(38350700002)(86362001)(6486002)(6512007)(66476007)(956004)(316002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xJTBjhjD4+JF5mOVH6V8Whhdw4F+XoTRSHHcCR9wZ+MOTtgHQbeKkNCEwvYk?=
 =?us-ascii?Q?leXMIvTdSZlgXUq+Nr2lCrjgwWcjSHVk9oYP1o4XRrKM5RfBG9wzT7lWIJjI?=
 =?us-ascii?Q?boDplL51bK+AJoyKYqBM7YvT2KehecAE1wp4dQFnT4JkJW7I8skVAoN7yrP0?=
 =?us-ascii?Q?nhL1I1aNgWaFrksZFluLLeGwbbWDBW+cYRCIy2AQc1kNrnHNJ1mHPHC3SQ4B?=
 =?us-ascii?Q?9SrN72t4FCVwOB6TD1nKns49Rh73FMYFL+doPgegAtikB78ak1BTEr6WORkz?=
 =?us-ascii?Q?dS4uvwFGMi0oX+DscgN7VrRNX99dz0dArp7itmRydMOUYWRzaBym8sTEGS4d?=
 =?us-ascii?Q?ETgLBFRxFSy0XGFhxEdtn9Y6+1vUEGziShi2Q0QHEKJBjvb5EDsz4cyUkkaE?=
 =?us-ascii?Q?c64UHSZGej9Sx5VUJ0tnKCvcY+t0kruMjWw1BcqpJJmwWouEoo4Tuv1lw1ac?=
 =?us-ascii?Q?ZfZLJisvwdOLuD88vuenjDBAR4QJR51bkJ6Sc+50Z8kN+zsWbRsNEy04Yqvx?=
 =?us-ascii?Q?M/wR91NptnJ0RBYrYXPE/O02V9eRDq3GJq4pugiagpQ5+ztjhfPDzAu5r6zM?=
 =?us-ascii?Q?wB0dROLVtf/d9CeFi8myxQzCUmZ7dYnXpM/bb540xXwTaq43yr2RbZMCR6d6?=
 =?us-ascii?Q?rrthYJdsotCQcDzqy8Um1GpGPvZIMVuNqqcvjw8oLN9sxo6YqTJ/p/1wIHmU?=
 =?us-ascii?Q?mAi9UdbRYpLyzOI/8nOSm25yLaoLV/ryt6sFIiXBB5Srrp/zGbyqFhPr3nea?=
 =?us-ascii?Q?S13T6BJlqFDnl/f94GeqYtcrCDH3JitrAEaObI0c06Tc2A6eGaeGXoD3vADC?=
 =?us-ascii?Q?zzbCtRCyF6RpLLAsL3cAA1iyfUpyQOB43aFOh254EREWBkreSqH2484Waxwj?=
 =?us-ascii?Q?pI5aeiToifbbCH5lFhHuMfksOFWvytRh8mIuI5tm/TY2fUPK8HjSbT71WDst?=
 =?us-ascii?Q?avmrhd6uHCJ5Yw4+mfy4IYhFqRJifcZFSTIddweGDO/yTuS3cq9//Am3Nmt2?=
 =?us-ascii?Q?txG9Ud5/zUdUGf7rKLP3O8M9WdeM4JUyaCHJ+4LJa2/1EKQ60Xp3YybPqvP/?=
 =?us-ascii?Q?bRK+qBoZxB0lyEW2JAGhsVdwJ1Ar82YiiDumuHNPVX746hsfJ/HLlj/u8Osw?=
 =?us-ascii?Q?yDMsi3zN46Sf0pveunX76dwrTu9ElyysGgFZNx1wiHgQNLz6LWqCttAlVwd9?=
 =?us-ascii?Q?aIkJSgx8LLMIqxYUvTTlSfL/OErV7eymxIeZnMGNoDYdVXYmGetLxPQV8ojv?=
 =?us-ascii?Q?CX9y8h8btb4rtFmqh4dB9Ji8qP5/dee2xtJnWvJcpv4FKt+iIJuyIMKBPgso?=
 =?us-ascii?Q?1dc+cYdwQWIDmSJHWX+eJZuY?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c75a8-0222-4ac6-5905-08d90065d5e4
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 23:26:03.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8qTV/GnJ5DodApOy9a5OwFS/dSw9/X+YxJIXD34qK98qi3rAHJ1KF0RCwte2YtOFSIO9EPOwBKPmeu1yUxYo4fDRKqr/npN7iGiHuxgso8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB1755
X-Proofpoint-ORIG-GUID: GXYkNZWp08UwwBSl1A01X5Z3-sN0dmxA
X-Proofpoint-GUID: GXYkNZWp08UwwBSl1A01X5Z3-sN0dmxA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-15_11:2021-04-15,2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150145
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hook up the standard GPIO/pinctrl-based recovery support for this
driver.

Based on a patch "i2c: cadence: Recover bus after controller reset" by
Chirag Parekh in the Xilinx kernel Git tree, but simplified to make use
of more common code.

Cc: Chirag Parekh <chiragp@xilinx.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-cadence.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index c1bbc4caeb5c..d017bc64e759 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -178,6 +178,7 @@ enum cdns_i2c_slave_state {
  * @clk:		Pointer to struct clk
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
+ * @rinfo:		Structure holding recovery information.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -202,6 +203,7 @@ struct cdns_i2c {
 	struct clk *clk;
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
+	struct i2c_bus_recovery_info rinfo;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -752,6 +754,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -1212,6 +1215,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
+	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.27.0

