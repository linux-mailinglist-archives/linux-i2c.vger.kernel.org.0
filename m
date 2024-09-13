Return-Path: <linux-i2c+bounces-6715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A4977F5A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67A81C21BF2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7621D935D;
	Fri, 13 Sep 2024 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YJo4inhG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8001D9332
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229530; cv=fail; b=ckCeTnVAWxKn0XV/gKLq7Wdq8oJSH25St8iS5wEswR7mdJBO32GNmfdLRos+W2geULd1DPb8RVwB6gNx85PP+SAFt1A6rhtMTxIzDSA05I5070n4CyRc/qa1+Fr07OvRhyaFjCZupA7xAxJlo+OliLr8iO/zlemVaaz5g8CwXGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229530; c=relaxed/simple;
	bh=OP1BD53Je0i/jgmxahVD166WfibhSRfDCrlJVp42giA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpKNtEp6nwd2odxzFi2Z6Kf+BBdPtg7zvsNuId9D7wTJgL+G2uSfWIyDBHm6CzBoVzJF/KC0j+fYDc7iy28Cr2d0wCfnHKgoeMZvrI4MoR1fhI0BLVsJNw/L02xn0ezGnHCL+nF9knCltawGDqeN1rIppBnd7UCp/XTJKnWCnBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YJo4inhG; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLaDipz8U/ery8WBZOK/XHDMn/aRQHCnOxWJ/9lJR5WqCuLW7yTiEuBG1fdbW9uvUMMxP0/5yW3654spLdLctmrPbEZojgipm7aFGR5kR+lBZPm6CYobtSNTqOtpuCNwyn8WKJDFvXUnfJNtj8aVq8DmHuX5TiiXbDsjcxJ+g7NFVT3x+zQjtxt0cP27VrZKwKua0Q5vkTq6HVRyifANeB+KO2WsOxN4xNsaWb9RJ3EJzSCGjvlHw7X2ja4TR5LglMcxzHAEdF+YTuL/OCZXCAFva8URYpUfqId/5bAmhTKDgWu7knOql6+N93wRIDgvvux6u6GsrLwEYSI9Dboktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz473k80CoIcqFyKW0CCBwlqXr/sEuEO8OIifcx1CCY=;
 b=kvfDj/ow1vSvjsgsk5hQD4lDkvjuqYozmjzeLZsvqP6ZAAAg0mlxP6my2+4c7+2ulhqt4m8X7vCynBnvqKE9xDyKYQEF4uCxMZWYQs758Zar5O3NF7Ktjs7UwIcHVot5EnXZIgpSWD5YM5k+Loe6RLrglHIHcMSvo7oVnxmIUjeEcjakDyBiA8CR7La3TenximtiwCIRqP4JUfnKKr8fKncY5TTNDrxYLPvkE2/qWTr+4uoqHrw4U9c4X6EAeRCOe3IMFHwQYtj9z5XMY4M0LQwna2JqE5H0iT23I8FzcsxgtYBmSPpKsoMVIzWVwTmuW7qaMJ88AzIS5iwiz/za5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz473k80CoIcqFyKW0CCBwlqXr/sEuEO8OIifcx1CCY=;
 b=YJo4inhGULgfpyqPEmQRtQExSlyBYX41fLiKLufgunXNIXcbhcbFULTQUA6dEjjya8isc8kbeLgSdIp4fwSBlfL9/H6IBL87HvK6hFmwXOcV1XUOUQvCIL875RMaQ8cN1vvDuMaFJBibH33qS2Jyl41iuivEIA+lw09uZrTvm08=
