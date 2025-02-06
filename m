Return-Path: <linux-i2c+bounces-9322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D91BCA2A7FB
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 12:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 045137A1CA8
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 11:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6722CBC9;
	Thu,  6 Feb 2025 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WRYylxq+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8172147E4;
	Thu,  6 Feb 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843049; cv=fail; b=jU9A91esfqzjBq1d+VMZOIayNVQVQIkxx8HO/Au9w1x0JKF4LNbjiS6cyux9IsYilmXFpN7pzhchy0GvR8avD19HvCFaHQWvZLDdMZY0OfxcE3wVjvw4/JVKCuoiMuvLWRDVfwTSX4QFeIjsCGybuYwbpxkAUXu8RtkYcz6jswE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843049; c=relaxed/simple;
	bh=ZNRStK7Pwb3ejuWU8XdIzVhRsyoq48MjfbdCZlpznPc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jw+LzaqiLIktmTxhytdP61CTxe5d4aHZaQBQMgt/JaSfnSIjTx1kU8bQ+9TIpgJ6yFgH4nTEoK8w5bR4wQzsowpYvOjdsaR+UiPjy0xJzqG7r+OU+2kacKKWsJuGm1WFjWPBXsNbl6H3s40E9RW+DvoBbhxaMRJhos7K9rCLD6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WRYylxq+; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTZlT0xuJiXBPaQCH/jN8lZhyzHq2F5kdv07BJ/I/rLORc6UT9DsGKHhblWBu/PEsJx/aK88LbdeE+CDgvyWWcQv5PnN4QDzF6MhNzKxK7Fi9tp31KEo6vrGac1v7zKdxFdKc8chcjPxnBDfwZFy1224p/iWTMpn4+n6EaABawjrMDW/oY2A3T5SsHvnUhHDkmCjpYLysPYl7X5cOjgUfWwzEasmpo5oCpnyr03wuCEr2Eu0P3ftJmJ9HICvR2B5p87kflvz8ltLQjo/g6ZRi/YlYAoATxGKxfUToDi+RIPj8tlDII6wBawKzUDOwIm2kWQBrYRiORAacYnOSxVv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4tor78wDeDAw2elfKudEJkLytXrBfI4m3Xs9YXA2IE=;
 b=Gc18ZxgkXLP8TtByALZ6hmDHOEm27SNSP0fx0llnMGzYEzrsveu8fqH47yVeY1q7zH9UbPFH9z5c0awUvj3rWkgaztzAT46xrb2AaNZizi6M3B2/1lLKBsLZj9M3sgc1lLvHjAQ6ajearFMnv9yCwNLn4AFUIns6zZkka/ybEHYjUcXtAti1vZMYjl/4WIQ3mLFm/bR3p6N/nuEr4d9GKv63i0mUi/r/WrsmCftbaI1XO5fUEar4n1cHlsn2mWP6Ai88S9nKsXfOjNqSPgu2muClVCXDaYlW0oyBWq4HikeVsrniJjwEL7QR30Zt5kGQN0s9qO93w1a2AxXmKtHW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4tor78wDeDAw2elfKudEJkLytXrBfI4m3Xs9YXA2IE=;
 b=WRYylxq+kSO/YpNNSghuS97wUyALmXLaKbrmuLFVX9yQNZjlP9VRtG/HTfWE0fHak3l5DOApKMxq6G5g67D92QuTVmWhmQD2uhGOVUAvZ6s3k994pdRkXSZiGaZmv36Tx4Ny+O0o6vzTJ4JO/ZR8G481xDsMBomvhuYVwvLotU4=
Received: from PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::29)
 by CH3PR12MB9026.namprd12.prod.outlook.com (2603:10b6:610:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 11:57:23 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::10) by PH7P220CA0060.outlook.office365.com
 (2603:10b6:510:32b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.22 via Frontend Transport; Thu,
 6 Feb 2025 11:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 11:57:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 05:57:21 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 05:57:18 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<p.zabel@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH 0/2] Simplify clock handling and fix probe error handling sequence
