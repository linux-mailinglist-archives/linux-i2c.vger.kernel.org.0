Return-Path: <linux-i2c+bounces-6551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2C975138
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C5B1F28320
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1701D18785C;
	Wed, 11 Sep 2024 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NdOS4Tr0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38941185B7B
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055693; cv=fail; b=SgykXaqgsAcJ01guGu3chaln0I67m7OLUgx6EBpi9TIpNxarYegdXX6mvWTGeZ07zYXRJPHqvz0zgtw6pC3SPrbrRNCChw+JM9/QBYjFJ6bzNtI+1raFmS5FWPXucYAoaJEhaXbZdGyUe0bzTKvxgCjTr34vLkL1HwBzXlAiipc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055693; c=relaxed/simple;
	bh=pwQmUflNDNdAprF5F65U1Qt2mpPdi7IKTfkVmX+7emA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzlBicoEe/cXPVRKrx88ZuZ/9y8L2vbuO4l/QF71uXW8UtusCa0XvzpJ16wX5FClpAYHQGymsK1b+CMddjcOKBPqN8+gZ5IyQClpgFYNG+UZiqYLbqYR/80toRMB77u1W+8i+K9Goj8yliiJnoz1U507S+6ggUFVmaJrvnQ/ysQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NdOS4Tr0; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBVb9Fb8/wVWijNNybQa9nCd96waMNe1bupKIG4UTceHgArY6562PfzxvjX5oBoQZfldfEcXvyOunzIkH/hIgoX2HqlVoiTTcfFEG5sIs4HB81166YIFZR0d9S5D3ebgCMJNoUJS5lugrr/E+CW3C4gRlfjBAWVjqmUW3rEUw88y1vk1jGV/wM1/LTGvE54deu2+A3aVLym0eePj3x5uUCgW7DkYBmGbZcFgGnHsUB8a+SfEcIhM/9+ZDsTcUIGDASUcnQbLvtF0yo6+BYnptz2MaiF6EiXtpMBY+LEIE7sSyXt+Mw9H8ZgpSVCkFTZokunPcoL1rRCT0qHhjJu3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tdjak7kdhcn5Euq/5MaU+YwrlebNOqdPfBQ8rnXvkSg=;
 b=fbItoK5OwzPz7ceq5Ge8P3fIbtboB8TpOu80Pv0xbBvnz267WC62g3algBFy7WjbgO2hrcU92jiEn+fxLbMddr9eB4+atcKthCXO9B4QFLfvCtaeegSJ3JA5u4WhholQH4RG+X2uDPIPUe0B64WleCNsa4bIwjKNOEwdFQZaZpsjYGZTNByDvhlOE1UDgyXR3l+MjfPu0P/0D5eFWwn0SMxx0AsNqHGckszih6rfNbRMbZwie39SBC/1YvsM1VvojA84KF9NbIC2xKWZZFnteqwKos/cnt+V/JHgCAzv4IMiapEXsFXHoEgJyBkOs14styOPD8AG+JJlgtOPAKLWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tdjak7kdhcn5Euq/5MaU+YwrlebNOqdPfBQ8rnXvkSg=;
 b=NdOS4Tr057mXdS0JW8Z3hryDPYI80rBLkmFWxarmpltU2mliwfKYBg5dnGAh35+6+YV1e0RlKUkb9FdxL1n/kqDG24wTKgLejIV7EPvDtDcq3SWMxyjGx2LubzO8nDCw6hKpYXfjhG6MP0OV6iUwDbJIQT6BzNJH3gCja+Ag3EM=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 11:54:48 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b2) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/8] i2c: piix4: Export i2c_piix4 driver functions as library
