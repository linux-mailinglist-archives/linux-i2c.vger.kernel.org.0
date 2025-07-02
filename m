Return-Path: <linux-i2c+bounces-11762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EEAF599D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B503D7AA7F4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19AC283CB0;
	Wed,  2 Jul 2025 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EIw/Zaf9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D12741A3;
	Wed,  2 Jul 2025 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463343; cv=fail; b=AX7oQ3rYOMxydMG/T7Dxpo1c1USyi25olIsO4/weSHHpqjqP3DsdttouVzAw1UTpNdzLe6TydlagK02ZMmUYRME4YM5u9YMN1hSA59RgTMrjiT84cCOOW3fB6JytE0ZWo2dLES2je2XY8FpC+c1Q8wUc6tJMOmiJnRoX9L2biPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463343; c=relaxed/simple;
	bh=j7zgPn9GPi+bps/UoXnCWg1w6Pjs1+HP/IIsjWQqFew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dlb8Pxq0dEUk/f99oxsXVkxatuNUBphIWOv/Xqw7v+fI0YjKgUuNzWGqsrq8PeRXXS7/9I/AE2jZ+aXuhqTSlTPIGeZG7D5YmhyOAKXqySOfVKhf0wJ0tgdfgNJ9Kg1RSBzJlbxVsUxJvCZMpQZqO2p0Mlc4sYw3onNPGV7PihI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EIw/Zaf9; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTs2DqblDL7MeBEgDmfvPjFqZmTJk+hOwnx2bnOTzgWpQiBKiHX8g0d8FrP8X6sOD1WuCFLzkXbadvoenY06SsOxc6PzJ6kGuZyiCAmrEMCoXGz2PYlwaGG+xWzcb4eFqH6DWE8KFzq36+7jtHXrpfrEhY+0zcvoks5/OyUxErMF/3GMHSLpxSS2nBFx7vX80/yt0X1eHigop3GjBCgRra4i1EXhYk1zLfHTODSxRRFhAG1lEN2NI84ColOd49m8k4fsjD4Td6L9DK1DehPEzXxO9QIOrmb18NKoyBQSH9SIBHFrTjDfsEJy79VitAieR50w3zgV3lpQhf7jWKY5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5mBy7Uk/z9o7/5XSJ665PkQBV8Mjyntdiowwf7t+G8=;
 b=bD+1hN5392msfDMSerISs8cWnMD8dmFJrSh9Aie1PnDv/Qm81hZZ/tva92NxjDcmlM2YNA8YFRnEFELLdusFwg2pGETrIM/S/j9SxdmkinZC9QWPMUuVTPw/E//oVjj05xLGwQlbMdmYgC/ny/U7gIf/QVhALItn5DGbn297o7OTEKsOH+c/2kovA4MVYIabVpapDJQf8N/TUdZ5w5takCfirWRhonvgREpd2NLV4NUrcrGoK+3RAZXTWpZds6P/yG+8wnhSiTSyEefK286ybvXf28T7VymDlADV4NFD5EqmsD1fIkcZxmaSUwL53Csmd7l6dCukSucps+wMbbs6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5mBy7Uk/z9o7/5XSJ665PkQBV8Mjyntdiowwf7t+G8=;
 b=EIw/Zaf9h/ZBJ5xWXCtd83v65TNQfjMhtVIRJK8Pev4MFrtd6f6A0Xy5WrBJlVqqDZ6lRr+QW3ZwjkvN+ZsbVCFR/rR14gMBJXzGs3AI0jjHOKxWy9h52oEbGiDbcBhnVqs2+PTEXRdeK35SqmKXG2469Puk15yS9l4yTLS1bX0sU4bXUFgFUSDV6z7OIA7Po8FgYyFr6RT2KdYgpQJgaMCGxUWeMFb0pG9nQw44Z/g/A1jGv3pnoTQhrrjtmH/O4qFE/TCszOhQz2nbLKQBcFMSsSXqXFm1hUf/Fg5Df0/hQ4SxeBwQvYbBbkY40u8WQ+RKWt+61czr9Rjew4sBzg==
