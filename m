Return-Path: <linux-i2c+bounces-11271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB7AD099C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 23:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 765937A9356
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 21:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F0B23C4FC;
	Fri,  6 Jun 2025 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4QFGXBSQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7273238C34;
	Fri,  6 Jun 2025 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245753; cv=fail; b=M7UqVoyQiGJjB3pUExDbyFPxYLPooBFkqC75WQh4FlhJ3lusygHfnpZIOEs3YqtGLN9RKQB3mtdTvxMxWiXWC8S0CqSeP9Mg6lw9s0IHXlvvo9wWjTNyFhSeAtynLRXbFenua5o6Tj82DQbCOWTFiQl20af65cSC6DUMG0ARpGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245753; c=relaxed/simple;
	bh=fFmLir73aZ3ndkZaPI2b78yNkjc6sV2/Zrh93svN3Rg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Edaka3DX4DwwcdW9Dnu5LTk8fWa6kuz+6lSkGHVqLbClex08QdiM5kiL4sI7MVZH0o1Mtni7nN86fA0cWQZjk5oi7zbzEfzN4FJKwG8bfYUeIVFCp910xUoPh+XkB6plHttrdGg5kPGHZTP5yvcqVYgLEKCAzU/GMhbLIDbRTK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4QFGXBSQ; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/dTmzOGgI2KtNI3LvcdVtYOCcJZ1j0HZ+tEaNhbjjzvzvYw2+A+FZgraRsOpGS2n7VEzD8d3xRv1G2CBMaoYgyZcKXH4QNDH7WCx9uqswtgdjJ15vz0p4/clcntndeW52p15JsgDLlKDMM9GQxTKcY5Ks6ce7i2noDxzQ3ypq8uGHVxRLQUTt/pVRNfNQTGOS/9whqLMkWXHxPQN0AQ93VJRC8Jib79VFgbClaQezYSmaXOs+zNx7JfLzOduH5ExPCIF4w3xBoqNHQu/25QfmrXbX+ilLGC3xjTd0eXII+/bcoLjZyjI67XehBBmK4LNuUeE4iiT8AF27yE5Gcfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyNAD+BZ0OIWypr4yBxp89q02e/eht7IRdlnslC2CDM=;
 b=r5BmTzgxgQMHijU/Klo3r4tvL/sdlFepVlD321BsJrx/PSXTWyn8V+S4EXvE0ShzeKIM+5d7v3Grz360hlYbIoOZEnwyD/jO9f7iaM11mRmz8CFOOSR7Mxhl+9Lg6bjO/NKs5lXInIxSltb3hR/oy5C1fpeJoQJ1gcH6xJtHKPXL9lfIMAYXHBCIrWnfGauaJOZPioDzJcj2OqAdaskV0hMdhFD6vBz0gQRYOTMVixGpa+0AJpIqBR0XC5UYs1j2bDtiz/drXrcFoJlfD7G2qgbmtEyvd/UGq55eEqW69E/prKHzKBoS8ZGN4zQNhXL/ABsuaANDuZSkQXg7JNuuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyNAD+BZ0OIWypr4yBxp89q02e/eht7IRdlnslC2CDM=;
 b=4QFGXBSQxQNCKJdNj7MoJyDt62GlwJ3Ur939uVxr7dOfnIVmxg2eC3lBm9TChYYvpZiUJEmZOlpqmxxhas75UfoHiSUKNHlIwAnrGGosr0hsCxc5UfJwD3j8gF3piyE+r2vlF2ZqbT70422EZOi0FF+51J9AFmFqQqR9Fl2xJTQ=
Received: from CH0PR03CA0330.namprd03.prod.outlook.com (2603:10b6:610:118::22)
 by DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 21:35:45 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::87) by CH0PR03CA0330.outlook.office365.com
 (2603:10b6:610:118::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 6 Jun 2025 21:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:35:45 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Jun 2025 16:35:44 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v3 2/3] i2c: amd-isp: Initialize unique adpater name
