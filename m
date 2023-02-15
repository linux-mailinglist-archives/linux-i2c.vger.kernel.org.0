Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55AE698500
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 20:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjBOTyE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 14:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjBOTyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 14:54:01 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF18D10FE
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 11:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuEIuBSYrkf2wBAATHAm6TfpycoWGufttkWzxT3anpOIIaY2DOeiv9e1hqh23mgtKDYyXaiZhx3r85lU9HgIn8NpwtPV8/JUE5uuB+jxhbKZOo1h0VCEWLaBbYwz9ow2IiNvvap2S5dny+TMKDYSjlaO4X9eiGNQF5OEJvNozO19ihQNWRhh7Yf708LbMElJ9bwqcp+haEgJQ0Jue1kj1f/LtEIVohoZQUnbzgPsaX5kQCwa77qlnfLNmJleLQQJyV3R3tPLKZ+5zUd5p788QvFa1r0KZqNKokJBRayXepXLpvsjhOWFIFPQ+R52ruVoaWExWxiSuAftLQrromG7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIsKl1QCKWCxPJTcfNaQ2JqdM98t9TMwEwaAylIxaFo=;
 b=lQ0Bg9O0kcAVdIijUDEUCL6AITG73aGOI5ZggleaL7oC30+vj/Hz53QZ/Y3oesVygDQbtIFlbGGuqX1ISZl0a8UvSit9dqm6bgF56kZ74wpZn46Noo8Hy+Ja0yjWzewD5TX6OxZaupHWd1e6/1yfPijxaBNV/TmcPgMhLGLL/vloObA9GzsxkLZtw/kUv0zYJ9KwrOItNax25TCEQOSgamu5HJbVWLIShXjCpZklh95s3Vxt3p6qXkPk0kaNVlMraI+fnOrkDM/LdKbJHeUWp7lGclE6vJGKpe2rgPXqQhFE4H3nP9cdVGcQDzRmMkaAksQUssR6Hf/7IsYNOw646A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIsKl1QCKWCxPJTcfNaQ2JqdM98t9TMwEwaAylIxaFo=;
 b=AxVJAGOvUl/4Fx/P7byk6hlv2c8R+Frj2jaWHQmwYEwsceR/Eum4MVUzeCPy5gb0wsrl7VTAtCYNjO5TGz8wXdcqiB4KOK+XwNAkZQ2HfNa5WjoAsUf+786w/d9ze3sniD7itLos10bTv1pRTKytCztHm+JkK+cYiEdHUOEXjVkrerqcPw92q+VmAuaczBY1O2o5BectklBybuyWJXencqvJ/pKDgukkMmAvAyzoQ9X6U7Rn1feHFp0xJW7CeNz6hHcHwJYbjapE4SxmwgE05pb1uPmdNVopRUm8/Tz08n79mINCZdwSvfdBpESDSrfaChLH4+Yuswy9cC3JOLSseg==
Received: from DS7PR07CA0013.namprd07.prod.outlook.com (2603:10b6:5:3af::19)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 19:53:56 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::2d) by DS7PR07CA0013.outlook.office365.com
 (2603:10b6:5:3af::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Wed, 15 Feb 2023 19:53:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.12 via Frontend Transport; Wed, 15 Feb 2023 19:53:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 15 Feb
 2023 11:53:43 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 15 Feb 2023 11:53:42 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <peda@axentia.se>, <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next 1/1] i2c: mux: Add register map based mux driver
