Return-Path: <linux-i2c+bounces-7336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B699A1A5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 12:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B264B24D48
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 10:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B17E20B203;
	Fri, 11 Oct 2024 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ts6TxB/V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16E198A3F;
	Fri, 11 Oct 2024 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643305; cv=fail; b=Tq80eKK1Kh86FuJdIUXoNUjvPZvoED6FTZZYSGCEbS5nlStIHcz34qidwkOrpbw6xv363grS24FX8nK1Jax8S/gHsSIiTVvMiqPP0gR7R6W8Yp4mvQtk50OawXk8oxoElzqkrtLH5rPSYtj0KM/uYOrrUSGaHLjkIDbyX2wfoHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643305; c=relaxed/simple;
	bh=xlt6+V5NES8DbSrR/QHN0/lN3gxqk6yR2UMYoUaqAEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FPPY0kBNVjX6Ma7rmSkqIjrfsIFu5MJ5Z7ZhuV6q2F8BVPySqvFXymJfN9tvw9+5j9IpRg4rO2OdSq/ePUuQYugTTzej5HXoiHN8T7DiMSWQaHfBdhJHGyRlNVXwW1cD1XWtB1gzeJMN2Iq0PvwQ+1s23mBwxV3tSksIunt33eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ts6TxB/V; arc=fail smtp.client-ip=40.107.100.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijnBh9h2/XZQ0sArow6JjvdK28KO+B/koe6uxzKHuDJNjWgrZx4GAJOI7pwikiJprImG0+s/Wuo1/DKdgGPyS5e3Vv/c6a4b2MI9cG5CTziKdjlszCZNr2WzI2/+Y3wdqMzr3EXe/uI8neeYtco4HbFfX3J8vflcYsQ4/CXGsIRsD8eFhBuNu6LZl+1MBjy3357vAKeU8scDBHuqZLZ30xnVAESRLC9b36DUhUgxTs/nfBXxTAVq+9BcoE3dDNVwXvhJHoDe9pLNSnX2l/IpJjSBzFgQ+bieWpltDDYjzEscdb7WiRFJsOyOGw68Nre02pDyae9ZCQJ7yERdl4zvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxz103hHjM3voLiCNEu0lk5b5E6+7AtxxqIqSpsPnsk=;
 b=ckuCB9HT10ONuKp3DJ/9PShiswcwyFvYhzidw9HZPWCRydwcPrRfadT6UhMt6V24WdyTuK6hFWkJ7yIFCbRd1O+O+z+1IDcd995/K/CT1OqbMMRK0weR0ewPrrSZvKmdaPPI290bdMICQbCuPJh6rJMTnypIbqozI+WWuSlyQ5I9AeMhBHhn1kU04fd9FfRqgsuALBPsjkcygyw5nPXgGx9weYcDcX8TiqItslUAd10kDehcSQ1cQdAzlB4nIe3sCMcW7A0AQPRYZTMli5p18uK6ql6pKTdEKAtfzEJJYh3RitPHRO4ikQQjiizF5CnS0kqRFMq4n9WWUg090/RUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxz103hHjM3voLiCNEu0lk5b5E6+7AtxxqIqSpsPnsk=;
 b=ts6TxB/VJucGj9wjd4HTqvO3I5uEhbpH3tZY+LeS3kcACFuDRIBLJED/2lKoyO06B7WlWXbjTI4UfiF3e81u66zkXAh77SZsubj2D/HhjsLML4ohdmTLxnHWuFa4YMJ9XhI5wxszJlV/ZnX+0n42IpS/K9nJoaJML0YHuQrgC0c=
Received: from BN8PR12CA0018.namprd12.prod.outlook.com (2603:10b6:408:60::31)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:41:39 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::98) by BN8PR12CA0018.outlook.office365.com
 (2603:10b6:408:60::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 10:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 10:41:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 05:41:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 05:41:37 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 05:41:34 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH 0/2] Add atomic transfer support to i2c-xiic
