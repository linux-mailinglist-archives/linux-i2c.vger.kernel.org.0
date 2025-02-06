Return-Path: <linux-i2c+bounces-9323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B9A2A7FC
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 12:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4255A1886DF3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 11:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F3A22CBC9;
	Thu,  6 Feb 2025 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z7RE5OWZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD692147E4;
	Thu,  6 Feb 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843055; cv=fail; b=XQhTpICLPGwVYrPhaXGvhDoiibHxxlzK8Gvil2uZIxCQFUsQLtaVyT2XpB2/lITItGIWGv1SYfBSaZy0ITzknhF2ETOOp6fWF+w624dbT6N2KxScMPrT/H0NSSZEhoYVgo8hH/EKhdJFB4jzsAPIasKrniTaAUf9hoYYftpzX2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843055; c=relaxed/simple;
	bh=nwwVqw200njwVDZ9+YA2oms1+Zn4bnAJNKaZ6Cvj0bk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUu9smcwMczfJCzsIlJ/VtF3xL5VCFKuNJ6TXNpPJRqfXxJfDg/uCmmYgytCsreoff3PmqyBq4wsGxeMR54P85ua58p3cbpL04RrRFV+IUGmZnul8WqxYagoqAgPSIcYVoMWfZqZj2KF6O+r94XkluV1TJu9EXNHzOP+cbbgrt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z7RE5OWZ; arc=fail smtp.client-ip=40.107.92.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF522wDQBH6Q4zswt+rGu1kFs65ved+5/16v8rx69ADvNMYfmJjW3EBuzG3TAUIVZ/8jeT5we0krcO1DHs0V4y1Q3EVcvTqc8wevgQ2DrnqrTZr6VzGx4wiqLV0xaH4OAdJlAuJeLjDULNaKe+EjOPx3UydouQt2eRqhf8XSiny1r5QwHXEtEPhZS2vFNJIY8qBSh+N7L6W7jFjv/g8Wc7Eehn7XRwO2v6l3CgUReWxdCPRD7w/JNi4cqb8TC4ZqJ9jsEtvUittWvWdHd2ZBIQ98q8IZOEu6PIcPCXEkhvMONH70pr2Nh2gzfq08pePRU/tVifDzWwU1YNkfBZzV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLg2OfvLHU1VcjhKsZeqA74rYbw6juNTurkE5jTVkdY=;
 b=mUx08rNdmy0GUAVm6n4wZ8ugaSEehETGDWsDW+ZyYsA5ABncyaGoIgav22JDnvHnPGeWp+z2hOZwqDbI5TVIpqvoyEg7ArLc/bLqhkcFdkqzHdmGcqcpP/4McZ90EaIavn5L3KeMhmsCLNKQP/44RYb/PXzWGVqDHn+NQVDGK1f/XWUU0PmvLtKtuQikKuwp/lyelw37Lby5jhw84+mlKdu+RSvsMrtlM3DFZDW+POJNTx+0SV4nCD9wwaN2DBJTtZg60sVNoUPxQFAQ54iGTIyglHe89DaCU9p6ZVKZ+Ifcm6pPJl45yJRJmDlAcTeWR6eoWR4CsZck5KRbfDmH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLg2OfvLHU1VcjhKsZeqA74rYbw6juNTurkE5jTVkdY=;
 b=z7RE5OWZ88AUV4tBJ2P6Gs14q1RP6Rc1ifYBdQBPxqv50uX/VtYSQQvwcxm8eZewXw0HyQoMbNat1KEAuvFW9ey8NTM7fZ8xYWeilprGSNwL/1lqvndsIllC+D7r+obX8917O7h1tftqMh7/3PUjT9AOY/KzZOwu4UR1Emwj78g=
Received: from PH0PR07CA0057.namprd07.prod.outlook.com (2603:10b6:510:e::32)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 11:57:29 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::83) by PH0PR07CA0057.outlook.office365.com
 (2603:10b6:510:e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 11:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 11:57:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:27 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 05:57:24 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH 1/2] i2c: cadence: Simplify using devm_clk_get_enabled()
