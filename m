Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D23785CB6
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 17:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237021AbjHWPyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 11:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbjHWPyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 11:54:14 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50672E5F
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 08:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRmAup0a74NcQQQ2tyU4AAGkP/2rI4Z5IdfUwAds9c9SLe46VQ311AP6MjJlboz8eHqsK1XypU5OduDDIFmPnvKi+7KboiegoChZirXDnhnSNS6bAjZyrL1fo9z6JKavzXkUz5e7DdKPujV35wiF4rbF+xeBdwpyktKCQ39Q68Gm89fO/GcChY3nBRfssFZnMGRfDIe1mARfhBQN9uMg6Wspdrp9LYgGzeBSdce3BPp3bRH1s78kmfQ6x4qAPdgUjPYJElQbctd1ks3i6Tr7H2zqQToU/u8nyo6UCdHxEK0kwThkPsC7JOiUQaEF9Brw5VRB8/fkcpGb6ldNsXNilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc5oaBFzXV/pD2DwlSB+t0xKRA2foSuWrf9+r+RT8KE=;
 b=EmsHtMCVOnzbtyb6Aaxsb5M2csDuV2lr5ITE38lqfepB7RaLkNBTNX9ZBYIu8paYJrV5jYB6i8csfcU+oz1huDydcUb3H9VF4lhR6mzevXn+NzypQYdiIQO1asplXuudr44oBIeC+B0rQgJb0WJSiij5EmN/KzeRut6VwNevJkuTRaHhNagyVoyxPpr9rLkBtPEILS6eLXYQaSl8IsbbsxPK1Kbnt6uXPx/JHFzm2agA6mhtFyXrb9PYKoWFVzMB4pQDPxAVNrKa4dox4+UyIg5vHqrdQ3HpigOXsRYduBmadzD9szlF8Cx87+fja3k/UuiuNAWmEGIwCxVwldTviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc5oaBFzXV/pD2DwlSB+t0xKRA2foSuWrf9+r+RT8KE=;
 b=jR9dVdSdpKbsnEK3zr5qZsouz2vXMy4mD0uXgViwWE2NOYTtSkJlPM0Vi9/7b5WPxauPBaz6W82ruGfSPDIEPiDpQ7z4iLvdqvRL4c8i8K3iVf3cEmUMNRXippwySDxyLLUWE00YB5dfmPZeHZwfJNEY13qLK/KMKYDFmdyXlRwBK9RK1hwy4WBHdWcw0Zx7OzfWsnOB7ucOa43C+qe2dUwc/GWYbBp1tC6an4y8zdNaOfuZUftyGj3APaOfOhAySv0lZmJ3AMO9Ux9MjzfFIeqdoBiZV1vqHwaKPG+qI/VU4EMpdg79EH4O38zYI5l8NEK+EQ06UIya3FltZ/8opA==
Received: from DS0PR17CA0016.namprd17.prod.outlook.com (2603:10b6:8:191::7) by
 BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.26; Wed, 23 Aug 2023 15:54:08 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::b9) by DS0PR17CA0016.outlook.office365.com
 (2603:10b6:8:191::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 15:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 15:54:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 23 Aug 2023
 08:53:55 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 23 Aug 2023 08:53:54 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <peda@axentia.se>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-mux-next v2 1/1] i2c: mux: Add register map based mux driver
