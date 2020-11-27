Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB692C726D
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389817AbgK1VuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:07 -0500
Received: from mail-dm6nam10on2055.outbound.protection.outlook.com ([40.107.93.55]:27745
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729884AbgK0TrW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Nov 2020 14:47:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNhxD5SwNUL6S4Txzu5uHbLs2WPTZAOoCI7Em6Bt9Q+NBb8u+KbSO3NMoU1diiPkkGkn58KSBJyCmgtH6qZ6sVzhOEXWFD3ST33fyWU2+oOGjm4+7DnWHHkw3H+Zya1Fjy8WZSQNXA577br3E04x4jxVaEcD5+Se2WfxOM0M1PNxu7HfKQNceIAffAo+5la6Tpaq9hypM/IIF6C21TbJtZZITtuITNiI4Hn0PfNK3Q+2wofJ6MPkUWhZLc9EUUeIG883DnCm+ix7bOx4r6NCLQ0bT1K4zSClHGzLrLDVZ0SaitaUPPfaeb8HNTdnyayF9YUO9m9V2euIhSUoYoORNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4TVOJAlas9BawQnstIAXPIhSG1ge1daMfvHgl3CmYc=;
 b=UF8p4XVTXN/EuXvBXAvLcg+Ub3MKpyq00xG0SARpWAA0PXVkxTAoLTEMjkA2jSgtm1Wef8/aEb5e4E7sdyYMbpaVislItMHeMnKeDmL9Ne7UI91s8UG1qnXAZSfTgh9f1bKVjItdc13DPYBT72CJPLIPK8urfEZb+ITI+lMQBMld06OedRDhcbOMBupZphDFdqagnDA15oW5I3BJhtJx4uuVRMQ6vfCbbqCfEad3cf3YqGv6BYP/3uDzdjoY7HxmTs5Tjsgb2XmByrlTErD5BgXhFQyyMzOdHeMla55xUyrfTQPmF6YZ/25LvwH2rvrRt//SKinINJj4LXtxvvAU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4TVOJAlas9BawQnstIAXPIhSG1ge1daMfvHgl3CmYc=;
 b=i3YJhhl6x63IGELCf8B0fb8wc6zz2+n/Sw/7+y+OluRQedMyKCDrkc3x4sG+8eg3IuzoZqX6TrHbW33GJIo8Qx5LX5yniAIBroDZZbfdzolwO4iRlUM0DIIdftcyKVpSetSe3aA9z6P3W8tlIpn3CTUd8uS5Ro/9iQMjqSXQhVc=
Authentication-Results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Fri, 27 Nov
 2020 19:31:07 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 19:31:07 +0000
From:   Sanjay R Mehta <sanju.mehta@amd.com>
To:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, krzk@kernel.org,
        kblaiech@mellanox.com, loic.poulain@linaro.org, rppt@kernel.org,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com
Cc:     linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Subject: [PATCH] i2c: add i2c bus driver for AMD NAVI GPU
Date:   Fri, 27 Nov 2020 13:30:39 -0600
Message-Id: <1606505439-39836-1-git-send-email-sanju.mehta@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::18) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sanjuamdntb2.amd.com (165.204.156.251) by MAXPR0101CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 19:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4004cab7-f7f8-41d2-58a5-08d8930afc7d
X-MS-TrafficTypeDiagnostic: BYAPR12MB4615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB4615048DF6EC79E2251E4B8AE5F80@BYAPR12MB4615.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqNsDoiv1+5JSHS1EpZZIL3wVYuvMA6MMVLhMvFRUACoV8jo2D+AbtC3oey3PzwY82VG7Pm13vDLr72nw6sUhE0TCsT9IqQutxzOCbJSo4IxypFtsEo+fA9jldpTRqrGxRohCJjczhEGHU/zpAW60EFvrHvsvwPJNAgJdWT3SCsV/QVJi6acx4f0S/aIVFvjO7DIwlHzwtESbP1Vew3L04CVCn7Bd89qSKus12Q49Tjp5o4YWQfhoVhbrfRQXdL4a7McKj6Ohyf4PcjKzUBns76Dz5RwLEyegBViFy687wE/u3w38H4bNvH5jlYQi8QVebnnueFo4pwBMx4eP0FyGxtWKxsuyJIJ/Xmey/m7n6A0g9BLZ5xvDs10DQ21c751
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(26005)(52116002)(921005)(186003)(8676002)(7416002)(7696005)(4326008)(6486002)(54906003)(8936002)(2906002)(2616005)(316002)(66556008)(66946007)(66476007)(6666004)(956004)(16526019)(30864003)(5660300002)(36756003)(83380400001)(478600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EudEG+e2wvVi5/f8AooYDJ7e1w0x12XvA6NM7ZTKHIm7x55i1/g0f709QPKm?=
 =?us-ascii?Q?KsRO7BFY+Z1FwlhdYa2onqs0DVQJz3iIfHRfdo/Fjwl50KH0J+4TRpUP0hhJ?=
 =?us-ascii?Q?dp1Bcf+IzjnRppv3ajR6uTCNT4sddGPc0ak0QMMYh61TA27pK8ybl6RH7Lzy?=
 =?us-ascii?Q?izLhvA+2RXp0vfxwoTYlO471Bc/kKfCAkjbFM6JDgpKUpOjIfu9Y+Vv+9uqe?=
 =?us-ascii?Q?KU7ka/cWddUMWBp6TxLUrSBDA8pRgWD7wVIzSPhCyFAvKv8UYYal5qpnTWTL?=
 =?us-ascii?Q?xgV0NyRJjIRDMmGoO7WzjpGHIr6+FzPyMZgxghmAyI6ZSep1VUKJhUHb7hNj?=
 =?us-ascii?Q?EuowAbO9SAG8Hfu7CehjpOIsTys7OksffAHxQUqC5zjS1oXuTqOkCljFEmCY?=
 =?us-ascii?Q?M/4KchARyEn2HCDMows20Pu+Go20Iq2L17RmUDo0mAbMVTasW7rk2laIhNH8?=
 =?us-ascii?Q?sCwg1LrB+Snd7WOi+/wkuKxNUr5ytwu92E30qikIoGnfVf4JeSsPBAgFcDmy?=
 =?us-ascii?Q?htUMlPZN5PQlV+WKSlyF5azS4GV05Vk+YHHv/yLLFsBR0lHkANxGb0Y+J0QX?=
 =?us-ascii?Q?C1PQ+ZRl4GHnaxLqGLN6+siZQfdfHvqh9z9HH7DynyWkstij7InwoxCs7aqz?=
 =?us-ascii?Q?R7n9zbwQGXWKo8PHmr5G5ux899wmA/Siy360ct6OOwwlcJGXMhQG8cV3eduF?=
 =?us-ascii?Q?IcWDHoS9TIzg9t+W3ko4MRE2NFfDbSv/VqAfsBR5FDIQs9NIkI5vmgVTIOVG?=
 =?us-ascii?Q?InUUy7eZOhMSGBXZyMV8lqRyE0GjlzKcFVH58SQdFgx51EycRkdMcfgT2n7s?=
 =?us-ascii?Q?f/LqFF1VVOFakPeqCdG6sXYPUxcbWKMWPUsZ2cbHURdkJDPW9p+brA6979p9?=
 =?us-ascii?Q?iQX0UAOyUYr2LjNNZsrHj0dulRqleVmrV9sK3HdfL8vHb/BGDAQSnpwd7/6x?=
 =?us-ascii?Q?0bbVEdmqhsaxTi4GynKLcdjPtoisHfsa0IaHTHk5SXEV4UJ5hAlZLBG4XZcl?=
 =?us-ascii?Q?jDtF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4004cab7-f7f8-41d2-58a5-08d8930afc7d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 19:31:07.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tLqBpN1QYUSgjj40Y5o5IN0hD4mn/vOhrB2rjslGStvgKl9QpH8Q0s4txXqaS4XwTatEfebzSOOtVuNLBMAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4615
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>

Latest AMD GPU card has USB Type-C interface. There is a
Type-C controller which can be accessed over I2C.

This driver adds I2C bus driver to communicate with Type-C controller.
I2C client driver will be part of USB Type-C UCSI driver.

Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Co-developed-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
Signed-off-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
---
 MAINTAINERS                          |   7 +
 drivers/i2c/busses/Kconfig           |   9 +
 drivers/i2c/busses/Makefile          |   1 +
 drivers/i2c/busses/i2c-amdgpu-navi.c | 334 +++++++++++++++++++++++++++++++++++
 4 files changed, 351 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-amdgpu-navi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a008b70..59923c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8187,6 +8187,13 @@ S:	Maintained
 F:	Documentation/i2c/busses/i2c-nvidia-gpu.rst
 F:	drivers/i2c/busses/i2c-nvidia-gpu.c
 
+I2C CONTROLLER DRIVER FOR AMD NAVI GPU
+M:	Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+M:	Sanjay R Mehta <sanju.mehta@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-amdgpu-navi.c
+
 I2C MUXES
 M:	Peter Rosin <peda@axentia.se>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a97a9d0..7e268ef 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -322,6 +322,15 @@ config I2C_VIAPRO
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-viapro.
 
+config I2C_AMDGPU_NAVI
+	tristate "AMDGPU NAVI I2C controller"
+	depends on PCI
+	help
+	  If you say yes to this option, support will be included for the
+	  NAVI I2C controller which is used to communicate with the GPU's
+	  Type-C controller. This driver can also be built as a module called
+	  i2c-amd-gpu.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 683c49f..5818f2d 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+obj-$(CONFIG_I2C_AMDGPU_NAVI)	+= i2c-amdgpu-navi.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-amdgpu-navi.c b/drivers/i2c/busses/i2c-amdgpu-navi.c
new file mode 100644
index 0000000..3067899
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+//
+// AMD I2C Controller Driver for Navi GPU's
+//
+// Copyright (c) 2020, Advanced Micro Devices, Inc.
+//
+// Author: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+//	   Sanjay R Mehta <Sanju.Mehta@amd.com>
+
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+
+#include "i2c-designware-core.h"
+
+#define DRIVER_DESC "AMD I2C Controller Driver for Navi"
+#define AMD_UCSI_INTR_REG 0x474
+#define AMD_UCSI_INTR_EN 0xD
+#define AMD_MASTERCFG_MASK GENMASK_ULL(15, 0)
+
+struct amdgpu_i2c_dev {
+	void __iomem *regs;
+	struct device *dev;
+	u32 master_cfg;
+	u32 slave_adr;
+	u32			tx_fifo_depth;
+	u32			rx_fifo_depth;
+	u32			sda_hold_time;
+	u16			ss_hcnt;
+	u16			ss_lcnt;
+	u16			fs_hcnt;
+	u16			fs_lcnt;
+	u16			fp_hcnt;
+	u16			fp_lcnt;
+	u16			hs_hcnt;
+	u16			hs_lcnt;
+	struct i2c_adapter adapter;
+	struct i2c_board_info *gpu_ccgx_ucsi;
+	struct i2c_client *ccgx_client;
+};
+
+static void amdgpu_configure_i2c_bus(struct amdgpu_i2c_dev *i2cd)
+{
+	u16 icon;
+
+	/* First disable the controller */
+	writel(0, i2cd->regs + DW_IC_ENABLE);
+	i2cd->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE | DW_IC_CON_RESTART_EN
+			   | DW_IC_CON_SPEED_STD;
+
+	/* clear all the interrupt */
+	readl(i2cd->regs +  DW_IC_CLR_INTR);
+	writel(0, i2cd->regs + DW_IC_INTR_MASK);
+
+	icon = i2cd->master_cfg & AMD_MASTERCFG_MASK;
+	icon &= ~BIT(3);
+	icon &= ~DW_IC_CON_10BITADDR_MASTER;
+	icon = icon | DW_IC_CON_SPEED_STD;
+	/* configure the master */
+	writel(icon, i2cd->regs + DW_IC_CON);
+	/*configure the FIFO */
+	i2cd->tx_fifo_depth = 32;
+	i2cd->rx_fifo_depth = 32;
+	writel(i2cd->tx_fifo_depth, i2cd->regs +  DW_IC_TX_TL);
+	writel(i2cd->rx_fifo_depth, i2cd->regs +  DW_IC_RX_TL);
+
+	/* setup 100k Speed */
+	i2cd->ss_hcnt = 430;
+	i2cd->ss_lcnt = 570;
+	writel(i2cd->ss_hcnt, i2cd->regs + DW_IC_SS_SCL_HCNT);
+	writel(i2cd->ss_lcnt, i2cd->regs + DW_IC_SS_SCL_LCNT);
+	/* setup the slave address */
+	i2cd->slave_adr = 0x08;
+	writel(i2cd->slave_adr, i2cd->regs + DW_IC_TAR);
+
+	/* Now Enable the*/
+	writel(1, i2cd->regs + DW_IC_ENABLE);
+}
+
+static int amdgpu_i2c_check_activity(struct amdgpu_i2c_dev *i2cd)
+{
+	int timeout = ETIMEDOUT;
+
+	while (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY) {
+		if (timeout <= 0) {
+			dev_dbg(i2cd->dev, "timeout waiting for bus ready\n");
+			if (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY)
+				return -ETIMEDOUT;
+			return 0;
+		}
+		timeout--;
+		usleep_range(1000, 1100);
+	}
+
+	return 0;
+}
+
+static int amdgpu_i2c_check_stopbit(struct amdgpu_i2c_dev *i2cd)
+{
+	int timeout = ETIMEDOUT;
+
+	while (readl(i2cd->regs + DW_IC_INTR_STAT) & DW_IC_INTR_STOP_DET) {
+		if (timeout <= 0) {
+			dev_dbg(i2cd->dev, "timeout waiting for STOP BIT ready\n");
+			if (readl(i2cd->regs + DW_IC_INTR_STAT) & DW_IC_INTR_STOP_DET)
+				return -ETIMEDOUT;
+			return 0;
+		}
+		timeout--;
+		usleep_range(1000, 1100);
+	}
+
+	return 0;
+}
+
+static int amdgpu_i2c_status(struct amdgpu_i2c_dev *i2cd)
+{
+	int status;
+
+	status = amdgpu_i2c_check_activity(i2cd);
+	if (status)
+		return -ETIMEDOUT;
+
+	status = amdgpu_i2c_check_stopbit(i2cd);
+	if (status)
+		return -ETIMEDOUT;
+
+	return status;
+}
+
+/* Polling based xfer routine */
+static int amdgpu_i2c_master_xfer(struct i2c_adapter *adap,
+				  struct i2c_msg *msgs, int num)
+{
+	struct amdgpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
+	int i, j, len, k;
+	int cmd = 0;
+	int status;
+	u8 *buf;
+
+	pm_runtime_get_sync(i2cd->dev);
+	amdgpu_configure_i2c_bus(i2cd);
+
+	for (i = 0; i < num; i++) {
+		buf = msgs[i].buf;
+		len = msgs[i].len;
+
+		if (!msgs[i].flags & I2C_M_RD)
+			writel(len - 1, i2cd->regs +  DW_IC_TX_TL);
+
+		for (j = len; j > 0; j--) {
+			if (i == num - 1 && j == 1)
+				cmd |= BIT(9);
+
+			if (msgs[i].flags & I2C_M_RD) {
+				writel(0x100, i2cd->regs + DW_IC_DATA_CMD);
+				writel(0x100 | cmd, i2cd->regs + DW_IC_DATA_CMD);
+				if (cmd) {
+					writel(2 * (len - 1), i2cd->regs +  DW_IC_TX_TL);
+					writel(2 * (len - 1), i2cd->regs +  DW_IC_RX_TL);
+					status = amdgpu_i2c_status(i2cd);
+					if (status)
+						return -ETIMEDOUT;
+
+					for (k = 0; k < len; k++)
+						buf[k] = readl(i2cd->regs + DW_IC_DATA_CMD);
+					status = amdgpu_i2c_check_stopbit(i2cd);
+					if (status)
+						return -ETIMEDOUT;
+				}
+			} else {
+				writel(*buf++ | cmd, i2cd->regs + DW_IC_DATA_CMD);
+				usleep_range(10000, 11000);
+			}
+		}
+		status = amdgpu_i2c_check_stopbit(i2cd);
+		if (status)
+			return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static u32 amdgpu_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm amdgpu_i2c_algorithm = {
+	.master_xfer	= amdgpu_i2c_master_xfer,
+	.functionality	= amdgpu_i2c_functionality,
+};
+
+#define PCI_DEVICE_ID_UCSI_AMD	0x73a4
+static const struct pci_device_id amdgpu_i2c_ids[] = {
+		{PCI_VDEVICE(ATI, PCI_DEVICE_ID_UCSI_AMD)},
+		{}
+};
+MODULE_DEVICE_TABLE(pci, amdgpu_i2c_ids);
+
+static int amdgpu_populate_client(struct amdgpu_i2c_dev *i2cd, int irq)
+{
+	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
+					   sizeof(*i2cd->gpu_ccgx_ucsi),
+					   GFP_KERNEL);
+	if (!i2cd->gpu_ccgx_ucsi)
+		return -ENOMEM;
+
+	strlcpy(i2cd->gpu_ccgx_ucsi->type, "ccgx-ucsi",
+		sizeof(i2cd->gpu_ccgx_ucsi->type));
+	i2cd->gpu_ccgx_ucsi->addr = 0x8;
+	i2cd->gpu_ccgx_ucsi->irq = irq;
+	i2cd->ccgx_client = i2c_new_client_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
+	if (!i2cd->ccgx_client)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int amdgpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct amdgpu_i2c_dev *i2cd;
+	int status;
+	int irq;
+
+	i2cd = devm_kzalloc(&pdev->dev, sizeof(*i2cd), GFP_KERNEL);
+	if (!i2cd)
+		return -ENOMEM;
+
+	i2cd->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, i2cd);
+	status = pcim_enable_device(pdev);
+	if (status < 0) {
+		dev_err(&pdev->dev, "pcim_enable_device failed %d\n", status);
+		return status;
+	}
+
+	pci_set_master(pdev);
+
+	i2cd->regs = pcim_iomap(pdev, 0, 0);
+	if (!i2cd->regs) {
+		dev_err(&pdev->dev, "pcim_iomap failed\n");
+		return -ENOMEM;
+	}
+
+	/* Enable ucsi interrupt */
+	writel(AMD_UCSI_INTR_EN, i2cd->regs + AMD_UCSI_INTR_REG);
+
+	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (status < 0) {
+		dev_err(&pdev->dev, "pci_alloc_irq_vectors err %d\n", status);
+		return status;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	amdgpu_configure_i2c_bus(i2cd);
+	i2c_set_adapdata(&i2cd->adapter, i2cd);
+	i2cd->adapter.owner = THIS_MODULE;
+	strlcpy(i2cd->adapter.name, "AMDGPU NAVI I2C adapter",
+		sizeof(i2cd->adapter.name));
+	i2cd->adapter.algo = &amdgpu_i2c_algorithm;
+	i2cd->adapter.dev.parent = &pdev->dev;
+	status = i2c_add_adapter(&i2cd->adapter);
+	if (status < 0)
+		goto free_irq_vectors;
+
+	status = amdgpu_populate_client(i2cd, irq);
+	if (status < 0) {
+		dev_err(&pdev->dev, "amdgpu_populate_client failed %d\n", status);
+		goto del_adapter;
+	}
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
+	return 0;
+
+del_adapter:
+	i2c_del_adapter(&i2cd->adapter);
+free_irq_vectors:
+	pci_free_irq_vectors(pdev);
+	return status;
+}
+
+static void amdgpu_i2c_remove(struct pci_dev *pdev)
+{
+	struct amdgpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
+
+	writel(0, i2cd->regs + AMD_UCSI_INTR_REG);
+	pm_runtime_get_noresume(i2cd->dev);
+	i2c_del_adapter(&i2cd->adapter);
+	pci_free_irq_vectors(pdev);
+}
+
+static __maybe_unused int amdgpu_i2c_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static __maybe_unused int amdgpu_i2c_resume(struct device *dev)
+{
+	struct amdgpu_i2c_dev *i2cd = dev_get_drvdata(dev);
+
+	amdgpu_configure_i2c_bus(i2cd);
+	pm_request_resume(&i2cd->ccgx_client->dev);
+	return 0;
+}
+
+static UNIVERSAL_DEV_PM_OPS(amdgpu_i2c_driver_pm, amdgpu_i2c_suspend, amdgpu_i2c_resume,
+			    NULL);
+
+static struct pci_driver amdgpu_i2c_driver = {
+	.name		= "amdgpu-ucsi-i2c",
+	.id_table	= amdgpu_i2c_ids,
+	.probe		= amdgpu_i2c_probe,
+	.remove		= amdgpu_i2c_remove,
+	.driver		= {
+		.pm	= &amdgpu_i2c_driver_pm,
+	},
+};
+module_pci_driver(amdgpu_i2c_driver);
+
+MODULE_AUTHOR("Nehal Bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>");
+MODULE_AUTHOR("Sanjay R Mehta <Sanju.Mehta@amd.com>");
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.7.4

