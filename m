Return-Path: <linux-i2c+bounces-11209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C826ACCF43
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 23:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4D317652F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 21:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4319F23BCE4;
	Tue,  3 Jun 2025 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rx5M3KNf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68995228CB8;
	Tue,  3 Jun 2025 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987228; cv=fail; b=GGBA+WK5exd/uz8x1jWxLEymJQ3eJlckSEzDXJAQja38H6Y50WcNey6reP093MqBOmAwxoE5EW7cipTmU9U6cqoHbVegME/2HMf9/fxiQB5/R8gRvTcQyY3FXjmm3m8B2X+86oOjJXQH6psRwHxxtXfTh2Rk6s8ZSq0qaNXOxac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987228; c=relaxed/simple;
	bh=pkOOQLfcs3faXAzB/KS0AvOlAVzcwhXhBfnQlUHmPuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sM9wrzqsK+MtLZZwxzj9PsZz7lJJRcWqtezQVBb5ClKQwcEqDuI9PXBXHqm44zyumqizbZCN8hGSK6cHmCC5xT2F+JpzfHhOJ1flG06GHsxbNOBEwU5Ur0hfmmibfBdMKxSZBPtu9s/7KwQFG0Eb77nlNWIYQaeXeEK/8+KlwzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rx5M3KNf; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyeqSuOVHI3//UD7945wcw1k4oJ0Fd8tLAMpBXplcncLCHBOIPtBYcXjtxHXzjIQ1jsPAcrPXVRjSkNc4XU/UXG8RGvRW2Bwoqze2vp2qWvi7Mbn6UjSFo+8wUNLNxhnCbsHaSTAfcfoHcJt49sWPJXK+QzAdzCHNZIT9GgZtmo1asM/uG8vRjryxldFVrzEyMGcANDSqriurjox1b78n1Shz1g8UyClhp2WbYZ5vlwqdOgdiALFWGipQVLJetEuE+OTCRa27Ze1dgN13JoM2uIaULDgy8abfHSLcYqyAMTmM8G3pEmIkUO+S/b7TysK3HQ3HoISIwscm/F5BqGUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzsyuRMNx+HUMxyOkN56AZEuJPfQY2zoJb4t6d0nBeY=;
 b=ijA+6wCt4aMYQaNauDhY/KUZ6c8DScPViCBMyvccjdiEeiPZIl7TN2NLgA07AQe9Y54ilZ+iRweOj/Z8YVGI/z1s5PUFbaLp8zwwMegOkUbWCzkONSR7OpVd2zsyn+JUV5KqZsQZuLnEqZ4QSYV7gnKrKxRhCJczpL/iO6crJfID5KcTmGh6lMykqjdCGw4eZJK+MRoc7CQCEIggR69sEMAZVzZbaTyRiKRmOtPON9lqKs6jsQkAEXOUSHHkm68WSQhSqd5geB+b3GNHRKfeim0pH4fYbr6ZMtbbbi8QeII/+JClXUGlNCuaH0XmLu1IcLryniDny8WbEPKsoo2p5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzsyuRMNx+HUMxyOkN56AZEuJPfQY2zoJb4t6d0nBeY=;
 b=Rx5M3KNfrKeWgAeH4PIjrWJSfcuck7IWr4DB9osc50evnCL1HPUlzKMYEqUH501Y6cH2z+3tDpjjfgErP+bSMBWrH62QVI5Yiu57RWuiwqAZGfJfMbm4PxhaNPJ3m4oRSUSokKfwsh4akzE6J9V/jSyo0yBlKakU/Cmos65dHlo=
Received: from SA1P222CA0128.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::10)
 by LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 21:47:03 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::78) by SA1P222CA0128.outlook.office365.com
 (2603:10b6:806:3c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Tue,
 3 Jun 2025 21:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 21:47:02 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Jun 2025 16:47:01 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <mario.limonciello@amd.com>,
	<sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v2 1/3] i2c: designware: Initialize adapter name only when not set
