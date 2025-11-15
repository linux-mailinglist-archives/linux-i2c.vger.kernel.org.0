Return-Path: <linux-i2c+bounces-14087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B9C5FFD0
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 083AE359B79
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FEC2010EE;
	Sat, 15 Nov 2025 04:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BmX7G73w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013055.outbound.protection.outlook.com [40.93.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113D11CBA;
	Sat, 15 Nov 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180855; cv=fail; b=HxrRik18roEkK0DNiryT6wneLmmAWqIQYyDpfopJmcInOsXhENHQ/WL9oSYitl+YIB3Kyo/gOMN+Vf7lqo7ntAIElgJbCd3kjERH6dMwqupmLfU6LBUeQOyki8MgwnW8hVN3EWUZGI1lg3EvH+8WTGeoRq9Zom4BUZwF0B3k2OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180855; c=relaxed/simple;
	bh=71BN8APuHObYtdk3+4PYPvieojZRa/FPkkOT4kQu46c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LB32+3BedrU7mmCVTBkP9xJARMyqDDAe609gT3VXxuiRz3c3HGVdUg9raHL9SrvnExWG5fPbeCemlfgnB4kBQ8+bjiGJps/J/gLNdEmFdQS2/fiwOZJb948ewxwusabcXPciJFzD6lo+JoBA7jnQ/AzFj3DBwXioxo/csenuG9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BmX7G73w; arc=fail smtp.client-ip=40.93.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p39LMhEqdObLiN9pwDko+cFcIuIkanyryG5OpzuAaeYvSjKKSA9i0h3txUR+qPKr3DwNRHQE7k3UkRm9CQTMKGmHgsRGiIpuAv7qLuPV+Dpf97Qo4m+AAeoMTBBQkt2SjeBQ41cmfbrXQqsxbPxJJ8CA4Ypr4PHO7M6jSqDeOzEuTZeo4bqMAyAEjzOOEz2RbgELMNqJFHGklQ+lNw6Ak5MB96OnfVwFFeTC51zDRH6cJyY+yyN89+U1A/aGdF51vHbzsjdPoisJHoWxMpDKi4bCHKU0lRAAfzt6l+MLt9EwWz+C7O7R67J1yQCZKwLid/unU8qX0sEpQWBYnFH58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMXz+3v+U6Qk2wOKrynNlqBBqW6T4ca7NFyrgAj4nyE=;
 b=J6K/v+xIb+aLCan8bWZgz5hSfSEQAuGI6uK3u4ZEP4xHPZfu/O8sFbzeENq/KCu4itULqcS1ilJRGUh0EjFuytwUDlQO3kxdfBabTQitsLb4JLY4p4EETN3iq2o/AzdZSh57c9YQM2GYoxIEfuKvSopyf4/94rkVeJfyKeJ3fDn4SHLyrG0ScqJliTF+S+1OqoC6WoTrIRWIVS0XHb3jjpGypv68wbMrXiC7Q9sMETP+CqD2dNtuQrrgJRA3RTieNpI1B/ELOVsnaTrtPdby1RS5TF26NOqT/fDr9uaO3Jk3IajSkC4uM0U4Gl/KrdwaTJjVaxm0M/0XNK72pfG9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMXz+3v+U6Qk2wOKrynNlqBBqW6T4ca7NFyrgAj4nyE=;
 b=BmX7G73w1Wmjm10ordU7SnX6lQw0rA7d1IID34YHIByytEu9HrlkGLIm4COaZlR986rEZuk49r+GvI8r7FJOA0f7cXxg8hwcHszZ5DxUfH5PAH1YpCD98vjxRwPboNNF08UP3GMPKIdbgNrraj4bdD05xbjDQq2d8hzYNOBUjakMMb8b/KvG2MNtkh697TPfO5aslTaHcFdaNiYNS4vINhHKlc3QmkzU714qV5tZTpRw1ppKoSxNsKoP44ZR2C817tF8kPtfJvwzbB2WQDUNxjvg60mTPAYN1wUingx3klSlwTyuRP1x6bOTEBd+7kXWnQL8pJkJgEsdiHg7MSMXtQ==
Received: from SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 04:27:24 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::bb) by SA9PR13CA0086.outlook.office365.com
 (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 04:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:10 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:09 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:27:06 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 0/6] Updates for Tegra264 and Tegra256
