Return-Path: <linux-i2c+bounces-6876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE797CD63
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 20:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BB5284D9F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 18:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8705F1CD2C;
	Thu, 19 Sep 2024 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S+MMfV3k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5E18A95C
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768802; cv=fail; b=poDJxBUMax1/AJaG4L/fgZ4dUGfodTPQhZs0bo2PJqJrOsm98wFkeWCMDQyFquhVhMpTJYjitM/LIBWSnBZ5h7SFWap19NTAQpqAETYeOov5uF3ygV7R/DX/6ncbtTYHUIH6QpNwuRGxQqUtlcCsoYn8LAXdZMXtPXxUo8VWSfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768802; c=relaxed/simple;
	bh=LkeheFs5KdsitRXb1TuPUJFAoDPGBNr2MPVtU8meuhs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdgEiTCXoENWLdb04Xd6zhDObJFUrWVpK/7FWHRO88GhHRNSOjhpTPtt/FWFaoo1WxXh/L8BWcPUATvCbDfW78EtlNK1xaZigkPpz+B3iM8uv53i9x0tgqHk5TDEuPUPRPlZ42HVMIqFeU7B7tczxQJ8mKM6hY/e1I/o7sSxY/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S+MMfV3k; arc=fail smtp.client-ip=40.107.102.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcUEyvYmyNmZlhRS/zfko0GHKBq1pTL5N6IJkze9SHxo0KlOeak9QwtFXhG+P9o+Q6t9dnXypXn/wMCU0hQsTN35NFDxE73cQrZ7BxON7h+pyabWAhLWZpfE6B6XA5oqk1aqyl3SDlDenugQzhXMJk8bW/FBr5XjSpGfrvo9/0RLa0Ck/PuNPjXtiqq0qL+RH3tEm3L101UBI38mcPIFcKrYkSdAUfpcHAKA7oGx6T2iBKeFn/LSE4g0aKtJXJ00ko3ZdmPM6wTZwBFf7j0zAe3qV8euOD1x/TtUwTdJoroQGrCLki2tDTv0VpxKaxAtaKbmhVaqCo1ExMgcQXM+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8gS6KPpU6UWzH4a6RdSfYPLGIhFezmBrdKGBAm1SRc=;
 b=bVUKtqbxw1lHErlNBjiUXhZA83y/fMsNhFEPCMmHrakzrdw9QlF2lZy3ChmQwbHklbBTAY/dZCDn+e1xatlYqiEwrarOduZ4cCkIrTFwXUeaP/vBMDoBmXudW7PzGRkznf1yJ1GM7oUNhhSZLzn5FPPJoqAJ+I0SHWZhV9yYDf08vYB3JTainqWD4pEoLP5tyz2JY+Mragrt/KdNW8ylXTYqsnUpBC4FI7twQujZwGieKnM5iktRwdtwI+mMsjr/qRHH9sWs3IlJ4Ar3C1NCzMFcTKd0i41GLi8VbQiYz9elyFn9KcLx/Ba7ZFrStlPZDx2bv29VcqRge9Ufh5KLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8gS6KPpU6UWzH4a6RdSfYPLGIhFezmBrdKGBAm1SRc=;
 b=S+MMfV3kCF9mJ2bGf7yoto7M0+EdP49g/23JqDORkIbWjBF/qOZs6LRlWsE3PtYx7ZYYrAOwe5mniOv92CsqmeM1KirH3T2Hc82ORT/3kJpOu4LDnPlh4Izubf39b6kzKk70ZwZ6DYxGVZGi3Sz+CMsuYFfYFowtAv1JJ5bpiKQ=
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 17:59:55 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::22) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 3/8] i2c: piix4: Export i2c_piix4 driver functions as library
Date: Thu, 19 Sep 2024 23:29:08 +0530
Message-ID: <20240919175913.1895670-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc1c201-6de9-48f9-900c-08dcd8d4ddec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R4djdEgUTAvRQWPHRS5hS7hJHMHW0sfTZ7Ds57x05M96ajWatmSDyiROfytL?=
 =?us-ascii?Q?uRYeXGopizlPip9Iqf9ZlWGVvZXY/6uh60UEc+LlqYjdawhnWypn3YTYwCbP?=
 =?us-ascii?Q?BnZb8i3HQW5OFUoBcqqsk+0uCF/E0ZDENLAcz8JswvQNagCjQfL/8vnrmPtt?=
 =?us-ascii?Q?ldQGvYEr6P4KEUr0mVycImz8tBZzQUiUQW5hOVSNrVo710lPYJpajAr2Pylu?=
 =?us-ascii?Q?+tgpEu/srTuWgtg3pBXyrzyox7hV+Q/GqerRxrInH+1V0UmfYbTIsgsX+KG1?=
 =?us-ascii?Q?vvonWbJN3n0af6qMcHFMMv+VqrUGCiwpVkEpsHOVl56LMrXrDuaJhtHSbsoQ?=
 =?us-ascii?Q?IroIaFyZ9c6o2sgltFE99gaeyBgqdbLPVHnpOs5Y/vxdkf8wWDNsKjLcvSDl?=
 =?us-ascii?Q?a5hMHL9AalOCpyTaVPgrpOOKJTNjM5jLddpd64+oE0ofJlkKS1DokYq3aHrL?=
 =?us-ascii?Q?4gnkGKDpyrKSWNEkly1Dbn2PdHJvcnRO6fx/91g/wFVfcwwfxQ/7Q9JU8Ozh?=
 =?us-ascii?Q?VFzSdMvSbZgwwYg0DYkkCEtdRiatWBKJCJz0AH5c39ADm7qvmUxEtKAP9APZ?=
 =?us-ascii?Q?RP3/AUdnxWk0/wdQsPLpoc+A5O6DAGwwhEFgiB3MPb1b1/godE5Oxra8NHBh?=
 =?us-ascii?Q?oTZ8B3IvsQlfbT4IbeIaJwwHMimTsrjcCRuEKstpGgrf5jTsjHmV2L60Zm/h?=
 =?us-ascii?Q?VVdzaU7oXjlmyiU2PdDkejDCCCYCq5JhDMimaCrFcU8CIOLProLQNB5DdA71?=
 =?us-ascii?Q?H/vZ5PLeWNZjBGFUpJ0hPFu7RCOgXfBGPFcfjUajAIDMEAPjP+wKb/FHX8h0?=
 =?us-ascii?Q?QS95N58b+aMon+aIsZQEwgn73NnNi0zEippgqTy1L024aoCzNAxzmgFCrnUD?=
 =?us-ascii?Q?XKqPcTPkP+lZSb48D3kTNeCGuoi+S4I8WQeupoN0olmIs+Cv0l3qJNNztBou?=
 =?us-ascii?Q?9D7H+D/HTDz7zt3qWlK/n7OwXV1iiNjFwQqdbZziGVO5uc2CJ0e8lBePEY9T?=
 =?us-ascii?Q?EN4QOu4T3AWQfG4MuVTtDvIpHZV5ggdeaI6fFS8fSLuPPh4hdgDCnO2Bb5zZ?=
 =?us-ascii?Q?pqO3amOX3BZQqqK2UM4gl7+TOCVzKQKhksOwLDyKPm6jrztjTWhrHyAfK7hN?=
 =?us-ascii?Q?Xg1GaD44ocQMJ86ViMgKpZSGEy5bo56PxLpJF5Uq1kcCBtPA9NPuzxg5cDwT?=
 =?us-ascii?Q?GzllEwOBWQfWA/9upFNfcud1wDHmu17iLhI+g/fENcGCDsF+k59tu0NCPCc2?=
 =?us-ascii?Q?IIqWsA4iN7XG674TMLRggGOkG3JAmyb1p5uCCfe5AB91qJXRVQJT6Lb72GtQ?=
 =?us-ascii?Q?GIWsL4RRwFgGTBGfhV4R7jwqsTLQJuPtuaemv6AlG5m3wto+mmXszbbn2TXa?=
 =?us-ascii?Q?UPlSrCsYySFBPQPBS9HSynGP0MzlaPs7PhhZLkO+wlwUveVDILK1agcNX3x8?=
 =?us-ascii?Q?o6Cva6yRj5gTJ1P8S2nrGRmdGez07hzk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:54.6139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc1c201-6de9-48f9-900c-08dcd8d4ddec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Export the following i2c_piix4 driver functions as a library so that the
