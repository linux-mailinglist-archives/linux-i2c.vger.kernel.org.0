Return-Path: <linux-i2c+bounces-6540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA66974FCE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F27B3B25933
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4743B185B69;
	Wed, 11 Sep 2024 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="evtVQkD1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F016184555;
	Wed, 11 Sep 2024 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051150; cv=fail; b=UXYI8CjZmUX0MGyUYoMDbTfzPQ4fdBg3TfVHVnb5uJxJsjza84yVRNeIEvaAI+yd8Rea8gzzijbUjy5RxxFQ/cx0anb+Get4/U4BCr98F/NmZQfEmp+q0JiPahCrf7BlzvJEmIQfo/HgRWx1SYrC6jhAOjXgM/c95U5ITn4P334=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051150; c=relaxed/simple;
	bh=X7JE3jz8OkImS1RLo4VKLN5/YJbPLuJ8JS6i3zD7hE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TgTIy+0fRlAXlOD4CCnxJT+TE8udjlS7lPZ6EpvXgfKZeBdjXVLTvDrm5U/wpB3Ixy2kPvsGhcL6jLmd3aCXemET9bvzlr9z3gfB1a2ayIi07kfQfg4fCYq2MLTNXoy5vAJ1gIZ8ZBccLbRnP2BChFT3bLP+0jtcVI+EFE5oWyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=evtVQkD1; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsP/z7bs4iACpAXvZc17RYV5uf61193yEQ7Eiy1dxdnq71cDQobSa+Zcqc2/w8Kbj3iADRKd5OGzBgJwe6uiwP6EJX5BU75FGifGhDeTEXqTjfrTMp1PdFzbdOOn42H3pWEkOVYd3XUtMDseBCjSyBiJeasoilA6A4LD7hCBvL8z1zUxX7maQnYwXRWjuUICx/gSC8/mIAzIs45VpGhPSIGsjARHN6MQc01WbxHvSXNn1bvobpibOSRwnjtyMOVqBHLfqtVvZhDdk+MhlEPAOFK6w8tbWiiTKAwq3BA8xJMnjc9vo8CppsAT6Pw9ZfhFXjqqDD1ot1LTM9TUnxYoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAXUc+ks8G2fFWunSNjtxS13J93MOyH3ZzNqUNBwFUM=;
 b=QAq3enNIOeuQuDL1LTlRKtHdEyuSVx/kgMCXMg/doWirUKCILoscMXsDIavVoQe83ML9pfZJexx3vBVu2ZcID/E6lAmBH7aL8fSEdm3Byk7GlgiGE74xUbH4U1/9XoMvbmBOuVJWGdAp9GnEZoofDCvUQjH9uaQwcOetTaCgye/bcWiDh22p5voIlZgDGQNFqIvpaFESAQ3EiBzt/kCRldD/Xvbl5ZShE27N6GGEjuCxMmIRlaxKhKEbsW5Y80EKrAWLHWHZbP5fYxzriSo9LfhiZ60sU6XeCGs0yDgW10fyERvFDoN22BcJR7Z4tepp6ESS4Yn4Osw+uQP+OKFDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAXUc+ks8G2fFWunSNjtxS13J93MOyH3ZzNqUNBwFUM=;
 b=evtVQkD1ZfxjCvgI3WC6Qtv81muJCf5M2MvCR6Lut067RhIjpE26iqqZMRPTPB8AGUWac/jONIDwrfV++6IGZlNJcMjbQ4CBfpvhtHtzFnGqEMAW0m/KPjQ4TuAkwktwuaEAEnND3O5f8Xu68fOE6idwyN7MwcEF0GZOEsaUet0=
Received: from BYAPR08CA0059.namprd08.prod.outlook.com (2603:10b6:a03:117::36)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 10:39:05 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::8a) by BYAPR08CA0059.outlook.office365.com
 (2603:10b6:a03:117::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 10:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 10:39:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:39:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:39:03 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 05:39:00 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V2 1/3] i2c: cadence: Relocate cdns_i2c_runtime_suspend and cdns_i2c_runtime_resume to facilitate atomic mode