Received: from CH0PR03CA0248.namprd03.prod.outlook.com (2603:10b6:610:e5::13)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27; Fri, 13 Sep
 2024 12:12:04 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::ed) by CH0PR03CA0248.outlook.office365.com
 (2603:10b6:610:e5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 12:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:12:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:12:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get successive interrupt
Date: Fri, 13 Sep 2024 17:41:09 +0530
Message-ID: <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 551c03f4-ae79-445c-d9f4-08dcd3ed4788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mbBcJwD+ctaJUWtkYwPRYjI/nvla0O/njYschcOp9w00v5WG68l+Gf9vMUyA?=
 =?us-ascii?Q?Cs1/pijk7w+ySoTDog4kcKxz/WWivBCP6Th0og8tVpz8e24R3V//AJO/3agk?=
 =?us-ascii?Q?1lyV3f4Kjj8fhf4FVfpy726L+ds7gay9EDAVDvZUtw6pu5lgLUbdsQfAQqKo?=
 =?us-ascii?Q?+nOq57F/QQOIr2WfydZv54HmMaOuqkKH+FuYQZQNABiEnlAO9wnI2QumDU6B?=
 =?us-ascii?Q?guseuw9JeGJcN+7+vIx4X9Qv6CITYvfOiFcNOkFoAGqOQPtLPC1BuAwkrOnX?=
 =?us-ascii?Q?rDKpOk1PTPN6hny+pdJnNa9So0zWpk45yX2mWB4XkQnzXVMWLcimiQDIJBL6?=
 =?us-ascii?Q?e5xEkxucHg2Qp1mveEwfmviPClGNDcM9Tl8QP5+EwfSdnXx7LZ5a9SfFFfx0?=
 =?us-ascii?Q?WqAbwLALXOewaGSPnuDf0w4d4gT6fNVzuGeEhlugQmnr27pyaBA+PwAdk3tb?=
 =?us-ascii?Q?AthxTWke8PGKNMi1/RkBLAqlld6RNgFWZoL+Vd95UuKJAxndxRueeHxTqD1b?=
 =?us-ascii?Q?Hz3uxIL2n5ymAHhWyV0PRjh+toubXvkPSRMWbgLLBlsfDlvfdMIu8FYSk/Mu?=
 =?us-ascii?Q?yvjF3fXg2wMbPBteEDXy8tUO467KXQDZntfnxtOly4eSxOGgmPtdVD4EHUpk?=
 =?us-ascii?Q?8zVnlNKVxXilUoUWOfUBG2bDDeEo5nxOqzMfBuOTzwmiDmjkNi2S+M8n7xsC?=
 =?us-ascii?Q?Q18aG5vG8l8occvgyMb9+tZ/vS3naXLUT40o80X5ij+U5TwC1cMWQoA0vBqq?=
 =?us-ascii?Q?Z0bH/NlBG+QhhbubkLRlhtHgagPH+L9AP/+Z/USbUD4+VBm45q2ARIyI6Y8h?=
 =?us-ascii?Q?LRKyylHH+RvO/R+EdsmCnZZ7JY6VwM6nra7I34Dc1ZWtVURZFDftKeIBgDZW?=
 =?us-ascii?Q?YNT2oL4w0uuBMiC0PxrXRvZekfzbnscbIARF7+tr+hR+n76ug1BE1oGmmdzi?=
 =?us-ascii?Q?cBEXc2/0tqST7fliXd+tmOVA/6aAKa4H3+z6qIUyiUTf9gyFE3n8JTah8TWn?=
 =?us-ascii?Q?GTEoRu8rwnJB7dvNqTF8IhsyQC+SjRuaTwBb6v4OnPWMU7cahRdP8hN9ig7j?=
 =?us-ascii?Q?7AMMUR/cBvPhBTG+lGgKrMebKVivc7sPPotlnxsLb4VTw2g/FVBnvrXMBj4C?=
 =?us-ascii?Q?bw0BPEzcZXLBOlQiDxbybL4eDN1fd/TFNzsjlyU1s/LapU7XVyAeWwz9J4Qe?=
 =?us-ascii?Q?JNLlACpMMxbJQlB76Gt8LeMbPJRQtP6r2J8+Y8vn0GFY0znPLHHQUyPzdSQY?=
 =?us-ascii?Q?owVw8uR31+I9+544e1mGn9F1zQICPspWBfjdTRpzi5aPGpDdchgKVIeu0GTd?=
 =?us-ascii?Q?G5SZ5IvKs9wcO3gjtAZkE7FKQek7NMu7XiRYLWow/6Sb7t98t75deYlERtrb?=
 =?us-ascii?Q?Dyr6Zjn2sQc97K7s2+wc+c4+HhLuVxrb7EgMS02lc6TyeNIRwJpOFRxlHjNa?=
 =?us-ascii?Q?NDyiIhSvp1POUVlYF65ZJFDLBl1S/FlX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:12:03.9691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551c03f4-ae79-445c-d9f4-08dcd3ed4788
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211

To ensure successive interrupts upon packet reception, it is necessary to
clear the remote IRR bit by writing the interrupt number to the EOI
register. The base address for this operation is provided by the BIOS and
retrieved by the driver by traversing the ASF object's namespace.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 1beef717ef40..77555416597f 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -45,6 +45,7 @@ static const char *amd_asf_port_name = " port 1";
 
 struct amd_asf_dev {
 	struct i2c_adapter adap;
+	void __iomem *eoi_base;
 	struct device *dev;
 	struct i2c_client *target;
 	struct delayed_work work_buf;
@@ -292,12 +293,14 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
 		amd_asf_update_bits(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, dev->eoi_base);
 	return IRQ_HANDLED;
 }
 
 static int amd_asf_probe(struct platform_device *pdev)
 {
 	struct amd_asf_dev *asf_dev;
+	struct resource *eoi_addr;
 	int ret, irq;
 
 	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
@@ -312,6 +315,14 @@ static int amd_asf_probe(struct platform_device *pdev)
 	if (!asf_dev->port_addr)
 		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
 
+	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!eoi_addr)
+		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
+
+	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
+	if (!asf_dev->eoi_base)
+		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
+
 	INIT_DELAYED_WORK(&asf_dev->work_buf, amd_asf_process_target);
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.25.1