Date: Wed, 11 Sep 2024 17:24:02 +0530
Message-ID: <20240911115407.1090046-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: fde5922d-58f7-4aab-8141-08dcd258894c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yji8FBWWfx1BDzOetNqm8dtZLkZzv4hlG83fLm6lVIlCdbND2hccNN02368e?=
 =?us-ascii?Q?G2PUWfKbnTERRFgfPHKN4FSXlyWmshcJTOdg7DAXnud9hj9Kb6NKmVr0H/Po?=
 =?us-ascii?Q?y4f0CXBUan/0GUgegDvjJ1AQ8Xu8ZYgquU/OTAfkrXTkv6idrwG1QugrXvK5?=
 =?us-ascii?Q?hwJtoMzOSBjEY2hoZVyKJuAJakM6Xqul21TAYg7Mj15WMIjLg2Dg6TKXpsJm?=
 =?us-ascii?Q?EayhfndfwZp/5J9TDhipY0je18RK7lMIXhRxbzRg1+5U2qGxfykbAXQ6CPco?=
 =?us-ascii?Q?F0W5BsWzk845I9henGzci/dyPrC0Xf2vlLdfHeg3d3d0shMzHHhvKJkZAQ/U?=
 =?us-ascii?Q?ntN2qKpo5F/reOdhnKTkA7oEPanwlcy4Y/dk2HtMI7O458XgWJsq83hMy+9b?=
 =?us-ascii?Q?ieLiWkZ0ZDQkmfI2bqHQbHytqBdihiO9Em88Clxj52P33dz1iGEuUToP57EA?=
 =?us-ascii?Q?+4YduE9939u/YWYOwm+gfzpRrCkecQWRsndNPlmta6SeuIEh9JYONVMlGExm?=
 =?us-ascii?Q?wyLWyzMWKn0sMNpY/d6HnTRm4pzijbC+Gb09//OUU9DsB5SLuXRFHA4+ub0b?=
 =?us-ascii?Q?Pcds8BU7vWgqyT8l8csHovH9QPXUMMU8qEyojsXmLMYEe99XYLMjJY0z1sEI?=
 =?us-ascii?Q?v8WodiQPeTtCzeCiZww+tYgvsUJsc9OFGJ7i1gFAD4NtyD1k+/TOEB37uSBx?=
 =?us-ascii?Q?0H4QIbN8LWZ+7W0jM5CD9gFVV7Ckt1jTPPoeaXIlhG2D3GLSXMu5ZpmF5hCG?=
 =?us-ascii?Q?0oozDhcGSM3LV602LSj2vduCwfKaxBJm7YlxwlCx98FC1utHb1gCiogbUy9d?=
 =?us-ascii?Q?V/VBBWeUJtS+QHpRip/9pxweMzQMB+VQOUF10ndDJmZmoohQz9o2dWopQtZk?=
 =?us-ascii?Q?ayHJ0aYDwAqCAJSplvzZITYv64QWH+/5EFjjgMWhxDynx0yONmrv4Dy4onnY?=
 =?us-ascii?Q?uWKzY+ZQT4vvl7Wvvk9JGkIr45znK3gFvezfROLK7X54TGxDO/vBp4JhrFGQ?=
 =?us-ascii?Q?DTrJ6xoRqHWTgN5qdzqJSZsttG6NgHJuzKxL1jnjJoHj639hoP7nrfIIRbjq?=
 =?us-ascii?Q?LpizcSv4N0l63UgBPrw2CVdDzr+TvkvfIS1U9yajSA3rYEu+FzvgeE19a2/A?=
 =?us-ascii?Q?HbyAQ1cBYKjB/WT2xQAzqyvb7+h2pYPN+aCYSOdBFcdjPPp2UN0afUMXw0pU?=
 =?us-ascii?Q?E7pl1MnGsC8sb7rgJpBrRem/glKtuEVP9NuAi81zU/U4DyfAWZ637aSGr/EI?=
 =?us-ascii?Q?7R5zvFDA9OYdL4NVI9Ft4kElRfUtnCAsg1ZJuKlUdZgn/ipSeJck5a6jjMRZ?=
 =?us-ascii?Q?8Gi9n9cLgl2G4C2mcX0uU1Ehe6mm1m/kW9/hez/R4XwkAVtnAleFVwx74OOM?=
 =?us-ascii?Q?/WdnMmYJKHj2GlFCBsGPpassCpulLWXen20dtzHRRt4kY/l60178x48wp/Af?=
 =?us-ascii?Q?kVbXIWZBv55o9uCz4z4WLkK9R4gLLxXJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:48.0340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde5922d-58f7-4aab-8141-08dcd258894c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425

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
 drivers/i2c/busses/i2c-piix4.c | 14 ++++++++------
 drivers/i2c/busses/i2c-piix4.h |  5 +++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 2c2a466e2f85..174cce254e96 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -153,8 +153,7 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_request(struct device *dev,
-				      struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
@@ -192,9 +191,9 @@ static int piix4_sb800_region_request(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(piix4_sb800_region_request);
 
-static void piix4_sb800_region_release(struct device *dev,
-				       struct sb800_mmio_cfg *mmio_cfg)
+void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
@@ -205,6 +204,7 @@ static void piix4_sb800_region_release(struct device *dev,
 
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
+EXPORT_SYMBOL_GPL(piix4_sb800_region_release);
 
 static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
 {
@@ -514,7 +514,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
+int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
 	int temp;
 	int result = 0;
@@ -587,6 +587,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
 		inb_p(SMBHSTDAT1));
 	return result;
 }
+EXPORT_SYMBOL_GPL(piix4_transaction);
 
 /* Return negative errno on error. */
 static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
@@ -740,7 +741,7 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo, val;
 
@@ -762,6 +763,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 
 	return (smba_en_lo & piix4_port_mask_sb800);
 }
+EXPORT_SYMBOL_GPL(piix4_sb800_port_sel);
 
 /*
  * Handles access to multiple SMBus ports on the SB800.
diff --git a/drivers/i2c/busses/i2c-piix4.h b/drivers/i2c/busses/i2c-piix4.h
index c4c20edacb00..9a5faac3eedd 100644
--- a/drivers/i2c/busses/i2c-piix4.h
+++ b/drivers/i2c/busses/i2c-piix4.h
@@ -37,4 +37,9 @@ struct sb800_mmio_cfg {
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