Date: Fri, 11 Oct 2024 16:11:29 +0530
Message-ID: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 11482177-b7e8-4be9-16cd-08dce9e149b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5qlnygx3YnaCkxx9cZBg/n0D/jrSKcp8En6an12f9YXqcs0p7bboRUccIlq?=
 =?us-ascii?Q?mVpKZUpuJa48yL++l67mwV+MCYyMqQkaS2mQpTU5sLWW8QeoDlZqDAMMSdAc?=
 =?us-ascii?Q?ID8H7q8Sx3C9Fb1fkH9du2TYMrEj1WMOuwKkG6Z2DUmiVdD8V/EhhpDy2PZS?=
 =?us-ascii?Q?eI8ZhQ40toMV9/gUvE0UNfucsp1d1rSs6VQtgvJJIU54LBvEfJ3ysG3afBPB?=
 =?us-ascii?Q?pPOtur/ZRDk+VzQR117k/5/SzeLX//Qe1xp9Jsqh37dRZpY7+qopgKa/+IsD?=
 =?us-ascii?Q?ddJyvXF4y6VC2Xiq0m0MGDiiQnS6hYm4jXrIJzUKXo99SG3kroWrc1W1ZGZa?=
 =?us-ascii?Q?zuJOZAkhH63LgdUx5cwHlYpGn5hhceT+zHsaKAt5INnTcgBJUKz3EVcE8575?=
 =?us-ascii?Q?n3v1gZl1nzlBOSfZY9KH4IlmG0XFFrDe5hcxLNEfrj6N3iCigp4t4NtmfIQV?=
 =?us-ascii?Q?O2GZh78C0k2urlsYeRn2klKrEcV2/ImCSFfaLZUFKkSYkb1NxRsHQ7HXJKLV?=
 =?us-ascii?Q?JGM3sGx3E6aAoxN//I3JN2LxFHQPSX+uh54Kw2CFsha0zXqjtnNV6Rm5xmkC?=
 =?us-ascii?Q?1fYNAKbrjcVkyXSfDIgng03z1ZHLszpZREfvlEF8cP0m8xSiqhXihGwQOSKc?=
 =?us-ascii?Q?D/dMk7Bran39vbnzt66V7QNDmKoW3pHNwADfQ8+aKbk01GINW30GCFcF5vrT?=
 =?us-ascii?Q?dhnvMM41EK+Fmh8ioY2lExzJDIhihmREPx046HywQM1cDYlcFsjjvg1Wy3Ua?=
 =?us-ascii?Q?oMBd3nVs4uw7eX7KBpbWcrPIUDgZc0qV6YezGEzKO5yZb/7yKWbBem/+Mi0T?=
 =?us-ascii?Q?lWSx6jEUg2LLzYFS5mWoRKre+c0oHotJkBMRVq6og2NC2F6T7e1pCMvl8YaH?=
 =?us-ascii?Q?msLE5HJperM4sDfoLckKEsnriUtFnk+uhxJY9dMAUH61+1+IcJ4XyMzRUYRw?=
 =?us-ascii?Q?WR3uFnhS/9Vq9SeSNDFQ7r7tyOUw1e65inBkiByWZqugGDzoH3iW0eXor5/u?=
 =?us-ascii?Q?5SbbMyURDqZh0munO1vI14DG8RG5oMJdBjhpOh3oThC2JKo2vsRM3kZFYWT1?=
 =?us-ascii?Q?DDgoW6LwmhklxM28uGN/zyQ1lFqoEEmbv2EOUnEhAoCnYrh7pWZ6D6PvrJSS?=
 =?us-ascii?Q?LkSZH1Iu8wyLl6TOSA5VOHT1fxh4LGkjZqsstHKs5wiAp/bM1801bNvKjVd8?=
 =?us-ascii?Q?SyoQ+xStwCLYAQFmpFfvSPHuqOnH6pHcrwKnt59voZBUB1XXtbUtmtV2Hgqz?=
 =?us-ascii?Q?8ldwrVEDyCVxWThMPWl3OPHyJwmAiAS3roY67jbgAargUTqU6ZEzbdfcUfIA?=
 =?us-ascii?Q?5oE22n5VwwWVJQEIJ9yQfvkI8Q14fs4vNB7pNLgreXVX9omFm3d09qex3+0E?=
 =?us-ascii?Q?W1u92lsKGxYsItiiog9JKbayzlcq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:41:39.2660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11482177-b7e8-4be9-16cd-08dce9e149b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389

This patch series adds atomic transfer support to the i2c-xiic
controller.

Manikanta Guntupalli (2):
  i2c: xiic: Relocate xiic_i2c_runtime_suspend and
    xiic_i2c_runtime_resume to facilitate atomic mode
  i2c: xiic: Add atomic transfer support

 drivers/i2c/busses/i2c-xiic.c | 287 +++++++++++++++++++++++++++-------
 1 file changed, 233 insertions(+), 54 deletions(-)

-- 
2.34.1