Date:   Wed, 23 Aug 2023 15:53:32 +0000
Message-ID: <20230823155332.48648-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230823155332.48648-1-vadimp@nvidia.com>
References: <20230823155332.48648-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BL0PR12MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: ae69a7c9-4ecd-4411-1423-08dba3f12f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7Mv7AELv5g0V//B+7zmIHQ4l5kc49uM7LAuVOMVz3BmT+BZX0Unvl6zQ+SzdQByQdyKiqeaEUqAJN0560Uh22NfT6VIkD+9Ov/7VJes9VTR/UBdIo5WMsianN54FNOSTAZVnyHbuzkj4V6L7Yqixl9km0Fa40WPyvPCYEw6fQ7t9/ITsn7Nrw9ZEHwMscVcxfFvW4DfEfxlBwDPIFjCwjRVkiHrQiLrAJWtf+KM1q5N/I1Ey/N5RqA4mShbOoOrExSrNT1mPXH5J/JqAwWreghv2r/sWBz24B0weD24z2D0isFM1F2A/IcvMBhqAgmmUw1zxyG7ee3LTuR174QDNFLZN5tPqXL2/Kn1dGKP3Vj1PgUdlRVjsxiqHlgCzHdfS8CZNgqXJekhdgiGb0loq2ah/P/tHaxbYF4Ip2YLFPhrXewC583+/EzQt+55BnM9uq0n9maPTyc7AYvslbHw6i7vuw1F9MxTI38IRJE6IlTv3bdKLo6UDKyUiKr1KJbIjbTJm3phTqLEbO7/wi6ClBuSjqzjq/6DDxprx4p3sFunCKvYmQl0M2cFoDYYxv7PmWy65MQryjRj37h89ACmB+7q6Wt2wJejpi+3/SCUtto3tzW2/nCLS6wpJdizysHBK/eJmPoihP0H7gfk7YK2yoxbhWHIo1vsupkANMBzDnSSxq89ZilZNnKElR2sEgLvhiT/u9GURau2SLX4mhxj13xEPjdJV6bmzfZjLsieZR1kCCwDwzzOMcL1bi2EcaA2
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(2616005)(316002)(6916009)(4326008)(8936002)(8676002)(40480700001)(70586007)(54906003)(70206006)(41300700001)(336012)(426003)(16526019)(26005)(1076003)(107886003)(5660300002)(6666004)(478600001)(83380400001)(30864003)(40460700003)(47076005)(36860700001)(36756003)(86362001)(2906002)(82740400003)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:54:07.4491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae69a7c9-4ecd-4411-1423-08dba3f12f1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add 'regmap' mux driver to allow virtual bus switching by setting a
single selector register.
The 'regmap' is supposed to be passed to driver within a platform data
by parent platform driver.

The register can be on type of bus or mapped memory, supported by
'regmap' infrastructure.

Motivation is to support indirect access to register space.
For example, Lattice FPGA LFD2NX-40 device, being connected through
PCIe bus provides SPI or LPC bus logic through PCIe-to-SPI or
PCIe-to-LPC bridging. Thus, FPGA operates as host controller and some
slave devices can be connected to it. For example:
CPU (PCIe) -> FPGA (PCIe-to-SPI bridge) -> CPLD or another FPGA
CPU (PCIe) -> FPGA (PCIe-to-LPC bridge) -> CPLD or another FPGA
where 1-st FPGA connected to PCIe is located on carrier board, while
2-nd programming logic device is located on some switch board and
cannot be connected to CPU PCIe root complex.

In case mux selector register is located within the 2-nd device, SPI or
LPC transaction is prepared sent by indirect access, through some
pre-defined protocol.
To support such protocol reg_read()/reg_write() callbacks are provided
to 'regmap' object and these callback implements required indirect
access.
Thus, 'regmap' performs all hardware specific access making it
transparent to the mux driver.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 Documentation/i2c/muxes/i2c-mux-regmap.rst   | 168 +++++++++++++++++++
 drivers/i2c/muxes/Kconfig                    |  12 ++
 drivers/i2c/muxes/Makefile                   |   1 +
 drivers/i2c/muxes/i2c-mux-regmap.c           | 127 ++++++++++++++
 include/linux/platform_data/i2c-mux-regmap.h |  32 ++++
 5 files changed, 340 insertions(+)
 create mode 100644 Documentation/i2c/muxes/i2c-mux-regmap.rst
 create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
 create mode 100644 include/linux/platform_data/i2c-mux-regmap.h

