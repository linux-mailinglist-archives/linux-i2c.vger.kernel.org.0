Return-Path: <linux-i2c+bounces-8399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCE9EAD2B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 10:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B7B28F845
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE962153C5;
	Tue, 10 Dec 2024 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VVRkpNfN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D19212D86;
	Tue, 10 Dec 2024 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824376; cv=fail; b=aF8/w56GcKPrx9wOxOCDb7jNzUBX+254z34BSER40X7G60DOH76IDla1sAS1Z7iehkeWitNVSKPC7HaU2Q/iadix0IIgjAF6iotU+8osZ0eoae+PtAwZgdXvp9hjRtfp5TlQpa04GdtRrZzoZkgUL/eb4j5g3CXcZgnZ25vTGJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824376; c=relaxed/simple;
	bh=ktYRPBPJy+gCujxkaxHFd8y6JSExHrp24VjmNwFEjfg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qjjs+PK4JAVM7v0373fCdNajSxwnoGSsqMwX8gpSLWhXbjP2+0veEl8II2pBO1kAXk4OqVU2QT23k1SybHlTI9kpc4nw4gR9mcNOQBa+LiVk4qsGUcEoCzoKFXcr4IpQOQJyMTOixG/KUVpQckKHIOph1Hosw2t4f+alwf95igY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VVRkpNfN; arc=fail smtp.client-ip=40.107.94.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNxtDQI4BFVnUeM/SKwHGpGuFMEr1lIdpK91YB1NnHokf6u40VFL6sIZ2rNLDMLBLZBj5d8qCLPIRwSMp4iXiYevnat1+RlsEXVNpuJlKIfeJ/cgJ32SCUjHWRNZUO7biYUMACvGXXAH3lbMg9bBwIHGIWrGd7dZpYEXOIMt1czbhquZVnYpW+YTgsFiADonANE2jRGcWGpCPg1J53FtPp4tDxXLC9xDBFnb3aBZ7XvHDcXguVGxOqFlx2wZ7hFVcqTXcEXv753zfvURCGV9GdQFtWDCVLFnwEro5YU26Ufze/iVbEpw96s2Y4Ta0M3Lo+ngcz1qg9g2A/dSnXW71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KEllUpmlPxW+W6loCwyhzTmqsNBumMh2k3wSZYJhh0=;
 b=r+1KW6U0n4RKIJf97BE/J8EcoxBc0fRgNbKNEGEpUDw+3LlW+wqjQ/OY9pjbYyJI++G+OgrZa3hRHmlTz+aec8mHETb0Sg12O7slcY/prSshPuiYOFRTmBxeK9YF4RL6vioWTfuNOw6EkuCL9BEgYq1djgcJDaD9wTGEd1MrUjKkWZuKYGBxhrn74xT2E7uhHkNlPTV5xEADB4EM/jFLgATQNztgJAQo8ppfR5t9Hb/6fjTZxVkrX2QG5v3MSH9oVdyCdzPn8TwgtsDjW7jwhUXV8iV1EP3rw/5vEC/K9xas5RtBLcTCVxFFuIWbTwpGCg+Fw4pPQd0oRojt11xYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KEllUpmlPxW+W6loCwyhzTmqsNBumMh2k3wSZYJhh0=;
 b=VVRkpNfN/CxJIaKAEykZ2pWSCToXJeiSQl31Ex/w0fz2ouv47qBaAD2KpUDU1/JB2WYShvofgGOZ6usNmbUxkoozY5N+sAU/eXO1QgsfRguDclJYod9YdfMPGuBtiKCTA72I41tnJH1TkVEGZR7otytdLGD9Qsrk4zWC7mXDGZI=
