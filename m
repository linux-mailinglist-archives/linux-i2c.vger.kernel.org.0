Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8991352C5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 06:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgAIFgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 00:36:17 -0500
Received: from mail-dm6nam10on2080.outbound.protection.outlook.com ([40.107.93.80]:7294
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725893AbgAIFgR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 00:36:17 -0500
Received: from BL0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:207:3c::21)
 by BL0PR02MB4737.namprd02.prod.outlook.com (2603:10b6:208:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Thu, 9 Jan
 2020 05:36:14 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by BL0PR02CA0008.outlook.office365.com
 (2603:10b6:207:3c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 05:36:14 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2623.9
 via Frontend Transport; Thu, 9 Jan 2020 05:36:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQUP-0006YI-Ry
        for linux-i2c@vger.kernel.org; Wed, 08 Jan 2020 21:36:13 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQUK-0005zM-JN; Wed, 08 Jan 2020 21:36:08 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0095a7I3011665;
        Wed, 8 Jan 2020 21:36:07 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1ipQUJ-0005yP-2V; Wed, 08 Jan 2020 21:36:07 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, Chirag Parekh <chiragp@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/3] i2c: cadence: Recover bus after controller reset
Date:   Thu,  9 Jan 2020 11:06:03 +0530
Message-Id: <1578548163-21440-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No-0.878-7.0-31-1
X-imss-scan-details: No-0.878-7.0-31-1;No-0.878-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132230217744961870;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(199004)(189003)(73392003)(86362001)(426003)(107886003)(336012)(36756003)(6666004)(356004)(6916009)(54906003)(4326008)(70586007)(55446002)(70206006)(26005)(2616005)(5660300002)(316002)(9786002)(2906002)(8936002)(81166006)(82202003)(9686003)(498600001)(8676002)(81156014)(76482006)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB4737;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 483eaba8-80e7-47af-e6c0-08d794c5d7b8
X-MS-TrafficTypeDiagnostic: BL0PR02MB4737:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4737A24335A10F45A910CF1887390@BL0PR02MB4737.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02778BF158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02plRM8cS2RbXi2xzO/0Yn14vvcQYxh9C9ifA4kgraXR2KVyzP+7PlCsZnMoDxR6uyLpM8WlQInF/n1INLTeYWUopvbclv0HMQ4pAjoFWNL9Exx4n3h6bO/L6m1TCX/giGkJLJeQc3R4BWKKuFFC9MBSzyaasXuKFtyzBLTCl2bgiAkIvAnHv80Az5Zxqr8XcgkheOTshSFq5FmTvv0Kmh4Y0zrYP47qu2HB0/E5gMWaDlsOb5qmouuPt6rUddX1/84jtKiuJ+/IaBgbYPJsnCD+Rp6pW72FOyT6ghV10eiw+4DC6JNS3g3l0Hh4FA0f4A/RKuvSSgMVGI1sLNZ6jZRgcAnVzhPhOvl/sw5srwSfH+Y3Fnb5yxIpORcprApt+fWQtOMGx8oOkHSlzaDGvsOryW/hFCysRThDgeHWfZKQEVnAwG5nAlWzU5H9hpLyEIIY9YCfww1eKG9iy/3C+TUj7XYjjtPpXfiZ2Hxj88ssYzKG3qrETz1wI2ACO5Uq
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 05:36:14.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483eaba8-80e7-47af-e6c0-08d794c5d7b8
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4737
Sender: linux-i2c-owner@vger.kernel.org
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
 drivers/i2c/busses/i2c-cadence.c | 101 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8a2983e..d214dfe 100644
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
@@ -139,6 +142,10 @@
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		Structure holding recovery information.
+ * @pinctrl:		Pin control state holder.
+ * @pinctrl_pins_default: Default pin control state.
+ * @pinctrl_pins_gpio:	GPIO pin control state.
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -160,6 +167,10 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_pins_default;
+	struct pinctrl_state *pinctrl_pins_gpio;
 };
 
 struct cdns_platform_data {
@@ -544,6 +555,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -880,6 +892,88 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
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
+
+	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
+
+	/* Setting pin state as gpio */
+	pinctrl_select_state(p_cdns_i2c->pinctrl,
+			     p_cdns_i2c->pinctrl_pins_gpio);
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
+
+	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
+
+	/* Setting pin state to default(i2c) */
+	pinctrl_select_state(p_cdns_i2c->pinctrl,
+			     p_cdns_i2c->pinctrl_pins_default);
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
+	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda-gpios", 0);
+	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl-gpios", 0);
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
@@ -926,6 +1020,13 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
+	id->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (!IS_ERR(id->pinctrl)) {
+		ret = cdns_i2c_init_recovery_info(id, pdev);
+		if (ret)
+			return ret;
+	}
+
 	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	id->membase = devm_ioremap_resource(&pdev->dev, r_mem);
 	if (IS_ERR(id->membase))
-- 
2.1.1