diff --git a/Documentation/i2c/muxes/i2c-mux-regmap.rst b/Documentation/i2c/muxes/i2c-mux-regmap.rst
new file mode 100644
index 000000000000..5ee48ad42e4c
--- /dev/null
+++ b/Documentation/i2c/muxes/i2c-mux-regmap.rst
@@ -0,0 +1,168 @@
+.. SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
+============================
+Kernel driver i2c-mux-regmap
+============================
+
+Author: Vadim Pasternak <vadimp@nvidia.com>
+
+Description
+-----------
+
+i2c-mux-regmap is an i2c mux driver providing access to I2C bus segments
+from a master I2C bus and a hardware MUX controlled through FPGA device
+with indirect access to register space.
+
+For example, Lattice FPGA LFD2NX-40 device, being connected through PCIe
+bus provides SPI or LPC logic through PCIe-to-SPI or PCIe-to-LPC
+bridging.
+Thus, FPGA operates as host controller and some slave devices can be
+connected to it. For example:
+- CPU (PCIe) -> FPGA (PCIe-to-SPI bridge) -> CPLD or another FPGA
+- CPU (PCIe) -> FPGA (PCIe-to-LPC bridge) -> CPLD or another FPGA
+where 1-st FPGA connected to PCIe is located on carrier board, while 2-nd
+programming logic device is located on some switch board and cannot be
+connected to CPU PCIe root complex.
+
+E.G.::
+ ------------------------    ---------------------------------------
+|  COME board            |  |  Switch board                         |
+|                        |  |                                       |
+|  -----        ------   |  |   -------     Bus channel 1           |
+| |     |      |      |  |  |  |       |  *-------------->          |
+| | CPU |      | FPGA |------->| CPLD  |  |                         |
+| |     | PCIe |      |  LPC   |  ---  |  | Bus channel 2           |
+| |     |------|      |  |  |  | |MUX|--->*-------------->  Devices |
+| |     |      |      |  |  |  | |REG| |  |                         |
+| |     |      |      |  |  |  |  ---  |  | Bus channel n           |
+| |     |      |      |  |  |  |       |  *-------------->          |
+|  -----        ------   |  |   -------                             |
+|                        |  |                                       |
+ ------------------------    ---------------------------------------
+
+SCL/SDA of the master I2C bus is multiplexed to bus segment 1..n
+according to the settings of the MUX REG or REGS.
+
+Access to MUX selector registers is performed through the 'regmap' object,
+which provides read and write methods, implementing protocol for indirect
+access.
+
+Usage
+-----
+
+i2c-mux-regmap uses the platform bus, so it is necessary to provide a struct
+platform_device with the platform_data pointing to a struct
+i2c_mux_regmap_platform_data with:
+- The I2C adapter number of the master bus.
+- Channels array and the number of bus channels to create.
+- MUX select register offset in programming logic device space for bus
+  selection/deselection control.
+- Optional callback to notify caller when all the adapters are created and
+  handle to be passed to callback.
+See include/linux/platform_data/i2c-mux-regmap.h for details.
+
+Device Registration example
+---------------------------
+
+   /* Channels vector for regmap mux. */
+   static int regmap_mux_chan[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
+
+   /* Platform regmap mux data */
+   static struct i2c_mux_regmap_platform_data regmap_mux_data[] = {
+	{
+		.parent = 1,
+		.chan_ids = regmap_mux_chan,
+		.num_adaps = ARRAY_SIZE(regmap_mux_chan),
+		.sel_reg_addr = 0xdb,
+	},
+	{
+		.parent = 1,
+		.chan_ids = regmap_mux_chan,
+		.num_adaps = ARRAY_SIZE(regmap_mux_chan),
+		.sel_reg_addr = 0xda,
+	},
+   };
+
+  Create regmap object.
+
+  struct caller_regmap_context {
+	void __iomem *base;
+  };
+
+  /* Read callback for indirect register map access */
+  static int fpga_reg_read(void *context, unsigned int reg, unsigned int *val)
+  {
+	/* Verify there are no pending transactions */
+	/* Set address in register space */
+	/* Activate read operation */
+	/* Verify transaction completion */
+	/* Read data */
+  }
+
+  /* Write callback for indirect register map access */
+  static int reg_write(void *context, unsigned int reg, unsigned int val)
+  {
+	/* Verify there are no pending transactions */
+	/* Set address in register space */
+	/* Set data to be written */
+	/* Activate write operation */
+	/* Verify transaction completion */
+  }
+
+  static struct caller_regmap_context caller_regmap_ctx;
+
+  static const struct regmap_config fpga_regmap_config = {
+	.reg_bits = 9,
+	.val_bits = 8,
+	.max_register = 511,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = caller_writeable_reg,
+	.readable_reg = caller_readable_reg,
+	.volatile_reg = caller_volatile_reg,
+	.reg_defaults = caller_regmap_default,
+	.num_reg_defaults = ARRAY_SIZE(caller_regmap_default),
+	/* Methods implementing protocol to access PCI-LPC bridge. */
+	.reg_read = fpga_reg_read,
+	.reg_write = fpga_reg_write,
+  };
+
+  regmap = devm_regmap_init(&dev, NULL, &caller_regmap_ctx,
+			    fpga_regmap_config);
+
+  Remap FPGA base address.
+
+  caller_regmap_ctx.base = devm_ioremap(&fpga_pci_dev->dev,
+					pci_resource_start(pci_dev, 0),
+					pci_resource_len(pci_dev, 0));
+
+  For each entry in 'regmap_mux_data' array.
+
+  mux_regmap_data[i].handle = caller_handle;
+  mux_regmap_data[i].regmap = regmap;
+  mux_regmap_data[i].completion_notify = caller_complition_notify;
+
+  pdev[i] =
+  platform_device_register_resndata(dev, "i2c-mux-regmap", i, NULL, 0,
+				    &regmap_mux_data[i],
+				    sizeof(regmap_mux_data[i]));
+
+  In the above examples two instances of "i2c-mux-regmap" will be created.
+  For each the array of the created adapter will be passed to
+  caller_complition_notify(), if this callback was provided.
+
+SYSFS example
+=============
+  In 'sysfs' the channels will be exposed through path:
+  /sys/devices/platform/<caller-driver>/<i2c-parent-driver.parent-bus>
+  Following the above example it will contain:
+  i2c-mux-regmap.0/channel-1
+  ...
+  i2c-mux-regmap.0/channel-8
+  i2c-mux-regmap.1/channel-1
+  ...
+  i2c-mux-regmap.1/channel-8
+
+  However, MUX number of each 'i2c-mux-regmap' instance is limited by
+  the size of selector register.
+  Thus, if its size is 1 byte - up to 255 MUX channels can be created,
+  for 2 bytes respectively up to 65535.
+
diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index ea838dbae32e..a509b75bd545 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -99,6 +99,18 @@ config I2C_MUX_REG
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-reg.
 
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
 config I2C_DEMUX_PINCTRL
 	tristate "pinctrl-based I2C demultiplexer"
 	depends on PINCTRL && OF
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
index 000000000000..952d705c5dd2
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-regmap.c
@@ -0,0 +1,127 @@
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
+ * @parent - parent I2C adapter;
+ * @pdata: platform data;
+ */
+struct i2c_mux_regmap {
+	int last_val;
+	struct i2c_adapter *parent;
+	struct i2c_mux_regmap_platform_data pdata;
+};
+
+static int i2c_mux_regmap_select_chan(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct i2c_mux_regmap *mux = i2c_mux_priv(muxc);
+	int err = 0;
+
+	/* Only select the channel if it's different from the last channel */
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
+/* Probe/remove functions */
+static int i2c_mux_regmap_probe(struct platform_device *pdev)
+{
+	struct i2c_mux_regmap_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct i2c_mux_regmap *mux;
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
+	mux->parent = i2c_get_adapter(mux->pdata.parent);
+	if (!mux->parent)
+		return -EPROBE_DEFER;
+
+	muxc = i2c_mux_alloc(mux->parent, &pdev->dev, pdata->num_adaps, sizeof(*mux), 0,
+			     i2c_mux_regmap_select_chan, i2c_mux_regmap_deselect);
+	if (!muxc) {
+		err = -ENOMEM;
+		goto err_i2c_mux_alloc;
+	}
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
+err_i2c_mux_alloc:
+	i2c_put_adapter(mux->parent);
+	return err;
+}
+
+static void i2c_mux_regmap_remove(struct platform_device *pdev)
+{
+	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
+	struct i2c_mux_regmap *mux = muxc->priv;
+
+	i2c_mux_del_adapters(muxc);
+	i2c_put_adapter(mux->parent);
+}
+
+static struct platform_driver i2c_mux_regmap_driver = {
+	.driver = {
+		.name = "i2c-mux-regmap",
+	},
+	.probe = i2c_mux_regmap_probe,
+	.remove_new = i2c_mux_regmap_remove,
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
index 000000000000..0c03687e2c7d
--- /dev/null
+++ b/include/linux/platform_data/i2c-mux-regmap.h
@@ -0,0 +1,32 @@
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
+ * @handle: handle to be passed by callback
+ * @completion_notify: callback to notify when all the adapters are created
+ */
+struct i2c_mux_regmap_platform_data {
+	void *regmap;
+	int parent;
+	const unsigned int *chan_ids;
+	unsigned int num_adaps;
+	unsigned int sel_reg_addr;
+	void *handle;
+	int (*completion_notify)(void *handle, struct i2c_adapter *parent,
+				 struct i2c_adapter *adapters[]);
+};
+
+#endif	/* __LINUX_PLATFORM_DATA_I2C_MUX_REGMAP_H */
-- 
2.20.1

