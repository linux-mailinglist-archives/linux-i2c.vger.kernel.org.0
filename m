Return-Path: <linux-i2c+bounces-8400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BC9EAD30
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB53286CE1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 09:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F28212D67;
	Tue, 10 Dec 2024 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BbZsxyH6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E3212D86;
	Tue, 10 Dec 2024 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824382; cv=fail; b=tueNlfh5kaCgDcmaQRV2Knb7G4H+2bPhLioPAm8cAcY3xiCrsnmvYxGbmJXl7mW0m/lr/cX57iDuR2XKVEI2N9QOuPKQvntdc5dZMf1VENHb/eM4LJKjnj6OdYhRLgU+NmywRzyNfOEV/hSMr0DTkVG/jcf7kL/zNo/wHruSm9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824382; c=relaxed/simple;
	bh=/zVBe9nKftXIXk5aQkh33z37bryCHp/Kp4wPSIP9MRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzfB6ncwJpoi/P5mlB3/ljuwOLO5aExvuIofJkUj9YJsabNkQXZ5oeirzxIOYbvGUi0ahBaLxG++PcLJ9R07VHoZdVGP3d/bt2fjHXOn1rgzxWrtDVa03Ct1xtkss1LwAP/KUncTRRAjO1EDwY0ogZHjHKGqvsD5zNpXDNeDV6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BbZsxyH6; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUWCw+nJFq916eG/xDjGlE9b6sEJ2lt7Kb5J4E9/WwZjv+qohf9+C9vQgamCUQP/FvvDawfNwcizttEcIjowsSTsUXQRPwXY3nE3PXCSiI1+9BTBmjf/GPM932Sd0OslEQwY35wRz4M6C7N9HgcwYlstzG8RzLXkSc99bmxbX0LkYPqpmkmVBZE8L3QWglFRBkOkD8X6plwbKPaO/jHZc2hm9zMxzi3JYMhYbs+vnCaHNgLAe8G9qeEcE/2mWRsXq0UTKHgJiNqVCXKQ8usAezGCxzPtD46GnmMwX8H/V6oNJllZ3jSd5jqg9Zl0ufPHkOYlkHdQ51brQNlsDozM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpPxhlZpHvFlidjzPl8bUSFkNAwxTYNWeE3I8YY9mYs=;
 b=mGgeSXvzTWlyssQuYuWI1fwP/4gl9yW+xYA5wm9Sw3tR3yP+CrZFEzR1kA4hKCnUIqJrpz6PNuOOl2RW/9I/BqAQvEN5QXXIb6Bei1GcndzE3M5Qa8MXMXEtmn4DGryDjV81smrMExr4nZ+d/hWeJBiTyhG0JL+VuGKmvKAozfvj77UhvZrqfAD8x1bfEvitnOeDFq04x6mM08rNPf0QNM/qUWlswSi27eLfTbiDlosW+ec3Whzvy33tqGjf9Zz7jbtBdIIOBBiVVLVFSJH1lfYIliMDq20u/4BvN2sLl0/o/4S18e6MJlUrWKQuDgKTq9ji7BHJ4jQDiQkU0MIa6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpPxhlZpHvFlidjzPl8bUSFkNAwxTYNWeE3I8YY9mYs=;
 b=BbZsxyH65ook8moU/eAB9BBY/GzWIQGVoi8Vy+UtF3aFiNKQQczldMmvA0XyMdBh5ZKfGJ2i7zrR25YTM/z3PtbRg1Awkzzty4SAJTsv/2JVCKlpQFgfpdN0nz/EHhaR+NCmPrw7Hvswbt3kY539UBHSgn+e+vYoWHeB/M+GWAw=
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Tue, 10 Dec
 2024 09:52:57 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::e5) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Tue,
 10 Dec 2024 09:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Tue, 10 Dec 2024 09:52:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:52:54 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 03:52:52 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH V2 1/2] i2c: xiic: Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume to facilitate atomic mode
