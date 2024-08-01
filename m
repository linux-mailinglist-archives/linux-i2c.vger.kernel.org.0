Return-Path: <linux-i2c+bounces-5095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C857D9448AE
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 11:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584891F21CBF
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 09:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF4516FF39;
	Thu,  1 Aug 2024 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SAdBqiVR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096D16C86D;
	Thu,  1 Aug 2024 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505469; cv=fail; b=evNA908EBUBuxq2fJ3hO8BBgaSrHempSpMYoliqdMC7STs6NLAlxTy/6pbhwwGw09lfXJCN9qAMsrq/SSqFMPP19+lyP1F+aR9qeOBlOCPahcbiD2sN6ZSmJIyZH0TIu8Bdepp4PLBD6QjbM1IazCCWpzPYcqH7vmDwZf214kLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505469; c=relaxed/simple;
	bh=8WgFGe6jvd2JxOZR08RZaJzNZlU7B8u8bZcH2JSBKYI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fYsT9yDHfyqeM8fNbUn0vfb4uRsGR08nRb7ztF2bi6ru6aiAATltJ1r5mqgNrxJdSxeSa+6hEZTKg9h0VzAp80Gcxlp2sktxh9TEXaoFyvDJjB6Ssk2CIAiFtkv8vITAozI1xvSGDadzwRJ5iq+DCVww48A4QA6RQ6lhX1ZEV7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SAdBqiVR; arc=fail smtp.client-ip=40.107.101.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/9XY19bn4VdwWRl5VSlIc/RFs2oKgpEPRKiFXJD/TaevjM6Mx8AiIWjh4sbJFamPxPpeKLyA4CNLcfM5tFBbbs9PSe1ykNNdh5VcpnixrC4aspkQkpVXo7DE7l/Jsh9bTm7+YY0RrnQ7Cu1jtfxJlOGrx24dwkK23OtwxsB/QIRVU8awJVfqroeHySb3caoJ61JgpPYd23gLZKM12+IjhCU0xUZohfk/vF0dYt+9Tfusc1oPTYiccJS15dRUbNSIXGLuI5HdK1S0Bw40iLTouUAuMhSYohuq9LYtd5C//VpeEIjN5mrZor7UBq1uroYAdqJoykGWQYWUS0SVES4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQmIFWRKnOV1pQf+iirC7CvRccbrODqKVGg3fUlNQs4=;
 b=ypAafcFZdsIAjD0Up3rjbZkq5LXvw7/eM8rblbCrq9tIr79FvNX3nOQLcdCcrQJkBH2QYj8YVeBX7bUU1EQG37BKesanOfsnPfE3O82cQpEVBt5DdYYrkMu/4cEg5SqoruX7N2mTaeB4aDHockhHe2MlRYxhjXImKaDOjhZE7JtjBgsrlD/Z3dcmvHfe9NxzaOfH9VmqvVTNj8ZT4pXo7e/pGkZAqIo9IF1ayaY5/rDPxhdbq5xQxGGlL+cgu2L4ziEL8dz3EqJanPmsNE/vS5bo401VbL1szvoAS6LH8KspAXke8OA0BlP6sfGN0pES5BKAV0tcjYUKTpPghyzAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQmIFWRKnOV1pQf+iirC7CvRccbrODqKVGg3fUlNQs4=;
 b=SAdBqiVRoE7pEN+ikbXH+NHIGsc4ZDrpCxzZ4CeR2NNZSRhCGIr1JFQkXTRxBILw5GgTLTB57neuPxD8hRvMz9TyKnnLIDX2Kai0yC/Zn1N+dXMYOtoPuNuSdK41kjvA+9YKOY/2+7W3UoW94gZvndtU2aocAxmMIeAEBq+4Iak=
