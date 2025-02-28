Return-Path: <linux-i2c+bounces-9658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D87A49F3A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 17:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4EF3A65C0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D1013DDB9;
	Fri, 28 Feb 2025 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m60XhQZ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619AF1EF381;
	Fri, 28 Feb 2025 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761140; cv=fail; b=G0TrF0eyrQh15+mrntsYqraSSh9Oh8iXfmcdv8hkw2zKZBCXkcxXnYPVM0vJ0+A2bZyrtiOYoqnjK8pEr+q6ecyO0y9T91iknbcjp0CDyMK8Y4gq/TXgdW3ZNjP41yaHoy+F63MCO5I1pegdx14pT0OMlX/FscomlkgNgsDJhSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761140; c=relaxed/simple;
	bh=cizX5daMg7j7BDPaIN6Wnp5cHYcm+sFaJbbjJzJr0Sg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mM1Yl69E821x5pKeCceuNuJwDv4tZ27IbhIEFu/kjvdAzwDKGjxq9vYH0TZWdQAad4TS80QoqaRImyFVlrPSZWAgJOvh20ZpEkFNdhB6Z0GwB6hluD0Sc9qmJL0UvDk+y6xRm77o5PUKnBExJIeRxPECDISac030LOPvY2q5XIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m60XhQZ1; arc=fail smtp.client-ip=40.107.237.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAWyyBAFGuXhZd+XwS2IaAn/WJSgyoQVO+vdRT+xXRMevC2+pF6l7pkaU32UkvIEwDGR1o2Qc91mf4xA3ZZHavw6ynd4aISKc56e0hJVW+A3vh3qHh0QzFB1/y+E3rM3s/CHq1dV1P9Oc7zn08Ks6FEAmPYAE8vJThKEEVnDestLnq9+hGZKrWORM0aH2PByEQXYADZDhOrZKc3dNe/q3gvKsetRc/4oN+yItwnu9OTeT/hUqe2yLIvm06Vc21DECL0o24eu1f9EihuotZbKfb+7FpHyRLZaFwuPNdOGySto9xDQyN1grVQ2JFJKJl74KgJf/M/Lxf4o/teHCeIjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2nTPIZySFC4E/AeM7Fvp+w0AJEZ8Z1QNGIDbqw3PBo=;
 b=sj653O1DXjFdbQ+ruyZVpcCGVISkyS/PZhJ4fbG5vKeVOK2UzOAFsjRvJNBIJb+SCMtoAdP7Y4SWBA94odA+s6lQVsdi75RnEbFZCWqxt5RkMAu68IVhCv4k55KAiaJgVXJVXuuzVOCykr5MyVzAChQqbBu4tWyzpwlRcfazMQurUQQXuY7P7maDdChNUw+VnWwp1DSQDNRfKLEKbr5BaJPNnyi6HM7SXhHnOu+MPy+/6aldjL0lPws6ICEq7GGHiC1MqSz+iLe4kNpABWoxNL2b+1muhfaBr6b8nk/okkhbfzkSWIzXosaRcEQVw8W/dlkTZ89KsnXAqboxYbLUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2nTPIZySFC4E/AeM7Fvp+w0AJEZ8Z1QNGIDbqw3PBo=;
 b=m60XhQZ1lmiotTkmWergZdMGD/uduppdHZmVDXGSFTjJTuY047A9ZSk4UfVCyCf/t8CqmLwDMky/iE/Y45bw5+mKMSx5NNp+0IVTyZG93tMnJ7PPK6U+YCukqwsEHzcujXJb0FxLnWqE9xqvP4twqc5bQaZlIT/AN5Lre5s5S0I=