Date: Thu, 6 Feb 2025 17:27:06 +0530
Message-ID: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CH3PR12MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f28e5-35fb-45db-8e07-08dd46a56aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQ57rpVi5zfnJ1MoQ9ky3BqXsuo43QM12lJ+7+nV3PK5Z+YCnfXl3tZK3gnX?=
 =?us-ascii?Q?Rlijyn6WDAQfG+pr9tkm3xNC51sYDbi03B0//+onbgb27yVoRBGoleDeQTDB?=
 =?us-ascii?Q?ACHBcOFF6ipb/hLVySqhazyeDy7eBUfkmiG9EDZuGB//ADS90DvnN7L4bQVr?=
 =?us-ascii?Q?4dtbhGidSg4noKPp+KSKwhNu1ZjE14opWzxUmj8PuFKTkHrVGVDmV1UMsiTa?=
 =?us-ascii?Q?brxb1ZackQwQnd5BVv+cwrXwSEuFKnVC/4JjWHDqkZy1p+FrErI66dqBHzKF?=
 =?us-ascii?Q?nYskubccotozBQzA4UTQ1chs0VEOi2F3bZjSqa0tN1fDlPTbge1/LxScn4nW?=
 =?us-ascii?Q?qCuSPzxPjsDcp07pjEpnbp/8DzCIsX2GTxcHjTLXmIhEAQq5Ip5Z7Nl24rVb?=
 =?us-ascii?Q?Gyj8N3Ki5NTappg3HX08kfmE0xlQDwdo/dibZoSu5ZWLIjiiX1tqCrxLI4HD?=
 =?us-ascii?Q?D4wKf8XtCVdHJXChttN5niKsLa/tF+VnKm/My5t4NUxqillazuXpJwFqVVEw?=
 =?us-ascii?Q?QGA1XzTj8lH6RzxDmndvbN4sdL/CEsdZx4fkzxMmjvjdNGs+ob3+FVQDwTQi?=
 =?us-ascii?Q?Ky94vEucTigWgU9rRNxtZ1WhY3BxomXgjOiurOZmjXl1cFV1kEz5QuTJL0nF?=
 =?us-ascii?Q?+QLltH6upbZI9o2V95g54t2RG9b4qnXVkiudPoHOTZQWeSjnWAY2+2ODF/S0?=
 =?us-ascii?Q?jWyarAJWSBoJHPlO9JwHNXS3NSUS9wM2SRg3eUagGo2b0VAsVqQ2rk1Wtdd4?=
 =?us-ascii?Q?b+TAfRzHKzlJDI+5WM5JnhpK5/YfTlIEKoYh6quBXWz/2GJB5Y9uNVaYZ45C?=
 =?us-ascii?Q?PR0Jp6/ofz5HB3J3atpErd2D3Vpd8qSfvClKiK13Ld/YEMDS8XNjAggZCeZV?=
 =?us-ascii?Q?NspHgKeaQqFhpYKP34JG8opv/mamZRI4LUQBw+XElLpnTTsZnpPe8ONRJ+en?=
 =?us-ascii?Q?5iS7HIo08zxQuOMLM1H1st6LQ4uHoBWsvW/0HnKe1CxOA9hIYLdWbhVhQUIx?=
 =?us-ascii?Q?B97Ca7TVmgmSutuiO5SNuQ3ovhXtCZZ84cFj8nJOwa0OgJKBjYc0aIFfAswW?=
 =?us-ascii?Q?M89G1iFZ4YX7vsJkas+ivGP1kFQaI4SMvcj4543hQeiEpCw8CfykJtSsjVM2?=
 =?us-ascii?Q?w8cjDd840kF36no3lTnwyqEJdswYqeyn0EFBRnVHBRA5tZW0stHNh/qGQ169?=
 =?us-ascii?Q?nK7n4UUCj21yv+m7HA3rRL/+KbxN8l/Uhp3E8TYDI0kFT2j71oddTkVMPeZ5?=
 =?us-ascii?Q?9GuWTzaaYG90jJ4qcu8ii45bk6yoPeG21dyX+2LSmQ3kSEwqwWQQazaMXp8s?=
 =?us-ascii?Q?sDYbv89Zdub8liveA++8LEGM20CHR/xTfIqCfk3a5mpFyb5Nh7Mie7cJ3KhV?=
 =?us-ascii?Q?OdvZwjWGWUSqoXcgXaA6ZbsXiD6VIJFiLeQ71vAU77UyxNF07nKwpgl+j/FR?=
 =?us-ascii?Q?YhX4EDD5XEuOvSoeMPpdGDN83M42sPXcU0C2lqJYKyk2XjepCWomyCQokMOc?=
 =?us-ascii?Q?Cx39vYAkKu2F2y4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:57:22.8807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f28e5-35fb-45db-8e07-08dd46a56aaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026

This series includes two patches that improve the Cadence I2C driver
by simplifying clock handling and ensuring correct reset sequencing
in the probe error path.

Manikanta Guntupalli (1):
  i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended
    in probe error path

Michal Simek (1):
  i2c: cadence: Simplify using devm_clk_get_enabled()

 drivers/i2c/busses/i2c-cadence.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

-- 
2.34.1