Received: from BY5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:1e0::30)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:44:25 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::99) by BY5PR03CA0020.outlook.office365.com
 (2603:10b6:a03:1e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 09:44:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:44:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:22 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 04:44:19 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
	<manion05gk@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: [PATCH 0/3] Add atomic transfer support to i2c-cadence
Date: Thu, 1 Aug 2024 15:14:05 +0530
Message-ID: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be7ddf7-3aac-4e4b-6d43-08dcb20e8739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ljQzwTyyHNBn/NT6emufW02jdt4VsjSstiZgelrrekhyzZDnd+Qh3tfLfiBH?=
 =?us-ascii?Q?lxAdFvjHiP7/gDPF0H81GkQRIrHyDVHD5ExH3m4eWO/08f5M8neNYyOqY+5/?=
 =?us-ascii?Q?+Vnw+sv0yM7/pxBYiKwNHCd30s0O+nn9G+vJvtvSzWhxnEbDlwsWXwUVXQSG?=
 =?us-ascii?Q?dXTlwozbIhUr2m39csfdMWCXyFE/oTyQ0K4iyzZmkQlODK9u1WD/YELuvNBz?=
 =?us-ascii?Q?j9ZgJQ/BiG8rFbPy3GTd1+OCJ5DuTg2V5YZb3B2PIyQzygC21HdUbCUjOFQc?=
 =?us-ascii?Q?YUfcWDAYVUhz7T3a6odLaL17HyLc22XkA5u6YzdHa7BT3t8pyS8rll7fQ3y0?=
 =?us-ascii?Q?ZfrDhzBfCgYXLHw2by+lC9e9sXfJ19y2JrhUmKGw+0cWeatrg7l1rnKJLxDw?=
 =?us-ascii?Q?JVN+CCILYocNvNF9N0UrRcEoQs8Pe62Lh+95teGAYbACwTLhUxzV3Y7S9tBi?=
 =?us-ascii?Q?cyJu8lnpvSz3+cZZDas7a9oX7sEwtDXofmPcvMwQvKUAZBRta0G7r5HqecQj?=
 =?us-ascii?Q?THfoq5+/MO6ErULn8wefi7ODJVr6zLFeDZ39Zl5DkyGDiCOc6YL3rUdgsQGk?=
 =?us-ascii?Q?60yPKh9iAbMP3LgUGJgYxlvrJs+XxSGr6lKgGscmxVsHH/OsqGfgdkwpUzXD?=
 =?us-ascii?Q?C+iqazG9Ld+K7gIrdJOhlPkF3mlbJhPFz77weVS/U4gSYuUFX2UUyR2OFpBi?=
 =?us-ascii?Q?Hwf6tl/okx1EFezp/kNR/jbQdLsHF/JSVxHpiF7BjNIa8g6dx1XnoXFl26kf?=
 =?us-ascii?Q?zRrsNto28h4HPsEhkHvidU1Sm+LdHw/T5UKW/qJLntL9j2gm+pcyo4eh50ec?=
 =?us-ascii?Q?1D8r6DsEYzpURPTj1fhJzARcNAvuCUo61DVBc4xhm5sASApRQt0JtY/qLPku?=
 =?us-ascii?Q?mVGgoLlWJainKQBwL3ef0vBG7mcJ3RF+Qt5gIs4WMpvYVJcDry9juYkOeSVo?=
 =?us-ascii?Q?oWre8a9B9kshOoaRQrxDostBGLRTWQJj9/RJKH10OMqt2rRVgGn84bIFsa2U?=
 =?us-ascii?Q?V62AmmKkoxITzB/wkbfC925oGAr4h5SxLiiE+5Lx0e60ps3Fmxy8r0yaz/zA?=
 =?us-ascii?Q?7h+CteZkRnkL6+HqXAbVHD9XP2a/5zs3ZsMcep2rSCu+Ra6vbV98tCIT+gzM?=
 =?us-ascii?Q?nCkC+gbogeEKP+U7Kcxl8ejOw35UJddvpahk0BAxBuUKcdC4L5pT1CmhepR0?=
 =?us-ascii?Q?sxecAIvBsdx49RG1AEor1WUi+OJROHHFPWX9e1iI5WsIltc4lvLj8jmKsKrn?=
 =?us-ascii?Q?pTo11a1x21oa8yPD06qbMqwSla5CTVuiHq5f6U5M2QOrKw3KViR2QaVVyZqS?=
 =?us-ascii?Q?5l35QeaKdfBhDzCTndmIzLnfZazs77G5kxHo5U4jOjN2Dm8Ge39TXxZRPMfz?=
 =?us-ascii?Q?WMkJiEIG+r+cviPsO+AxH3xiPJXD1oroKcWfVG6ooocY4pfBXiFz9t/xMbIW?=
 =?us-ascii?Q?b3PZCxSETk88i8Udu2oJbtWq7UmDYYDZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:44:24.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be7ddf7-3aac-4e4b-6d43-08dcb20e8739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173

This patch series adds atomic transfer support to the i2c-cadence
controller version 1.4.

Manikanta Guntupalli (3):
  i2c: cadence: Relocate cdns_i2c_runtime_suspend and
    cdns_i2c_runtime_resume to facilitate atomic mode
  i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
  i2c: cadence: Add atomic transfer support for controller version 1.4

 drivers/i2c/busses/i2c-cadence.c | 418 ++++++++++++++++++++++---------
 1 file changed, 299 insertions(+), 119 deletions(-)

-- 
2.25.1