Date: Wed, 11 Sep 2024 16:08:50 +0530
Message-ID: <20240911103852.162234-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
References: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b6a601-8a8f-4477-f21c-08dcd24df591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eD7pcTE6O+LkGHUvYKg2JqZKXkMqW1YPGlp6nvQW0xKL9E7IZDGLS7NGvwwe?=
 =?us-ascii?Q?sqhhR/XSjRRktAMWc9UGAMy5mGGB+IAskxT7r3eeEaL16RzUIcZ9rW0kukqR?=
 =?us-ascii?Q?RtQhRnprxpSoJZyGDj4/b0bICGI1gYNdZc5ry5ZA/svzsVG14NDKB6qgoqLm?=
 =?us-ascii?Q?UU+8fbC1p57GjOqehcXYKQeYC83LKzSbsigoJfIBJo7y2lZbnsvOVNIZMHyU?=
 =?us-ascii?Q?HUU7Gf41/DUGttJnR9wV/PYERel8tSJ5grh5vK6zgiRnSLip4Sq99aRE2d5C?=
 =?us-ascii?Q?BKHiyKicpUzLgQ+u4rDlAMefDmvFbPACZ9lSrmpu7AoZTnR/dYhLtFQ/zMW9?=
 =?us-ascii?Q?KFhz6vg2kwv6ypzqXM5zIKDMsFzChJ6l6X4/V5MN9ggyA6YFTVYmtWoJkeMO?=
 =?us-ascii?Q?ggNkn1f1u5AQVBgHIc3+zZNClBt4u4H1Mqr6DDaduwe5gKMXhBmI27yKvAi/?=
 =?us-ascii?Q?pLuhUQ2l+ZAKFM7pLBCxdsSxSCSnA4MhhRR34fy14AJIZ9lOOL0WXDanQ9VP?=
 =?us-ascii?Q?v2zbx3bWj+wWPqQjkkuW9ZxM36x2JTmrAiXYYCR3lm1dbckHuOX8BhsUx7xu?=
 =?us-ascii?Q?EIeOs5ADjPOD05SMwxpnIWTIPsCgf7jH/DxdI+xF5Ow5ZGe/zLMLUAGQMvRS?=
 =?us-ascii?Q?NURozNxVX8g5xkD7aUoTvB9Zzk77RXaGD3Qp9JarAh88H4jxhvx1YI+1vvnQ?=
 =?us-ascii?Q?TtzXBFJvZ+kwRqhxbQ83RUZVFj+fN6iog6kHKOvhArrZPOhZhdRn0X89UEb3?=
 =?us-ascii?Q?xh/BQQqCRIn1ds5tsIambXe6o/rBjDOI/tEnZ41ZFbLdukvSGHanX1n7g4Il?=
 =?us-ascii?Q?hvC01oRUKRhglk3qqTi/nwMIERg0nGquOTO3t8NJnzpL7VUIYfh1AIz/DBTg?=
 =?us-ascii?Q?2i6O0bRVL9mxXN+V795xMCuwpw6viW1SCu66Otg1cdSxjJfJJpCeQRUCjKcW?=
 =?us-ascii?Q?Fly5LvqsvgDk2ugTA0qUF1CAB3RU6oBr9V0bE05BLhIPQP9hiJG+GOjTAzfh?=
 =?us-ascii?Q?AFlCZH4u8Xe5plTBoAqHo6d/Q+ByRJEhwhwqjiRf/8+ZFSaIMLDZ169jgzG+?=
 =?us-ascii?Q?4O/UnzC8SkEOzC2BR0W4Va8JlYu9ENzFlwEl425ve+7uQExnciaH8dXlRhrw?=
 =?us-ascii?Q?y8SmhRcsV0c4iwcP7GQz0ab9PVMNXbML4U41K5nBgWiNybsGeG1BN8xtm3w8?=
 =?us-ascii?Q?OrYxJp1rNzNIbN1vgiIkKH+BW1JFuD6TtmieLlXIEPUwv6WO0wweyGB6VL9i?=
 =?us-ascii?Q?AzI48iB9J9UM/MvBM3gnDBmOvEebEv27QT73PLaZLhvU50vwJwKA+rflttCN?=
 =?us-ascii?Q?8ZKlSt4onHJ8E7msrJd144KPS1QelLGIB0u59Q6/YlhH36dv809Oo+Vh0j4D?=
 =?us-ascii?Q?ej4YjNWiT4/dUPE+V7VvXBvBejtYWaa5E8/MPhV5mb0kmqCOFSAJoPxwJ4rh?=
 =?us-ascii?Q?efBluughSaQlDhw0K607bXX/IOJQVI/g?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:39:05.2502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b6a601-8a8f-4477-f21c-08dcd24df591
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448