Date:   Wed, 15 Feb 2023 21:53:22 +0200
Message-ID: <20230215195322.21955-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 459a7e55-22ff-4e1e-5a81-08db0f8e5f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mo3jJfrKRpLgZgaHh2wvqeia5PKf0dfHTi8Lq8Qjh8NukmSxWAg7jksPPJnTdVlUd02PQvj87Tz87VVr9paTozYmD78pxS8wQ0s/Ew9jRwEfOuC0w+ugn6voQo9pk1cjOpdn2/X0W4nTUU67TM3A5EjQBxtQvwWqe6jlEIxoDFrPOVlt2BjUxW36+2eUsTC/09E0WrBh/K+BjJi8nPh2NjEh/jaBYF2d698dOmy51B8GGltpxAo0icIhi3uTlpGgvgM5asuS3XtfzX7QDY70UgeN/4MSTbUBohBie8JkoeBC+NN5Vw6o9VqYR/zJ6ts9O1EswGjP/plQzqbSHpBweeWoPj5yPW4sJOI1I+eodChMOremQlOnfLv/wZ5eMSuMTg+EcUNtKp+ff8OWf5dlCX7/DOzm41Rm3gDoAi8FcgIt5l94hG0FM9hd+PZh7KGAT/2vrxTvL88p4EA1BSQDFy2HP7qHvKdc4P3xtrw7wYu/XzJKwdg261wczExYBreRPNnW+3UrcLgrslLLMLUBmrBYlINShDZdgiFhzzGTIUxtpsdpeQDfUzpOYd5bv3VFh11xyQ2rQ07LQ9U8GQ1y1wXcRzy0y1dBTL4zkT1opTj6oMeBx0coWZYPVXL7Q6Pj3DtJcqJh7EQmWBo+F/ysHIB+Z/uQFErkRfP/IPIs1rmpFc6+tgCanqf5xoIy8awIClSTq9SgUehd0xv9hrLWCg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36840700001)(46966006)(40470700004)(426003)(2616005)(336012)(47076005)(478600001)(316002)(82740400003)(5660300002)(16526019)(40460700003)(2906002)(82310400005)(1076003)(36756003)(26005)(36860700001)(186003)(4326008)(8676002)(356005)(70586007)(8936002)(70206006)(7636003)(41300700001)(110136005)(83380400001)(54906003)(6666004)(107886003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 19:53:55.5478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 459a7e55-22ff-4e1e-5a81-08db0f8e5f03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add 'regmap' mux driver to allow virtual bus switching by setting a
single selector register.
The 'regmap' is supposed to be passed to driver within a platform data
by parent platform driver.

Motivation is to support indirect access to register space where
selector register is located.
For example, Lattice FPGA LFD2NX-40 device, being connected through
PCIe bus provides SPI or LPC bus logic through PCIe-to-SPI or
PCIe-to-LPC bridging. Thus, FPGA operates a as host controller and
some slave devices can be connected to it. For example:
- CPU (PCIe) -> FPGA (PCIe-to-SPI bridge) -> CPLD or another FPGA.
- CPU (PCIe) -> FPGA (PCIe-to-LPC bridge) -> CPLD or another FPGA.
Where 1-st FPGA connected to PCIe is located on carrier board, while
2-nd programming logic device is located on some switch board and
cannot be connected to CPU PCIe root complex.

In case mux selector register is located within the 2-nd device, SPI or
LPC transactions are sent indirectly through pre-defined protocol.

To support such protocol reg_read()/reg_write() callbacks are provided
to 'regmap' object and these callback implements required indirect
access.

For example, flow in reg_write() will be as following:
- Verify there is no pending transactions.
- Set address in PCIe register space.
- Set data to be written in PCIe register space.
- Activate write operation in PCIe register space.
- LPC or SPI write transaction is performed.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/muxes/Kconfig                    |  12 ++
 drivers/i2c/muxes/Makefile                   |   1 +
 drivers/i2c/muxes/i2c-mux-regmap.c           | 123 +++++++++++++++++++
 include/linux/platform_data/i2c-mux-regmap.h |  34 +++++
 4 files changed, 170 insertions(+)
 create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
 create mode 100644 include/linux/platform_data/i2c-mux-regmap.h

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index ea838dbae32e..af2dbacdda57 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,16 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_REGMAP
+	tristate "Register map based I2C multiplexer"
+	depends on REGMAP
+	help
+	  If you say yes to this option, support will be included for a
+	  register map based I2C multiplexer. This driver provides access to
+	  I2C busses connected through a MUX, which is controlled
+	  by a single register through the regmap.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-mux-regmap.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..092dca428a75 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
 obj-$(CONFIG_I2C_MUX_REG)	+= i2c-mux-reg.o
+obj-$(CONFIG_I2C_MUX_REGMAP)	+= i2c-mux-regmap.o
 
 ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
diff --git a/drivers/i2c/muxes/i2c-mux-regmap.c b/drivers/i2c/muxes/i2c-mux-regmap.c
new file mode 100644
index 000000000000..e155c039a90e
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-regmap.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+/*
+ * Regmap i2c mux driver
+ *
+ * Copyright (C) 2023 Nvidia Technologies Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_data/i2c-mux-regmap.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+/* i2c_mux_regmap - mux control structure:
+ * @last_val - last selected register value or -1 if mux deselected;
+ * @pdata: platform data;
+ */
+struct i2c_mux_regmap {
+	int last_val;
+	struct i2c_mux_regmap_platform_data pdata;
+};
+
+static int i2c_mux_regmap_select_chan(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct i2c_mux_regmap *mux = i2c_mux_priv(muxc);
+	int err = 0;
+
+	/* Only select the channel if its different from the last channel */
+	if (mux->last_val != chan) {
+		err = regmap_write(mux->pdata.regmap, mux->pdata.sel_reg_addr, chan);
+		mux->last_val = err < 0 ? -1 : chan;
+	}
+
+	return err;
+}
+
+static int i2c_mux_regmap_deselect(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct i2c_mux_regmap *mux = i2c_mux_priv(muxc);
+
+	/* Deselect active channel */
+	mux->last_val = -1;
+
+	return regmap_write(mux->pdata.regmap, mux->pdata.sel_reg_addr, 0);
+}
+
+/* Probe/reomove functions */
+static int i2c_mux_regmap_probe(struct platform_device *pdev)
+{
+	struct i2c_mux_regmap_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct i2c_mux_regmap *mux;
+	struct i2c_adapter *parent;
+	struct i2c_mux_core *muxc;
+	int num, err;
+
+	if (!pdata)
+		return -EINVAL;
+
+	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	memcpy(&mux->pdata, pdata, sizeof(*pdata));
+	parent = i2c_get_adapter(mux->pdata.parent);
+	if (!parent)
+		return -EPROBE_DEFER;
+
+	muxc = i2c_mux_alloc(parent, &pdev->dev, pdata->num_adaps, sizeof(*mux), 0,
+			     i2c_mux_regmap_select_chan, i2c_mux_regmap_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, muxc);
+	muxc->priv = mux;
+	mux->last_val = -1; /* force the first selection */
+
+	/* Create an adapter for each channel. */
+	for (num = 0; num < pdata->num_adaps; num++) {
+		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
+		if (err)
+			goto err_i2c_mux_add_adapter;
+	}
+
+	/* Notify caller when all channels' adapters are created. */
+	if (pdata->completion_notify)
+		pdata->completion_notify(pdata->handle, muxc->parent, muxc->adapter);
+
+	return 0;
+
+err_i2c_mux_add_adapter:
+	i2c_mux_del_adapters(muxc);
+	return err;
+}
+
+static int i2c_mux_regmap_remove(struct platform_device *pdev)
+{
+	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
+
+	i2c_mux_del_adapters(muxc);
+	i2c_put_adapter(muxc->parent);
+
+	return 0;
+}
+
+static struct platform_driver i2c_mux_regmap_driver = {
+	.driver = {
+		.name = "i2c-mux-regmap",
+	},
+	.probe = i2c_mux_regmap_probe,
+	.remove = i2c_mux_regmap_remove,
+};
+
+module_platform_driver(i2c_mux_regmap_driver);
+
+MODULE_AUTHOR("Vadim Pasternak (vadimp@nvidia.com)");
+MODULE_DESCRIPTION("Regmap I2C multiplexer driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:i2c-mux-regmap");
diff --git a/include/linux/platform_data/i2c-mux-regmap.h b/include/linux/platform_data/i2c-mux-regmap.h
new file mode 100644
index 000000000000..a06614e5edd2
--- /dev/null
+++ b/include/linux/platform_data/i2c-mux-regmap.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0 */
+/*
+ * Regmap i2c mux driver
+ *
+ * Copyright (C) 2023 Nvidia Technologies Ltd.
+ */
+
+#ifndef __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H
+#define __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H
+
+/**
+ * struct i2c_mux_regmap_platform_data - Platform-dependent data for i2c-mux-regmap
+ * @regmap: register map of parent device;
+ * @parent: Parent I2C bus adapter number
+ * @chan_ids - channels array
+ * @num_adaps - number of adapters
+ * @sel_reg_addr - mux select register offset in CPLD space
+ * @reg_size: register size in bytes
+ * @handle: handle to be passed by callback
+ * @completion_notify: callback to notify when all the adapters are created
+ */
+struct i2c_mux_regmap_platform_data {
+	void *regmap;
+	int parent;
+	const unsigned int *chan_ids;
+	int num_adaps;
+	int sel_reg_addr;
+	u8 reg_size;
+	void *handle;
+	int (*completion_notify)(void *handle, struct i2c_adapter *parent,
+				 struct i2c_adapter *adapters[]);
+};
+
+#endif	/* __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H */
-- 
2.20.1

