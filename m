Return-Path: <linux-i2c+bounces-9324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14946A2A7FF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 12:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDC3162EED
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C322D4CB;
	Thu,  6 Feb 2025 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lyA4ssgZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6302147E4;
	Thu,  6 Feb 2025 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843061; cv=fail; b=ISuGaAoopHCbjd/pTBoG+iUlSrPZcpOA35+TrfALX690QvKgrCAEnvjMO2q/nJPPaGERzQuDxHQOYGoyX4j1c3QtKsuULxFuhbPSTNVf0W4hRGKRHxblqX7xloFQlXWeIciv7oPXsO14onMldlkXE+FG/+17izz9WSvfcMD51Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843061; c=relaxed/simple;
	bh=YZACOHaKo9T1IsvXVHGgaOgETM+8MDRJyPdBa++lptM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzNykTUsQ9+qHb1COzJTqM8Cf6eFtEEX8RUcaGGCSRq6zvA3JzptbgAaNTaUPvLc0A4lOPPZtPqOM0TisXT40zb7IiJbgrhcWBCiJs6eVHiZlOtrl8UuezigUsRN9suqpumQfemmy+M3e644HvG5KSRvKW7Cxx7/AODreeFRapM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lyA4ssgZ; arc=fail smtp.client-ip=40.107.243.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU4REPmIH700DrtVFQo7v59OKMdnCX0ywwDAMtFE1UeRvys7qWJarg7/UMr4es7Tvk5dPOqM3XFl2tuyNmjK2yawk6IQvXbT5UbS/3eSasVTt7VOYJqHvM5dC5DuZLNR4AgXVwJXRKy3LMbYqtDo/mYwpjFE09e643NoAeXh2uaWqQInN3Q66tCwkE6l+1m5pAIHDNKvNu0yFLLRMU0Ants6fah4HbrxDHl/ELmf8x5KDCcW3PesfZOdVuFfCidbUKqLDp7yddMNsAV/yNL2/QIExHhqjIAPbnRFLcMJECoqlGVKTFgtI6k1YIGrqbFS7uktFyotnxMZZra9vR5I8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlPA5sJK+RrtmAbsqXLO5U2BNtdfDlY8hLcmpjZ4xE8=;
 b=Q39K2mJKIVNIH3K6E9DVhqouMojqyvUKycZbGDVI97Xgb+8X21J0/5adKpTx9EDa1fUwchA5UfNqDy+QDxT4Jrygx8N30Rv/f6kXNrfxdsPdD/l/xbkZCt1mrRE88vXWIVOdlA/Nz0qYAdK6WMddB+lwxNCVuPE9XzTG+lq6o4vYrn0ogdM3NneixgN9aGs4KUv2uVla6UZV+r60e0UBJ5rJS7lqALWputMRR63y7j1daAozEynske95v8N7wcrDfs9pjNLAWsfEipy2kt7gvR8uUd3BxKZ0l+pcAWBfuR7GoU61mcOX5mwhlVNEXPMAgKZSSSAp8eghRqDVT2v8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlPA5sJK+RrtmAbsqXLO5U2BNtdfDlY8hLcmpjZ4xE8=;
 b=lyA4ssgZZqusE34NASJgdLk5W/C3eZdSzSWHO9aSeRvwBw5JjRQyMcwLo15o/yRQV//8HmLcZmlLoI9qNwIAF/LrJadzY2SolDlcIIF9HiAnSwGfWIvxczHuBKRm+uTsjbnt6hiT/86TvlF1Ltl1cO0ysGYqpNpMjsTuPPpIXWw=
Received: from SA1P222CA0059.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::11)
 by PH7PR12MB5712.namprd12.prod.outlook.com (2603:10b6:510:1e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 11:57:35 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::61) by SA1P222CA0059.outlook.office365.com
 (2603:10b6:806:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 11:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 11:57:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:33 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 05:57:30 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH 2/2] i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended in probe error path
