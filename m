Return-Path: <linux-i2c+bounces-10620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D068A9B6B9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 20:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 261157B6185
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 18:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379A1E5B9E;
	Thu, 24 Apr 2025 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jWSPdByT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15521DF988;
	Thu, 24 Apr 2025 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520640; cv=fail; b=bx1/Ef5l0PEGoc03dPDbHb9Rgp1oZkYTFP8/e3bB5n8PFynHPnpNudZW75NLVgBKZthUbRmL9LWK4aIarYWE60lPgZIQ37Gh1fP43Tq/epDJeXwyWKWQoXzxKWGpr0XaIwbtPmfvNcpx9nYtz6VvrbvW56kocy4U6wmXBaryPeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520640; c=relaxed/simple;
	bh=DPSiVWoBoL+1/f9bevOou/K9QP+/BS1S5mf92pN/ZsI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jCB9+r3yOqmwHu/z8s/3Bc3D3LVmTY3HONa33VsUOUCSZkTsXGhboc2IZgJwzFIcLIoqaObErohT4jSgaTnpTMwhcC2iVSLwOBiiYOIbv2vR50+t6nb9Bk2VrEMeVovk1Dzosb+kxLwT5dusFZhG5vm9g+M7gMxZDf2zBcFvrDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jWSPdByT; arc=fail smtp.client-ip=40.107.212.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC+LNaT1bBId8sFVBPcfrra4PtKy2QnD3FXHIu65ZumTW5iXjPNd2HStpqDZ8uQyrrCtU/2nvxmN9KokViTox3u19TMx8fgenvAuzkG04wOGFpmal36auTWOUrlZ4VvhGaPmjn7J2uiKSfQQSr2V9Me0qzI5YOaS+SV0H9BQToaWvMYXLzVYX5G5Fl04UQspg3EYJyl1kResmXbVvLheCHKk9Ph6ap1i40oI0Tl8I8glUzhgY38HYBqb0fh32d2yIEAAziZnhGBNRphA6G23rP4ZPl11bV4bUgeBzm/0nF0c8EyJ9JClyylbPqaUP1gqik21TiCSPVKVk6z8OivPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLT5NhzKkkDZuKsV49831QcVHnMfCR5T59FPL5Sh7VA=;
 b=LRgyM8TNMEkRhb1Y/6LvcUMD3/JshdJg6DnP5fafxcUE3pzuHZ4TselEMZDSDRpvC+1ea1UlwoVaUonWTMdjOYWFN6WRI53gWUYIFAF/PRo2yNbCZpmhHIK/0vG1DsVnd7nlW2afB9c7SPECyfVX9DTnqeZiHwJ9j5PPms+1lpvCuiRAQETur6nRvG+d4O8Ns8Lbb4a2pOF09CDoqdJ9t+HaZPV40lU+aWzcbDILsfFaPrm+jgnZ5bmfSL0Wr/RPH+3j4+3OpYwGGGMkB8XvsCOdPd/9eoyt8IQaO2A87TfvH8UkC+fQ/dBRHMKAWzx+phOWOxqePir46Ijqhf4LFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLT5NhzKkkDZuKsV49831QcVHnMfCR5T59FPL5Sh7VA=;
 b=jWSPdByTMBJEi3y4BgvPxpudgQdKBIPiC8ILdz8ODop/h80iyVvksg2nWVi+ossHhXwSA83oXNAQc1w5Ir1AJfGMR30s+EzUZ+luz9cJ738GP9wmYd3MFXMHq7bBfzfH1HLxyMpNojSTD/mdO3/WrQ2SsWh+Gl8sXKSjqvoM1I8=
