Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5CC2D3037
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 17:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgLHQvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 11:51:20 -0500
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com ([40.107.237.68]:17888
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727113AbgLHQvU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 11:51:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOJ3scE0hRB9acwCbPHiOu6AYE1JPY92zi3rvZb7VpXeusikHSAcl8Y2YO/tlwWUz+26eaRzCv1iQrLCo0tSfUptR6ydbbnCM8q1+iIJeM+D/mT+abtElYY1ErKYSGlcM+VX5/40sM8Wul1AxUvqZ5bLYZH7ex7iJ0y2oexfC5WPfAVkS0ekICYrGzOWWP178Xm2htoN4W4gtPa3OixRudwshe1f5Pl9HpBFyjaCFhMqzmQsu57ms2jUjjGtIQSAgsw9bDjfL66IFH335z2bwa26kqRYb5XbSevl03rrHVNW4/KDp6hdVDrPx3jyaYQxS5+Uu4945G6mOE1VVKeHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAbj+L/eYK4AxIJDfYFPnmAOeOq1gQ8tzr6EsEmPf6Y=;
 b=HR1ei/7myChkUr05JqQ23Zg+ImHatQuQZbjCoxQFzpuLNtSIr89DLL6zCHMUMKFkHBoTii7tJF4dURi9laZhQGngn4J/dpumBn30eS2aZx8t3VD3bVNLUJVS6LLh9IdLit6gsSGQR/guZe06Ec4WSSnM7qTOxMbQop8L9kuXH+8oNWOGuxYySegfm8/xinoKEhHAnSdkXQfWNkZBIXvvXHG4uwkSJfA/FHtC7wZ2sWiD/MoxUFBAhR3GiSsBYyhIGf6hDm/tunIZrFsgWGXcnXNnvmFqMFhtyCKNX3FLspGjE+1jaBOnivZs+5drsJwI1Kj5PuB5kgQ9V10GnRQ1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAbj+L/eYK4AxIJDfYFPnmAOeOq1gQ8tzr6EsEmPf6Y=;
 b=J3sczIhvW2AxE7Hk8kgbwX1wSoiaxf8PhUzb1cUI56tLNEo3iZjRzX/tWQM/gHroLQRUk0OWTQqfCD9KG9fAROka9akQjrFf0bqysnu26gf84qIe60/fbNmITlV8npCdne6u9S1n+5W0UYdjqS3Z4Oe9IIykuRTWW3LRQk+Psbg=
Authentication-Results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 16:50:21 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 16:50:21 +0000
From:   Sanjay R Mehta <sanju.mehta@amd.com>
To:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, krzk@kernel.org,
        kblaiech@mellanox.com, loic.poulain@linaro.org, rppt@kernel.org,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com
Cc:     linux-i2c@vger.kernel.org, Sanjay R Mehta <Sanju.Mehta@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Subject: [PATCH v3] i2c: add i2c bus driver for amd navi gpu
Date:   Tue,  8 Dec 2020 10:48:24 -0600
Message-Id: <1607446104-58597-1-git-send-email-sanju.mehta@amd.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::22) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sanjuamdntb2.amd.com (165.204.156.251) by MAXPR0101CA0012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 16:50:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96afc65e-c93d-4a4e-69aa-08d89b9959cc
X-MS-TrafficTypeDiagnostic: BY5PR12MB4193:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4193DD08C5B949647898BE8DE5CD0@BY5PR12MB4193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxsTiijDo6SfQLbYHSrr/1LIn/gLmucZOqJNEZSMU3Lr0jgrh3H1BFOctmNNuSXD/v1lFJA8x+tdynRMhUyvXhoNYo5SI7s2QWzy+dzD/AzpMEsuw3Ertf3DEF8pNao3VckXnFnGmZGyCAwA4ZotjE37MkfFh+kuC8Z1ly4L15AaQ75s2xtreZsmV3IeboLycessY2f3Fp9l5di01efEEJ6egYkxqfUrQKk/T+DJU5G9GEVnNgUW67r9cdwfTdCvegGgy0X97IQwUCLQsmNcMBqF5CuJGxCnfx4SWCSctXvxQsn7iCHKgLlt135GAEGBzyosMHSyfVYv/StqB4MRKS8HN2CebhGra7xO6YgeJFmkY2IY8C7tAp6wA7HzakfMIPw4jfwEyDB/3Jd//jAy5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(7696005)(52116002)(8676002)(921005)(6486002)(86362001)(8936002)(54906003)(956004)(5660300002)(508600001)(16526019)(186003)(26005)(4326008)(66946007)(66556008)(66476007)(2616005)(6666004)(30864003)(7416002)(34490700003)(83380400001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YNrVDuYx1s8t/GlOrr0bfTf7htOwcTLPaAfThnOelteQTGCh9Q8qY9umFp8C?=
 =?us-ascii?Q?oyXkzxfdaAmW2P8pj8H4kKuh26S46Yr8wDpG1oseKLctr2Fy9m1scsKaC+6Q?=
 =?us-ascii?Q?Cad4V10DxhMWStCnIL3Gw6wxRU6nyYor7PGWqQxe4fmAaetND1ee4Gvcyg5z?=
 =?us-ascii?Q?423OUrHYKyU0qKcL2i8Rb2butiGj1awH4m1m9OfXBeIZeyxqcTXh8JFDVGk3?=
 =?us-ascii?Q?/hM6LqBSSGjR6kzQF2gMzy1Kyc5ciuq6TRr02WoGphKxyFGxS/cGaVnN+QN+?=
 =?us-ascii?Q?mXQ/C4oD64PaYwtyStb1QjSVSD8MfmtQcvdb3PkgbjkmNydFNeoVlOOuL5Ih?=
 =?us-ascii?Q?F2gqJYHOAEhsixEJJOuo2caZg3gPn8UPmmjfaVsq1eFtsTtDJel1hJ94L3zg?=
 =?us-ascii?Q?6mNCYpc2LNTRsvlvmM5+LmHzfWJl2t9A8K4PyUw56iul+0U6bKYUCLxzQLPQ?=
 =?us-ascii?Q?hDzAPjoSKgTw7KGsqvTlJ2tZUJPQl8YCQ2Im5smZTwNXlMok4s+qacmX7zmI?=
 =?us-ascii?Q?n7+/AW72PkP3fOur3o4s1xcMoD/JN5b4AuEsHoU1skcUhT6Nk8AUkrcglSmu?=
 =?us-ascii?Q?1OIlNWk01KZ0PYMFqE7ETcCEHQWxcLPqfh3mwDlqgNbzA1hDBY9+7Jul9HWy?=
 =?us-ascii?Q?Tji0HkoaOGdloRvzFv/0dbRcwR9s1c5Z9d2YLP3osZI6/Z4DvnKKsTFqHm8z?=
 =?us-ascii?Q?DxuR6IN6Lgkz0dP3MIKkxOFPu4w0Eh+K7qU/WH6pPLXekND6YpvMw0NTnn23?=
 =?us-ascii?Q?l7A7MLWFFRk4aIk9QLGOipIhDExvEwSniuhAMhE/tNsYBm4TIAq8HMvNZc6K?=
 =?us-ascii?Q?pBQ9tUY+sBHlgV9caTkIRDw7Wc+Z0tGjLoBSDSIoPD/bI7WlPBuvhZTc2Zq5?=
 =?us-ascii?Q?BbopchteElH1+4oujZIXbs4LQAnvhhg1AVpqRzo93AXcMueWtWODjuKWRMrF?=
 =?us-ascii?Q?32T9o60PSSPlWQ5DSiwHDz4Jsn+I8LT5xzm7HZaqk4OCMeQpzxrkw2FC+2uU?=
 =?us-ascii?Q?cShS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 16:50:21.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 96afc65e-c93d-4a4e-69aa-08d89b9959cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4Gz8XjeeNPPenKsACgwdEWnsyGJZc0UDhncj+QlbUjvXtlPOAZx2qgiWHimL9yPsmjzL6z/nU2rjdILac3vCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193
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

Changes in v3:
- made changes to use regmap mmio as suggested by Krzysztof Kozlowski.

Changes in v2:

- converted the code to use regmap, read_poll_timeout and made some cosmetic
  changes as suggested by Andy Shevchenko.
---
 MAINTAINERS                          |   7 +
 drivers/i2c/busses/Kconfig           |   9 +
 drivers/i2c/busses/Makefile          |   1 +
 drivers/i2c/busses/i2c-amdgpu-navi.c | 325 +++++++++++++++++++++++++++
 4 files changed, 342 insertions(+)
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
index 000000000000..d129b691bc23
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
@@ -0,0 +1,325 @@
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
+struct regmap_config map_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.disable_locking = true,
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
+	i2cd->map = devm_regmap_init_mmio(&pdev->dev, i2cd->regs, &map_cfg);
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

