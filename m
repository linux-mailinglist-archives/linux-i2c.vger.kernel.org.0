Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D9C2D2B35
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 13:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgLHMjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 07:39:00 -0500
Received: from mail-mw2nam12on2070.outbound.protection.outlook.com ([40.107.244.70]:22401
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbgLHMi7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 07:38:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USPgYkJe/y1VOpolXrAGcEAKIA3dOv5ZZ7up39rgwaIHKe7hiSOayTLjC2uSOmO9gh5wxKdyk1eL9WB4jli06MEALMGKqtMDodPySwXCkjH6wVjoZnNGgczsnBftdeuMbf+ofEVAYFENfJvUEHnRbfA0p1if06pGGwlhc5PAtpiMCvafAn3aMxwdYNXl3fa/+NnCHtKW1ZaUs/6kTn0UhaQLEc2j5uYrJjfyghMjIBbof/dLmhO1ggMZ7ZZofZ1NQNfA30ixD7dYISFxRNa/ZyJG276CvQu6KJlqpqhAuCmkTJmOyBF3kI5SuNTQKBYaZbM1eZJ6FlEk9Q5yadXTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7zaPkSa1ZmIHDI1ljsTIO7d705WXc82JiG+B6GwMe0=;
 b=QiWrRl6AXDnuwMPQb8KRotFPm/JLfv+EN4fa0oNCkuY7gUjy0uGPrgWoPULwTzwyzxBVFn1Fk5bDLyuneRQ6w9CGxg3vAx+CyzAvtzZkHPbB2Zp/Tdr5iuEHen6M7I6bmjGHZGivaUAOqlFxP076JdgheVbQinJHdJsvzMw3muRyAvzbkhxiBpH5a2QD4NCKyN0tEmWoTkJDNAwaLQ3OEWmV12Xi9s1uOtqyh+nOCpvcP61qfJlOWCOKwhg8JceWVy/a8PiLTtkjuKkgMtrTM7ysSgQ0IR3sE+imXeEMbS+l//Wo1iRhNWMOCyKtju9VZDaywKYgVZC7bO+hqGoZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7zaPkSa1ZmIHDI1ljsTIO7d705WXc82JiG+B6GwMe0=;
 b=rwneiM4T48Mu/HC3P7+0DNTU1tP+7+NRtblDL4pxwuEb4X2YxrfpRWNxD1u8FyBSl5znAFVWDpQTHI5TSax1HE/foNEpWrV9zKtEiHeBQU4BMSc5ZRVYbUGFUiFnAziXbTncVzEVoglU4S7lpQ/Aj2ce3QaWeqWFwMC+MDBFPdk=
Authentication-Results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BY5PR12MB4903.namprd12.prod.outlook.com (2603:10b6:a03:1d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Tue, 8 Dec
 2020 12:38:04 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 12:38:04 +0000
From:   Sanjay R Mehta <sanju.mehta@amd.com>
To:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, krzk@kernel.org,
        kblaiech@mellanox.com, loic.poulain@linaro.org, rppt@kernel.org,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com
Cc:     linux-i2c@vger.kernel.org, Sanjay R Mehta <Sanju.Mehta@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Subject: [PATCH v2] i2c: add i2c bus driver for amd navi gpu
Date:   Tue,  8 Dec 2020 06:37:41 -0600
Message-Id: <1607431061-57635-1-git-send-email-sanju.mehta@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::18) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sanjuamdntb2.amd.com (165.204.156.251) by MA1PR0101CA0008.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 12:38:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c9e5580-59cf-4eac-601a-08d89b761b8c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4903C1C96E977AACD8CE23E8E5CD0@BY5PR12MB4903.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GC9PcJBq9mJsTyZiMdQpIQhKg4T8gBXd46xnzlfraDoObIh1kobgzzVrpZkzkMigjnnll1ngTxUnb+6gSBF+6u8wLZs/md9WcqpkwQN17wj5vkm+TW/0LDN8WSXd8tO9a419pMJv45z4yV5GseLY2gx3wOLWiIxuM8iqDkneVa9nqjDp1TxfXd5HsPpe580wvsqP4zQTAbdsdblFcF5wrz0SzChZLrW/Ipjz99eBDowzStZ8lygiEdLOpGt1Nv5NpgTe0nWlnc89NMLXx0Zi3DUhLs9AMk5lmsT4zKlOIszlxl+C1MB0/Kirlz0EtMmfhiPRoGr8emxXg2HV5S23gNfOo2BhEDlUYcPr7HefR/fy1bGjbBycTgNcotqhr9KF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(5660300002)(4326008)(8936002)(186003)(83380400001)(26005)(66556008)(956004)(66946007)(54906003)(2906002)(66476007)(36756003)(2616005)(52116002)(7696005)(921005)(30864003)(6666004)(16526019)(6486002)(478600001)(7416002)(8676002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/wp9akIDgYwr7+MmK5RHzTlCMufN1zpBkiewEwUWIdofSwt7ZAESSNBLiJC+?=
 =?us-ascii?Q?zSEGSZOsglZUZvFkBPIcu7sDVMsNzWOJCYKRmDPBlhUVr/LIK6zoAE1YS2ry?=
 =?us-ascii?Q?VHipXD/Uc7zbB5jRqtefnGiUsc0XolpL94jIBv464Uk/ELNgkUNySSir8Rz5?=
 =?us-ascii?Q?cubL9YDTIh1bN2WA8uX4zyDszA4BcDgr58UqXwNjhUqkqxNPKZO4ky4M04s7?=
 =?us-ascii?Q?OMVNm0ZuZ+y+rBp3N9yMVFpuP3EbMAA9LmYW/nGo7RLB0f7LtXDmrIWOlM7Z?=
 =?us-ascii?Q?PTO4L8NuGT/cABuzgXJgVrBLxpQ5DaYaQgpVHL5v42SBtb6HY5z80Em5ANQF?=
 =?us-ascii?Q?L1Jw0iRLWfITkx+NG5yurhq6RFy3Dj8J4AV1zX3ldIn7n162lZxIZoldtI37?=
 =?us-ascii?Q?6Btac5jvYiqMtHg1wwm8x417MNvghpJf46vOzZTABIgXKrUgBSlafIcTit8I?=
 =?us-ascii?Q?OQUHj4JJ6RhVqkBasi2l5kyXg0SusQqJ1buo39IMdARwMV1DVd/AH5Il808Q?=
 =?us-ascii?Q?V36STB0m58xhJh3x+ibqrpIvWgWcyvRF5ZAN4AmV2NGMZ1Lv2AC3HJqgXNJG?=
 =?us-ascii?Q?WF0scjMMtWUaF4Hy7StD6vgWMTZ87qJ3xfiLLuzHQYm6Cab+/ZSDiyrViXgs?=
 =?us-ascii?Q?WnGXA1Hhg0tAHlJ46sFGhvboyLmjNSrI+pvlv0NzySvLyRxezT9p/Y1g1wQN?=
 =?us-ascii?Q?X+V4qoox9qAlyBLKkeplEOx3QXLczgvYxz9SxjtPBhf8qcX/V93FEBR7xQ9S?=
 =?us-ascii?Q?fSkbvdl94/R2XJ2V735Fv+3EVithIImdhvVAoTfzO3MuhxlIPGPKxK/2tWzn?=
 =?us-ascii?Q?4jKViErryPfhDojLUNQJeCMKJ5UoqqeKGzzAmUjKo4ZTM+4MqP8nngTaQ4IQ?=
 =?us-ascii?Q?lv9K/iqOmZFLEhhDZbd2rj7gWOfKwSgCzW8tQdMu3etAII9F5MoWT7TCAsLw?=
 =?us-ascii?Q?rO1SvAILgdrvn/en1YmoMXhw76wQgVpqisN1+o4RaTV97HrBc1N/Cvtm6iYn?=
 =?us-ascii?Q?Zx8h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 12:38:04.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9e5580-59cf-4eac-601a-08d89b761b8c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuAirkRIZ1Tq2TOdfsX+tCPzq46W6yQH87A/E5mqMQs5CvonjfT53yA/Ey6S0Xcm094l+dJjNdnIa4hVYUhAsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4903
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sanjay R Mehta <Sanju.Mehta@amd.com>

Latest amdgpu card has USB Type-C interface. There is a Type-C controller
which can be accessed over I2C.

This driver adds I2C bus driver to communicate with Type-C controller. I2C
client driver will be part of USB Type-C UCSI driver.

Signed-off-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
---

Changes in v2:

- converted the code to use regmap, read_poll_timeout and made some cosmetic
  changes as suggested by Andy Shevchenko.
---
 MAINTAINERS                          |   7 +
 drivers/i2c/busses/Kconfig           |   9 +
 drivers/i2c/busses/Makefile          |   1 +
 drivers/i2c/busses/i2c-amdgpu-navi.c | 345 +++++++++++++++++++++++++++
 4 files changed, 362 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-amdgpu-navi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 190c7fa2ea01..93894459a4c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8119,6 +8119,13 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/i2c-core-acpi.c
 
+I2C CONTROLLER DRIVER FOR AMD GPU
+M:	Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+M:	Sanjay R Mehta <sanju.mehta@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-amdgpu-navi.*
+
 I2C CONTROLLER DRIVER FOR NVIDIA GPU
 M:	Ajay Gupta <ajayg@nvidia.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 293e7a0760e7..0ff369c0f41f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -88,6 +88,15 @@ config I2C_AMD_MP2
 	  This driver can also be built as modules.  If so, the modules will
 	  be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
 
+config I2C_AMDGPU_NAVI
+	tristate "AMDGPU NAVI I2C controller"
+	depends on PCI
+	help
+	  If you say yes to this option, support will be included for the
+	  NAVI I2C controller which is used to communicate with the GPU's
+	  Type-C controller. This driver can also be built as a module called
+	  i2c-amdgpu-navi.
+
 config I2C_HIX5HD2
 	tristate "Hix5hd2 high-speed I2C driver"
 	depends on ARCH_HISI || ARCH_HIX5HD2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 19aff0e45cb5..f599473a8ad9 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_I2C_ALI15X3)	+= i2c-ali15x3.o
 obj-$(CONFIG_I2C_AMD756)	+= i2c-amd756.o
 obj-$(CONFIG_I2C_AMD756_S4882)	+= i2c-amd756-s4882.o
 obj-$(CONFIG_I2C_AMD8111)	+= i2c-amd8111.o
+obj-$(CONFIG_I2C_AMDGPU_NAVI)	+= i2c-amdgpu-navi.o
 obj-$(CONFIG_I2C_CHT_WC)	+= i2c-cht-wc.o
 obj-$(CONFIG_I2C_I801)		+= i2c-i801.o
 obj-$(CONFIG_I2C_ISCH)		+= i2c-isch.o
diff --git a/drivers/i2c/busses/i2c-amdgpu-navi.c b/drivers/i2c/busses/i2c-amdgpu-navi.c
new file mode 100644
index 000000000000..3922b8aebc26
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD I2C Controller Driver for Navi GPU's
+//
+// Copyright (c) 2020, Advanced Micro Devices, Inc.
+//
+// Authors:
+//	Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+//	Sanjay R Mehta <Sanju.Mehta@amd.com>
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <asm/unaligned.h>
+#include "i2c-designware-core.h"
+
+#define AMD_UCSI_INTR_EN	0xD
+#define AMD_UCSI_INTR_REG	0x474
+#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
+
+struct amdgpu_i2c_dev {
+	void __iomem		*regs;
+	struct regmap		*map;
+	struct device		*dev;
+	u32			master_cfg;
+	u32			slave_adr;
+	u32			tx_fifo_depth;
+	u32			rx_fifo_depth;
+	u16			ss_hcnt;
+	u16			ss_lcnt;
+	struct i2c_adapter	adapter;
+	struct i2c_board_info	*gpu_ccgx_ucsi;
+	struct i2c_client	*ccgx_client;
+};
+
+static int amdgpu_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct amdgpu_i2c_dev *i2cd = context;
+
+	*val = readl_relaxed(i2cd->regs + reg);
+
+	return 0;
+}
+
+static int amdgpu_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct amdgpu_i2c_dev *i2cd = context;
+
+	writel_relaxed(val, i2cd->regs + reg);
+
+	return 0;
+}
+
+struct regmap_config map_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.disable_locking = true,
+	.reg_read = amdgpu_i2c_read,
+	.reg_write = amdgpu_i2c_write,
+	.max_register = AMD_UCSI_INTR_REG,
+};
+
+static void amdgpu_configure_i2c_bus(struct amdgpu_i2c_dev *i2cd)
+{
+	u16 icon;
+	u32 reg;
+
+	/* First disable the controller */
+	regmap_write(i2cd->map, DW_IC_ENABLE, 0);
+	i2cd->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE | DW_IC_CON_RESTART_EN |
+			   DW_IC_CON_SPEED_STD;
+
+	/* clear all the interrupts */
+	regmap_read(i2cd->map, DW_IC_CLR_INTR, &reg);
+	regmap_write(i2cd->map, DW_IC_INTR_MASK, 0);
+
+	icon = i2cd->master_cfg & AMD_MASTERCFG_MASK;
+	icon &= ~BIT(3);
+	icon &= ~DW_IC_CON_10BITADDR_MASTER;
+	icon = icon | DW_IC_CON_SPEED_STD;
+	/* configure the master */
+	regmap_write(i2cd->map, DW_IC_CON, icon);
+	/* configure the FIFO */
+	i2cd->tx_fifo_depth = 32;
+	i2cd->rx_fifo_depth = 32;
+	regmap_write(i2cd->map, DW_IC_TX_TL, i2cd->tx_fifo_depth);
+	regmap_write(i2cd->map, DW_IC_RX_TL, i2cd->rx_fifo_depth);
+
+	/* setup 100k Speed */
+	i2cd->ss_hcnt = 430;
+	i2cd->ss_lcnt = 570;
+	regmap_write(i2cd->map, DW_IC_SS_SCL_HCNT, i2cd->ss_hcnt);
+	regmap_write(i2cd->map, DW_IC_SS_SCL_LCNT, i2cd->ss_lcnt);
+	/* setup the slave address */
+	i2cd->slave_adr = 0x08;
+	regmap_write(i2cd->map, DW_IC_TAR, i2cd->slave_adr);
+
+	/* Now Enable the controller */
+	regmap_write(i2cd->map, DW_IC_ENABLE, 1);
+}
+
+static int amdgpu_i2c_check_activity(struct amdgpu_i2c_dev *i2cd)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(i2cd->map, DW_IC_STATUS, val,
+				       !(val & DW_IC_STATUS_ACTIVITY),
+				       1100, 20000);
+	if (ret) {
+		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
+		return -ETIMEDOUT;
+	}
+
+	regmap_read(i2cd->map, DW_IC_STATUS, &val);
+	if (val & DW_IC_STATUS_ACTIVITY)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int amdgpu_i2c_check_stopbit(struct amdgpu_i2c_dev *i2cd)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(i2cd->map, DW_IC_INTR_STAT, val,
+				       !(val & DW_IC_INTR_STOP_DET),
+				       1100, 20000);
+	if (ret) {
+		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
+		return -ETIMEDOUT;
+	}
+
+	regmap_read(i2cd->map, DW_IC_CLR_INTR, &val);
+	if (val & DW_IC_INTR_STOP_DET)
+		return -ETIMEDOUT;
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
+static int amdgpu_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct amdgpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
+	int i, j, len, k;
+	int cmd = 0;
+	int status;
+	u8 *buf;
+	u32 val;
+
+	amdgpu_configure_i2c_bus(i2cd);
+
+	for (i = 0; i < num; i++) {
+		buf = msgs[i].buf;
+		len = msgs[i].len;
+
+		if (!(msgs[i].flags & I2C_M_RD))
+			regmap_write(i2cd->map, DW_IC_TX_TL, len - 1);
+
+		for (j = len; j > 0; j--) {
+			if (i == num - 1 && j == 1)
+				cmd |= BIT(9);
+
+			if (msgs[i].flags & I2C_M_RD) {
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100);
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100 | cmd);
+				if (cmd) {
+					regmap_write(i2cd->map, DW_IC_TX_TL, 2 * (len - 1));
+					regmap_write(i2cd->map, DW_IC_RX_TL, 2 * (len - 1));
+					status = amdgpu_i2c_status(i2cd);
+					if (status)
+						return -ETIMEDOUT;
+
+					for (k = 0; k < len; k++) {
+						regmap_read(i2cd->map, DW_IC_DATA_CMD, &val);
+						buf[k] = val;
+					}
+					status = amdgpu_i2c_check_stopbit(i2cd);
+					if (status)
+						return -ETIMEDOUT;
+				}
+			} else {
+				regmap_write(i2cd->map, DW_IC_DATA_CMD, *buf++ | cmd);
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
+static const struct pci_device_id amdgpu_i2c_ids[] = {
+		{PCI_VDEVICE(ATI, 0x7314)},
+		{PCI_VDEVICE(ATI, 0x73A4)},
+		{PCI_VDEVICE(ATI, 0x73C4)},
+		{PCI_VDEVICE(ATI, 0x73E4)},
+		{ }
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
+	strlcpy(i2cd->gpu_ccgx_ucsi->type, "ccgx-ucsi", sizeof(i2cd->gpu_ccgx_ucsi->type));
+	i2cd->gpu_ccgx_ucsi->addr = 0x8;
+	i2cd->gpu_ccgx_ucsi->irq = irq;
+
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
+
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
+	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (status < 0) {
+		dev_err(&pdev->dev, "pci_alloc_irq_vectors err %d\n", status);
+		return status;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+
+	i2cd->map = devm_regmap_init(i2cd->dev, NULL, i2cd, &map_cfg);
+	if (IS_ERR(i2cd->map)) {
+		dev_err(i2cd->dev, "Failed to init the registers map\n");
+		return PTR_ERR(i2cd->map);
+	}
+
+	/* Enable ucsi interrupt */
+	regmap_write(i2cd->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
+	amdgpu_configure_i2c_bus(i2cd);
+	i2c_set_adapdata(&i2cd->adapter, i2cd);
+	i2cd->adapter.owner = THIS_MODULE;
+
+	strlcpy(i2cd->adapter.name, "AMDGPU NAVI I2C adapter", sizeof(i2cd->adapter.name));
+	i2cd->adapter.algo = &amdgpu_i2c_algorithm;
+	i2cd->adapter.dev.parent = &pdev->dev;
+
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
+	return 0;
+
+del_adapter:
+	i2c_del_adapter(&i2cd->adapter);
+free_irq_vectors:
+	pci_clear_master(pdev);
+	pci_free_irq_vectors(pdev);
+	return status;
+}
+
+static void amdgpu_i2c_remove(struct pci_dev *pdev)
+{
+	struct amdgpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
+
+	regmap_write(i2cd->map, AMD_UCSI_INTR_REG, 0);
+	i2c_del_adapter(&i2cd->adapter);
+	pci_free_irq_vectors(pdev);
+}
+
+static struct pci_driver amdgpu_i2c_driver = {
+	.name		= "i2c-amdgpu-navi",
+	.id_table	= amdgpu_i2c_ids,
+	.probe		= amdgpu_i2c_probe,
+	.remove		= amdgpu_i2c_remove,
+};
+module_pci_driver(amdgpu_i2c_driver);
+
+MODULE_DESCRIPTION("AMD I2C Controller Driver for Navi GPUs");
+MODULE_LICENSE("GPL");
-- 
2.25.1