Date: Fri, 6 Jun 2025 17:31:40 -0400
Message-ID: <20250606213446.1145099-3-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f79490-a765-42ce-e6b4-08dda5421869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ueQDXzXE4zrJlhzVvCLjBaPa0LAtTAox6JzmCmtf+gmAeXLA2mOk4YaSV8kT?=
 =?us-ascii?Q?Q65aYHWOjn9t9EoinvKhA4i97NP2clTlcwpD3SYKJDG5hzMs8OshSMD4n+RP?=
 =?us-ascii?Q?ZfYJl2jnax+76w26p+rv8wrRUyLnxWJw1Rv7LrIzwFeuet5i33ViNEmcjAH3?=
 =?us-ascii?Q?wzEdEMj6wcH8C7Gjp2zNkESLL2rpZBoO75c/U+q2zHjMxgOb2goozbiC6W83?=
 =?us-ascii?Q?9TfZT0Pm5Ij9RnTDin79uxDuI2JmJJ72q//04lkl4pUerRCka5q86EIIfK0U?=
 =?us-ascii?Q?CYGudsXBMfbs9gPeKpYkgxslT9Yl+VoBhE7XwuOH0+Jlj4p39AX5iPF3L9Ny?=
 =?us-ascii?Q?sdkyq0eyO9/DCRqBKitiKU6ZOTdx+bVj/AtZFbw3/EXrcXIz7GORINr0SQ28?=
 =?us-ascii?Q?SYMIZ5I/BJKjNd8neHgzfGOONuCRwGq/RTzOXaRReb2e+Z2OlRdStcQE97za?=
 =?us-ascii?Q?viN1XDOrGO78CXJFC10Mv/0Ub4NoYrVA0QYGvj5dxEp7ub9sCcAsWY2kTCEW?=
 =?us-ascii?Q?ZVfkKBBNKBY5f31915KaDP3xjg1TmVzZ8hHsAhzEGyY+Kzz6n/Pg8MUhNIOG?=
 =?us-ascii?Q?7EdpPyMugYuCZpgho6zOAXsFFDxbL/J4+VI0j+h01hUTYeNwoNXPmuWaPnkj?=
 =?us-ascii?Q?RkmPWGEX63VNRd9AMoMQFsyw58uxpXbOTbA/9+Tlx5G1zPVTSA1dKtumK2Jj?=
 =?us-ascii?Q?kkP2KDW5FDnwLrsqYkpnzs3yj1QBznlBtJvGSuA9eZk3LgmBUfbgwdJ42YlJ?=
 =?us-ascii?Q?xhEYHJC4LlqJSVm2spIWS5ZTyoA4rf9LIeLODFxaKXoANKIOOCL/hc5BuhOV?=
 =?us-ascii?Q?XjdI2FFEJ2xXR3A4Db44bYKMQB2J6DJdBgyQlUS3I3pR7trmAcclqRH6Z6z+?=
 =?us-ascii?Q?EoNbNP+r1MnvNZwBcPWpkvI9uv33NbFp+qC5ljgARKJp3YDH8XDAZSJ22hdN?=
 =?us-ascii?Q?kYeh41kF1wgU6UoCKuGQ8eahB+QQZb/Inny3EseYxvXRcYVMdyEYxZMaiz9Q?=
 =?us-ascii?Q?sAHWsgT9dDCjlFtQI/foqGox+0mxz86JJY/YaOynRXCncGxVGcdG0raeG4MO?=
 =?us-ascii?Q?g0KiIefN6OfTElkqEmO9QYBh8+hIoHs3FC9RESUVsxvLe/8uV+l47KU/F1dy?=
 =?us-ascii?Q?rS98DdoFCLSUf1LZ+G5W2MA3qfmaloxRP6CUESP8Ym2zQH5oIVKzw103rUf5?=
 =?us-ascii?Q?qCh18uBMSiEoAyrClHR4JjedhLPSDFSCk9spfafAvN4NnREJe5TzzdqoNd69?=
 =?us-ascii?Q?fY2zt44gGscsCqU6lFsDiOZAoaYQZoXqo+Ua6KFQhepdDBOg7s1Cj5da1H9t?=
 =?us-ascii?Q?kfDXW0WxR8Jk+nWCAiJiRkOuMzl66/th4ladCCsaw78AMW3lHsnzHo0Xgs6o?=
 =?us-ascii?Q?rRVazlIGGZHXu9yQv3EA5Hiu5HKEYz4y3a01n48b9ol+/J6e0UEkojqMk4ZA?=
 =?us-ascii?Q?3uoa2CSQfbSKRKgR7Vg2PLEeV0PH2qYFQD2/6sTs4SAN9dF7AruYvC+DKTRS?=
 =?us-ascii?Q?FE0KwChXxxN3qfUHTcgKmyWLbZjeJBpYY7gL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:35:45.1939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f79490-a765-42ce-e6b4-08dda5421869
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718

Initialize unique name for amdisp i2c adapter, which is used
in the platform driver to detect the matching adapter for
i2c_client creation.

Add definition of amdisp i2c adapter name in a new header file
(include/linux/soc/amd/isp4_misc.h) as it is referred in different
driver modules.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
index ad6f08338124..450793d5f839 100644
--- a/drivers/i2c/busses/i2c-designware-amdisp.c
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/soc/amd/isp4_misc.h>
 
 #include "i2c-designware-core.h"
 
@@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
 
 	adap = &isp_i2c_dev->adapter;
 	adap->owner = THIS_MODULE;
+	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	/* use dynamically allocated adapter id */
diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
new file mode 100644
index 000000000000..6738796986a7
--- /dev/null
+++ b/include/linux/soc/amd/isp4_misc.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __SOC_ISP4_MISC_H
+#define __SOC_ISP4_MISC_H
+
+#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
+
+#endif
-- 
2.43.0