Received: from BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 16:45:31 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::1) by BN9PR03CA0723.outlook.office365.com
 (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Fri,
 28 Feb 2025 16:45:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 16:45:31 +0000
Received: from maple-stxh-09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Feb
 2025 10:45:30 -0600
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
Date: Fri, 28 Feb 2025 11:45:14 -0500
Message-ID: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 706fb861-abad-4d35-800b-08dd581750a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?csV3DXlwvgH5mfbPzzKX9IyzSSVL5dIbqLgiHK7gNs6ai6CUUdWAmy3ltIEp?=
 =?us-ascii?Q?5C3jh+tnPKD6vcVFP07bjHWOFO7xjaLllHWldZFSPg2D65Hnt/uWFLTAw0dO?=
 =?us-ascii?Q?nt/gZh/1xwe8CPQoA2KSDy2KZlh9IF87lTyGc669HzCVqzwm4ElyrnRFR0AM?=
 =?us-ascii?Q?kgsqPhZFMefp4GGKrc5au6sLUDgMzhw27UHXh0vXdUdO80un8rllyZCezOJh?=
 =?us-ascii?Q?M7QlzjdYFKhk/XM/yIC5wUNOP3z7z+pFXclt9+Gjj1VFAnjQLFBawJi3NgV8?=
 =?us-ascii?Q?nrTWUggi0g3hHWdrAePsBNHp3fguVjxwMRtYLVBD8VNlRrD05mppyyM9JvyB?=
 =?us-ascii?Q?TSuC05OLjfr6jUqL5YASbfRHwPGaMlycBmY8r3vXDxEIJchDHIOs8kffOhYi?=
 =?us-ascii?Q?I9hKCnzxmwLb1XmgQfu30BtwuFZBE99/ZtFHUGU9rvvR9/wYoD7JtjSwasBs?=
 =?us-ascii?Q?KAkijYLZrcbTpjPXTivj/d19663g9mJ2wHKuQFBXM24p3kPKc32tNRPNVltz?=
 =?us-ascii?Q?smrof2NbaVBuAFy/p+RFLj3bOm9IKg8wCFGqLKnjOxyEldnq0HAH08UgpH+i?=
 =?us-ascii?Q?EhxY0X8f9p34/kFtuRx4MojhuL/m/2UDUDTBObla3Ij/EZDa9Je3VSievC8T?=
 =?us-ascii?Q?nMu2+CvnA92AEdbzRxG96lsZUmDNq/EIsLfZSQZRZ0TYssuIRRId222lmBFI?=
 =?us-ascii?Q?VcoqERQ8w8yp2rCjx2McMbhsyH5X0Z8HRKyJ7GqKn+DQLIrsYrvrtSw3/x/4?=
 =?us-ascii?Q?+Z4GsV7ta4GgoW2sZVmKpSxJn8p0NgWcw8Pyvl1Yf0c5PehOOsqkXe02MVET?=
 =?us-ascii?Q?ygPLBODBQ9TBosihSwP5IR9ilBxw0H066+xrxWPRB/Wjbv+WbfGm9BpLPVOQ?=
 =?us-ascii?Q?e24B0woFuCt0Org7jKbhH/CrSH2RmdHh4VEKoXzF+BPjIvDCFDPeqI8IEMI2?=
 =?us-ascii?Q?XHxBtL2hSN1L2DGA/ns0xhBqiGaW2N1UcmqHjm+PBGId7yRC4vsjh+fHQ6Eh?=
 =?us-ascii?Q?7QIoc7AQaYcOIjBxK6qZaIsR/po4vmf+5Eti9UF1np47WYih20WEcLfnetLL?=
 =?us-ascii?Q?SR22YRgaZ1GmU/pjown2YjWX5iEJY4JZ5/NFFRECf1uJiMq14SwDwSqOJ5QT?=
 =?us-ascii?Q?2H9WZdjf5Q4/6DmLMnl3oS2CgaezmHh0jBEd2ZQZQ4h6nvO12hye7mskxYKz?=
 =?us-ascii?Q?fa5vFs3n4I+E3K3MSjfJJNU/czfVjlsMgLLrVIdBWtCvIRR8AbqMTLuv7L3Z?=
 =?us-ascii?Q?sBZdV3zlkt0Ttt4gPrfigEw2WxvQKhuEa2W4hgiOaMqiWjdh1DM5wZMt3CWx?=
 =?us-ascii?Q?hSWyCfYi8Llg0W1BCM0HH30nV2zCyNZGQB7l7mFwV76RZBlirRI/K5dNEOjh?=
 =?us-ascii?Q?7JjOaRUKgH9Ej8KD31wOHTQgt46/sNpD+yXftO4H15cWTj54y3EZ4ERze5MZ?=
 =?us-ascii?Q?DUWYry/+jdNvJgb2gR25wMuxOAct2xGGyHb0doK5DbwkNURezE9wKx/I9lB+?=
 =?us-ascii?Q?J6BTxZ74IvhB7uk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:45:31.6263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706fb861-abad-4d35-800b-08dd581750a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

The camera sensor is connected via ISP I2C bus in AMD SOC
architectures. Add new I2C designware driver to support
new camera sensors on AMD HW.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/Kconfig                 |  10 +
 drivers/i2c/busses/Makefile                |   1 +
 drivers/i2c/busses/i2c-designware-amdisp.c | 266 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-amdisp.h |  24 ++
 4 files changed, 301 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
 create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.h

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f445771..79448211baae 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
+config I2C_DESIGNWARE_AMDISP
+	tristate "Synopsys DesignWare Platform for AMDISP"
+	depends on I2C_DESIGNWARE_CORE
+	help
+	  If you say yes to this option, support will be included for the
+	  AMDISP Synopsys DesignWare I2C adapter.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called amd_isp_i2c_designware.
+
 config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
 	depends on ACPI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1c2a4510abe4..cfe53038df69 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
+obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
 i2c-designware-pci-y					:= i2c-designware-pcidrv.o
 obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
new file mode 100644
index 000000000000..dc90510a440b
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -0,0 +1,266 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2024-2025 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/units.h>
+
+#include "i2c-designware-core.h"
+#include "i2c-designware-amdisp.h"
+
+#define AMD_ISP_I2C_INPUT_CLK			100 //100 Mhz
+
+#define to_amd_isp_i2c_dev(dev) \
+	((struct amd_isp_i2c_dev *)container_of(dev, struct amd_isp_i2c_dev, dw_dev))
+
+struct amd_isp_i2c_dev {
+	struct dw_i2c_dev	dw_dev;
+};
+
+static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
+{
+	pm_runtime_disable(dev->dev);
+
+	if (dev->shared_with_punit)
+		pm_runtime_put_noidle(dev->dev);
+}
+
+static u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *dev)
+{
+	return AMD_ISP_I2C_INPUT_CLK * 1000;
+}
+
+static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
+{
+	struct i2c_adapter *adap;
+	struct amd_isp_i2c_dev *isp_i2c_dev;
+	struct dw_i2c_dev *dev;
+	int ret;
+
+	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct amd_isp_i2c_dev),
+				   GFP_KERNEL);
+	if (!isp_i2c_dev)
+		return -ENOMEM;
+
+	dev = &isp_i2c_dev->dw_dev;
+	dev->dev = &pdev->dev;
+
+	/**
+	 * Use the polling mode to send/receive the data, because
+	 * no IRQ connection from ISP I2C
+	 */
+	dev->flags |= ACCESS_POLLING;
+	platform_set_drvdata(pdev, dev);
+
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
+
+	ret = isp_power_set(true);
+	if (ret) {
+		dev_err(dev->dev, "unable to turn on the amdisp i2c power:%d\n", ret);
+		return ret;
+	}
+
+	dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
+	ret = i2c_dw_fw_parse_and_configure(dev);
+	if (ret)
+		goto exit;
+
+	i2c_dw_configure(dev);
+
+	adap = &dev->adapter;
+	adap->owner = THIS_MODULE;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	adap->dev.of_node = pdev->dev.of_node;
+	/* arbitrary large number to avoid any conflicts */
+	adap->nr = 99;
+
+	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
+		dev_pm_set_driver_flags(&pdev->dev,
+					DPM_FLAG_SMART_PREPARE);
+	} else {
+		dev_pm_set_driver_flags(&pdev->dev,
+					DPM_FLAG_SMART_PREPARE |
+					DPM_FLAG_SMART_SUSPEND);
+	}
+
+	device_enable_async_suspend(&pdev->dev);
+
+	/* The code below assumes runtime PM to be disabled. */
+	WARN_ON(pm_runtime_enabled(&pdev->dev));
+
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+
+	if (dev->shared_with_punit)
+		pm_runtime_get_noresume(&pdev->dev);
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = i2c_dw_probe(dev);
+	if (ret) {
+		dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);
+		goto exit_probe;
+	}
+
+	isp_power_set(false);
+	return ret;
+
+exit_probe:
+	amd_isp_dw_i2c_plat_pm_cleanup(dev);
+	isp_power_set(false);
+exit:
+	isp_power_set(false);
+	return ret;
+}
+
+static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
+{
+	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+
+	pm_runtime_get_sync(&pdev->dev);
+
+	i2c_del_adapter(&dev->adapter);
+
+	i2c_dw_disable(dev);
+
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
+	amd_isp_dw_i2c_plat_pm_cleanup(dev);
+
+	reset_control_assert(dev->rst);
+}
+
+static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
+{
+	/*
+	 * If the ACPI companion device object is present for this device, it
+	 * may be accessed during suspend and resume of other devices via I2C
+	 * operation regions, so tell the PM core and middle layers to avoid
+	 * skipping system suspend/resume callbacks for it in that case.
+	 */
+	return !has_acpi_companion(dev);
+}
+
+static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	if (i_dev->shared_with_punit)
+		return 0;
+
+	i2c_dw_disable(i_dev);
+	i2c_dw_prepare_clk(i_dev, false);
+
+	return 0;
+}
+
+static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&i_dev->adapter);
+
+	return amd_isp_dw_i2c_plat_runtime_suspend(dev);
+}
+
+static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	if (!i_dev->shared_with_punit)
+		i2c_dw_prepare_clk(i_dev, true);
+
+	i_dev->init(i_dev);
+
+	return 0;
+}
+
+static int amd_isp_dw_i2c_plat_resume(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	amd_isp_dw_i2c_plat_runtime_resume(dev);
+	i2c_mark_adapter_resumed(&i_dev->adapter);
+
+	return 0;
+}
+
+static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
+	.prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
+	LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, amd_isp_dw_i2c_plat_resume)
+	RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, amd_isp_dw_i2c_plat_runtime_resume, NULL)
+};
+
+/* Work with hotplug and coldplug */
+MODULE_ALIAS("platform:amd_isp_i2c_designware");
+
+static struct platform_driver amd_isp_dw_i2c_driver = {
+	.probe = amd_isp_dw_i2c_plat_probe,
+	.remove = amd_isp_dw_i2c_plat_remove,
+	.driver		= {
+		.name	= "amd_isp_i2c_designware",
+		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
+	},
+};
+
+static int __init amd_isp_dw_i2c_init_driver(void)
+{
+	return platform_driver_register(&amd_isp_dw_i2c_driver);
+}
+subsys_initcall(amd_isp_dw_i2c_init_driver);
+
+static void __exit amd_isp_dw_i2c_exit_driver(void)
+{
+	platform_driver_unregister(&amd_isp_dw_i2c_driver);
+}
+module_exit(amd_isp_dw_i2c_exit_driver);
+
+MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("I2C_DW");
+MODULE_IMPORT_NS("I2C_DW_COMMON");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/i2c/busses/i2c-designware-amdisp.h b/drivers/i2c/busses/i2c-designware-amdisp.h
new file mode 100644
index 000000000000..f98661fdaedf
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-amdisp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2024-2025 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+int isp_power_set(int on);
-- 
2.43.0


