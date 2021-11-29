Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147974610C0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241113AbhK2JG6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:06:58 -0500
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com ([40.107.236.85]:26243
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242294AbhK2JE5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Nov 2021 04:04:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUCCMbqS3frYstM/rPoTEK4yghNVbCyoasNgJZ4H7rvMcb8oanBwn+FVQxPx00dFI8EgeCwf7Cc7DHxWVLEEuXQRbnOagh+1prXCGo2jkGzgwyRmN15bknPJARguS6mqqPmg/t4jOJa8cOhscAg8+l1v+L26TQBHviu/rPJH3YTBNCWNepQaX3SdxmTDP4BlEfzqaXeA7BACS3qkG8NniIaRpfRnVREZp/Dwh9lCEiQ7P20H5zoM4NGgX00xYFeMVRLCY3vJv0U3fUQMfwtXgvwmkvAelfENXO1kW0VKE7UlCDedLgRvPtHKfAkY7uJMU+Fyc5TSrpbOprH/aMphWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTJE3P/NRTYo7GC5MAIqo99gfZt5hfTv1IMf8wUl+XI=;
 b=EOOkxwcs1I6QtpxFCyLLiRa9agBJiyf4UNqhf4HVzlotinpRJ3Kwh/nzSEgk50dt6T2bPyIyoutXm71XaW/BrjBTQB82wm7kha50D+TdIXVbvM/EN4+CbsYH9XCun3UIuT9RcE9Mi8RrTtWLMDz/KyLrWSEtOnCkhQyt3oQdhnrrn0cpIKlL6H5UCjTYC8Q8oCzyMXRmQK5yspjpwry6oxQFTh/tVMYY/f03M5F3HJq2RnAuhg+ePGLlR6gqd7YJwJXn1Waj9uacXyvzbz48ZPUoC3UBcvNMB4VBN8Bfh4fUU+Rcs9phMtgtUZP7Pn1XDBtLHf9QftAYiBXO5y5NIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTJE3P/NRTYo7GC5MAIqo99gfZt5hfTv1IMf8wUl+XI=;
 b=ECAe6wMgx1D3owcBgv7OZjquS95s+EJlhUL3vw4f0LaxA1n3sQbmgzA3trSJ2QTSaDkvPC3g52MTGQ97pD+6yo/0wlAG79Ei5Sc5q1Gm7gT0RXW+7DYMKjv5t4gxBrGVhgnZsYXXA/DjHu4kSNo6vNId4bcnVMg2RJEQ40UZEL0=
Received: from SN4PR0501CA0054.namprd05.prod.outlook.com
 (2603:10b6:803:41::31) by BN0PR02MB7902.namprd02.prod.outlook.com
 (2603:10b6:408:161::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:01:32 +0000
Received: from SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::66) by SN4PR0501CA0054.outlook.office365.com
 (2603:10b6:803:41::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Mon, 29 Nov 2021 09:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0045.mail.protection.outlook.com (10.97.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 09:01:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 29 Nov 2021 01:01:28 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 29 Nov 2021 01:01:28 -0800
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 robert.hancock@calian.com
Received: from [10.140.6.59] (port=34642 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mrcXP-0001hh-EG; Mon, 29 Nov 2021 01:01:27 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>,
        Chirag Parekh <chiragp@xilinx.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2] i2c: cadence: Add standard bus recovery support
Date:   Mon, 29 Nov 2021 14:31:16 +0530
Message-ID: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b999f265-ddca-4d18-c30d-08d9b316d701
X-MS-TrafficTypeDiagnostic: BN0PR02MB7902:
X-Microsoft-Antispam-PRVS: <BN0PR02MB79028C74B12486DDE02DA5DFAA669@BN0PR02MB7902.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3Jvn8wzbq98YOborjgj4wbC1O2TtFW10XPIR1HA+tdZq5bazF7N3dhhlcP53ZA/0EjrvmBHvepncPLd+mxGrf8loZanw+W+FhHqUJOTOul8078MNZA3nmPrud9rPwFMcYRFr2D6CR7pIGVDgRgor6uQFIennKWHt8hU1EISAihIij91W7LGSukj2brocvBfeaO2yJrPsA6fBNmiUxuJ0FP7Hy1Twy37vvdmqOr6q7QN9W5v11UMRRWiOTWceooxPMYiyX1RBEGkJ+9mC/PYN6iJ+lg8wsuyRKorI9aU41mzsYRMTSfgWgn6ozvVoiL5eLKbmegFL7oNCxAwWWgmccOBT6VnNYMQaP62eK7jnkBBepa/G3XaM4Ug+VTdg43Hvz7BncSvFSIuExhTw1Sei4h3H00tLSQ6kdynJkFMhhBpiR4wMXgk+wf0utrVa7FVh/iaKqVbTsDuFjxParu4zuU40gz/Avsi9jGv4ZiR91tpWE3TrI3cYq1MiJFa0zMmA2l/mHa17foAf6HenM2sL4DDN/kXbhXinN+rBSxvw3fIn+JE6kKxu1FHIuzLP7n36Dk8CLWBN8ayifYPFpsSlK2yUOKtHZFVL5b9CoFCM9nZHal8dYcWRSMN7KMFjtSKrT6hFebViLZwNMHFjkBy/Xx45AUjExER9RHuS/ewWzZUluYJznn7KXkO/oKyDOT9i5tV2D8DmBWIAfcsBlFTMFcH5uvWACPio8frDsVLFG0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(44832011)(426003)(4326008)(8936002)(6666004)(508600001)(5660300002)(2616005)(70586007)(6916009)(54906003)(316002)(2906002)(70206006)(8676002)(107886003)(1076003)(336012)(9786002)(7636003)(356005)(83380400001)(26005)(186003)(82310400004)(47076005)(7696005)(36860700001)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:01:32.6695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b999f265-ddca-4d18-c30d-08d9b316d701
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7902
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Robert Hancock <robert.hancock@calian.com>

Hook up the standard GPIO/pinctrl-based recovery support for this
driver.

Based on a patch "i2c: cadence: Recover bus after controller reset" by
Chirag Parekh in the Xilinx kernel Git tree, but simplified to make use
of more common code.

Cc: Chirag Parekh <chiragp@xilinx.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Rebased.

 drivers/i2c/busses/i2c-cadence.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 805c77143a0f..22ca4ca2a1c1 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -179,6 +179,7 @@ enum cdns_i2c_slave_state {
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		Structure holding recovery information.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -204,6 +205,7 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -788,6 +790,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -1270,6 +1273,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
+	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.17.1

