Return-Path: <linux-i2c+bounces-12096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EFB16E39
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 11:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378771C20780
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4FF2BDC2F;
	Thu, 31 Jul 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FmRDgqAb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619282BD5B3;
	Thu, 31 Jul 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953120; cv=fail; b=Bd2T+TOAUEVo5UaBqYhw47TiyLsn2IGBWkl4sKARfvyCcF162yoogyUykNO7Na+X5qO8Fep8+f5f/uaQhmoSnf44EVUo87pmu44YnmTjjZAi0+sA8Kl6LRcc05mAR557rIjXVYIR2Icbdixwn1kAl4nE2kOeib3iIEaxUlfjUEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953120; c=relaxed/simple;
	bh=9F59vh9OLtYBtox5fDOjKRp3fPkcb5WR7g03y/Cc88o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TdygfRlGscnF0VbHAJlzCq4CR0NkZ2F4myX/PzriO+keazlHWqSmtQxdCaijVtRQmTtuBduinJ9k/5xJRLTypxv2pQ3FNrj1oDK1YvQSKtEzgVdwZ0bVf12osUouBeZeLBHbGq5jUfUa2UhkR4sEONwVfH172hMlJ11TUt/5qU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FmRDgqAb; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P52jjyXSBPpajx1+gQAxCDqQu0UkTAxxgDwl0+QAKcxLnBDaaDe+wssvps++s+2BCa7a4rsY0eSj+OSBrqNmuRZljfKTl3n5WDBlhxFdId1NTFdjpZGoJgpm8EP4S65nbNbxhCgYmBJFQMRDlT7gag/XXbTcoThQl44XfKvL/8cMNpjijcCg1FQB0jOmHGTcwfa3WyuYbOzf7Le0xDBwAC8S3sgCjdim9U0st8rshfqNDwaK2u6CXLCJ4AzLs0Qa2hYMHhsDpRBYxEBaSGq20W59b7Cv5Zjxrea9eqSvZbElycPL1jxTpB56sKThM0AUrUVcNCvDsNF3fJiF/c5WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p00vz/Hp5FIhtw1BA5FKl3+WLVBZOJgauSW13qyfkY=;
 b=xJjXy/QCb2L1TAhqCE1jSyFGdztnmrovp+VGcthSnJPPM38pauoORYnRrgV/3K+wjPzK3RqpQDdzI182pzDiI0MNJ8zOS/j8EXPTj1fd/1XIjYtmgl9N0PH/OifoxGxBqENb3A/QfcEcl/NQdb6H+/kL4IKWrdnjIMNISI4axRBdfi3NO9r1wO1JCg72vMwVafmE9NGmfCK7zte8qK2rUJzTzNfvwAPmJM/UXUnj2n5qmeaAwKcgKHdx0u+sVQh9TLKoZ2lsq07ecQ46jzHaygqD9FXx16J55W/3KJA3XcDfp35W+IOZyOFDuaalE/Ax9amjBhBZ05LNSMZUW4qWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p00vz/Hp5FIhtw1BA5FKl3+WLVBZOJgauSW13qyfkY=;
 b=FmRDgqAbLx1oTQI8lN+FcejNVMaYs1rR6MiRAnRt/fJp74J+BN99eMAYyfkhgaJI2YZVlszQH87n9sXh2ObmfeMWzioRgx6TgLuIzJn84uN8LX1vIpfPqTK43RD/LRvoq5Pv/Jpcg0E3gVW9/dXAwD1uQablhRID8Zi7GeYF3Z9scxPuJHvRFmcMSfoQPSVst/+fmrEN6Jivm9iV8z4Hu+zOLN1Bw67OJ0lPXdPqL5Iw3BXPw41wZ/gGwEbVP+MOddd8+7MXw62QAvwNSErBtlRFxih7Uez+jRGNbRfZFCamnQiZ/3hM45MshaIYGjtTHB0tCEF2lkfdKdTKF//ORg==
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 09:11:55 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:505:cafe::7e) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 09:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.0 via Frontend Transport; Thu, 31 Jul 2025 09:11:55 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 31 Jul
 2025 02:11:38 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 31 Jul 2025 02:11:37 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 31 Jul 2025 02:11:34 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>
