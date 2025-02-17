Return-Path: <linux-i2c+bounces-9466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E14A37DBD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 10:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADA5165E54
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 09:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867881A2630;
	Mon, 17 Feb 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EmLYFiua"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB11922E6
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783004; cv=fail; b=CEOoi8qTm0qdRNEoE30iN3ft8rYgrxflCp1SToevLLjBqdl/pVHvVtSWNn2cDFrbrd38UhWCGkJHfnAuTOCIrPmXsrWh+/7gaueiUd5ET7tmgFzDAuSi+vYWB5P2glIyoIEFPguWRhjBKQHVm458at+CKIUkARFGBS0VfmRo1/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783004; c=relaxed/simple;
	bh=HXlJdUDeROFmCqfd36uhlFtXxGwKNG8Q1H6xIbT7Wjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYwP5GZtpmRB8tHPmYapMY8TpjNiqwysoXHjqblyqHI1QCm7l/0TB/DYxub5zQzNGeW+yR93Sft2HE5GdD2TUHYEJg+daU4hFRJWFjYB0k+OH9E/MOkrmJho/y1gjTmiyNrlgl7nybYDJG+j2GvsKCEsSV6KxFCXxLF//IIfV/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EmLYFiua; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qR7IWIxBRtj/x/lMGcYiQvwC1+9L4UpE0A7InbaYKKjB3MAymeG0gsbB/eiRxjAEi+LGp60+5PeldPuu7lc8GuM10DKWwvcqAqZJveJseJEyt9HVW3Xnz99qFmH+bHXuTVCAzNS3JUtgIPhWvyvvldw5m2xqnkJUtL0obfPBenE8cmVWC6sS4mlz2S5KUkkjUuo5qotXomiOAFlHhzwdogMRyZD98ZALh7C9q1RaTPGdnjnhKZK2FgATpOBZJtBQfEt9tIFKFhfW9/dpCMnGmHmphAzCG1BAI8xXyql2giKpkDX1XmIyoTrQw2cmWZ+u7W9IRsnsv1TG1ocxdCJf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9aoUqHCkihnvQgdqm0QscppNIamz2sDTQYpB6XMhB0=;
 b=eWpJMiDD9VKRCZ+bSsqlVfoP0IyXG3zm+1nMNB8oCA+EX80eqyZ6B7sjNZ5cRd6zKSy6AAfVcBWrMrtHeRO62/rgNy2++K5XJD4s9tlvw1UIGirB66AcZWvA8N0Nqs7LfMMMDq+tF7aMgLikPwUz5xjnpA0TOOFI/wOg7C1tEFrDFH9qKnbz75802BzjQ1zMDWMyG2gk8sJMkyuIJ3IEPJc+hAxi1sf8g8j8GurBM7T6CRucKLpF0gFvbrQeU8nfuVH4cmyrcWzbvA9x+XsX2mobYrKWKP18URs8kSPW9u9PwkPpyzgmwhzYam960ohjF0+3vGGBRdf6SwOgldSEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9aoUqHCkihnvQgdqm0QscppNIamz2sDTQYpB6XMhB0=;
 b=EmLYFiuatJOZeoMUAYAVijsqZI4jkvGtF1a0ouOlIG3MLBYiy5qS3kdSwDRLtpd+yut+u//B8+8qExYmj49DE2XCblKrR27yci2DGO5rCpOG1LMhfc5yFthA+EJ8gr2Ryq7d1ZQcNfDfnDZ/78XRjrsPmFAcgp8Uqfqv0zRVfnY=
Received: from BY3PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:39a::12)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Mon, 17 Feb
 2025 09:03:20 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::59) by BY3PR03CA0007.outlook.office365.com
 (2603:10b6:a03:39a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 09:03:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 09:03:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 03:03:17 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/3] i2c: amd-asf: Set cmd variable when encountering an error
