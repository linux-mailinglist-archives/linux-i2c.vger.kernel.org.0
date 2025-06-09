Return-Path: <linux-i2c+bounces-11304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB6AD2311
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D221889FE3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD0D2192F1;
	Mon,  9 Jun 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iEvLePOC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8866C2163BD;
	Mon,  9 Jun 2025 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484596; cv=fail; b=KbcSvQ7am5kbp72vZHUOm4FMVcfk7n63b4kphuOo6wQ1RvE0Cnow2zjInJJ41oEEuZYd1pqT9GERsnP8d7J4kar3iKEjDhNS53Cbt/QCG7BcMTc/p5rqc7h3EhEV5oN/ZHErTddwsVD8YbVG31no2WPwTHkCwZfVV3xeGbWnieM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484596; c=relaxed/simple;
	bh=Z6v1jcLInHOsyMCGA8PSV5pGjOG2YorZHlWUzwEYsUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1Y7rNV4wqGCL6ADaYBs6D+hHNHKJ2z4HuMpdVYeZKbyRh6xSJDRSU+xs+WZlKhOJuCCd+QYqWw1G6qtQQQK/NM2LlzYvfGuRX/a/eKe1ktkVv5lfTroBVrbMkld7Cqf2OuL4OU2P+xJ8Gv6jAb24Fk6/x2ibGbshuTxWdgy9xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iEvLePOC; arc=fail smtp.client-ip=40.107.100.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFGtV3xiYo7N8Rcim8cz/ahjcv0nV5kZNKOCKLhWtRgH3eHciTPaa+lfipRV36pfkmnfbVIgvL5noKA/Dt553BFvTSZmNX2QU37222MxC6QkGtEE0hgXWAxDJ5B1rhnPZ2ayNxR6cOhKAHG5MQ7xWWRllsr7LlOSOlug6wh6HAAeoedN0gjExjWzzH9IpqNlG3/+a/g5HNmADqePqZ8O9RoKK3B8c1+N9twoI9oQOD/cseRPkfEXXB9qmWNa8wA9j41JeRB1N8ELiNvFFGWvcrZeMNssche6/X/4bjEB1lQ0vHBIq4DGT5zmdzw4YgQchwKTB8ZAOfk/TmU5DA7VIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=065QH/HDFkDvX9+iD/ZvphZZpxfPHAW56u4Z3HQRZkM=;
 b=a7Av0OelygDLQ5kU+mTK0yjWUBvSGDcC/RiSeLSgRg457CGnU7K2xz2kgf/BkuEx3iKNr7eb5tXE/QPk7TYwWe7dzRIjI4wl7zsIzipRmFcX058uIzZkjdTx8o48Phc1tVqv1hVMN4xTdVKnt0YVWZMPlw8G3P0HaFpO8eMn2i+pgqOqiJp2lkQMSjGO4WHcrRwHHCh+4MzuiBeBgtWkB6H9vxlG7Tjsu9LCWQBBGw7sfUWyRtHglA9uVwb1MO7xmAVxGAAAO3CfNIefChhHdIJAbHfa4n5N86zzAOVwPVTKZhbaE8NRbutTtA7qy5qlvp7HPPFnK01SKReLHaIeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=065QH/HDFkDvX9+iD/ZvphZZpxfPHAW56u4Z3HQRZkM=;
 b=iEvLePOCBMq7XncG7TtsR7w9OezoqTYm9y8tTqhDKtCvzUoBc68CQxTsj1DhNFPWZbPpgiHgzmqUtkHKEHrm9vEYp1jZawOkQuPQ094zhEsDyK9VDsHdxg7pKthz52uGEDIXfdTTPdUzsfHokTVf4A/m0MUZ6XIR1fgEwMQDaxk=
Received: from BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::31)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 15:56:29 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::42) by BN9P220CA0026.outlook.office365.com
 (2603:10b6:408:13e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Mon,
 9 Jun 2025 15:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 15:56:28 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Jun 2025 10:56:19 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<rdunlap@infradead.org>, <hdegoede@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v4 2/3] i2c: amd-isp: Initialize unique adapter name
