Return-Path: <linux-i2c+bounces-6930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CD97E72B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E698E1F20F2E
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0CE328B6;
	Mon, 23 Sep 2024 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I1uSyEEj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D083C485
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078743; cv=fail; b=Q62ci8+bhrewV9/Sh3PBHMl9rsF8/ZMyQ/f4lVjyiBvqj4ItKb+VyJGEg7DLVDbZmx//C2UYWWB2xnOOaujpAEuSAbXQSpj5fVKGfWJXJlhVYE6rFeYIemol03VK+FgDG4JS+Bz/10mjITC2vvUuSAwdSm0tS0rCAMunzPhYoLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078743; c=relaxed/simple;
	bh=pSx2mcnBADHmOElkL8YFEg3dmmDMiDqdwyTH8qFgopM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DONo8vlhEZDYtHZ1lrXCNwN8tfeht761HTSfdSVkp3QNSaJgccaIsreP8/1GcrAvQwPdPdgiiu58Z2muDhD2FFTVve9EF2A376AQ9rXA/p21FwBjsQ8Dd1eEXt9fLn4zM7K/s8UteT9IxOsRitZ1wy/GpN2ArEt7xSvSATciy+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I1uSyEEj; arc=fail smtp.client-ip=40.107.95.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoj91gAbUAjyJSOWccP39iJvWKzfY2HEhjCp+tN4zdZXf3nOrSukQROaz/dnh1y9UW03kqytTgziyRzWGej9zwNMyLXjm0Bjof/Xaq/RFJR6y5hJDWSdMI2hO6Lh84/oxDbjqQpxyUyq+kXsDD3gqIU/N190B9hILVLwX8kavmFkzwQQCy3HV4zDUHTwdcKKO6hSWHZSU7S3+gZTFPREIXUlEZtzBHJY3nclqQESRtfjENFWpbnR6sEaDBsT0SuFjLX1fuPAeWKKF/OBsFsP0naeNd2akJqXqL8BKUbvBsU7ViWux/Jb1zOMHIXp60TeO/5RLsXLOTM5PwiBdHafrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN9v5KIfIIBpwZbyFCB/2EIg7x+vcV5P4609Y+O8vps=;
 b=xLsyQi61Pyvi9cYf7PFUUjQr8pUzxnAqnlYzTr8gHFZ1QLRVrnkoB8sDfdatSWYuNeOVsGVoM09OxPTrVfPM7xjjDpGQZzz+Bj8xC/fpzT/YIocYVn9nE4wCjpmKQ+2bv95eqfp7OlRbCXf0i3nE7dNazGEll5ktCDvAoiBtrrAgKYFo0LpEWLLyNHIl4BjNk+q1WucSvk4mi7o1UyHXb0MaDRjayHW95utmXD8EaOvkySQ807bKnN9yN4xeoS7nr/xBhpdmkhefvAaCUu/HiN7i4fFujobsKVF3dUSM20ObS9qjmU0bcSWwhJrDr2IdpYDpDEwu0EbTS5vHL3MX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN9v5KIfIIBpwZbyFCB/2EIg7x+vcV5P4609Y+O8vps=;
 b=I1uSyEEj7zNrlUDbJaDBozbrbwlk5AXIvlKXwIeeLHvKdz6Qq4I/wrcYTYQNN8VhfmUH/CvyRia0g80Y7uU8kn5tmHvyZgGDGmqAVTNwxmBb/oAfO/RiVKVJ9cigAkUFtneyky+irzqBrch+ngn+sHyWymJG9x7cBswFLOlzQyo=
Received: from SJ0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:a03:3a1::8)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 08:05:34 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::de) by SJ0PR03CA0363.outlook.office365.com
 (2603:10b6:a03:3a1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.31 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:25 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 3/8] i2c: piix4: Export i2c_piix4 driver functions as library