Date: Mon, 17 Feb 2025 14:32:57 +0530
Message-ID: <20250217090258.398540-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a0ee53-5deb-4188-f653-08dd4f31ecc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RTDLZ8qppDM8qg9vxhBlKROk8l2A/xfTJ/3sZVrU5ax/LGchsnZuMCOvDHf9?=
 =?us-ascii?Q?fA0CRmdhKR4h36y5Z7oDpos/zl3hEI4OClr8ko6PamXO3JezMl6c+z9gXD8w?=
 =?us-ascii?Q?JdmgqHgEx/W0+rBRFD424VtJkyDJHfwi7cIKnYaPO8SRKw0ehZyE/m6O8TTh?=
 =?us-ascii?Q?zmwuE1dYu2eghyEvkFf0gpIzv6cV+R50MVHugTl4oH74+45HM39sFr2jFAB0?=
 =?us-ascii?Q?UmGxuMJqRC5c+pELpcbyrozDf8NuPiMYxuQScr4xhN86Wb1z6pCxV3CADnzX?=
 =?us-ascii?Q?001h1FOEYXWlo7QE+Os0MBcdFreUAk/fn/jH0fIrre9DpC6/d8cfQEIbsHsz?=
 =?us-ascii?Q?pVtIDP4+WlTS32uXayBM/gMxej3r4Fnop+l7NqoPcl+OknOd8sZqEqOM0ZfG?=
 =?us-ascii?Q?22BU6t6EORtjvRDsWL3A9fV/K0sJAidXv5mik7F72pcILkwDwwZI2p/TH4QK?=
 =?us-ascii?Q?X4XvLFNSqyKMuYCyqZ6zme00o6QhxF24mBltTy/LpHig5moyZvv+bcr4OO4F?=
 =?us-ascii?Q?rFyHyH6zt8r6LdDY2eYt0xNEgrGnpmBnZig6lZMrIfdbdu+C7WRJ4yEGuBJd?=
 =?us-ascii?Q?S2cPtz5la97JSH5LCBlGRnGDkD3UF/SLBQryVsu16OT6Uyp+Amo3bFS9tW80?=
 =?us-ascii?Q?mPJrBBsbPyhCHJ6m8gkcHSWDLONNTZ1+1VzKDGt1JL85PMFThqRPIKmRGM7U?=
 =?us-ascii?Q?icUoU+8/3D9VA7ydJW59t7GF7rTuBG8EOc2gO1+XEKVdTFywWfS4Mu9vwUAn?=
 =?us-ascii?Q?E+N63yJLq3F573zzvT1A1jttJZWJLMGCIM7T9ByZPhQD5COEpyOqlYRmAGeJ?=
 =?us-ascii?Q?0OEiWa/OMMYk84arZfUIvnguqmiNPyi3F7crjZUezhiRxbqfQHtuKb/Wl2Jr?=
 =?us-ascii?Q?1a78LWjYLMMPGy8b3ER0lUdyXTaSXCDmNZUpEDUJYzkymR6Q6ZGATbc6EME6?=
 =?us-ascii?Q?VTKBY0h6uVhPFocIVe0Xv/etw+f17Mijwz4qeyWHO0N7wtydlYv2aggqmo6Y?=
 =?us-ascii?Q?r6PoO3dR2LhQGARV2Rx6lu3saEO3U+yrMWWZMIFHQFDmfToWTMW1fY5WtrW6?=
 =?us-ascii?Q?VRfRE/LUcfciZgkXUdkhare7+j2efA4PTysvGehqhIeNwGSHe1x5NbSJUfZo?=
 =?us-ascii?Q?eEE0eqqy53bQcZ1m8BskZCcL8n3lm4pN3gOhCL88L867+aQY5Td6WOih/1im?=
 =?us-ascii?Q?mqG2v0WxucdCGy+AlZOSJKx0/JaeWs1x86/C8c4WAjCAA/X5VNW0XsLDcqKy?=
 =?us-ascii?Q?G0t1DVL/weboICIg9V1pRbdEEz7IBEUs95XKDbfIBuUlXgzoF3ZuqnpdSkMo?=
 =?us-ascii?Q?qBuXLzPOT3TYm0Or0gOigXWUKkcyCPOUEJSbGjacPsuKgQEJXc86ZmgsJXjy?=
 =?us-ascii?Q?3oUdhvXXGcdaeoqmu0kHFLR1qZf0RilUp/mglUbn+oeDbnN9bEQDHfWUzO9S?=
 =?us-ascii?Q?7eCnwLYOh5SMUpbs4A1jF+Bwnd1v9kObU2knOsBBJPM7K2cnLpnlJoF3yVKK?=
 =?us-ascii?Q?tHqFiGzGYL27NwE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 09:03:19.9132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a0ee53-5deb-4188-f653-08dd4f31ecc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

In the event of ASF error during the transfer, update the cmd and exit
the process, as data processing is not performed when a command fails.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index f107d80afcc1..438db5a9d0ed 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -69,7 +69,7 @@ static void amd_asf_process_target(struct work_struct *work)
 	/* Check if no error bits are set in target status register */
 	if (reg & ASF_ERROR_STATUS) {
 		/* Set bank as full */
-		cmd = 0;
+		cmd = 1;
 		reg |= GENMASK(3, 2);
 		outb_p(reg, ASFDATABNKSEL);
 	} else {
-- 
2.34.1