Relocate cdns_i2c_runtime_suspend, cdns_i2c_runtime_resume and
cdns_i2c_init functions to avoid prototype statement in atomic
mode changes.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes for V2:
Added review signature.
---
 drivers/i2c/busses/i2c-cadence.c | 120 +++++++++++++++----------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 87b9ba95b2e1..d3f6ca2cb4d7 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -228,6 +228,66 @@ struct cdns_platform_data {
 #define to_cdns_i2c(_nb)	container_of(_nb, struct cdns_i2c, \
 					     clk_rate_change_nb)
 
+/**
+ * cdns_i2c_init -  Controller initialisation
+ * @id:		Device private data structure
+ *
+ * Initialise the i2c controller.
+ *
+ */
+static void cdns_i2c_init(struct cdns_i2c *id)
+{
+	cdns_i2c_writereg(id->ctrl_reg, CDNS_I2C_CR_OFFSET);
+	/*
+	 * Cadence I2C controller has a bug wherein it generates
+	 * invalid read transaction after HW timeout in master receiver mode.
+	 * HW timeout is not used by this driver and the interrupt is disabled.
+	 * But the feature itself cannot be disabled. Hence maximum value
+	 * is written to this register to reduce the chances of error.
+	 */
+	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
+}
+
+/**
+ * cdns_i2c_runtime_suspend -  Runtime suspend method for the driver
+ * @dev:	Address of the platform_device structure
+ *
+ * Put the driver into low power mode.
+ *
+ * Return: 0 always
+ */
+static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
+{
+	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
+
+	clk_disable(xi2c->clk);
+
+	return 0;
+}
+
+/**
+ * cdns_i2c_runtime_resume - Runtime resume
+ * @dev:	Address of the platform_device structure
+ *
+ * Runtime resume callback.
+ *
+ * Return: 0 on success and error value on error
+ */
+static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
+{
+	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(xi2c->clk);
+	if (ret) {
+		dev_err(dev, "Cannot enable clock.\n");
+		return ret;
+	}
+	cdns_i2c_init(xi2c);
+
+	return 0;
+}
+
 /**
  * cdns_i2c_clear_bus_hold - Clear bus hold bit
  * @id:	Pointer to driver data struct
@@ -1158,23 +1218,6 @@ static int cdns_i2c_clk_notifier_cb(struct notifier_block *nb, unsigned long
 	}
 }
 
-/**
- * cdns_i2c_runtime_suspend -  Runtime suspend method for the driver
- * @dev:	Address of the platform_device structure
- *
- * Put the driver into low power mode.
- *
- * Return: 0 always
- */
-static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
-{
-	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
-
-	clk_disable(xi2c->clk);
-
-	return 0;
-}
-
 static int __maybe_unused cdns_i2c_suspend(struct device *dev)
 {
 	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
@@ -1187,49 +1230,6 @@ static int __maybe_unused cdns_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-/**
- * cdns_i2c_init -  Controller initialisation
- * @id:		Device private data structure
- *
- * Initialise the i2c controller.
- *
- */
-static void cdns_i2c_init(struct cdns_i2c *id)
-{
-	cdns_i2c_writereg(id->ctrl_reg, CDNS_I2C_CR_OFFSET);
-	/*
-	 * Cadence I2C controller has a bug wherein it generates
-	 * invalid read transaction after HW timeout in master receiver mode.
-	 * HW timeout is not used by this driver and the interrupt is disabled.
-	 * But the feature itself cannot be disabled. Hence maximum value
-	 * is written to this register to reduce the chances of error.
-	 */
-	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
-}
-
-/**
- * cdns_i2c_runtime_resume - Runtime resume
- * @dev:	Address of the platform_device structure
- *
- * Runtime resume callback.
- *
- * Return: 0 on success and error value on error
- */
-static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
-{
-	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_enable(xi2c->clk);
-	if (ret) {
-		dev_err(dev, "Cannot enable clock.\n");
-		return ret;
-	}
-	cdns_i2c_init(xi2c);
-
-	return 0;
-}
-
 static int __maybe_unused cdns_i2c_resume(struct device *dev)
 {
 	struct cdns_i2c *xi2c = dev_get_drvdata(dev);
-- 
2.25.1