Date: Mon, 9 Jun 2025 11:53:56 -0400
Message-ID: <20250609155601.1477055-3-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4224c2af-9036-4499-ed0f-08dda76e325f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GFVd6FJy2WhgQ054X0wxSVODuvAbKWRtqIXuALmf/6oTrIqitPoWZBJCH/NU?=
 =?us-ascii?Q?GpVT2OKskN48O1Dicd4QQ1wUO4Cezl5Jpe0opsAubEsJD+oH+IYOi8hWcy4z?=
 =?us-ascii?Q?FWL/FEgBhXN/jBv6mCNKZgcptWiJmkSWRH1WPxYP2RHUeS8zqfL636+cW/KV?=
 =?us-ascii?Q?HzhDNsHdLMh6EYaF70PI1d88RhBPPotVMZM16GTEcxglQErmhCdItpDcMjvE?=
 =?us-ascii?Q?x3mrJ0Pt0BrBfCFw97JXNdaLsvGqd2qI7f5Zbu2cFLi5msyPTmprGMzQ1YJj?=
 =?us-ascii?Q?q/zqFTIvljzJVFx6vJaesNQtMrdV/jkEM/3Wk1N1OkQ26IpMIK1DM0RilMFZ?=
 =?us-ascii?Q?uB7KwXDhvQ3qHyI9UE37KfYGfbXVV133xBC80qm74LquCBIww6q3E7XU7/Lc?=
 =?us-ascii?Q?ROnPnHviOvouYtkutIrX8k4IDT0dnTnc4sfSO7pEyWaANbDGjAheq3pBP7ki?=
 =?us-ascii?Q?fYUyX3exxAcIy3PUkKWllU0Jafch9Tzg1keexl91YNj0yHzmOlHiixkXPXFA?=
 =?us-ascii?Q?SpFyqKm1tt6KwLZRNhXfsiDHEeg57nBm7b+HXd3ZyiZtdOqPHbT+AIwrWo8o?=
 =?us-ascii?Q?b6flOJpBI4othsVkM35IyyFEQqrcTdrvyLkwke8NC8jPCuUHVs7g+Gk75y1v?=
 =?us-ascii?Q?qmJWewZr4o3uFvJLAsXD9L7n7oeCyf4xPin3VT5xRYhBHxLO/9u8XfAraVAs?=
 =?us-ascii?Q?29h8Ha8XqMNZTjb7/Hx8tIU+HJlhfxuoNsc3AUkJSNWBeN+amD8zijvZOgz/?=
 =?us-ascii?Q?SGyuDgVhPDPD62JolVA373Gg3v8sRSNDi1M3CLOJv3hAAJdw9GfZE01r1hXT?=
 =?us-ascii?Q?Hl+K5VY73MqDy7qApUyGaMqb1dER2POOgO1EtE4paZV5dkXdDF/KHSV2q/MJ?=
 =?us-ascii?Q?93jHX4kfvgxZTBnRjsBo8xbN8xsjGtm9q/DIsfKPg68ODQMLetbrPoARD/xU?=
 =?us-ascii?Q?48GLI+93c6hvanZKjK3fev0gF2b82M4dDnXlXcwgw+JU6lP6/lioqmnjuvMi?=
 =?us-ascii?Q?hXPrOROUs4IhhSVPCHrybFra15WPFPK7GbWVbSKQ5wzgaLXimH9/Re9xR3VP?=
 =?us-ascii?Q?dygsSWxk0nbjbKgaRfKhNlP/6xPK51kpeOPR+xh65jZf01ukABCrm61/nbC0?=
 =?us-ascii?Q?DbQb8udd3csijhjY7JdEJFWLDoMkb7GxKshVUkNIUX/RXvc56zDYvZrD5Ovt?=
 =?us-ascii?Q?XU3yGeyQ+3wqPcF2DtZn6dRKptXRJIGhoRXFQCxcW9WoWYPecIYqYUPnLVRP?=
 =?us-ascii?Q?/KgFZM4n3wcNcCzUkjDVPtMjmEu+9RrxZ0sk4GiSliRHIDmxxDJn1IavJUhe?=
 =?us-ascii?Q?mmaNXsOszr6I6VfJzx/6xIs+vSstosJbOll00tyz4gGAsjhjB36gK7tlFz1S?=
 =?us-ascii?Q?g0HisiDVEoD6bDVPo/m4Ultt3A+9w4ao8vpjlOS0YDM/kMQ7Mgthxxo+SDcP?=
 =?us-ascii?Q?uuRpR2GJ4I1go+5kScAoVfrYrtceTGQIFdR+49Vb6dVAXoY/YXOrGMd431Kd?=
 =?us-ascii?Q?abzh5jX6Jh81xKmdzuYR0vx+8ht7T3+rJDA4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:56:28.9419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4224c2af-9036-4499-ed0f-08dda76e325f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321

Initialize unique name for amdisp i2c adapter, which is used
in the platform driver to detect the matching adapter for
i2c_client creation.

Add definition of amdisp i2c adapter name in a new header file
(include/linux/soc/amd/isp4_misc.h) as it is referred in different
driver modules.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 MAINTAINERS                                |  1 +
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d24abc83d90..dd67855f5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23878,6 +23878,7 @@ M:	Bin Du <bin.du@amd.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-designware-amdisp.c
+F:	include/linux/soc/amd/isp4_misc.h
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
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