Subject: [PATCH 0/2] i2c: tegra: Add Tegra256 I2C controller support
Date: Thu, 31 Jul 2025 14:41:20 +0530
Message-ID: <20250731091122.53921-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: be9c1ec8-98a9-4ddc-080a-08ddd0124bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Ht5MD8MfpYGPIHsqw8WLoNwn3p6iesp0IJLU4SB+pRoFhmYOz+B70c5VSDO?=
 =?us-ascii?Q?70d74hz4OMODkrZCdm8ZMc8i5bS7RC7ZEdFltDVeyow91t7JkGbsUcenIgk1?=
 =?us-ascii?Q?IfXrWa1LPVmZW77h4Igvlm4CMoU5hU4JIGt2LaxuiUzUWjcCDdfIjI0swHmB?=
 =?us-ascii?Q?BCVea8wzSLQ7n/7sYbvL0/q2pBI0M18VPy29WcsZ938IuH+NAPxofAOKwmB6?=
 =?us-ascii?Q?qM7Bv4JCJc71cm6WR2pX8RtlWu2/khOgJAO5Xl0zPK79AzUS7COvcwxXPYzU?=
 =?us-ascii?Q?ZO8PcoEIClE44iVYE1mBqJOb6EE0WamfvuZif7aa8INIvLMwasiXxn1jCTx3?=
 =?us-ascii?Q?bqG1bX8vtIycGrDXK9+sxGcB8gpzxiJLpuo+PkJPQG6M1Lk2LHLcls8CkKB4?=
 =?us-ascii?Q?UnbK0Fui3fqI+DM/Bch7OQsfPguVbQekhXKhQkqcDu3G4kZbTaefYWbkOfcR?=
 =?us-ascii?Q?oKM0zbnzvLDUG2a3l5zIr4kWkr367UWu5ZSRKmhX6FBCb6KsUV3U1I5rYFF6?=
 =?us-ascii?Q?netclY+obVc5GABj+wmy+WoGAF6/Y8APQM0AY16/YQ2aHHtutvslpSl8V6Va?=
 =?us-ascii?Q?k5RsQ/FBiWvFP2TcFZx5IkLHMg1vhAP1BsEKWNZAIMGdD3O293mPygjqhCMN?=
 =?us-ascii?Q?PgOzl8D2h+USeopVRh63ji1HgS8YSKtdq4Iy3QpBuOlQKEBxKPXGnWPcBuiA?=
 =?us-ascii?Q?VSK3WWFXxe8qFOwUDnofL+8hC9n6zqufwZHlYNUcXE+sVAHFHLPC6E/WpTm3?=
 =?us-ascii?Q?5jic91vjBNpFAWXgSCUpHoQlJpNa5d5wWYwOGRGKROFbJgVzs+mp8yOeICxb?=
 =?us-ascii?Q?TKj7SjRqbsbJgvyOYnK7nIw/eSMzqfLeeuvwjqPQSRwm+njIkbDP9qctWsW4?=
 =?us-ascii?Q?7QLte5pSpJT0c2w6YktHIYmvFtQYHn9hI+kcJg+0/IlrZsw8e3psaLcHCLYU?=
 =?us-ascii?Q?OP2eMVAlLH8hSYl7hpptkWTJs3eyW8DyAppnknqbjS7jj16Cq1HHSpaZZULS?=
 =?us-ascii?Q?+mVQmbE3y+qSJRotitm1hd05fwyyh1m4zSuuv4WbMHFVAVXGcDMFlXGL2AUY?=
 =?us-ascii?Q?jU6RYqQ521EyqYrgMaffFo5qlswngLq7KHeXScHOeeKN1rYlYNaac1CW+uFU?=
 =?us-ascii?Q?yc2G1TH+zDR8RDXWLRfKDn+8p1c0VmlDKHUQZFl6eezIEmiIkgrrzsOiR60/?=
 =?us-ascii?Q?8bL+porHOtuxMb6bEE3R2UbajqL2fgn6lQFqU0kCWygZyZTYZ8TDH+6QJGIo?=
 =?us-ascii?Q?3TxSDrcu2wojnSlvvOvBFWGcakkpOyUR5cTSyTBu+D/xOP/Q7MZlVr7gkmJx?=
 =?us-ascii?Q?7fLfp5cJEAFZo1qnXaG9NMdHOCZ1O87ZUtCya+/yrEcaQ28NCNoQxEfKwLP4?=
 =?us-ascii?Q?K7mtM18l5ctwAI4OBzotfdpSoWnzJCVzB89im5rWlI0Tx3Mi2+F2NNfaxafy?=
 =?us-ascii?Q?pRlN6L/ZGQyqm40GEy7fbEgnMDFNwiPlu2cM6KW3FI0eNSG7r420KFEDw6Rt?=
 =?us-ascii?Q?qWPQCXB9lj5+w06jETFdZ0zySP0qGmDXuZWVkEdZtsr+1UxH1173tGYqxQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:11:55.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be9c1ec8-98a9-4ddc-080a-08ddd0124bce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469

This series adds support for Tegra256 I2C controllers to the Tegra I2C driver.

Tegra256 consists of 8 generic I2C controllers similar to previous Tegra generations,
but with a different parent clock frequency requiring adjusted timing parameters.

The changes add the "nvidia,tegra256-i2c" compatible string to device tree bindings
and implement the corresponding hardware feature structure with appropriate timing
parameters and clock divisors.

Akhil R (2):
  dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C
  i2c: tegra: Add Tegra256 support

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  6 +++++
 drivers/i2c/busses/i2c-tegra.c                | 26 +++++++++++++++++++
 2 files changed, 32 insertions(+)

-- 
2.50.1


