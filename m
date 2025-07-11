Return-Path: <linux-i2c+bounces-11909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF4B01C4C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 14:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE5B1C26474
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 12:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CC7487A5;
	Fri, 11 Jul 2025 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="imq2rDJn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B6E2BDC0F;
	Fri, 11 Jul 2025 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237917; cv=fail; b=lKURZkkW55diFSY96HIvybveDxIGiMNAOyhAWdFOsUwRzbebw2tFUTbSMmh9SkuITedkPQ7UKhS2w1+gCLjVv0FAPcp9mRFdQzpLnP5QBAMf0xfLBGrjgcTQF16MCxIAk0Nx/EdBXI8ZUvTk3ZNIUKZmyXhm3sKdj5nLfTX+drE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237917; c=relaxed/simple;
	bh=oCvD+Y5Agj2Uam7x1h1JXWJF9g5kR09g0G7VKLKYPPA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzUOmd+EbbWyrT7z1AYT4LRewPbs6SCp7CDfRwFNdt+PnW+EKZtwQrUkaw9HQ1ROgq31+6dOjSVSJSIks4Dunv9I/ascENsnpXP1E/2yyKo+OSgA5tWzQGF/vRN1VJVuzuss6RqCathgxrJ36jRi/gwXLduVQfnxLEHhhRQpHGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=imq2rDJn; arc=fail smtp.client-ip=40.107.220.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GeTpGkb0IGE8PXOIQmLrAODYnb6cKuwQs1TaX+Euuz7wtWUAtV6Yfs9FMCdYCy44QEHN1I+EDB045PAwnc7zccuQk6dSyWWaPClvQhBuyW93iREwz0Takduh2QShcwBJjFRdhEXXtgGU9rZSIJqhNra+pYkn7VrS29JmR1X47VodrFWclGsL7MSzp4toEB+jGlAMehvhvCefhWCN+BcUnuSgukBSD2FIh1Y644RzulY4SGmmu1Z40q7re4nsnfEOToBvOjdeBKY/4TI53EDSJfA7wUf3FsrBrVc685vThihEK0Um3BjNRzXsLemdm0ZkAzI4SCPilinP/uJvAAylQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS7iqTnBOvznp7WuSW8kA3i2x2M/16wYkerk/+SGEgI=;
 b=f/ppFe33uwk6ycToMQUFvOIeIjd8EJH3WR8g7IdUTPBMiHDjkKeY3LrFOU8yzZpn9W+1P8M7Ce5ihheoVF4Tw+q8MUjhyvWsPXNpAKKOGwpJAD9CcM7hn1Y4JGneZI1P2P+W8mc77Szya5t0ZtsBPL9xHnQVPe4ncan+uz4bkejsDSHbjsTwOK5fUFNZLEBBR3bdioiypLaPZ3hmqxwrIajgpOHNFr3183Uyut5zwt1Q05Ox7y71Xo4w7zREOHtsDrN87vo7PbrJZXRRht1FL3HkjLcW4K8NenXJlwyADNmoGowcaULqvnxk0EIPBfmMrckUpt40zr1lhiKcavIIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=axentia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS7iqTnBOvznp7WuSW8kA3i2x2M/16wYkerk/+SGEgI=;
 b=imq2rDJn8iPGLuiI+pm4PuR2nN8+xJkhyw6JBXGqN6PfV6daAE81L/iEDe1sM/49gb75np7xutXOu62BpLQ6sclQaHzplOwI1VKJLlR+VnCtg35I4hJEBCiwBY3VNhyU6vojPnCs6Q1T3k7f1waZWPfLhz9NEL8bWM5jMSUREiE=
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 12:45:12 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::23) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 12:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 12:45:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 07:45:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 07:45:08 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Jul 2025 07:45:06 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <peda@axentia.se>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH 0/1] Increase I2C bus arbitration timeout in the PCA9541 driver
Date: Fri, 11 Jul 2025 18:15:02 +0530
Message-ID: <20250711124503.3390451-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 407b44d0-b1c9-4284-a543-08ddc078c634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OGeSJLbqUY5og69PNc+VlBFAs3GWbCr2ZGKOaRtOp136is3TehTsi+rzFYdr?=
 =?us-ascii?Q?HNbkKn4nWlWgQR6DFj0Z1nY4MRIKzs7CHuzeQAktG3MUW1xGDnecpIPixYjp?=
 =?us-ascii?Q?bRaKv64bAhdE2a9a6aRprp77amzyMz61YYphlubgoQ3mCC0DcL8PkGfbl9HQ?=
 =?us-ascii?Q?+5YPSGWkQSZD/ZctCB14PxpmozyuEKCK26FKGyCo0Oib9Uw8ygbmI2LJLbJ8?=
 =?us-ascii?Q?2VtVgkOXQatMsGjRomEGn4X/sjsZmz4jysKIh2ZoC/nhbOtl4GY62wGlv3p0?=
 =?us-ascii?Q?24IHaQ+x9gERHRtPb3ypO08/iQzo3/BiyVsufldQAWDdAg5vNG0Gl1MwuAvZ?=
 =?us-ascii?Q?kAszriMcNspXYjI7KiDYtZdS9y2bzKx3fSBx/+GZq53DXmjQsWvT3hVqF9ab?=
 =?us-ascii?Q?dJN/bW3kTQLMus0bxPeitVOSLJGp1EuXyg37WLlUEHNqA9agSa+QchHXF1zM?=
 =?us-ascii?Q?jEI2jS+gGCQ0vITKBsvWYWPCGV5Vnxk2ywg3alNE+DOjnBUxCfbVIMCRrqfz?=
 =?us-ascii?Q?H54RJPnMu8J55420HPE3z5qPybQWaGGxHfxlBgQCi94W2VUODsmav7p76VWt?=
 =?us-ascii?Q?aI0t7SVQa4ewHw57pr24ZzZmWcM4NoPP+Tk9WQ+iFLbq9YB4VMNveqLerF/9?=
 =?us-ascii?Q?xYrct1/OL9DGEuwwb7Ouj9ur6I1TJPNbC1CTzidvXJ0HXHSpRUpqMSHwk37y?=
 =?us-ascii?Q?CDAdkoSvfqUmodhyDI+dgZOt+DzAOZnVYuYQRDL8foKAT+mcRX5Y9E6t5czW?=
 =?us-ascii?Q?I54bQHQZxzs1Fd1pwUhbsZ3Rcy443sm+80JhchGIX3tDHtucb1AX19NOnNam?=
 =?us-ascii?Q?3GcB7cztxVycC3176r6Mx2Y+TWGGhnxCiZhYtldmmPc4mg6KpTgk3iaFrNMJ?=
 =?us-ascii?Q?H9Kp25/XyjpGP+G9MbpaFV79nr7lQaZNIHnomYm6fpoiteCMNHp2bc45H1xx?=
 =?us-ascii?Q?AYpenl1SvNAp69BR55/lM7qLqHTcwCpWl7nUikVXKgR7qDQJI0867tvLOlLM?=
 =?us-ascii?Q?xiIGJ0KGrfv0zUydRVi0bAeEcRuQD1KrVbNb1Eu50NFF0TIcCwDplgPcFypP?=
 =?us-ascii?Q?vRhkWm2XHqnibo8m3n/CTxHMx5Lsi35+7aCXdhgmxrwn3GXeYFYIvbQiMbaC?=
 =?us-ascii?Q?e/6vJsnBm39jwhFsOdIK6LdYMSwMY5505twNN7S7UgFRP7eBYF8vDvUe60ca?=
 =?us-ascii?Q?1II3AqImT/ULkk/qR+qJQZ2ObzlFkAt1wZ+iw37kht9KySElk9mP1ZExnomF?=
 =?us-ascii?Q?FQg32oNCIWXLaUHzwf40jTBJJDx2gjjySJ19ewqk9KhxKdFKMQQCEpoTGfmS?=
 =?us-ascii?Q?Dsl6TDHPiaEEoVNcbRo4MUa7qo/sADu3GuWWoi8+uTXPLR8cSz4PDgKTlM0j?=
 =?us-ascii?Q?ITA8+RWp+8sPdedP3Nl8kc/fRZIwsTfhKga7WfUThjvvgH9bVz1rqWnAXd2E?=
 =?us-ascii?Q?z61VCR9u1Qx95ajJawWKAZM/JLBaafaeBRC4HEG9Ga8loZbTO3urIRNGRH3k?=
 =?us-ascii?Q?Y+I/ZwgGGqmorUIxU+nDG9AIV4j0xPKDgjyy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:45:11.0024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407b44d0-b1c9-4284-a543-08ddc078c634
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

This patch increases the I2C bus arbitration timeout in the PCA9541 driver
to improve robustness during multi-master scenarios.

If it makes more sense to make this arbitration timeout configurable via
a module parameter instead, we would be happy to revise the patch
accordingly. Please advise.

Looking forward to your feedback.

Jonathan Stroud (1):
  PCA9541: Increase I2C bus arbitration timeout

 drivers/i2c/muxes/i2c-mux-pca9541.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1


