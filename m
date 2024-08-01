Return-Path: <linux-i2c+bounces-5096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D15549448B0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 11:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 018E31C24373
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCBD16C86D;
	Thu,  1 Aug 2024 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jTrD0Ebq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345C171092;
	Thu,  1 Aug 2024 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505475; cv=fail; b=SvBZZ1zWr+AnLcUrDbeMV8JOMMt7IHZ9+0lDIyB/d3YHoKKsVPJj6j5ckiBsD7AaJwi4fX3UZzZ11MGxdD3RhUucHBPCaPtMxd7JLvkZSlfUrL/lD2v0PyoOUohEh4ME/8zBZTLy8nTsytIE0n1inQCoxmYsTugNUZOm15b5P1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505475; c=relaxed/simple;
	bh=5R/aP3wBLy3AgvS/xnMcN66wUleEeo9CsK8HLYHbmzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OoWYmDNGh0IkK06bLiY/4/4cRIH8YHTRE7PjtZdE6wnNYkmkE+qlGgtS5ZsDZDwvj1RhVY59ybTXLmqj3ZDB+h7r4rUTEAvAa6iEmfMn8M7MsBBA/AKfHtlKQEn7NfjPC79ZxsTDh9EShc2Yr3yPNWUIRgCrVRX+ZDeMWb4Mftc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jTrD0Ebq; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlEExDfp4U/iDDh8OndRjsLppheQmSyDfWzkBeTlecN3Xz0GjM6sCsn11ibQw9tUceaMRTesPq/6H9Zai2qXKndUNZToV5Rq+0EkV1z1895ziMZnG7U46MBuV+F7nQleGOezfXzZOeLYWd8A3K+PjWPyzhGB2CBZS1C8U+eMzGbrxT5YigoTqy3rf6OutnyysqlfR26Xdpg8bvUUgIP73c98hREDsHVXXuAbEAC7n2JVKsFhwupCr+nR+aKLqH1rE2WjtI/TQK2nWdZnSIg4qtiIgZVes3l2gZuby74zOerHRQ9nAvLQukNn952IUO/83xieD/THjnJa4WZPTemOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcoAbiRiHj9cBJ0eoyPfj+OdcY/NqCs+SSUFeHG0+wk=;
 b=FL9LHpWKW7z1R2uyL2Kr/PEnI4vOjIMgknlQsv/W98qXtd2ayJQqpgVJE9lC3WbubuXdAKG5t9iZPgzG811baxcutEgDB0PFVKKXZbbzLoqueWAYuS+49R6x6Td8WmIYM8WBv6C8IixjMwF7lB1Owp1VZaybXh0BsLTj8N9LP7FS2kkrIwsfWiFmuSl04lADmIjV0NL8Yx4RFjwTXiVVGR3Nt6K+/E2qFCC+JA6/Q7Y/QA5NwjF4OU/7sRgelGM32IUiPUHKv6oToibNpOqLs5HtgYPwFFHjkHkB0237niv90oAp6WaEYuJ9BcBksT7hXLE02eXBUMUspsTsT5p5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcoAbiRiHj9cBJ0eoyPfj+OdcY/NqCs+SSUFeHG0+wk=;
 b=jTrD0Ebq+rHNNHh2QbOKvYuNoVNkllfEDLlnMuobynutBCAF/RzsGT5CcojsYgnV3qYQ+jDJFcV2DZCKCUdShGDtTjdvprSnOfY4+O6qLFCmiR2LK5Nj+6OVqiOwXBCG5pvSg831F8NnYpswOI6YPPRMXkOHUuc8xuWD3iimoCQ=