AMD ASF driver can utilize these core functionalities from the i2c_piix4
driver:

- piix4_sb800_region_request(): Request access to a specific SMBus region
on the SB800 chipset.

- piix4_sb800_region_release(): Release the previously requested SMBus
region on the SB800 chipset.

- piix4_transaction(): Handle SMBus transactions between the SMBus
controller and connected devices.

- piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
chipset.

By making these functions available as a library, enable the AMD ASF
driver to leverage the established mechanisms in the i2c_piix4 driver,
promoting code reuse and consistency across different drivers.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Note that the git diff view is presented in two separate lines in order to
suppress the checkpatch.pl "CHECKS".

 drivers/i2c/busses/i2c-piix4.c | 16 ++++++++++------
 drivers/i2c/busses/i2c-piix4.h |  5 +++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4f070863a2cc..c289edc0a6fa 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -156,8 +156,8 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_request(struct device *dev,
-				      struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_region_request(struct device *dev,
+			       struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
@@ -195,9 +195,10 @@ static int piix4_sb800_region_request(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(piix4_sb800_region_request, PIIX4_SMBUS);
 
-static void piix4_sb800_region_release(struct device *dev,
-				       struct sb800_mmio_cfg *mmio_cfg)
+void piix4_sb800_region_release(struct device *dev,
+				struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
@@ -208,6 +209,7 @@ static void piix4_sb800_region_release(struct device *dev,
 
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
+EXPORT_SYMBOL_NS_GPL(piix4_sb800_region_release, PIIX4_SMBUS);
 
 static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
 {
@@ -517,7 +519,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
+int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
 	int temp;
 	int result = 0;
@@ -590,6 +592,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
 		inb_p(SMBHSTDAT1));
 	return result;
 }
+EXPORT_SYMBOL_NS_GPL(piix4_transaction, PIIX4_SMBUS);
 
 /* Return negative errno on error. */
 static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
@@ -743,7 +746,7 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo, val;
 
@@ -765,6 +768,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 
 	return (smba_en_lo & piix4_port_mask_sb800);
 }
+EXPORT_SYMBOL_NS_GPL(piix4_sb800_port_sel, PIIX4_SMBUS);
 
 /*
  * Handles access to multiple SMBus ports on the SB800.
diff --git a/drivers/i2c/busses/i2c-piix4.h b/drivers/i2c/busses/i2c-piix4.h
index 32da914109ba..36bc6ce82a27 100644
--- a/drivers/i2c/busses/i2c-piix4.h
+++ b/drivers/i2c/busses/i2c-piix4.h
@@ -36,4 +36,9 @@ struct sb800_mmio_cfg {
 	bool use_mmio;
 };
 
+int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg);
+int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba);
+int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg);
+void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_cfg);
+
 #endif /* I2C_PIIX4_H */
-- 
2.25.1


