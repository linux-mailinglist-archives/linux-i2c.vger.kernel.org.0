Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6465B583846
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jul 2022 07:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiG1FwC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jul 2022 01:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiG1FwB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jul 2022 01:52:01 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA72056BBA
        for <linux-i2c@vger.kernel.org>; Wed, 27 Jul 2022 22:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvh50BQEZlnBAKKdZg/cJptMFjecyheAjFGROthKQ0Yt7mwtWieOaiI5B0aaA31gpyj2X0ryIF0wabq/FBeuVZAYqwGPYRoJuA37Q3vjy4jqJsXo3jVsGLKgdSLIYoRNDXel0IakmjCc4D0zaqpJftOqbjuoG6t+0YL04dzOsF9i7aEC2yzB1yBM1VldxFGxhul2fcGn0G2wWRuDogKoGJUuBlm0FhqnR7MfthvBRhDcnKJMgbwnPtVBD7lpts9LDaJHnCLkTErNiyj+T0fxKQ3cyh2qNiVKpZzGpWFPAflXz0O1XxSfy6d+Q9OHsH8bDR15gsPhQgbzTwfdtnDXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MTJprcKE57tIOr28KNQz3xaaYDI3khZsAZKXcv2m2o=;
 b=ejnCzhwojzhYqZ0UO8TxocITntTUpERs29iSJmehNjsMKQjOOIqzw3aTd+8WpgqSStlXnp6cUkJRADhaR95/NkIDHBlUeBnU1mDUbni1/HxpWd8uXaESgPLo8ZjYbQBYYz7v4LTqSH7KHwyYCeiwNbwOfqDXowfJ4xDhPfh+wI3RFMcSpRkg6N8eK5yg5FcZL1j3UaHH6kl1JY+oAGe8YMx4epKGo85GfnoctUem3BIh2QodPAOprxqPPDqpBoaobATyNS0rmKzL1ARxVcMb9Mwh0oQw7Pm3w+YtJOUKX0IpE+f1ReeGO+G1kByJfu/OfZlganzOYeaeVK9aGIi3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MTJprcKE57tIOr28KNQz3xaaYDI3khZsAZKXcv2m2o=;
 b=fwYINDRhNfpckdDANyP49Uv5NaB7DA9LyWVKsfyYl/u6MH/DVYuAhz2S7kSJizsd5rvjXQrhXGHUNjN4lhPcN+R7pUGrUkmCuiUpcZ83UCrdEov27Y3m6ZMgxUO28LxWRp1Z2w9SpNTQxkAYkgYMdmUdtafxhaiOyZsNML195Gk=