Date: Thu, 6 Feb 2025 17:27:08 +0530
Message-ID: <20250206115708.1085523-3-manikanta.guntupalli@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|PH7PR12MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: faaf0a2c-6565-44a5-9291-08dd46a571db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e12cD1iH39StaTZwxgNMcGUJQssUJMxWyScpS2E7P2hLCoi5rJwJeYUYxpcd?=
 =?us-ascii?Q?CUz+VWRtnAscDrqUh7GFyFwGjjyPBSTl5GFWtE+rk81e0H0rTzi8dRHJOSEC?=
 =?us-ascii?Q?uFzfdy7nM/fuhAXa4YlJxQeKWZwvbi88tDjElRMQsL8u9iMIcAZFIg0KqYrr?=
 =?us-ascii?Q?Pr8gsr4lyCtMPMn1X+uTkgrZv1WBkd5D7R1lduAETuPJHhrTo5dQ/TEqGcQx?=
 =?us-ascii?Q?uNBX0PhjTVAG8lVgUaIMOw6npa9V/sC29XV2wft7wAnGu3r6rkw/iwAjwXeC?=
 =?us-ascii?Q?r3t/zrDoF8ZO/bXhS3IhNLhcRSqAaFkw7N/CyOy1i0jJMOq2j1JzPzEbSn5s?=
 =?us-ascii?Q?GVtm2OoQ3UeLjLY5IpFF1KAJK2/AkLdfsXkBbBqsa5fDDz26r3s7v2f4bx4d?=
 =?us-ascii?Q?Vx7bvt7b2KJ73P436aJk3FWmhr4EKqlS16IYyDoEC++xhvu3jbEyB9zsqwCL?=
 =?us-ascii?Q?asb7msVzDb85PLb+mdRlqotLWPS3VoURTAloJ6r5I/hAXnzK7F0kNS0il49r?=
 =?us-ascii?Q?cTV9DaBPWqn9Mz6k+mTZm3V2dH3neHjq0avp1uYtEANpTVeBJcx0L0S5HGPV?=
 =?us-ascii?Q?8ADDorvhLuo7zqMPjtu+e12VeYcwaj+9uprW2AovrJ52PUhuV0OxyucrfhHj?=
 =?us-ascii?Q?JNGOQgDKjUlp/i7+Z0Up/XmwCvHVEomoPO05DCw7iKCAypWI6rb3HDbp/QLt?=
 =?us-ascii?Q?AWIl6QSLYaKem+kcOncUODS7dp7cxC8UJS0Fjq49vfcm0Jjz+Rtghpz/3CKx?=
 =?us-ascii?Q?sqX3OO9JZ9odm8r1lHnB5ehLjHpKS3hVjvoZ9uE1in56gRNz5bptZtX/1HqW?=
 =?us-ascii?Q?gNS67hX/0XujDlerZqndoLzB0eQF3LRnaZ6bMfIYWemHYIYMz8rvoyxl41pT?=
 =?us-ascii?Q?NlRimdW5SwvFo6vyMbZuaOBH4GKcQQybrcKnD5DByK1f4OZ3JuE1c7jN0Iq4?=
 =?us-ascii?Q?8FmAVd143fQVRsPUkJmjvhA1aHxYC4ifj5ThCuMdT57LOY0H0ahpC0hgLTX1?=
 =?us-ascii?Q?YKxoJ6j8qC81SAKVbtRVrWi7lf9fkLgpsivHJve5UQphOZecKNzQ2Pm8sLdM?=
 =?us-ascii?Q?DdLCGtdBwoW45QunvNSYbkxXV8lw1QtwecW4APJqo7ZmfQJNi9Mp0DUuaLOD?=
 =?us-ascii?Q?zC3J4Fh0xMkFGXRaPibILaQEQP8xeHhZVB36s2fw54eDhwNAKKsrWi5YD5FH?=
 =?us-ascii?Q?htNVnwd1aj4c87+CX7H0Hh0UxuW7SMpxZxip3ud+6Rbf7ALl0Y8nUu/yLbou?=
 =?us-ascii?Q?sgNHV9Ja6a5q5oCApjbC8SpfBFdrqzK3ybcnrZABGJvaS31TP187V6bfKmEJ?=
 =?us-ascii?Q?RXKfHa+mb1WgMvUbDuUhIfkwZC2NW7Ua0jmElM/zwkMho/t4FESGwnzhPO2c?=
 =?us-ascii?Q?MpgJjeBvj2+DHw0diAwJVWBwWkc8d3g6hFLJ4XnL1kBNdIjA6gHLjVAdPZcr?=
 =?us-ascii?Q?lIJo1ljfVXjv3zAgOQ16NCm0exb0ffYRib1cVkgeTOgkYCutkosdmNmH/T2+?=
 =?us-ascii?Q?9xMOKTiL6qlnAA8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:57:34.9460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faaf0a2c-6565-44a5-9291-08dd46a571db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5712

Ensure reset_control_assert() is called after pm_runtime_set_suspended()
in the cdns_i2c_probe exit path to maintain proper power management
sequence in error cases.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/busses/i2c-cadence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 51dc7728d133..8df63aaf2a80 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1609,9 +1609,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 
 err_clk_notifier_unregister:
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
-	reset_control_assert(id->reset);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
+	reset_control_assert(id->reset);
 	return ret;
 }
 
-- 
2.34.1


