Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B9E785AF7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236564AbjHWOmK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbjHWOmI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:42:08 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA46E57
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 07:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG2IVRDtWgikGq5wGMNIQYrS4p8P4o9r4hTdbLnZgcgRnIKdI9LtU4xdRfKrtGeWvXYR6vldaDnzjJe3IhidqwU/eETuSBpMOhI4sh04qS9RDTvSXm1tq8qOBX/m/kLKWlqXrSFRGlxpthBHjL9PTUOQV4ZH63FMK6TH5YXBLHLhc6nD63sse+POpS5FwY0BoAx6VITQUX0ar5i79gH1M5+4tWnIEVQmwdvKcUzA9KyFhvGh8ONRdD8E8lN7Mtfrl04igZwei7ZU8Oe/0iDypKKynOX9oAw2DCXEz/A2KzlinZMshcZQVrrQiQzmX1lBW0Su/L0KrPvIBPeprsmTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzXelBKpfWByICAjc9hcTRCDxHroSlQEsbi175pBAuM=;
 b=m5/jXfpU3uuen8LeceoLzVmixbJdur5ob4aGg3ihXuxOWq0CThSC7Ydi0gntd0UjhsDJPyAozCB/8gFoM1ON5n9zDAeY8bu9v8DwophZELsKCZeT8MaMQHwkwW0XEu7+933uaIXA5vGO1/o1+lmcOSWJzDp+qRnShZXue/kfCB53NQYWgh8wmv+hZxlD7/JZStVNrY5kful/KwNqdu0l3MR1otZeTRwp7zeh2KCBWOvfKkzaofh66uaCDLEx0w6bbmaGTbsnTXfj8g4+FXLez/lvGbY5zhPC1tapAWyJ3/jGPcwMmg/J3rryF4ReppnnL5WHDK4geDKeVpNuUqNwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzXelBKpfWByICAjc9hcTRCDxHroSlQEsbi175pBAuM=;
 b=REkr8WnMBuzXyDBH8wlSrrmjssDNEw953zKhoUz+QPjRc4PO58E5YgAXm8MSPwRxguyFIH3Xz2PGZZhwv1wOm6krSUhwgh8PL4OzejbkQGPsio9gdkMzFtsMfhPCtEMgymfmZJD+HmamfxmNQcxECpJrkDWKqdrY0CTia87gQSWgUN6oTvsuYlE8DzGYYO/dLYXLJcrPftjGCm1NuPdwQnBIILJeZp5uriGcHK7YiNu+y9XCrDFtq6nMhqClkq5zYKvgs4WIbWHdhv8qS50iUAjBSGRqLNbnMcNnqrcHceskVK/ye/0ajnDQwEMLpiZSC1LDC9BbxatkYjLTVNVZtQ==
Received: from CY5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:930:8::27)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Wed, 23 Aug 2023 14:42:03 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::97) by CY5PR03CA0007.outlook.office365.com
 (2603:10b6:930:8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 14:42:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 14:42:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 23 Aug 2023
 07:41:50 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 23 Aug 2023 07:41:48 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <peda@axentia.se>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-mux-next 1/1] i2c: mux: Add register map based mux driver
Date:   Wed, 23 Aug 2023 14:41:27 +0000
Message-ID: <20230823144127.7885-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230823144127.7885-1-vadimp@nvidia.com>
References: <20230823144127.7885-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: fb16c0a9-7b9d-4035-37c6-08dba3e71d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vu7bqXAXicQ8fhnKhKzSTI6J1PVwi3TcSrxZbUyTmMhtTNGP+hNeuxkvniElZurmvrDbtF3I1MAGr3Evr1f+oJeepthaJtvypVqV/8kphLLXaXa7s/51tq4PYu6S9xLIoE3/iLHVryZqALoZxnU75iKXJWsTHhQc1d8v4Dmg/GKErjFLOPWwMdWqhtaSDxTxQGpHrXYM5DaSC0PvMjux9BSU3zNnD1TXwR2KcbyMwihA1m3p7dNTH0otn4bjujJJpPQecjMRqVNk7Y3UkA/Um5712SEdWGJHciRaw6t/HttjE0vlnBP8hi8FO4Q43JNcY9E6nm8BGuFYxmQ9yrqNgCODOJA1ri8AAUDRnyv5ONGof7mGZlEI63mxi9nUjdDRLEyHusE7XlWX/QR2H/CXCfrSrrVkcdqiHMN6gy1TLihm7ibjOA3HLInxFfeR8Vx0O+LCsN0uRlSXZeBzHD6br/FIAj+zO3hizwHjwXBDoubK0UjZYZBXyu2Q2pVTlaVY9N4Ji/UuwoEFVj2XRCm7feVGB5dQXcIPVe7ZVjmPvwp5+u/jWCtYyMwkTeBmyIgQKjRB+zf94Kk4NeF2IiZ0xliFCi4dvzbIaxGfgv6xmneMPoF9PnunaZHihPrWu4TaFqZM6FOjEKbFNkS6cM2Kc8ZIdqlCjsrZMcnzwo0kl+Y/xXr09UlTUfxwBa8FYrHGYJT3qgCZvSNfe9FuzaxQVkAuMLCX3xDFa8Wrb676UbMgXFZ8sy/JyRLF2tDa/UzJ
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(30864003)(40480700001)(83380400001)(5660300002)(426003)(336012)(26005)(16526019)(36860700001)(86362001)(47076005)(8676002)(2616005)(107886003)(8936002)(4326008)(316002)(70586007)(54906003)(6916009)(70206006)(478600001)(82740400003)(356005)(6666004)(40460700003)(36756003)(41300700001)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:42:02.9547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb16c0a9-7b9d-4035-37c6-08dba3e71d7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
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
 include/linux/platform_data/i2c-mux-regmap.h |  34 ++++
 5 files changed, 342 insertions(+)
 create mode 100644 Documentation/i2c/muxes/i2c-mux-regmap.rst
 create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
 create mode 100644 include/linux/platform_data/i2c-mux-regmap.h

diff --git a/Documentation/i2c/muxes/i2c-mux-regmap.rst b/Documentation/i2c/muxes/i2c-mux-regmap.rst
new file mode 100644
index 000000000000..b062c1c5c02c
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
+	/* Verify there is no pending transactions */
+	/* Set address in register space */
+	/* Activate read operation */
+	/* Verify transaction completion */
+	/* Read data */
+  }
+
+  /* Write callback for indirect register map access */
+  static int reg_write(void *context, unsigned int reg, unsigned int val)
+  {
+	/* Verify there is no pending transactions */
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
+	/* Methods implementing ptotocol to access PCI-LPC bridge. */
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
index 000000000000..0414b0ce9096
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