Date: Mon, 23 Sep 2024 13:33:56 +0530
Message-ID: <20240923080401.2167310-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 6640fd4a-fae4-43d6-b12f-08dcdba68039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ySROatIk9jAFBZb+J1ieiE+mGs8G7G5uH0Yl40uGbkXPeULoWb/Ta+ySfcb?=
 =?us-ascii?Q?UozavisoB6RWeEap47ZAegLIqxlLd44sF7o6Amt4pvhOjYDYVtkHzMsNgL6C?=
 =?us-ascii?Q?+XYBX3vCPe0z8SRnpBI2qA23Bv+GhX1QSiPmYC2SRZbLOisKVNJ+AKXADcpr?=
 =?us-ascii?Q?4wDNs6Tg1GWPv683AbObTRjYsBD8vEcfp0qkIrN+Swi37qlrhTnEo5DQT0YX?=
 =?us-ascii?Q?IMmRciJ01S9Mmhic1j1ye10mU6NaD6J0zVxvKj5DcJHX7yIKkbjDt8/CHQ1e?=
 =?us-ascii?Q?hFDUKQqJDkKShsMC4jqphcpQQKNNcrTf9dCaEEh3SvuSY8XJt61eHqCwNzmq?=
 =?us-ascii?Q?L/k7lnHU7AdIvUt6wrIm4+nZ/sOt4K+aV0lGj+rShVaVFGwFJ53N7KkH7+f7?=
 =?us-ascii?Q?mMKLIjmZdyBe3kHNAW16RAWK7Wv1Ubna6c48JjEz1gjECIyva61CWcO5Aa1u?=
 =?us-ascii?Q?dkmlCAQXCQHs1p+HWZP0pyZdJX0rr2avDSTnug//Sovhkh85J1ksrMuFP2Un?=
 =?us-ascii?Q?pE9aG6mPpxkG/hCHhoxYio29YVKqP9oZ7GLQBvrardoKdVpTEYmk8h6qnN7v?=
 =?us-ascii?Q?RZVK7SXia6SOkjP4mf51pNm0oXMdAzP5D+mP4jgcapgGxKXoMDIYiPIJplqi?=
 =?us-ascii?Q?gcbCelCSQjHBXNf9s5l7srGVLGsy9cRnADUjieeZktR3X7fsUBZ4U4et4zJ9?=
 =?us-ascii?Q?oklfI0cc3phJIcEtdl+MrusWVTvXuysOJacEnSQEdDQULAt0pU27QGKGSNmj?=
 =?us-ascii?Q?1MkjXt1xEu/3woj1VXGp+O5k3tMtgXrADe0M1VkmyVTkgQ/3yMcTdAgaQU3x?=
 =?us-ascii?Q?QJq3mtTraAjFaQ3VvjQs1SBWKOrdBXIbT9TojfhIg/aI87qGaLRoI2RUcqPD?=
 =?us-ascii?Q?YD2+CQ+ykfVzgxVWPl/PhGfjjYkQVwZ4w2hIS/yzUtlOwexLzJ5HceS7VjbG?=
 =?us-ascii?Q?OrYfff31vIhAASsXt4WG8At0g0xJ+CKq6/hy2Cn39N9CPS3uv9Ex4NqtqpHT?=
 =?us-ascii?Q?wxjg6At7PYJfJiL8zT1uN1gD7ER6k5CvQDunUzFVRRpICU/KppaH+899x8gH?=
 =?us-ascii?Q?7PmImqdE+jQ+qJ5saWerevd1aHf/k2eKLvQLkgDCGQ5tWacQbnEJRDdNpSv7?=
 =?us-ascii?Q?qQrfpU8egGoIFfRMLOwhyNVuYP6j0eEEyVDTx3UMIZtdXpW2badwfMaL/ILK?=
 =?us-ascii?Q?MrBIdXKGmpUaVAuuopMq4MwnsYda0YMqh99mJ2W6DDgnEElQN8d9JhczUIQV?=
 =?us-ascii?Q?ETodk6dn5TXVwk0O0P7aU48VPiKuSxWZtZS2dB8jhbIoNpBpv5TIXHutb+0J?=
 =?us-ascii?Q?wUOI4qM/fVy6Fg7dAdYR69xQeQttBSbwUj9O4xKUpbWaEPPQCDXvcLV8KEqS?=
 =?us-ascii?Q?i2V6dJHkww4ddPeADu2STTDK/2JQy56wHEcVDs5I4ohFOrAWP2zs6TSx6dWb?=
 =?us-ascii?Q?XtcuQGEOlhoKL7rq2g0aDmwIKHfgQzuk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:34.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6640fd4a-fae4-43d6-b12f-08dcdba68039
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858

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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 14 ++++++++------
 drivers/i2c/busses/i2c-piix4.h |  5 +++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 4f070863a2cc..ee76ccc71697 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -156,8 +156,7 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_request(struct device *dev,
-				      struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
@@ -195,9 +194,9 @@ static int piix4_sb800_region_request(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(piix4_sb800_region_request, PIIX4_SMBUS);
 
-static void piix4_sb800_region_release(struct device *dev,
-				       struct sb800_mmio_cfg *mmio_cfg)
+void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
@@ -208,6 +207,7 @@ static void piix4_sb800_region_release(struct device *dev,
 
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
+EXPORT_SYMBOL_NS_GPL(piix4_sb800_region_release, PIIX4_SMBUS);
 
 static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
 {
@@ -517,7 +517,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
+int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
 	int temp;
 	int result = 0;
@@ -590,6 +590,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
 		inb_p(SMBHSTDAT1));
 	return result;
 }
+EXPORT_SYMBOL_NS_GPL(piix4_transaction, PIIX4_SMBUS);
 
 /* Return negative errno on error. */
 static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
@@ -743,7 +744,7 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo, val;
 
@@ -765,6 +766,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 
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