Received: from MN2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:208:178::30)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Tue, 10 Dec
 2024 09:52:52 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::da) by MN2PR19CA0017.outlook.office365.com
 (2603:10b6:208:178::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Tue,
 10 Dec 2024 09:52:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 09:52:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:52:51 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 03:52:49 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 03:52:46 -0600
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Manikanta
 Guntupalli" <manikanta.guntupalli@amd.com>
Subject: [PATCH V2 0/2] Add atomic transfer support to i2c-xiic
Date: Tue, 10 Dec 2024 15:22:40 +0530
Message-ID: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e8609f-6843-4068-e415-08dd190069a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AW/Jz6xSo4Qw43qI1GZ8DiCCZlJQn8nFkmnwB0vDChFeQ3f3r3RuFSSh0dPO?=
 =?us-ascii?Q?JYhHx7kZ0J/7QPZFKkKZRboXgS4gVowvWeAzy+qr3vNYrvovkZa+14YP7k6R?=
 =?us-ascii?Q?Q36MfKMhP2MROjCS71GOwA2lJF4cicO84E4zXcXlf3MjykIFqHqDe4P191KK?=
 =?us-ascii?Q?F//D1zy0s1bdPM9Fl75gqxxVy8UAPgcGVz7mmYoQ4heU/vAY2st3Qmdp0dd5?=
 =?us-ascii?Q?73//e1OOWRiP+fLROPGr5GpThQoo/GTxCYVA9RIRq/5pFvtPasQ8xpFjpDHu?=
 =?us-ascii?Q?4y+69OfWHQm+hMi1j930TDHj+GmgCsqpGkusI71H5UuUg7uM3KCLjLXmLwwp?=
 =?us-ascii?Q?Ttz6NDc8LRUOTdRXKmSaE9agO5L7c7nxkwZQCo1j30dxX4QOfq0FrYiHEqW6?=
 =?us-ascii?Q?O+g/w28Gw1IfWluZ7WNRIHhV+MhLZytPorEE/tO+27pjQYvgvvy6u6pkNzXc?=
 =?us-ascii?Q?IiiunrVC6ay3ddd+FPQ7UzhJA7L9SYxVRJUo/ydaGLp+4B1q1AxN6MRjEVz2?=
 =?us-ascii?Q?tET2tLaFkZnqLGQSehUpdozCfVLbkNm6260mg4lDXhsvbsF9RtQI5ERfBfoj?=
 =?us-ascii?Q?VO14vrKW5quAvEG0u9yLjn4dDW9CmSs2UWTikBcWapSS44Cb+9xwAU0nw7Bm?=
 =?us-ascii?Q?QpASCol5w5AjANZytbXIEoJXiSBM+lu6Pl/hBagfPpeQDiHvUZnV23uthXSw?=
 =?us-ascii?Q?IQ2PfNWuAWyq2+geDB2QSdThiQJUVNUjTsoSYO3ovC874ROjLtZzq9/Gyens?=
 =?us-ascii?Q?StSseKqT5WNc1+7FNHWPY1IcD2vohdOTSpuvIxEOvw7nCQijf/FiXdTiBAsV?=
 =?us-ascii?Q?CIjX5GGDArDbdT2F/0cYFmUU7AvkidSsirdOtjMYL17fldx+PGB4hnzSza8n?=
 =?us-ascii?Q?s1MrO6a2GynLmaTX0mieqDxXh1AWVWzCVaEs+1+4gLZnDWiPT1Kp7qJ+2tY8?=
 =?us-ascii?Q?iVDG9DvkMlKRnDjMCVlA85udvhAKLWnmd6H5O0BzkpoBi1ZVKibj8WXYh/rJ?=
 =?us-ascii?Q?TPsfj/I1gkuP4LWccHe42OJ7ajfeWyfnUOr3jB0flvomY26iLFvMuI5vJnVL?=
 =?us-ascii?Q?SpbSsVEda6bYEI+Q9dUXJRRLoHw3UPNfHmU28qLI79VcVnZHtJwNZtIiUkJH?=
 =?us-ascii?Q?S8IY72GYUyYnVzxENhO2g56dUL+YxstBj4leMmYvV3gbF9irNecgNas0Ksxn?=
 =?us-ascii?Q?aXsHDJ9hipoVnTtW6puZXt8U66M37JayjkySeYf9hQ0l17IXicIGoBzPVmRO?=
 =?us-ascii?Q?9ZZNI2MSYgqhzlH3U19yxjcOYzs1eb3ESqMG+U89eVS6tx31Cm/I/bpcFMe7?=
 =?us-ascii?Q?Yw+cxaUzlhtR18LBRXyQaMKMT/yt2auBeWYGFH//gG/MeUyi/r4yMP/So++I?=
 =?us-ascii?Q?9GDTNTrd9V1CRBZi2/mLmJGRtFcjS3TEUkZOXQE3IbFv5D1cTb7HLB1qaKKm?=
 =?us-ascii?Q?yORaNzHqCGyK5AEWiEKh899RD8pT8en+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 09:52:51.8936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e8609f-6843-4068-e415-08dd190069a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

This patch series adds atomic transfer support to the i2c-xiic
controller.
---
Changes for V2:
Remove NULL checks for tx_msg and rx_msg, as __xiic_start_xfer() already
has checks.

Manikanta Guntupalli (2):
  i2c: xiic: Relocate xiic_i2c_runtime_suspend and
    xiic_i2c_runtime_resume to facilitate atomic mode
  i2c: xiic: Add atomic transfer support

 drivers/i2c/busses/i2c-xiic.c | 281 +++++++++++++++++++++++++++-------
 1 file changed, 227 insertions(+), 54 deletions(-)

-- 
2.25.1


