Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4964D564D75
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jul 2022 07:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiGDFya (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jul 2022 01:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiGDFy3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jul 2022 01:54:29 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9051D65AE
        for <linux-i2c@vger.kernel.org>; Sun,  3 Jul 2022 22:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxgyglnaggpQRLu6TSflMuVBvVwERe6czcQVL8xjhfCuQfmBlqidX4ma+NFs/O4kHUpVxaFIy1dthjkg4Q60U0EgMM1DD475dTBhPh4Rsj+HAnOHRkq9wpjCZHUsMVFjhc9VLOtcJ9DO2gN+TDhpaGC4u2Cq86hANOLLrNBDULqykqsJG9k6TjMbKxJDTJ+VGU72B4KdmrGzNjA76qbzt/3clLS2MqT3MxH+kWMvVlh6QwdFdSJNnsRvv4xhrSZasSJsIKR8wfYkwH4nF68DHwkTz4X0l5UaSGfvfEGyuYeb7PVvyE0ftKbAcOycbtIh60tYk50uLEcMc/LoO2dLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2MnfDNnWQH6CpMJsRw7lJBPQjIpwUkA8UcYSiQ2/Lc=;
 b=jek413krZjX7MTCEAe2Q5q7kaHU15kZmvzRVMOdmsKx0ELr3rWfL+XsHZpBvFOeU+3S3AK2AQ3cUd1oNwXv2y7/KOqVNrFAuF/Y7JgKCSL1TO29rIPrQbt3Xpx484uvNUE8FVohlB69Imu+LwaUBFMmXvTwg9xqx3K7GlVuzEezNIE1flXhd3LSiedS0A7OkG6iVzN3RDWeVvOPKe2DwQL15Qg9nNwcabOjXq5s7mMTb1jo+WwMnolXtVM41qs31NdN9c6EmE7OGLx+PcEm+UeMXFBfPr5aCe92QWoZywb9HPCGEYdYFHt7Lp4WN2LqRmPomlVGtF2iWk6BtqT+wGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2MnfDNnWQH6CpMJsRw7lJBPQjIpwUkA8UcYSiQ2/Lc=;
 b=P7W5NADN2JYoqdx3ca35ZeUw1E0ALKrjDaFsFdB++s8KYQupbQ0NkvkSinaMezllYS2z9QHpjujTE1gTrinJPbya6VlNU5o3DCs9V0ynQXmUfWQPCJWd6Bktxqgyai8Y4GABPZAyPFII2N0cjjuGqIEYdAEm6UlPGrT5G7qL89U=
Received: from BN6PR14CA0040.namprd14.prod.outlook.com (2603:10b6:404:13f::26)
 by BL3PR02MB7891.namprd02.prod.outlook.com (2603:10b6:208:352::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 05:54:25 +0000
Received: from BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::de) by BN6PR14CA0040.outlook.office365.com
 (2603:10b6:404:13f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Mon, 4 Jul 2022 05:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT019.mail.protection.outlook.com (10.13.3.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 05:54:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 3 Jul 2022 22:54:24 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 3 Jul 2022 22:54:24 -0700
Envelope-to: linux-i2c@vger.kernel.org,
 robert.hancock@calian.com,
 shubhrajyoti.datta@amd.com
Received: from [172.23.64.3] (port=50777 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o8F2O-000Bze-89; Sun, 03 Jul 2022 22:54:24 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v2] i2c: cadence: Add standard bus recovery support
Date:   Mon, 4 Jul 2022 11:24:20 +0530
Message-ID: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed1a9705-7c22-44c4-abbc-08da5d81a691
X-MS-TrafficTypeDiagnostic: BL3PR02MB7891:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n92/Z1fwxBbY2QJALrsG65SzxRfVQC1h9shduGXAJqSFPZ1CXTktnhtoTYptpR2GA4vQPDMxMtXPx6iX/NpVGv75kiAh3gD3eMURs2g9fEKStY5hNzqqxH/0GKIdRRnKhwPwFx3K9jEd7fqE8OwRKKRAATyB4suse5MseDscWY3hE1YhB/L6E2Bpb5usDECQjD+aOGUaDHMyQkW5bYRxLVFuMD0Los4qUp+vQ7zKGtR0cd+y4uDs2n0lGEl3KsH35XDv9zhQ1Jv5PydIz0CVQ4drA2kYHq+zlrYWL+C/C9iXgulutXDEPJXhG6lms75wSJah6dOoGf0GhDHAn+NVxbWxmOinpMQOajfBZ5+Fqez/+sNheuhQJGTI+ub6Vuz7HM2AXIbHADPBfm2l4b0OCZdZoTP19KToVwNwBlKpJTV5t2xzVp/juOQ2xGjRmZ/bzt+yv5K4US10D96Iah5gH6sJKQO1nKUUz8YugE/n+Rj/VS/CURRUld/Yz/4o3cENZ76BJNE0UKywu82NVYSDRXZPSkN8wW5D0bNj4HjWMNJwYY30QZvqKDcsjpcLtf0xCrIeC2dqfG9vNwAmI53Sg+CA2FZYKPvuSS03D1B+nmXALzafWyVAQuD695ixK7EYQsi6XKMSAUcv97RsOFtAb104G3ne5XUUdRd850aPOwfBTizgLskf49I+HRGxS229E1xnwZY0sWQanpQDie7JOoO6fA4Mv7TwRSZEXk86LYqb6u+qs4f5YwEt6RelrAPZsnK1V7giiFrJQitNgNjQ7E5zNrc0hLJOSRg2c6wTKj9nWlrb25U/1fosjrjKk7Q+yCYSXWIN9gXTucA5H1Rx14lg/nz/ufRsW136JFyFaTwcGQWNO9Ls5JJruKF7I5rd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(36756003)(41300700001)(82310400005)(83380400001)(6666004)(2906002)(7696005)(426003)(478600001)(26005)(336012)(186003)(966005)(2616005)(47076005)(44832011)(36860700001)(40480700001)(54906003)(6916009)(5660300002)(4326008)(356005)(8676002)(82740400003)(9786002)(8936002)(70206006)(70586007)(7636003)(40460700003)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 05:54:25.1669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1a9705-7c22-44c4-abbc-08da5d81a691
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7891
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Robert Hancock <robert.hancock@calian.com>

Hook up the standard GPIO/pinctrl-based recovery support..
In the discurssion
https://patchwork.ozlabs.org/project/linux-i2c/patch/20211129090116.16628-1-shubhrajyoti.datta@xilinx.com/

recovery should be done at the beginning of the transaction.
Here we are doing the recovery at the beginning on a timeout.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v2:
Updated the busbusy check on a timeout

 drivers/i2c/busses/i2c-cadence.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b4c1ad19cdae..cf15eca1f9e4 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -125,6 +126,8 @@
 #define CDNS_I2C_DIVB_MAX	64
 
 #define CDNS_I2C_TIMEOUT_MAX	0xFF
+#define CDNS_I2C_POLL_US	100000
+#define CDNS_I2C_TIMEOUT_US	500000
 
 #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
 
@@ -179,6 +182,7 @@ enum cdns_i2c_slave_state {
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		Structure holding recovery information.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -204,6 +208,7 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -796,6 +801,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -852,8 +858,12 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 #endif
 
 	/* Check if the bus is free */
-	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
+	ret = readl_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET, reg,
+				 !(reg & CDNS_I2C_SR_BA),
+				 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
+	if (ret) {
 		ret = -EAGAIN;
+		i2c_recover_bus(adap);
 		goto out;
 	}
 
@@ -1278,6 +1288,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
+	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.17.1

