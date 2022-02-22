Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756FF4BF9BE
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Feb 2022 14:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbiBVNrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 08:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbiBVNrL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 08:47:11 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7281A6E4C4;
        Tue, 22 Feb 2022 05:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUPBLKgMXKgxImcv3WeeiOV1BNrRKmFcDJsmFtLLXeaGeqqp3WdzZX1ll5ZHDTxTOBAh9ZCyUx+zs26Sx5JWwcibYypfNLgGYtwtbtWSmEmomGjS8GwuHGspaXIBPCFjxonFHZYqck7lhNs+OGRvKZv6Y/VFW1tAvxh5j8U6JZBQhEWge3jK2Nx/MDIKNJI4Hz1jdHsIer8di478vuBzzYSFd7DzO3UrKDCsAM8oTw7TTpYjpttExKwOyQn8HFMJnGpZGI6rBJwTi2yaoUliFC4JmzkSwsBDdcDnp93jj4H/uwRhFJcjFHAOciayrcZInGULHwtFES++2hVu1YoGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taTQKiq06mws3wfAeH3jLrhDRw2ynjRAmGQBFYn9eeo=;
 b=a5GLgsOzCiNgWcjsML47E4G/N0QMKWvcR90pQlYBZ2frL0oekq/FA7tnM0iX+H8b5PyRYNujo1z4yFgWnyQBmsA47ZZX55p4nL3fEeS5iNX8FrfPboKSeWKSMmWjyTHM8ODoPbxAN2aU2VS0g5ITUW61VoFN/Xb600pcRl2Gi64v13Qc3P6JTOMsoFdm1knan53TVq5XoJahxGJvkp2LBj3Z8RV7ddVIXNr4VoKAYrc+l5aWi9FuO37FF9AkHvELFV2Nto97EzdRzLiWG77YDqbh7TPuPvFZcz4+Op+CGuwhpW8LPbud4IZlGfXUUZDA7I5bGlQ3JPywkzADN+LRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taTQKiq06mws3wfAeH3jLrhDRw2ynjRAmGQBFYn9eeo=;
 b=nZp5jrNTRdG/5hpOGCjYgRS2kkPZ9KCVyXhoBYJG2fZzHY/nhxSUmrlThTopN2J07Ev7vnA/4K3UCUWRKq4YzdXOpw93CU+rSZVE2IaGUxjFLyhv5UmiFCpnWPTPSIwxsFAG1+eiBFSznb6NA5UExVoC/tThRTzix36kmUpsw9s=
