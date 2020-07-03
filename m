Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31DB213B6C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 15:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgGCN42 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 09:56:28 -0400
Received: from mail-mw2nam12on2061.outbound.protection.outlook.com ([40.107.244.61]:6200
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726035AbgGCN42 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jul 2020 09:56:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaManCNPlM6bCyYI9Ed8Cut1Nzm4NMEPnWcNg0W82EOvnH9ogb2RgSckXe1aVzcdmNyMYwC91fhxCB+hhVwYTSjrkTAvE1podWyE3BCkRzHUrxiUAqGfFLfHwHnYP6/bjZyTgMXb45fYKq9Zuz6PbvxHdyLQUKFdfaSneFDlKIMSOtE+NwBB5YX5UksiWTKH0HioRc41ksJusGQ4XURohofNq3RGHRkBxJYUipKsVEcdQZBh1v2E9Z158bUDKl8ipJmtet2vkHyB3Hi5ahGOHGoDXve2sGXphB2I30JiI2A1tuO8PpwbyMmETAnUZJYifKEJzWlnXAflsd5T9cIQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FGY4417WxzOZRswBSTPd7er1aCrtnOPiLn7y0li0js=;
 b=dHjAFeH4peOyy1ca/IpShQqhOdY7w63QySdwStkgtfdMgJxtwBdRh/sW8ymQxXyjx1IWxLgdir6hIIW7n+hAlY0curkh6hmaRcLtW3BtpbdG2h1aHKUNVnq1UIV2HykKBWMqyQQlJjU9UuwoPYGlWMjUx4EOKhumT7BS3U0Txc3EZ62076vfnqnvBmCIXNuVR5H3Df+iRl+rYjJsCHcIxKS+6TrH/GO/syc0iA5onysA7im88GbR2M6o77MyymwtyID7KqiAGokxJPHDFXNPrEQ87fPoVm2uNHquFuYmjGrGIniTu6OC3ClWeJm4JOElY5xRLdfHaPSEcDtOvlnN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FGY4417WxzOZRswBSTPd7er1aCrtnOPiLn7y0li0js=;
 b=AeXagBY8C2kc6jxglmvSm0p1duB/0bXl2jpmdwKtTBrFdCbvFVTLtq8KaQwzK1BkWDi8WvfXU/LLXBZ0TucM5dH/3peQ1QLseADFr+mbJX5SIJqdB5lZ7a/Q7oe38bVSYfzJWR1pGPwGHA9Hym7+rw5aBg+oGror9Y8p7NJsWco=
Received: from SN4PR0501CA0113.namprd05.prod.outlook.com
 (2603:10b6:803:42::30) by BN7PR02MB5331.namprd02.prod.outlook.com
 (2603:10b6:408:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 13:56:24 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::3c) by SN4PR0501CA0113.outlook.office365.com
 (2603:10b6:803:42::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend
 Transport; Fri, 3 Jul 2020 13:56:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server id 15.20.3153.24 via Frontend Transport; Fri, 3 Jul 2020 13:56:24
 +0000
Received: from [149.199.38.66] (port=58707 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrM9Z-0002x8-Qa; Fri, 03 Jul 2020 06:54:57 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrMAy-0004WL-4w; Fri, 03 Jul 2020 06:56:24 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 063DuGSZ014470;
        Fri, 3 Jul 2020 06:56:17 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrMAq-0004Te-Cr; Fri, 03 Jul 2020 06:56:16 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 2/2] i2c: cadence: Clear HOLD bit at correct time in Rx path
Date:   Fri,  3 Jul 2020 19:26:12 +0530
Message-Id: <1593784572-21910-1-git-send-email-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(39860400002)(46966005)(4326008)(478600001)(426003)(186003)(82740400003)(316002)(26005)(47076004)(9786002)(6666004)(36756003)(336012)(8676002)(70586007)(7696005)(107886003)(83380400001)(8936002)(70206006)(6916009)(356005)(44832011)(81166007)(5660300002)(2906002)(82310400002)(2616005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 660b7f12-ad21-4a08-7b93-08d81f58dfc2
X-MS-TrafficTypeDiagnostic: BN7PR02MB5331:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5331C39B0FD59F921916FEB4CA6A0@BN7PR02MB5331.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2Hj8ZfB0XanmIkMgNEd+m/UpROHNxTqL9W6i2LqqmDRqigWLgA9RkSbQjw9LEWFNfsk1Dxq47c2i1VoK63BPBuBfz/TWaDbiksk19+II42s3XKc7yWvGbftDGT3+r5A73ClYomxrBsz+12mmTZgC3lD/NtNZKRPI12LWIRqdP5DAAT3l5aAWx7dRETmYA8d6bGnJ6xZNuOJ1gbbeWMPWZkcXxQLpvuZ3i7spXpos5LWtatAZveMRwcFyDQW0GCVXQzpzoiExuTUSXMXVWV+BbM2x6rntCB+8HqnybZhqFxeh1voO19Hm2Sh2yfGt8pqYS/qF6RqS/7OJZAedCIs31nTsEcnfcgJZQJu3D0ufuQKrIk/FsW4hRtn4MH+D3idKOx6RdrUWH1hqB20DO3TEw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 13:56:24.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 660b7f12-ad21-4a08-7b93-08d81f58dfc2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5331
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are few issues on Zynq SOC observed in the stress tests causing
timeout errors. Even though all the data is received, timeout error
is thrown. This is due to an IP bug in which the COMP bit in ISR is
not set at end of transfer and completion interrupt is not generated.

This bug is seen on Zynq platforms when the following condition occurs:
Master read & HOLD bit set & Transfer size register reaches '0'.

One workaround is to clear the HOLD bit before the transfer size
register reaches '0'. The current implementation checks for this at
the start of the loop and also only for less than FIFO DEPTH case
(ignoring the equal to case).

So clear the HOLD bit when the data yet to receive is less than or
equal to the FIFO DEPTH. This avoids the IP bug condition.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e069602..e4b7f2a 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -421,20 +421,21 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 		/* Read data if receive data valid is set */
 		while (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) &
 		       CDNS_I2C_SR_RXDV) {
-			/*
-			 * Clear hold bit that was set for FIFO control if
-			 * RX data left is less than FIFO depth, unless
-			 * repeated start is selected.
-			 */
-			if ((id->recv_count < CDNS_I2C_FIFO_DEPTH) &&
-			    !id->bus_hold_flag)
-				cdns_i2c_clear_bus_hold(id);
-
 			if (id->recv_count > 0) {
 				*(id->p_recv_buf)++ =
 					cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);
 				id->recv_count--;
 				id->curr_recv_count--;
+
+				/*
+				 * Clear hold bit that was set for FIFO control
+				 * if RX data left is less than or equal to
+				 * FIFO DEPTH unless repeated start is selected
+				 */
+				if (id->recv_count <= CDNS_I2C_FIFO_DEPTH &&
+				    !id->bus_hold_flag)
+					cdns_i2c_clear_bus_hold(id);
+
 			} else {
 				dev_err(id->adap.dev.parent,
 					"xfer_size reg rollover. xfer aborted!\n");
-- 
2.7.4