Date: Tue, 3 Jun 2025 17:40:11 -0400
Message-ID: <20250603214611.3039787-2-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb2d7cb-eb00-47b0-3b05-08dda2e82d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMU9Er7yyT3O/Ob7SedC9daOkWRb8pxmWMt1YDFA+NdLJh1L+uskiGBPSnlX?=
 =?us-ascii?Q?/1V9bvd4y9IPACO8lGb4zPW9MaovCKGJ2JXQO0m8XGZyK0irmltHlp+WG0Gl?=
 =?us-ascii?Q?QvCrOtQQA+kpl9QOog9K7I+l5H4WHZwP1tu5PY7aCVIjOvpjnewV0LM/O1qN?=
 =?us-ascii?Q?6SWWZoZgtF7Z+RxXqx3xdIlWF/yf6vuNKlyi8dtYO5LgIAW7954s5ZTzgXMj?=
 =?us-ascii?Q?zV/bo9LFXcw5R5NyO/n+fNOEAX/NjZpG0FdJA3Jfd9ClogEJt6x+vJ6OMhl7?=
 =?us-ascii?Q?Q2qdWSeUtE2zTqUjmlJuW/fmHzMNJdpuSHnQzobGORV7XOCkJTh2CJrYNfp2?=
 =?us-ascii?Q?0OrYj/rJTNr+CcWJ1tVqV/CcT3z4gLlHJDnxSvALRQxJagK9Uuh09WxDFTi/?=
 =?us-ascii?Q?Ki4Qlu03jI9LBkRkM6X1YoTj93mT9qq+vxUEzonwaNUlaarnFEjkeQ4vvsd4?=
 =?us-ascii?Q?Mm2n2J9+vI030/xTD8lW28nTBPvhaOvtf+omhQoOMaO/m8JUUXZuoH4bwZc9?=
 =?us-ascii?Q?B4r5QhahHxLCd2wk+AQa6suFUu3zoLrT1/xMCZ46VRDMDJGDq+uKy0WajHlC?=
 =?us-ascii?Q?S6Y2+twWQyTMA6f7oX5lj3i93+pacTTgG1ItAukNYWEK9wGWSpIWK+taxRTW?=
 =?us-ascii?Q?qbZ+L1vHt0scro0eVzCDJKx87O7/OY0SUCK+i6CzOcaH16n5KiXVKaz7jZjl?=
 =?us-ascii?Q?WkzMXD84cRmwbZaJIQ14QfN1ryv9VxcC4c4VyagMAkvuhnwz464ZWrriI2au?=
 =?us-ascii?Q?7y2BSXuykLfSninobAV9qlYNTupGrvc2LSVXCNQ91i/P97nbjuRmMw6uUEXM?=
 =?us-ascii?Q?pweEWW/JzxrxFHAuJARC/D4HdAe1rX5Zd1CYNL8x4EAoLZK3uATkn9xAZvmN?=
 =?us-ascii?Q?gzllDXllTrQXurlVRaSm6Yu4D8Cz6iYnZYiPtZOaqru74I4iamDHI+4vUFzV?=
 =?us-ascii?Q?XwL1Ht3mwTzjKVVSJDNcwRZw73zTfNZBpycaa/J4POR3EoBAYNQlrmIXpOvR?=
 =?us-ascii?Q?GwM8TN41llY4fPxxbBEI3f3ZfoWH5d3wP96xdB2GuuPL2348VenU1r/vu/Ah?=
 =?us-ascii?Q?yZXOFN6en/VU559Slz8JY9c5WvO1Xfy6FI6OL6hPHM5aN5FWuxr8/NjcuSEG?=
 =?us-ascii?Q?w5HYG1YR4LiOf7GA6Rzd9yBXs140ehOhwxBqTin5v+oFTmtXmgwPQyY91nVs?=
 =?us-ascii?Q?IDtD3TAOQeThLl/8gwnCRE46jFZI+43TMuDS3rbVQFMh1t4fNvghZoDKZTO+?=
 =?us-ascii?Q?l1UzZkB9vdLE3GvXujF5+H9Y/QYb1DFepgmLk9AkQjL3d5SG1AHvw93Dyskx?=
 =?us-ascii?Q?t922iz/uH+0rtl4k+//IVVuX6wiKolf3+r8KCfenhyJ6+L1rOQDdoCwSgy8X?=
 =?us-ascii?Q?OF/zTcarbGb18DNCbER1rrKb5ZZMGlvjLNrlsgOXd6ksCDnhHOUvM0aFT2p0?=
 =?us-ascii?Q?erV5mZpa4pxot+SxWZE6xaUzpQi0QHDEn5NohYr8VWjG1v1wuFjIK+ueNFN2?=
 =?us-ascii?Q?KzBnDP6bY39CnzWsVIJbkW1bXZGzk9P/C5nU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:47:02.6857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb2d7cb-eb00-47b0-3b05-08dda2e82d01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749

Check if the adapter name is already set in the driver prior
to initializing with generic name in i2c_dw_probe_master().

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..9d7d9e47564a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	snprintf(adap->name, sizeof(adap->name),
-		 "Synopsys DesignWare I2C adapter");
+	if (!adap->name[0])
+		scnprintf(adap->name, sizeof(adap->name),
+			  "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
 	adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
-- 
2.43.0


