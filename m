Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59471050A2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 11:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKUKhq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 05:37:46 -0500
Received: from mail-bgr052100133047.outbound.protection.outlook.com ([52.100.133.47]:58945
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726722AbfKUKhp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 Nov 2019 05:37:45 -0500
Received: from SN4PR0201CA0002.namprd02.prod.outlook.com
 (2603:10b6:803:2b::12) by SN6PR02MB4942.namprd02.prod.outlook.com
 (2603:10b6:805:99::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 21 Nov
 2019 10:37:43 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::208) by SN4PR0201CA0002.outlook.office365.com
 (2603:10b6:803:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Thu, 21 Nov 2019 10:37:43 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 21 Nov 2019 10:37:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iXjqH-00008H-EC; Thu, 21 Nov 2019 02:37:41 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iXjqB-0003b6-DO; Thu, 21 Nov 2019 02:37:35 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xALAbYSC023484;
        Thu, 21 Nov 2019 02:37:34 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iXjqA-0003aw-9I; Thu, 21 Nov 2019 02:37:34 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv5] i2c: cadence: Fix the driver in interrupt flurry case
Date:   Thu, 21 Nov 2019 16:07:31 +0530
Message-Id: <1574332651-17308-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--6.634-7.0-31-1
X-imss-scan-details: No--6.634-7.0-31-1;No--6.634-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132188062632879588;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:SPM;SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(50466002)(47776003)(4326008)(51416003)(316002)(2616005)(61266001)(48376002)(356004)(16586007)(6666004)(86362001)(5660300002)(26005)(70206006)(107886003)(76482006)(14444005)(50226002)(82202003)(8676002)(81166006)(81156014)(426003)(70586007)(73392003)(498600001)(8936002)(9686003)(2361001)(336012)(55446002)(6916009)(2351001)(9786002)(36756003)(2906002)(305945005)(42866002)(989001);DIR:OUT;SFP:1501;SCL:6;SRVR:SN6PR02MB4942;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a4fb41c-fec9-44f7-290a-08d76e6ed736
X-MS-TrafficTypeDiagnostic: SN6PR02MB4942:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4942C77C69A885DD2EC11D5E874E0@SN6PR02MB4942.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vo92QrJjgrptvWvRhTDQfkffp0if5Gm6IIHr+eZARoPBAdAyKiPQ5Qw45HZx7G694BkX9nQT8CrZ70filrRBX+JUcPjbLz2ci28RHq0lNh9S70ipvzq5sr+ajIuCwKa/Ze6733tQcf8X149cmV3v2zBO/T+R5CTSMd8zRtzGnTPe7ZWsUWy2DtlGee4MltSy7SxJmFMLVE93A3HhGy9tSEvlVtWxl53YumwadGmPmRqFgH+OH6K8chqyRlli5YBYCQ5Ar0N4RpP3gg2AYh8H5iJxuTdobaxVJmzK1w2dcIVHzD+F/WIqKdVM5fQG1BMS557tSiPdwg9aI0J3V52XAwXUf0Z6EvhgHv2OhD7LIx1GRj/iZphmyqtEkCGI8QAMV8am9/kBX+hoKCUHgMmRvWCFyrHfetirQbfuPJdHtYJxc1ZnGEUKPsA9GfPNZlkYbJV0KrRRfWTGRULvmH4ygTSXnDEC+B//Lg8OYbZ/QWuTysJbcEr3n/Ozlx0bS6HDNymnnrdcIH0d0ILFFOEUqKFWgQK/qknDUE2scuiNrxn2MTPw4zYKFMybn8Ub5R7WkcJS/E2/53RoJNJylbtPvA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 10:37:43.0577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4fb41c-fec9-44f7-290a-08d76e6ed736
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4942
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

In case there are a lot of interrupts from a non i2c peripheral
the  clear is not released and the timeout is reached, then the hold
bit is not released.
Protect the code by making it atomic by disabling interrupts.

Fixes: df8eb5691c4 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2: Update the wording
v3: Add fixes tag
v4: update fixes tag
v5: Update the description

 drivers/i2c/busses/i2c-cadence.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b136057..92829be 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -365,6 +365,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 {
 	unsigned int ctrl_reg;
 	unsigned int isr_status;
+	unsigned long flags;
 
 	id->p_recv_buf = id->p_msg->buf;
 	id->recv_count = id->p_msg->len;
@@ -405,6 +406,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 		cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFSET);
 	}
 
+	local_irq_save(flags);
 	/* Set the slave address in address register - triggers operation */
 	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
 						CDNS_I2C_ADDR_OFFSET);
@@ -413,6 +415,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 		((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
 		(id->recv_count <= CDNS_I2C_FIFO_DEPTH))
 			cdns_i2c_clear_bus_hold(id);
+	local_irq_restore(flags);
 	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
 }
 
-- 
2.1.1