Received: from BL1PR13CA0393.namprd13.prod.outlook.com (2603:10b6:208:2c2::8)
 by DM4PR12MB7623.namprd12.prod.outlook.com (2603:10b6:8:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 18:50:35 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::6b) by BL1PR13CA0393.outlook.office365.com
 (2603:10b6:208:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Thu,
 24 Apr 2025 18:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 18:50:35 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Apr 2025 13:50:34 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <mlimonci@amd.com>,
	<christophe.jaillet@wanadoo.fr>, <krzk@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>, Venkata Narendra Kumar Gutta <vengutta@amd.com>
Subject: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
Date: Thu, 24 Apr 2025 14:49:26 -0400
Message-ID: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|DM4PR12MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: df79dea7-f16c-4450-4724-08dd8360e5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uyV45DdvIA632YNlCp8VGbBjCGNGO87Bac+84HvG7EbgaDoprRDAd99jKKWd?=
 =?us-ascii?Q?HLydCIZB8sJVyUypLFmDxV0IHYfweA32czitQxunl/1yXNhRMSKBDcytM4Rn?=
 =?us-ascii?Q?W/oYbeqMIsHDVDjV+JgoD2rQabsBew0Zp60QiY27x4tqsEVsazWLmpxqxk0t?=
 =?us-ascii?Q?ZPNbz8fZIadC79o5k0+ftUtCCIKVV3D5U55xUJstWXP4H26+Ds+o5yBL36FA?=
 =?us-ascii?Q?gGsvZ0vaJmefeQIdtPU/0/1rfUlNFbBX5Q2pHwNgcVJPuLQr+4cMyex4LqkQ?=
 =?us-ascii?Q?YSMSLNKvOYIgpkmgklf5L9Okin3WgOqAKe59KX4wH5E0IPBzfnZof83bMBiQ?=
 =?us-ascii?Q?ixVZgKwxXoRx73mzZfy+0yUPtx72IRuSEAnXGMJ1jc2UeJ8faV+lBEve+EW1?=
 =?us-ascii?Q?LqhZPHtym457uE5WfGlv5UfaVoAsPd5FYxFRNOZzr/CrcNDoaeBZI51uF235?=
 =?us-ascii?Q?EXG/5Wdd2qI1pFdruSxgsO9r4AMDmU3qdld7eiSGsaCmLviU1//KVDpZKxls?=
 =?us-ascii?Q?smuJW45UAv4iQhsz2CXjYJS4tgNv5W8P/lIry/9DB1IKYdCk6flwCWSLGnKu?=
 =?us-ascii?Q?z1XQhKj8KtjKRcG7+AUV+0cf7Scs5lATbOLjPTfXSZcAgO+R41YdBFMduX2c?=
 =?us-ascii?Q?1A1R8j+sVAuMdB4y0bdWCSsDyST0OW9pAVhSc1AoI93C7RRWhyXyaE8XOVBK?=
 =?us-ascii?Q?n6KuM/oh3qPsf/liCz3pCZODyfaF5Vlx+Nt37SltRByc8rPCY+35/nl6SfZ9?=
 =?us-ascii?Q?GghrKhqdACk9Bg9EQXsyh+8z7O2RTK4LrQtJxrF6zVCvVt8j2EEWibRjAIuT?=
 =?us-ascii?Q?kKDMScjpIaJg4HvWVkiDEFc3U339pRZkmeKwz+/Y1fvogHF/rWGjXAXsnW/L?=
 =?us-ascii?Q?Y+nYMI23ZhBRt/Nwk4XDBRqXEbe4sxVn52lUzXwyDhit4ZO6M9xzK9tU7FGG?=
 =?us-ascii?Q?oKoqrujNKWLjUcNW+tATUVPgdZ9a/1iZUdEpP3e7LRPYrJSANSSEyGqTo3G7?=
 =?us-ascii?Q?Cy6VNxj6Wk1FQO0/UT8jTKPpOPHf3GpUkgTtKNQXr1fB7HHhwDsTGMrYngLO?=
 =?us-ascii?Q?Tct0sJQtgD/dEaXj7RmX1v8W3FK6MezJ2pxYf2CBOMtr0xXDBubm6cuJt7wU?=
 =?us-ascii?Q?XWm/ZNZRnIZj18qZBBYymDMBGZ0riuTW4mmFi8RT10A2zab22oubMG54Y5zl?=
 =?us-ascii?Q?BRSDgut2SpB9c+qGMTL+iVDEJeVwajjFBFDUAyPWnXk3xIySdqLFCO+CT4fU?=
 =?us-ascii?Q?LnB8uQ5gGs6aIf7B1ZihPcA9/oP0TwWqGinRMIEEuZxXHzV7Nca+T+YhoHdW?=
 =?us-ascii?Q?rYkWjx+agfTXECjhdDNQATnAbtEPJ3cNI9dVI7QDIkXSIDURVxI07xB8D3/e?=
 =?us-ascii?Q?r2oof53RdTIFHBst0REmreqIzPLjL/Tvtd02mu2wYKXDHCrcYlvLb6aQFgG+?=
 =?us-ascii?Q?ZzeR1GRFepKGGF0jW7+TbVVwaB0TaZD2baW+PPaPTS66Krn157UMDnd8MY81?=
 =?us-ascii?Q?ozI6bgOHi16HWt+KjHduzVu2vqc0SUArq3P3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:50:35.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df79dea7-f16c-4450-4724-08dd8360e5b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7623

The camera sensor is connected via ISP I2C bus in AMD SOC
architectures. Add new I2C designware driver to support
new camera sensors on AMD HW.

Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Co-developed-by: Bin Du <bin.du@amd.com>
Signed-off-by: Bin Du <bin.du@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v1 -> v2:

* Remove dependency on exported symbol "isp_power_set()". Use pm_runtime ops to power on/off ISP controller.
* Remove hardcoding adapter id to 99. Instead switched to use dynamically allocated adapter id.
* Cleanup header files.
* Replace subsys_initcall() with default module_init()
* Update copyright header and license info.
* Update MAINTAINERS details for i2c-designware-amdisp.c
* Fix coding errors based on review feedback.

 MAINTAINERS                                |   7 +
 drivers/i2c/busses/Kconfig                 |  10 +
 drivers/i2c/busses/Makefile                |   1 +
 drivers/i2c/busses/i2c-designware-amdisp.c | 205 +++++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f31aeb6b452e..65b6d985e1ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23519,6 +23519,13 @@ L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-designware-*
 
+SYNOPSYS DESIGNWARE I2C DRIVER - AMDISP
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+M:	Bin Du <bin.du@amd.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-designware-amdisp.c
+
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
 L:	linux-mmc@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 83c88c79afe2..adb2910525b1 100644
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
index c1252e2b779e..04db855fdfd6 100644
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
index 000000000000..ad6f08338124
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Based on Synopsys DesignWare I2C adapter driver.
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "i2c-designware-core.h"
+
+#define DRV_NAME		"amd_isp_i2c_designware"
+#define AMD_ISP_I2C_INPUT_CLK	100 /* Mhz */
+
+static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *i2c_dev)
+{
+	pm_runtime_disable(i2c_dev->dev);
+
+	if (i2c_dev->shared_with_punit)
+		pm_runtime_put_noidle(i2c_dev->dev);
+}
+
+static inline u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *i2c_dev)
+{
+	return AMD_ISP_I2C_INPUT_CLK * 1000;
+}
+
+static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
+{
+	struct dw_i2c_dev *isp_i2c_dev;
+	struct i2c_adapter *adap;
+	int ret;
+
+	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_i2c_dev), GFP_KERNEL);
+	if (!isp_i2c_dev)
+		return -ENOMEM;
+	isp_i2c_dev->dev = &pdev->dev;
+
+	pdev->dev.init_name = DRV_NAME;
+
+	/*
+	 * Use the polling mode to send/receive the data, because
+	 * no IRQ connection from ISP I2C
+	 */
+	isp_i2c_dev->flags |= ACCESS_POLLING;
+	platform_set_drvdata(pdev, isp_i2c_dev);
+
+	isp_i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(isp_i2c_dev->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(isp_i2c_dev->base),
+				     "failed to get IOMEM resource\n");
+
+	isp_i2c_dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
+	ret = i2c_dw_fw_parse_and_configure(isp_i2c_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to parse i2c dw fwnode and configure\n");
+
+	i2c_dw_configure(isp_i2c_dev);
+
+	adap = &isp_i2c_dev->adapter;
+	adap->owner = THIS_MODULE;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	adap->dev.of_node = pdev->dev.of_node;
+	/* use dynamically allocated adapter id */
+	adap->nr = -1;
+
+	if (isp_i2c_dev->flags & ACCESS_NO_IRQ_SUSPEND)
+		dev_pm_set_driver_flags(&pdev->dev,
+					DPM_FLAG_SMART_PREPARE);
+	else
+		dev_pm_set_driver_flags(&pdev->dev,
+					DPM_FLAG_SMART_PREPARE |
+					DPM_FLAG_SMART_SUSPEND);
+
+	device_enable_async_suspend(&pdev->dev);
+
+	if (isp_i2c_dev->shared_with_punit)
+		pm_runtime_get_noresume(&pdev->dev);
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
+	ret = i2c_dw_probe(isp_i2c_dev);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "i2c_dw_probe failed\n");
+		goto error_release_rpm;
+	}
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	return 0;
+
+error_release_rpm:
+	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
+	pm_runtime_put_sync(&pdev->dev);
+	return ret;
+}
+
+static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
+{
+	struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
+
+	pm_runtime_get_sync(&pdev->dev);
+
+	i2c_del_adapter(&isp_i2c_dev->adapter);
+
+	i2c_dw_disable(isp_i2c_dev);
+
+	pm_runtime_put_sync(&pdev->dev);
+	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
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
+	int ret;
+
+	if (!i_dev)
+		return -ENODEV;
+
+	ret = amd_isp_dw_i2c_plat_runtime_suspend(dev);
+	if (!ret)
+		i2c_mark_adapter_suspended(&i_dev->adapter);
+
+	return ret;
+}
+
+static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
+{
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+
+	if (!i_dev)
+		return -ENODEV;
+
+	if (!i_dev->shared_with_punit)
+		i2c_dw_prepare_clk(i_dev, true);
+	if (i_dev->init)
+		i_dev->init(i_dev);
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
+		.name	= DRV_NAME,
+		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
+	},
+};
+module_platform_driver(amd_isp_dw_i2c_driver);
+
+MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
+MODULE_IMPORT_NS("I2C_DW");
+MODULE_IMPORT_NS("I2C_DW_COMMON");
+MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