Date: Thu, 6 Feb 2025 17:27:07 +0530
Message-ID: <20250206115708.1085523-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
References: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cb3d21-9b3b-4fdd-1a0f-08dd46a56e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yEka1AVKyZBEfbKu2DfIg63K83VGor5iHym2PUavLq8UzwzapjrlncONS5kf?=
 =?us-ascii?Q?f/fKXag4BLPFCf60ezDIiN44lWPkKzO55Flbla22XKDeoUN/vi4pmJJ2OALh?=
 =?us-ascii?Q?SW+Mv9Kgge8BIiVqZI7hLM5w5MoDYa+hVh6S8vgAOXOgknSj9M6JXNsLcPPZ?=
 =?us-ascii?Q?PjJE5K5oZYq1vIBng/ZmwJJIjKgrRFQh//lNX31DNcUO+zUHW3BFEBLFEO3N?=
 =?us-ascii?Q?PYI5WohelcGg/0HNWkvBDRghm55Vid9B1+v83oF+TmRV8LuD/p1tHL7W7Tum?=
 =?us-ascii?Q?EtMmTSUj32dwFqlOBxqwEQEeycpILwpuEfBIvpYnmuCoQVDzpApm0TB1lrpN?=
 =?us-ascii?Q?uFkvDaOBsRXU63LvhCqq9KLPw4sZ8MyYeBA6fnFrgL90OB8OzhiVOg0OvDAT?=
 =?us-ascii?Q?yIsJbUDpMGKH9XfApbxFxEzF5cgwm+A0dNKQccHEmSitKWC47zh2mJf3tzjC?=
 =?us-ascii?Q?AdnXV2MOMQ4brgRWYYqGkd4pm8iYZaAiARCpoKccaKibWau6TjXRNce68dFE?=
 =?us-ascii?Q?zXBf/J8to458hmAUeUnb4N476/AzOrmdkDZ4erini4oJWIg4V1Sb72s3HCrT?=
 =?us-ascii?Q?ZW8yx72+2U5f14HCbTgf4Nrd+IYuG3NHVKPWeMr5YyNp3mCbNlGQBqog3fPY?=
 =?us-ascii?Q?GTnN+E65s3PTIEc9iShghkhFAR3rFCxE8vlmtcjYybCWmCJMSew74GmXyDqR?=
 =?us-ascii?Q?WQI/Wexq3KKfo28Dm1figLSv0BIcrjxk0twmHBxOR7J4NJWlHlI5YH2i2HrJ?=
 =?us-ascii?Q?SO5WDRUsjgTwi3UmGYYNb9Odqj7fNxXvEyvAsrFaKaMPfXt6yPchGf7CHJiz?=
 =?us-ascii?Q?68XzHQCP9jN+P9Ueai9HSmC068rer3IGEVPSWfu/5ddBgxTrquNeWussluWd?=
 =?us-ascii?Q?NGM9NVVy2ucVtQ7oB+flOLegZYzu23d6oSZg57vHvIYb8iB4UzfjPp/FmnRn?=
 =?us-ascii?Q?ey59DMLa8/9bmrKQM+UCv/3wcrZxScW9k9Q5DXse5/R3z4e/Lhk8mNNUuVw7?=
 =?us-ascii?Q?aGUtGNeDbwYCxIwVqribUxLVhPMaBRz4dOHiHtGuGCS29q9GyDboz1XKTPNs?=
 =?us-ascii?Q?tcWiFeffhmbA5hvBJdgz8QrZE7x4FxYjMqJlkOgDX0vu5fFqPwc7/gb0T8nM?=
 =?us-ascii?Q?ZRxYGJFBy2v4z+Thf0d+PmfNq+kLu3nqDf/jWZI8RuJsU79ESbxzdmAee83/?=
 =?us-ascii?Q?CiUyqtxXjoY0CkIp442VFGEeAxKjdjwSFdVQwhT7QPmFmvnlfDSCeRtoSl92?=
 =?us-ascii?Q?XKLFB0KjYWYtYAUI5yUD5guCu1z/mquEQ5R/xTTOVvUxpmGlJsNs+gWqS4+l?=
 =?us-ascii?Q?04KiulkqnCFafHHri3X6tseNBTinqtM7ZhLgIhkFrkDYAmLziRvqqEKLFkxG?=
 =?us-ascii?Q?caBqNq6+ECShc58fdIfSt3wEiukJ1HReC0EoehCdYVAgzF/QSzMRFK92SGCk?=
 =?us-ascii?Q?FF98qnFJd4hIEDBfvADnGThD1roHysYF0zdBg3yY1rOqY/5cdwRWCmOFWu9H?=
 =?us-ascii?Q?+svd2GcUiVkhsm4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:57:29.0553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cb3d21-9b3b-4fdd-1a0f-08dd46a56e5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068

From: Michal Simek <michal.simek@amd.com>

Clock handling can be very simplified with using devm_clk_get_enabled() as
was done by commit 8d2aaf4382b7 ("gpio: zynq: Simplify using
devm_clk_get_enabled()").
And also fix issue in connection to incorrect sequence when err_clk_dis
label is called.
When reset_control_deassert() fails it jumps to err_clk_dis label which
disables clock and also disable pm_runtime setup but nothing has been setup
at this time of failure because initialization is done below
reset_control_deassert() call.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b64026fbca66..51dc7728d133 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1541,7 +1541,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
 
-	id->clk = devm_clk_get(&pdev->dev, NULL);
+	id->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(id->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
 				     "input clock not found.\n");
@@ -1551,16 +1551,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
 				     "Failed to request reset.\n");
 
-	ret = clk_prepare_enable(id->clk);
-	if (ret)
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-
 	ret = reset_control_deassert(id->reset);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "Failed to de-assert reset.\n");
-		goto err_clk_dis;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to de-assert reset.\n");
 
 	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(id->dev);
@@ -1616,8 +1610,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 err_clk_notifier_unregister:
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-err_clk_dis:
-	clk_disable_unprepare(id->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	return ret;
@@ -1642,7 +1634,6 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-	clk_disable_unprepare(id->clk);
 }
 
 static struct platform_driver cdns_i2c_drv = {
-- 
2.34.1