Date: Sat, 15 Nov 2025 09:56:26 +0530
Message-ID: <20251115042632.69708-1-akhilrajeev@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 32525170-5401-4ec4-33a5-08de23ff4650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z19thHpWnB08et5plRI7FSec8SKOJVOSIEFubYDY2XKlwmO84AWhgG7L8cpS?=
 =?us-ascii?Q?Ct+wn+RU/aiqrLmOcjFHvJTM9JQmV1HRlbD40ToI2n4BZ/cPWEDf8dVo2HLP?=
 =?us-ascii?Q?WT5qRtda8CMAkE6wqjShKPl0zQ6Sda9dgJ2hSAKJLfkddQP48woq9RwG6noC?=
 =?us-ascii?Q?quUHSq2ALjWdW1X8RkmiF7pv9ZYocbiAjLcSFaznGX9hSAEM4+nBZHF3E3Zz?=
 =?us-ascii?Q?55WAsMWSrIidZxWqNs7XqiGqn33KNnILt2wJnIOwLwARtTR2kSbnlsqMhOYZ?=
 =?us-ascii?Q?JQkvlM9HE5fdkgwyi4ZGdqkZNe8Gfeqv8dO3T4uFS9VSLYUq5q4Yjj7b8zCu?=
 =?us-ascii?Q?xtOJRuaPuu2BhVdBgnNCmo18BvS9Fg1dDtsnvCISwNRCk5o45T67dh6tEKJb?=
 =?us-ascii?Q?uptUGiF2cw3uyYukaofTOIJdBA1Jrw+emxR90ySE+YjHC16piJ6q/DS3Uhm2?=
 =?us-ascii?Q?HmYMepRlGy+7zqvCIJ4vHFYcHir/FfAkHbcyuqtUV+qjJ+eUEVRAD1skQT6j?=
 =?us-ascii?Q?VSNief6UAQQBj72457gDgVduAdWZbvOnlKi47ojeCc299kklsCJNYMQgu6BO?=
 =?us-ascii?Q?QhNvo+F3tlRKIPcQEyUPFqXDQfKP4QNqeVDM+b2Iclp7X8TsWwF7XQMJ91yk?=
 =?us-ascii?Q?2eEqu0tAAXsMliN5JD4ta0x8GvMxTJDaNVVoWC9xpAoL4uz410KdnTnFtvNN?=
 =?us-ascii?Q?UQ4JV9H+72hMcq8l5Msa0AfxnjC7XzTNWovCRMNZeUI9Y6I68uXk4q8qZ0xS?=
 =?us-ascii?Q?fLh6iv3u6pJxezgNq5tKuG7zAuvdzq8q7j7HEmCj4UjgbxMCnc/FZRyIroVd?=
 =?us-ascii?Q?pk+6hKDHn2MRTxa7AKwlwlJ9Nv8ALPCKyD2FurTxgge8QvyUpsx/s9VWD2hF?=
 =?us-ascii?Q?4K59qTYvgyKwhymnMo7LcTOaAzTX1sOTRZjO10AvyIYsTPkpAzDoxLzhd6lk?=
 =?us-ascii?Q?NX+9wp27X7WNoZsxq4Qz+qnwoIXdnLmC9uzQ15UStB+MKSqdFcxod8zAhRrG?=
 =?us-ascii?Q?wgdG52AnopPzLQnvtAcpSK4x29PQ/wsmD0odkhS7epD6IG4VqRBT2mVtN+Yi?=
 =?us-ascii?Q?e3BojSp+/Orqtue8dh0RwM72yanjokbvPiOzMGXTM4kO5j3SRbEQAcXy3ebl?=
 =?us-ascii?Q?17aXhmZA3cUIWyv0Vg+hleppeo4okiCkD/vH3JXu1Eu2teiz98lDEcpEZj+c?=
 =?us-ascii?Q?dU94oip6adYkOvietuRlNmNJ1mPT9OxKxPiKaqIvj9R6Wcn8NUVK7oDyQPYY?=
 =?us-ascii?Q?u8qFMD+tEoM7jfZzzMJiGBNhp2HjyKL/BEJC8QMWhSh1VsrQuTM4J0XU/o3Z?=
 =?us-ascii?Q?6BzIKAK6lz8CKVGjXhGz4eSJJrQ+3OA1U8lmTVCFmuBgO+/y/Mzw6u02ewaN?=
 =?us-ascii?Q?KDWupF4OMPLJH2psA7mWCwVbJHsZeYuPpxUEXdSBczpwauhvMz2XyYKzXn2b?=
 =?us-ascii?Q?Oys1ghDNDSpRcMEb/SkiUKwBSVWLfK/V8Ymuy3utRuuLql+n76DassinPn/C?=
 =?us-ascii?Q?Rm0t7YEPyH1AWLhljkEOfneZ27rDs/uWYuuva2AvU8eIrRbodo8XM4swzi9d?=
 =?us-ascii?Q?IFH+jSVWWirH0oviWXjQcpKERY2pJePuCKxV6L5P?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:27:23.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32525170-5401-4ec4-33a5-08de23ff4650
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

Following series of patches consist of updates for Tegra264 and Tegra256
along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.

v11->v12:
  * Added two more patches to the series which are needed for Tegra256 and
    also cleans up the timing settings configuration.
v1->v11: Changelogs are in respective patches.
v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik@nvidia.com/T/#t

Akhil R (4):
  i2c: tegra: Use separate variables for fast and fastplus
  i2c: tegra: Update Tegra256 timing parameters
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (2):
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 drivers/i2c/busses/i2c-tegra.c | 305 ++++++++++++++++++++++++++++-----
 1 file changed, 258 insertions(+), 47 deletions(-)

-- 
2.50.1