Date: Tue, 10 Dec 2024 15:22:41 +0530
Message-ID: <20241210095242.1982770-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 8353bc58-e0c0-4da3-a5a7-08dd19006ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oYZNT0tSzhtso0A+D8Imdq0fHTB1RdW1oP4KvDQMlRhmNPlkqf1Iktz+IneI?=
 =?us-ascii?Q?7URcdxigyoqyJvGdivjG1PeZsOZGef1dzEhaqfS7afiGXB1bUOwMmLFOUxtO?=
 =?us-ascii?Q?2wC7qn9DV3RlnOH18ESKP2Cgq/SaU7jocr4HFm4IcrDByMX+aTkTSOE8yRuK?=
 =?us-ascii?Q?jnGPHlj6zrpNeNqcupwewc5L4/XySwuXedOlJRcgzcqcKF04qcCrmw+h0dTV?=
 =?us-ascii?Q?k+R3h31SW5dx6CxAafxf4evRTyBJUo8jG9btHiXyzP/eC0CS0XsusgHDTN8Y?=
 =?us-ascii?Q?TuPw5EUZkHXSWTxaipCVPc/b9xQ/RD9O0Rs8KLkkc8DoFCyxhD7Y6Yo5lVHZ?=
 =?us-ascii?Q?Upy430TwKpfbU9dCorgIVuVXdclBSyQ4jAyKsQHxLgjoE0I0yM1LSywJZQUY?=
 =?us-ascii?Q?xlfP8z+9ZZiqsipxbtibyTjdrmU3I8UfOdVzbZzhUo0b8+jv81hGzSAxwCu7?=
 =?us-ascii?Q?QltsX9APop7sqj1NIKR4MD+jW2TMFAlUqfkBq1ohIzgHiusQa3Wuc/oSZ7q5?=
 =?us-ascii?Q?XVAOZCzsVDbUolYrqTsWDDG9zHznx27A144Kl2PbKL0RJpzCWQpxF84359AN?=
 =?us-ascii?Q?fIULd1hQGKEWtQSiAiraOnHVwjq4qdFqgjtePn0AJdH3YTmU2E6FdA1ua1mt?=
 =?us-ascii?Q?1yLTlfSogbnbUyPbHLafDXV8DVwk+pqlCwpapKbl0rfdyogH5LPMJQcMpcgh?=
 =?us-ascii?Q?Acy99EKTnIroDWtBa56w3W2AG96BnHFU2NxP5xGBMH+uqffluQbXsRt/utJ/?=
 =?us-ascii?Q?uVq9p+Wg7I++x32SHtT+hbLCt9yuA7me3ZyuZFNdneJtveW/y/5eUxTsVr8g?=
 =?us-ascii?Q?SRt/zmeEc3DBX2uRRJkBzb/afIYj7cEjxhDIOf5I8ego5rDdo2tmbGG3erjn?=
 =?us-ascii?Q?4nsVkC27xGzVQFqVwW66/2S0B1Ms7VBw84qixWkjNf9fI0opXqjz785v2mYQ?=
 =?us-ascii?Q?vSJwMd5TM9DMq3yCPSxVmz0Yi0p/l4ZHtpmxDZOREABpw04rzs7Vj0AIZpFj?=
 =?us-ascii?Q?N7yCGOpxH7vwNR/RbsiYLIFyQYpkpnzjdqNsYFQm+bQMwq6+lwIm/rjU/mi6?=
 =?us-ascii?Q?7mnwLetxgyIItCBPlHQCqGKlOciC2shr9qgvR708cu4GFSvee51mEngFYPSU?=
 =?us-ascii?Q?GTvfsuWJo7OtoUItvGOgqJyh7dkghSaV87I0g9cw9UJqfEuI0+ApKYFugQHu?=
 =?us-ascii?Q?M7HZNgGTiDsHucYszAJ1I2udNoI9/h41/Sh1bL0BmptGiShqybpZ4yrKkyIE?=
 =?us-ascii?Q?OZa6cvzfrD873fLVcTHrOJNlfKz3EQJwmi8HOdpRSIF1WsUmeuoKe3Q8d2H5?=
 =?us-ascii?Q?hvT3Bx2r8H2SPJpiNxkR8Bhd0/v642CVDP/b7ZReoICHK5CYGhMMjIARRJAP?=
 =?us-ascii?Q?wbKe9Vb7NyVKK+7ZYQ9h3mRl5VdkleBAg+1Zwg4vOU+b0IRX0lgLuqrC5zgL?=
 =?us-ascii?Q?73WmvE6N6C8XAzrgeAhqfwlViUPA/+qL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:52:56.8602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8353bc58-e0c0-4da3-a5a7-08dd19006ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

Relocate xiic_i2c_runtime_suspend and xiic_i2c_runtime_resume functions
to avoid prototype statements in atomic mode changes.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
Changes for V2:
None.
---
 drivers/i2c/busses/i2c-xiic.c | 46 +++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c4d3eb02da09..f48e73f905e5 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -238,6 +238,29 @@ static const struct timing_regs timing_reg_values[] = {
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num);
 static void __xiic_start_xfer(struct xiic_i2c *i2c);
 
+static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+
+	clk_disable(i2c->clk);
+
+	return 0;
+}
+
+static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
+{
+	struct xiic_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "Cannot enable clock.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * For the register read and write functions, a little-endian and big-endian
  * version are necessary. Endianness is detected during the probe function.
@@ -1365,29 +1388,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
-static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-
-	clk_disable(i2c->clk);
-
-	return 0;
-}
-
-static int __maybe_unused xiic_i2c_runtime_resume(struct device *dev)
-{
-	struct xiic_i2c *i2c = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_enable(i2c->clk);
-	if (ret) {
-		dev_err(dev, "Cannot enable clock.\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops xiic_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(xiic_i2c_runtime_suspend,
 			   xiic_i2c_runtime_resume, NULL)
-- 
2.25.1