Received: from BN0PR04CA0133.namprd04.prod.outlook.com (2603:10b6:408:ed::18)
 by SA2PR02MB7563.namprd02.prod.outlook.com (2603:10b6:806:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 13:46:42 +0000
Received: from BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::d9) by BN0PR04CA0133.outlook.office365.com
 (2603:10b6:408:ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Tue, 22 Feb 2022 13:46:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT060.mail.protection.outlook.com (10.13.3.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.19 via Frontend Transport; Tue, 22 Feb 2022 13:46:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 22 Feb 2022 05:46:39 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 22 Feb 2022 05:46:39 -0800
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.59] (port=35756 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nMVV0-00071z-Gh; Tue, 22 Feb 2022 05:46:38 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <git@xilinx.com>, <michal.simek@xilinx.com>,
        <linux-kernel@vger.kernel.org>, Chirag Parekh <chiragp@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] i2c: cadence: Recover bus after controller reset
Date:   Tue, 22 Feb 2022 19:16:32 +0530
Message-ID: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cddca7e0-0c4f-43bc-0f48-08d9f609c218
X-MS-TrafficTypeDiagnostic: SA2PR02MB7563:EE_
X-Microsoft-Antispam-PRVS: <SA2PR02MB75638C253E20E57C97FA522AAA3B9@SA2PR02MB7563.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+6SaDIn1MWsRQJPQmslM9ab32G3wst/WQz3RIuO0LsUCWpqPMOqxwYdIKicIhInyncP/+32XRIaq5i8GrBZYc1QrRQH5ArYi+sYky5Ai6qWaV0GCL4Amvl/mGf4tgVh8J8M8Luf/IgdUcog1AAj5i9xLV49jPqHerDrLm2tMR/bclRZtSGJxrf6pM1Saq4ftzB390UvuL8tk5LAaA7MNBGwR3QzWpfhriHpChpPEElrncUQH3XfF+SbOAuZH4UKUIa8ii+TxYJZxQKBvdLtEkmIr/gD8jIJJ4LR9UFqiRkREsl+vbtD/T2KZJ3SqGMQaJyHLuMS0V0rN68ySPfjRRgQV2LxhiOhOt1EsJsTLnVeIW6ChYxey/k/JqN+dKL2wKFwVgNkNLHqXprrGOpY41GECxexIzxev5eyM3EH3rjx+BGTi76x5Xzo2USsQXp27pgvq6BwohMYO9J6escfQFU4QOX3zR4gFsXrT2+M1kXpLDr4dSxqMQTuL/ii+QjYdLULI4F7lsJRXtHvo1+Tj28jKTBd/cRLE3fw8yXMs8ZxhuwUIoX5sVcENaORIISmV7RQeByciXSVbzw+7FTTQ5eUMBYvYLpj6T+aIzZ/TurGD+C/ZXF2s+DqOBp6NlmB+vCimiSCWUdFNMA8G7khWC7w///jpKt64j2SXH8kxjMk55I5ZJGBQvUcVYkIh9/jTcdi8KmzCT68g0ZTyb035g==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(426003)(47076005)(336012)(83380400001)(44832011)(40460700003)(36756003)(5660300002)(9786002)(2906002)(8936002)(450100002)(26005)(7696005)(2616005)(107886003)(36860700001)(186003)(70586007)(70206006)(356005)(7636003)(54906003)(8676002)(508600001)(316002)(1076003)(6916009)(82310400004)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 13:46:41.9724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cddca7e0-0c4f-43bc-0f48-08d9f609c218
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7563
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Chirag Parekh <chiragp@xilinx.com>

This will save from potential lock-up caused when I2c master controller
resets in the middle of transfer and the slave is holding SDA line to
transmit more data.

Signed-off-by: Chirag Parekh <chiragp@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 109 +++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 805c77143a0f..682821481b67 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -7,13 +7,16 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
 
 /* Register offsets for the I2C device. */
 #define CDNS_I2C_CR_OFFSET		0x00 /* Control Register, RW */
@@ -179,6 +182,10 @@ enum cdns_i2c_slave_state {
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		Structure holding recovery information.
+ * @pinctrl:		Pin control state holder.
+ * @pinctrl_pins_default: Default pin control state.
+ * @pinctrl_pins_gpio:	GPIO pin control state.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -204,6 +211,10 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_pins_default;
+	struct pinctrl_state *pinctrl_pins_gpio;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -788,6 +799,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -1208,6 +1220,96 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+/**
+ * cdns_i2c_prepare_recovery - Withhold recovery state
+ * @adapter:    Pointer to i2c adapter
+ *
+ * This function is called to prepare for recovery.
+ * It changes the state of pins from SCL/SDA to GPIO.
+ */
+static void cdns_i2c_prepare_recovery(struct i2c_adapter *adapter)
+{
+	struct cdns_i2c *p_cdns_i2c;
+	int ret;
+
+	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
+
+	/* Setting pin state as gpio */
+	ret = pinctrl_select_state(p_cdns_i2c->pinctrl,
+			     p_cdns_i2c->pinctrl_pins_gpio);
+	if (ret < 0)
+		dev_err(p_cdns_i2c->adap.dev.parent,
+				"pinctrl_select_state failed\n");
+}
+
+/**
+ * cdns_i2c_unprepare_recovery - Release recovery state
+ * @adapter:    Pointer to i2c adapter
+ *
+ * This function is called on exiting recovery. It reverts
+ * the state of pins from GPIO to SCL/SDA.
+ */
+static void cdns_i2c_unprepare_recovery(struct i2c_adapter *adapter)
+{
+	struct cdns_i2c *p_cdns_i2c;
+	int ret;
+
+	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
+
+	/* Setting pin state to default(i2c) */
+	ret = pinctrl_select_state(p_cdns_i2c->pinctrl,
+			     p_cdns_i2c->pinctrl_pins_default);
+	if (ret < 0)
+		dev_err(p_cdns_i2c->adap.dev.parent,
+				"pinctrl_select_state failed\n");
+}
+
+/**
+ * cdns_i2c_init_recovery_info  - Initialize I2C bus recovery
+ * @pid:        Pointer to cdns i2c structure
+ * @pdev:       Handle to the platform device structure
+ *
+ * This function does required initialization for i2c bus
+ * recovery. It registers three functions for prepare,
+ * recover and unprepare
+ *
+ * Return: 0 on Success, negative error otherwise.
+ */
+static int cdns_i2c_init_recovery_info(struct cdns_i2c *pid,
+		struct platform_device *pdev)
+{
+	struct i2c_bus_recovery_info *rinfo = &pid->rinfo;
+
+	pid->pinctrl_pins_default = pinctrl_lookup_state(pid->pinctrl,
+			PINCTRL_STATE_DEFAULT);
+	pid->pinctrl_pins_gpio = pinctrl_lookup_state(pid->pinctrl, "gpio");
+
+	/* Fetches GPIO pins */
+	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda-gpios", GPIOD_ASIS);
+	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl-gpios", GPIOD_ASIS);
+
+	/* if GPIO driver isn't ready yet, deffer probe */
+	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
+	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	/* Validates fetched information */
+	if (IS_ERR(rinfo->sda_gpiod) ||
+	    IS_ERR(rinfo->scl_gpiod) ||
+			IS_ERR(pid->pinctrl_pins_default) ||
+			IS_ERR(pid->pinctrl_pins_gpio)) {
+		dev_dbg(&pdev->dev, "recovery information incomplete\n");
+		return 0;
+	}
+
+	rinfo->prepare_recovery     = cdns_i2c_prepare_recovery;
+	rinfo->unprepare_recovery   = cdns_i2c_unprepare_recovery;
+	rinfo->recover_bus          = i2c_generic_scl_recovery;
+	pid->adap.bus_recovery_info = rinfo;
+
+	return 0;
+}
+
 static const struct dev_pm_ops cdns_i2c_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
 			   cdns_i2c_runtime_resume, NULL)
@@ -1254,6 +1356,13 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
+	id->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (!IS_ERR(id->pinctrl)) {
+		ret = cdns_i2c_init_recovery_info(id, pdev);
+		if (ret)
+			return ret;
+	}
+
 	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
-- 
2.17.1

