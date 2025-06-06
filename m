Return-Path: <linux-i2c+bounces-11270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537EFAD0998
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 23:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A37D97A90DF
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 21:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A4E23A9AA;
	Fri,  6 Jun 2025 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rZsaunOC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB121A76BC;
	Fri,  6 Jun 2025 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245747; cv=fail; b=uzJG4QyEOJskOiEN8DJa8W30bLKGtBLckZ4Vdo1WjqZQC98nfPKVncV2GZeiybOxttlOCco4m7JJ9MMeJnxiARIDKUOZTVgqWp9JGtQOX/TeHtVdnO6H+U8c2/jyy10k7IzYWtsUFgTEb3XTYO2vh+teKcB2GZmAaM9keiRqAhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245747; c=relaxed/simple;
	bh=vHJR3OR6dhTiWlyQOOOWvfWd3jHT9TFPtLbVanVItNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVgGNGYFI7jCUb+PKzm3p0xs2q90AGvZvRAk+H4BsYE9t4OHLc/aFKilRzPpuD/Z68jg808/hpHBVNTefR017fb6fqMUBkBXEdm9dcacaPSjPZ7tqjPnERwp94KouffO6eoYubtTFX9XQvnZK+i4d0wkoo1LW3EwGv25ECeRoR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rZsaunOC; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzEIvxoIB+O2spTZl/VjJrJN4jfw9UdP/BIBH3yIPhG+FvZZf/ibTLCWGLwhPpj49YwTAlvU1I8NdpEiY8sm53GNkPEOjeih3FbLEXDCWYRvwbYkjKbJGx35t3GvZgjANf3tVJGZjZuROBIFKLOn5PfnTHGdKBHYnbOULJ5FFwdC0CqudZ3e52t6C8hqSXPHtC9Om0dO5JaHOt3LZQrGoF2eNCOlzhPUeXzMlSHBR92/PJdzeBBdsnrYZrC39EN/OXjgpwbXVMXWQqg7Zmd4GRGnhfu75mXTSt1Sud23J3bpIPyUJNHdK226TC/UETd1iBHe2OtDzXS4UMH4PLGoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKiNkZWt5Dd66kYiauq8T9FX8HqaRoQyDX3KpEvpAKQ=;
 b=Qyu9tutWCEbjwViet/lq3PuyZR/63hYnDSDRvCik3EJUh7jB5bLNHEM2GSkZbOd0EOmsu7qUOJMkT+aWUauhzKvnT0Qy4TEoJiPGajXh3FsRjMonDLkpVPGfDhP1o927NMWiTtqrgSzzdbPrrTXl0h6gwcFxRuq1xXsi+8AHMI/pwv0CZZYFq7OE1HwaUuy6jsDZDCPB/5iIFEwJQ1WrTlYc3Eh5AxB5iCkNop4V7cvdBR01beUplUZZ0n/NcmcaU87damd02yIIj5R6c5UQ5EE0s0lAqxiKzeOzUdGSY1n+fEFzIEkmpDQ04NCREKquogZaZmjr/ndMRDSshH2LzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKiNkZWt5Dd66kYiauq8T9FX8HqaRoQyDX3KpEvpAKQ=;
 b=rZsaunOCw9Kdv/BKoSzDUApNTut1TnV4763bGU+DGzCfO5IDOrqe0fqb1MyoXljqiRKPOOl3WzRfBP/Q/MyJxHaC8lS5/AXkBlhaUmBgFWcGusspG3cZpjpsOnKV16tlhezZcbxDQjaB18SS7LjayZxFmjn5EY+UQI1s63094GQ=