Received: from CH2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:610:5a::40)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:35:39 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::d9) by CH2PR08CA0030.outlook.office365.com
 (2603:10b6:610:5a::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Wed,
 2 Jul 2025 13:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 13:35:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 06:35:23 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 06:35:22 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 2 Jul 2025 06:35:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <ldewangan@nvidia.com>,
	<robh@kernel.org>
Subject: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Date: Wed, 2 Jul 2025 19:04:47 +0530
Message-ID: <20250702133450.64257-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ab4138-243a-43c3-042d-08ddb96d557e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3HxEeIb4giA2aUjGyXZ36H2vuTAOuCSlEI4AqBfT7KxPkshsBNxXayfA/fSy?=
 =?us-ascii?Q?UDGsHHcqL0LzgpaplTBcfpxUtpUCogYeC8CKmuveo5vzY+qx+vcYwwzIUKVy?=
 =?us-ascii?Q?2BWvYX25MR9ORMqgpJr0XO6lCLJYVuaIzjpUzAfxMSwdBL2CSJMPkDqYjOis?=
 =?us-ascii?Q?qByAttCAiZaPAMz7dMrHLQi0c4IZYCR83kZMr3gtrgVVBjG7SNeABNLlqf/0?=
 =?us-ascii?Q?UerLZq0nE0y5OdUHOKelvpq1ooZA9MOaCo9g7e4eaKuOnZym66+JbE2+oJwn?=
 =?us-ascii?Q?vzXGGc6xY95a8Ts8i8URr94SVfo5Lj0sbAWUYooK9mauT+voELPQpC+l/Q2+?=
 =?us-ascii?Q?sMgJQLqVTw9yr4CDGfEDFtBUppRQjGt6u1EjSawyen+pW7Q9lhdkdYoen9wD?=
 =?us-ascii?Q?/yIx0w7GVTm16uWkRSKIhA4zVfGjPonjoo9XuFqQy2HwsqbFpnNnfpaa0y23?=
 =?us-ascii?Q?JPF7Ru1lSCOekHPlYw9EJg02E1P78y6YZIASKqgFZRgQtqIaO/NMdWtQIWuA?=
 =?us-ascii?Q?Y3B5ZIroMcOHEGpDDm+K3FbXx03y1itlmX41XdP3tB/etofyOXU8cajmBaoX?=
 =?us-ascii?Q?lnDD2OKD4MSLkgQYOnBUBIKp8qr8QZiPBV/Iw2Sfou36L3B7RcuW9WQYiqm0?=
 =?us-ascii?Q?hrNNjHIZNKnikltVU/82BYpAuZqwshoHGauoKo4+Ggch/3ghmvEbwD+jEtNF?=
 =?us-ascii?Q?ti1dLdeuhgTv9lRKDSES0Cm/RmyEvtI+KreovhRG/VqQ8QsuOhZHU/akvYIz?=
 =?us-ascii?Q?ixs5hIJ5Dq8XzgRmA2ZmpTUE63NTqya9ACd40z1sBc/e6IMqlm/XsPClW5z3?=
 =?us-ascii?Q?QjJgQ+FnweIrGutqL5dbb9lzxNb3w9UceeJP9XpAH3H5t3zAojufIPx+SDNP?=
 =?us-ascii?Q?N1ShU6IX1rdP29HXKprJtEKbgjF+o/1/kggdXk190PYp8k+zqryM5Mfq4S4c?=
 =?us-ascii?Q?1X1tWssS1jaKsDjJTM+1/ZG1jO4CiIYJA9kj9ceXuuZwqzANsTfWBQ/k5ETH?=
 =?us-ascii?Q?xq8sTTaBZ3tD67Cwg+iH9BiEC3EA4XoiHucHYgOD0/dzZTkRjhnN8XR35Uw/?=
 =?us-ascii?Q?rIitt79O4hnDknXe/JY0KhfjlRQwxta6eVhNOigpT3vuZRImfsvt+pbIYZRR?=
 =?us-ascii?Q?MCsuuALdwTqOCLuZEvs4LwDZ1N7mm90m0FEldrlKPbf+Jl8t2V0hhxpf4KPX?=
 =?us-ascii?Q?rj+z41fSCVPZLTinoGwtVE3JAR/Idg8jDhYr925b1zhm3GkAQQFsARNM7LW9?=
 =?us-ascii?Q?7IZurKa3GyF9gMtKlwnm/BjAtlnTCzWbkCGmHPwj0R+Tgglejmoh7TQW2NDd?=
 =?us-ascii?Q?voRvDm9qGoFSQyrwDfgCXZtZyaEa9TbAkmSFAaqYGAp3C+byIsb4DLr5+d1h?=
 =?us-ascii?Q?35nSUdED9YNBh53haALnospplxkf8oXjpTdd6cgXG5oA9ym5qT2FW4dnl+ye?=
 =?us-ascii?Q?px+doRBHbp6u4Zrrboq4aGeCOyRvEgDUNKW4wkvpZFP69bVkDvg/izo+E595?=
 =?us-ascii?Q?eifIQjrjjL3XGyczLWDVpF74VQh0qNXovtRD?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:35:39.1828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ab4138-243a-43c3-042d-08ddb96d557e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198

The acpi_evaluate_object() returns an ACPI error code and not the
Linux one. For the some platforms the error will have positive code
which may be interpreted incorrectly. Use ACPI_FAILURE() to determine
the failure and return the error. Also move the reset to a separate
function to handle this better.

Fixes: bd2fdedbf2ba ("i2c: tegra: Add the ACPI support")
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
New patch suggested in v4.

 drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 049b4d154c23..6f3d770c5a67 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -604,10 +604,25 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
+	int err;
+
+	if (handle) {
+		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
+		if (ACPI_FAILURE(err))
+			return -EIO;
+
+		return 0;
+	}
+
+	return reset_control_reset(i2c_dev->rst);
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
-	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
 	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
 
@@ -619,11 +634,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * emit a noisy warning on error, which won't stay unnoticed and
 	 * won't hose machine entirely.
 	 */
-	if (handle)
-		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
-		err = reset_control_reset(i2c_dev->rst);
-
+	err = tegra_i2c_reset(i2c_dev);
 	WARN_ON_ONCE(err);
 
 	if (IS_DVC(i2c_dev))
-- 
2.49.0