Received: from SJ2PR07CA0018.namprd07.prod.outlook.com (2603:10b6:a03:505::22)
 by SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 09:44:30 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::13) by SJ2PR07CA0018.outlook.office365.com
 (2603:10b6:a03:505::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:44:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:28 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 04:44:25 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
	<manion05gk@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: [PATCH 1/3] i2c: cadence: Relocate cdns_i2c_runtime_suspend and cdns_i2c_runtime_resume to facilitate atomic mode
Date: Thu, 1 Aug 2024 15:14:06 +0530
Message-ID: <20240801094408.2004460-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb15c18-b3b0-4b6f-313e-08dcb20e8a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+BJRJjUNqVG570U4rP2K4OnoadIPxmk2Z5c47prrzdQKupYQK/lRjyEFHk2i?=
 =?us-ascii?Q?MtgeYBLsu10QijJfSJ9mLltohBR+ap4Cn89fwTeuwpdOuopBTeKnkcTV8qtb?=
 =?us-ascii?Q?PZd99ChOLc8X/GPY56by+vuFeD6UcA0eZ6w20rWpdO4F872xAujJs3qDNOgP?=
 =?us-ascii?Q?EbF1USwepkirQ/xhtvHTwOYeuXHxAhORxu4flJz3muLxPY8kOdb/pZZ/ytTq?=
 =?us-ascii?Q?dIJu/gjTOeFyxbWNKTYLZk2Rbo7zuxn9/WgIqZyuisZ94uX/OO12kyKms1X6?=
 =?us-ascii?Q?d96NDSoVb7GtnobVqzkuwM9dKqo7jvlqDw5Z1nxjqj2ZDSV6J4cNKZWXUstM?=
 =?us-ascii?Q?d8D8ZAWrfmgmg2xAkYwZGMlE3DOm6LNnxtUJC6ayX2U+f7KySR8SgkzYAv6E?=
 =?us-ascii?Q?DqGa1rSd7b9P2q+AJNfjsfVPIeOr22dxc+uORhzfv5CiPTP2aw1ocUyHxObk?=
 =?us-ascii?Q?GiP+oTeAZMqYgijKXq9Vm5o6UGAF6G0P56zdbXotVdhATod0wgtlnI4yAcNq?=
 =?us-ascii?Q?cpzj4K8Y5JFfBp3BbBACLGv3lWAKblkmnt+TOVyq5u4vPnJ/NWJWBduF4uGq?=
 =?us-ascii?Q?9JLXw64fMbUUwt3RnGJ08IaND9pkwigRfB4WW9fN1WQC77ko0n1s3BMOFCaN?=
 =?us-ascii?Q?oXXgH9izShDXfbLOccupn4DpwYpkhrR/62CNxlLxBdPfVjDqp0rim0yn499y?=
 =?us-ascii?Q?TuNAfsBrLvlrM8maa1gkHixt3qRVGa1wPTi+OWpQcCPDN3zsvuV9/V6wEoHy?=
 =?us-ascii?Q?XU7+QkCmlv9ikW7T/MiuIh0zrq4SruElwrmWx5YJSV5NDWJbUSvAIb/VDJxH?=
 =?us-ascii?Q?ohArd1ey2SKIf9buLvUWuAX9UgkD1nLHLftHUNdqko1IJYlFKjEoSoQZBJzD?=
 =?us-ascii?Q?Zxd7ve0HIpNXf8AaE/SK6DIz/UdRXUfChZLaH9+6XJv51R8gJTyrZRhZztc/?=
 =?us-ascii?Q?Qx+gWPU6JlGaVMmsNkCbz8e4imMNykkEjhcjYZsPkPEbO22/eH1rFTdYBvuf?=
 =?us-ascii?Q?tmEt/kcZ2JZQnTQgvPqEkcDe4BzonZXQO0whl/z4Jr/tW5ZSZjQZNYMGCy3B?=
 =?us-ascii?Q?vq1ld17nrCAZYKB79gdpmGp2m1B1JkRV5KxAMCy0C1F++39Hc95dikJj5uoU?=
 =?us-ascii?Q?k30P8a3Lmnt3RvcF+0I5N/aZRY8i1xd2e7hSBWhMciaweFyAzhma2djIpqWf?=
 =?us-ascii?Q?vK51G1uTUm+CS0LfCcsGJsQ+M5EW5zIeLomman/w1QVOL6LfbjD+KrDYz0RO?=
 =?us-ascii?Q?SJTMG/KtVCoHYCuvHBtgQpaJu6F8zih5g/Qscjf2qHHgHvgOT63CKJgntCYL?=
 =?us-ascii?Q?oJeb37tm3QtfTlQS2CzIBzoUADlyy8p3NHM4TEzmgWaYL6fwcC5KrwAXKtUP?=
 =?us-ascii?Q?Ow7pAtIgr2C40igeSUpd+NO5V2StfAI2yDckEANSyCtAIAK3aewAlzjZ1ePk?=
 =?us-ascii?Q?+Jmx6QjMEroF1VJEeVxr+zQ0k53gm1gu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:44:29.5930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb15c18-b3b0-4b6f-313e-08dcb20e8a2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126

Relocate cdns_i2c_runtime_suspend, cdns_i2c_runtime_resume and
cdns_i2c_init functions to avoid prototype statement in atomic
mode changes.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
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