Received: from CH0PR03CA0303.namprd03.prod.outlook.com (2603:10b6:610:118::16)
 by MW4PR12MB7310.namprd12.prod.outlook.com (2603:10b6:303:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 21:35:41 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::8d) by CH0PR03CA0303.outlook.office365.com
 (2603:10b6:610:118::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 6 Jun 2025 21:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:35:41 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Jun 2025 16:35:40 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <andi.shyti@kernel.org>, <rdunlap@infradead.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <sfr@canb.auug.org.au>,
	<linux-next@vger.kernel.org>
CC: <linux-i2c@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <king.li@amd.com>, <dantony@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH v3 1/3] i2c: designware: Initialize adapter name only when not set
Date: Fri, 6 Jun 2025 17:31:39 -0400
Message-ID: <20250606213446.1145099-2-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|MW4PR12MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 25276743-4644-4fc6-bd20-08dda5421638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7aulS5sKk60AsNOWKOxDpowTE70Rz6ltH07eYwSLWJnSYfiXRYj2wD5py2BL?=
 =?us-ascii?Q?0Q+FoMbEAVUz+MapgRxtd3moL/Nub6UrbupAqMSTlE60/YX415H/46INkKoz?=
 =?us-ascii?Q?CzLWh/7r1K2ChWWgx5zNBLsRp7sFxIJC0AqfPL76bMxF1pse4T/P1nt7BbK6?=
 =?us-ascii?Q?b7T2yE3NPGx2c7CB2poHlsPQwsoD5TOy81zBy2Dur08RZq+ay/xLt43sGOFF?=
 =?us-ascii?Q?cqwS907NAecw64uxakoYoQsy2CLhIQx4tmdkHNeTXM0ezpupSihj1PfpqOjx?=
 =?us-ascii?Q?dvp03r48FBB7EJOhKWvySyQrzOpYa8XuhTKLKp5K/lVZ7XqidGrLMRxok/y6?=
 =?us-ascii?Q?FCh6jrwRmtuV276LqOK+IO+Bes0if9WtKzuAUB9ukLG/GqSsGFU1sawVaL7U?=
 =?us-ascii?Q?o76//WYMcUXSIZDlNaGjMabhbr4np6ImhKpcdQWYfnaARAdnimcyM8zar7eB?=
 =?us-ascii?Q?Dn3s1P+cFcS/0/O6uuL35sdVdzSdVRH8lkQysaI126kvSeVgkV5xJZoQ4MTz?=
 =?us-ascii?Q?VPEhczNSB7bbGrLJSotdyRN5DX8EPxeqZLQzW5c+L+/3EC3s8/3nveKSO1c4?=
 =?us-ascii?Q?JCNS3snzB7t6MGCoOh0Va5xuEoiW/oJr0SoXwQmfSzHp/EDOSfUA1iwJ1ogD?=
 =?us-ascii?Q?8DEyTjQLzIiWDRhdhcwJnOwduaHA5csmB6LYQ9/nd8kKOXtgu0a+Eb76lQgg?=
 =?us-ascii?Q?BTxvCZsTKnTE8K8Htn5rHlXbUmtuZIcmEkt9JIa8E+zbnryLWhfG4q6u1VKa?=
 =?us-ascii?Q?mn+hh6mv18uFrLx/jYkzhT9NKahsrD+cap7YUGDMqtmSTWZaVVosqRy63a6m?=
 =?us-ascii?Q?zvKmjfe6K6D6ejph5yzOErqWTyFvjVTjRX4fyOYYYCIq0/ceDk6Ycq96YQ87?=
 =?us-ascii?Q?GopMEmWgarl9U5+/HSr404sIyrq7SzeFidOmEkwvIcqrOkBliTGuudrFBaf+?=
 =?us-ascii?Q?FWddPomdeYm0r08UfDn4gM1NMwYBewx2pNOTpFY3V1NmdBWCfpUqKLyKhvrT?=
 =?us-ascii?Q?Lj4BX7VYi0t51q7NclKsWDFp5ixaDKJqtHeRX0ldleKsEle+fZ+0D2B5i82k?=
 =?us-ascii?Q?59qkLQIP6gCoe8qCOi10TEWqq9zXLfiBFiYijtSKbpWmx95wErMu2Wcm5amT?=
 =?us-ascii?Q?Cq9pnGUWKK/2S4NWXw9281pD4II0+DmmRfpMKRiSjmRtacFeI3jcKGP+/g2a?=
 =?us-ascii?Q?SgEj4dMYTVRztmhJKb9I7eL/Ul6MAsYXYEQ1jnZfmPClMmr39SfBF6ITcOEj?=
 =?us-ascii?Q?lWEeBUIEpoMg65cEwRBk8je19Vfc/9y0NTFECoUGnckqOVOEFjRhO3CB0Dd9?=
 =?us-ascii?Q?lzS1g8rS5ciYWLpn60nTEQbuPbZHm5Xb8zdRof28L4W2doc9Vny10OnkDFta?=
 =?us-ascii?Q?eU8BAg/GKDecdeDiV8GU+1i1sQNBkBiGxOdYBE0E1hkPSpNOF1DURvssqHqC?=
 =?us-ascii?Q?qpUfeNMnh1UgWOubsyf+0n0jjMyHUM1OlJWAZP/egqSyEWogAHmI1fCfB5k8?=
 =?us-ascii?Q?Iu46oN1J8Cm2Ggzr/UFti9NMKPOHxOuo7ST2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:35:41.5173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25276743-4644-4fc6-bd20-08dda5421638
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7310

Check if the adapter name is already set in the driver prior to
initializing with generic name in i2c_dw_probe_master(). This
check allows to retain the unique adapter name driver has
initialized, which platform driver can use to distinguish it
from other i2c designware adapters.

Tested-by: Randy Dunlap <rdunlap@infradead.org
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