Received: from DM6PR11CA0023.namprd11.prod.outlook.com (2603:10b6:5:190::36)
 by MWHPR02MB2302.namprd02.prod.outlook.com (2603:10b6:300:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 05:51:57 +0000
Received: from DM3NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::7) by DM6PR11CA0023.outlook.office365.com
 (2603:10b6:5:190::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20 via Frontend
 Transport; Thu, 28 Jul 2022 05:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT060.mail.protection.outlook.com (10.13.4.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 05:51:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 27 Jul 2022 22:51:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 27 Jul 2022 22:51:56 -0700
Envelope-to: linux-i2c@vger.kernel.org,
 git-dev@amd.com,
 robert.hancock@calian.com
Received: from [10.140.6.59] (port=47326 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1oGwRA-0005Ts-9y; Wed, 27 Jul 2022 22:51:56 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git-dev@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3] i2c: cadence: Add standard bus recovery support
Date:   Thu, 28 Jul 2022 11:21:50 +0530
Message-ID: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12e49f58-1a55-4553-b94c-08da705d4861
X-MS-TrafficTypeDiagnostic: MWHPR02MB2302:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6PzbKXXvYQam9GkRF/J7vd/++1J4EQuYCQlF6/IHlhYJdWRqnnrHZ1s6WuOIZQY7Z/9kb2ZuZs6WfU1wUCIYU0ppb0eQHJ5UEyDEIR049gsX1eLMxcZMD7wZf27MgdaZCdlany/TN/yLRQvcnLS4vO4W3cgnPNfQE55lsQ1AOD3wQmI7NunfcymVNoWRWcROFIx3rgCY8p0tyPsmjXZO5CfkQ76CchQvIHCWMIycYEAUy3r43fib6p2N1LPlhGdmhSI0wmDbXN9K4i+4gZGn30gfrwNjw+FRddX6Cbc8Uo/BIkxmY9LRDV5F13kYuEm1LxUp4vkBhoxtYYV74hioCUogPvgXqGJkBFnOzms/5jLG0TvjjWB6Fg3zhCro4Bck3EdVoquprOhrmyPrEwJkdFZMpXho51bImLSNBI4u+fRUAyH9p7sPMsuFy6ahvUXvtMxbTPuEBzmPnQxQERfFQ+V15HP18pgRzA7bOSREZk5QxKtSLpVBwmgbkC7ihVqlrFp5CmQTmTAQEZDTQJZURRVRQAM0A/DYXikJW2p5bIktD3NID/GtAimGnIsTDKnBqqhriqZ0tOJ8N9hGNQH3pmvadCHVHOZvP1u6vLuuqeFZE/t/cxnB4y7xHAqu030QAe/ZkToSSUnyJgLCtgUMf11uDk0/8uk5Xj38iPRCGDcZVeWE7wZV20qr0N2wj8kbZj4Gj4L00oAu8drEAgnFcZAyW/dJIpsrW7oL1LrlaeaoQNvna2RBkjdE+FDOWbtNUi5oYalEnnkoYap1gT1EDf2In0RpTTZFW79dtLVCdMAJosgKCArbS/MapY+1QGAyyUzGJmEECEnQ5kq0WoEjuA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(40470700004)(46966006)(36840700001)(7696005)(6916009)(44832011)(82740400003)(2616005)(2906002)(82310400005)(40480700001)(316002)(54906003)(8676002)(70586007)(70206006)(6666004)(41300700001)(4326008)(26005)(356005)(47076005)(83380400001)(186003)(7636003)(40460700003)(478600001)(8936002)(336012)(36756003)(1076003)(426003)(36860700001)(5660300002)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 05:51:57.3729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e49f58-1a55-4553-b94c-08da705d4861
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2302
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hook up the standard GPIO/pinctrl-based recovery support.
We are doing the recovery at the beginning on a timeout.

Multiple people have contributed to the series.
Original patch from Cirag and another one from Robert.

Cc: Chirag Parekh <chiragp@xilinx.com>
Cc: Robert Hancock <robert.hancock@calian.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 v2:
Updated the busbusy check on a timeout
v3:
Added pinctrl_get

Did unit testing and probed the scl to see the clock pulses.


 drivers/i2c/busses/i2c-cadence.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 630cfa4ddd46..c9a10d4297a9 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -10,10 +10,12 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
 
 /* Register offsets for the I2C device. */
 #define CDNS_I2C_CR_OFFSET		0x00 /* Control Register, RW */
@@ -127,6 +129,8 @@
 #define CDNS_I2C_TIMEOUT_MAX	0xFF
 
 #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
+#define CDNS_I2C_POLL_US	100000
+#define CDNS_I2C_TIMEOUT_US	500000
 
 #define cdns_i2c_readreg(offset)       readl_relaxed(id->membase + offset)
 #define cdns_i2c_writereg(val, offset) writel_relaxed(val, id->membase + offset)
@@ -204,6 +208,7 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -832,8 +837,14 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 #endif
 
 	/* Check if the bus is free */
-	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
+
+	ret = readl_relaxed_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET,
+					 reg,
+					 !(reg & CDNS_I2C_SR_BA),
+					 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
+	if (ret) {
 		ret = -EAGAIN;
+		i2c_recover_bus(adap);
 		goto out;
 	}
 
@@ -1242,6 +1253,12 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
+	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(id->rinfo.pinctrl)) {
+		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(id->rinfo.pinctrl);
+	}
+
 	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
@@ -1258,6 +1275,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
+	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.17.1

