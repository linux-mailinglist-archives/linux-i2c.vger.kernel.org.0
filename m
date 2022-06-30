Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A31F561A31
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 14:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbiF3MSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 08:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbiF3MSj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 08:18:39 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D94F318
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 05:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iODEIFge6iPY8pfFmB+1IcbT1m/kxoaSX/EDZrw0+deKuCYVjoJB01MSvNIcc0bKHtJGnDlOnuaCACtPF5wBWd2HTsz+5CQ9Ho+nvzZ2KiTIWshVE0BztNT77CAh4Lr0i2gRW5sfLqGXoZ7famx/hvqD4bOzA39B6nxhiYMyf08KH2dGU3HgUeft37gUYagHGuVQtd5rhaj3FktUHwcE2S9pzQSXSIRUnaFQ7M3VRwkzqmBjdjQLPiJIrP+V+Ch52XjJXAk1JFhYa0eNhNzWUvdwUPl7Hmf3n2BbKixOacbuTzrzMHQOM5ESoXnl0s31NPmukl8PMtgkwh4Ejp5YBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDiyiTZlQA9ukbH3R5Y1eUqlr5TVzl8Bw43e/88nREE=;
 b=ehxzpgT+11cQUkoflyAO30MI3zzy5dXHJ5/zedDbgtwXfR2R65NjEMFjoCh95AU0OZU75IybV/aVDfLTyEIODg60rqrOgz67vcmuUXvbbC0y69SPTpcg66SjTMkx58JczmC8/LVmIJoFyz/iWozKjcXhOIAw27SP1Tm11LJ2ukW4CYvVnsEhZJulEL/aP/cz+t6mvpj84qOAb2+5qa8tMVOFpYT3e/Uoi0i1z8OXFJ6LpC46B2I5Iip1lZFg4q2Og1B9Bj56lvOmQ6j8R31+DEKp1ZAqcV6S0ylxkMmHuRtVgc6mBF0m+3VwJ7uaAvOj9MONPERnRFvdSLldiz8Vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDiyiTZlQA9ukbH3R5Y1eUqlr5TVzl8Bw43e/88nREE=;
 b=Oy0CZHBJMAZm78qAIAh/+O3qBqr4+wHKhnkOPFOHtx2CNNObRkkS/4a6N7fe7zFTq9vnesvNyxQXeVmymNnVdZM6OpEP1HWnnL8iwxgp4UCeN5Xt66Rqk7r1Z2UCW4I1cZRCX6OXfRDPyjkCI0XEo665KQve0/GTwUX9kSeRBKs=
Received: from DM6PR01CA0015.prod.exchangelabs.com (2603:10b6:5:296::20) by
 BYAPR02MB5576.namprd02.prod.outlook.com (2603:10b6:a03:a1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Thu, 30 Jun 2022 12:18:33 +0000
Received: from DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::19) by DM6PR01CA0015.outlook.office365.com
 (2603:10b6:5:296::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 12:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT051.mail.protection.outlook.com (10.13.4.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 12:18:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 30 Jun 2022 05:18:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 30 Jun 2022 05:18:32 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 git@amd.com
Received: from [172.23.64.3] (port=40152 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o6t7v-0007vG-BK; Thu, 30 Jun 2022 05:18:31 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@amd.com>, <git@xilinx.com>
Subject: [PATCH] i2c: cadence: Add standard bus recovery support
Date:   Thu, 30 Jun 2022 17:48:28 +0530
Message-ID: <1656591508-16313-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95e451aa-ac7b-4c91-2a1f-08da5a92a6d9
X-MS-TrafficTypeDiagnostic: BYAPR02MB5576:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CnFsgoBpmLoAxpO8HxOBUKOrnxfzSkDRf24TTHdk7+zRLhI7qr1/32ZwuO+tQvqB4heOchmvuLZHR6zTGDpFozmC/p+0imPA87fxycPqybVfiFUfEM1HMmaSQIBvYHVnXx8li6v6j7u7R0z+iORv02ClZeP/MeOvmDbcSrJ0jo90kpGLDzvZgpJsfcQ3lyzUD2/4eY1glt9v3tRVXe6ghw3+zkTMhP9CI7CSQi+Uen0Kxv5cD7bPzXo/Qy5Z3f6dhMHPmift5/k86LlRHBqc+wdYZvgqHzlsXhDjnRIJU4N/RQ0ZfxgkCV+TWZ3hGE0YFwdQ0QCpF1SuBKBunMmhd4SRWSeIhRp+p8SYT+6+kFoheKLv9udZL4KyErP6/uKzjGuV9BEZ/AABpPqjvlwCQs7pxDdVC8RiqFYdE9b/Mh48CNbWxUVaX/Qu7nkVKvv4aofdgr4/P2kmpuQAncoz45N2dW4qa1/QxVZWqYgIuu8yiYMQH+8pCFdERKEk/Ma6A1SH8ec++wJgmdSux+AuBc2I0gp+fR5/YnxXKvvwRgy/ToHU0Odr7SRh+V/wQ3ZnbRsD8jlAfPPlNk7I8EEHWvhBxh7xNNQ0suPuhrcjR7sJNAIHM/Vy6FenxrzKgvn9thKETBYg9q/JIuAdJ6dyjVyl3e0LpGTQC9QI0dRGuwo4UiqIf4XQ1q3VgBk7d2vU7M7qZ2xW9xJg1/fSnkFVLg0TUJGY1KrI/la8WNRioONnn5R0KnlnifHqNdocuEqUyPTHQAdo8YHHB1k8LW4263y91oX9onlP49p4xNusD47p6C8RJ+qo/Lr0E45eGm861tcatBmXH0q3EDiv7ZSH8bf6JYrfhAbqpeCWSSqVxLJNYGXyejrgmvArqzbRya6I
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(70206006)(70586007)(7696005)(6666004)(54906003)(4326008)(356005)(41300700001)(44832011)(316002)(7636003)(40460700003)(6916009)(5660300002)(26005)(966005)(426003)(82310400005)(83380400001)(47076005)(107886003)(82740400003)(9786002)(8676002)(478600001)(40480700001)(336012)(36860700001)(2906002)(36756003)(186003)(8936002)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 12:18:33.6384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e451aa-ac7b-4c91-2a1f-08da5a92a6d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5576
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

