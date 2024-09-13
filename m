Return-Path: <linux-i2c+bounces-6711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC8977F57
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BAA8B25788
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CAE1D935A;
	Fri, 13 Sep 2024 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZQfc78g0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C01C2329
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229521; cv=fail; b=Qm69B3RnIVIYQncHUD52KUg4nrZsfFyJKjG5CDnLMlLBa+kuairsd8e+WXU0IgS8zxv9i8nLa+dtl2UmwxevW/ZfqKFjDCbMYAl/KcO+povvNoUefhUqAUtgXXmIQV3tKqWtBZ4YPQDoR/KgAC4YrEGQZ1B2SFBpj+G5S71rMV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229521; c=relaxed/simple;
	bh=CPCR44+rG+0Ildkk0srAQL7vppVAwH5jDO6xZ7pYyUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0c3ZwfIVQdoRLqUDCVdvEx7C230OnR7X+vsp6vA5I3Lz/wxyrsmEw8a5+3q5lxOvbwRmzGzgu3mJGfWvQNW0yhZt980+Ee8XGosghnYlzz0+aJ8bDt9zceLuIhWGY+evEYBbf4+eFqN2Ikk71tdyyBQRbKs8DNmi8gxc8KSDb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZQfc78g0; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKC0O32Se/WpjmBybGzzAJgNeyCIWV8ZntsN3wScGRzfkUmALfbglPJjs46QE+otIMWZfCJbXZ/WUhVE368ksrZUGur8Tolb1JAyNjR2/ftT62GFCEgZtFVwZgSfo6gL+hVJE1SWGuwcieJEulvX3MZWiRTevYHlsEH0e7RUVUr9fvhYNYss7zs6Tn3QtopE/cgqwW6oORFPiM0oy5M3VeTAUU3G92/TVqLpJdLITHXFxjfxotv/aQALTb7fBI7VsE/pM7SbPCvdLjGGq4RaJdXwxJ1t7p8mgShsIwqldmVM3qZXea/rAiqYC52IZ6U8cjXXNZV8oT57NZklGlF7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8X92reLtvPO5QKuDUOJvFqig/cxf1Tj93LE9zwF00k=;
 b=MbyoANbvLiXn1W4fJm9LBybKtsTXokFMqJ+H0T6lBGkRj4HxxTQP7Oph4JbxFeyDX8QvXVv0czFsfFHNVij0LJeOvpuh/Kiz2WOeE0K3MWk15LPcQv560xxi5HemLS+gR+Tw//FDDd5oR5ha6BjRYTAY9Q8lNDfL32EZbom50PjFVRTepqbOlIy36wW9LxIadDl8VXLvHjPtRAT8PTkCYZRw2Qsgd26yGtQeC2KdCjXpLdW/u7hse7IpodsO0DMPu+kniSMzXJBZd1LYRNerQU/SfbCKd683X8nkcxe773Dx01a2SjYJeL/nMvnZVIZnVEensbUGhy/wHgJyrrJygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8X92reLtvPO5QKuDUOJvFqig/cxf1Tj93LE9zwF00k=;
 b=ZQfc78g0abT84apR5t4dfPTKDWudoXKTYeqH0h3pWbwykKtgcX6S4ksDptftwR/+n3dfvUsx16DDWk0wV+Yl2v4VLfymv9bxYA4yqvdsFe3k1s9Qjr84ktBdZc0tXZDV3I5H05i9nuBhVOn2UWGZZ4dwI20/D9cCy1Mhjc2hfHk=
Received: from CH0PR03CA0246.namprd03.prod.outlook.com (2603:10b6:610:e5::11)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 12:11:54 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::48) by CH0PR03CA0246.outlook.office365.com
 (2603:10b6:610:e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as library
Date: Fri, 13 Sep 2024 17:41:05 +0530
Message-ID: <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc648b2-e333-4b9f-e148-08dcd3ed41ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DsQYNSMwqB7bo4xCZakTvljmt3Yq5wqhaEEwsKQYoDkmMfd0ydbG7EIgpIhz?=
 =?us-ascii?Q?84sTexLdZTFTIlwzwWL3mqi2YxYzQk3izYNjIhEabWm8J/jJW7W/F/oqhKeP?=
 =?us-ascii?Q?xKZhLtJmnN9sOJBZKyveWEfPbNyI4CBlx+BHa25kQeNsS50xK5euevetUwVi?=
 =?us-ascii?Q?lFRqgJiYbZIGdv2wv0G2Xt1RLNMsEQPtBEQUR2wJar2nm4tmnBPylepIAxoB?=
 =?us-ascii?Q?T9jSU/SJspSJMthG9In911gDAXd4BxdtAG4wz9pP5mgIAqF9n73zic3UwSMq?=
 =?us-ascii?Q?fo9t+qgjSPl9OGSq89SzkLgS7mM4zl0cC27tOYpR+ELOikhoWmBeLZRicEdq?=
 =?us-ascii?Q?qB6bDAbpEWpKvOqv5vqtMu7JaU6ptQ2uCcqYlbp06b6xRS/B/WQvF0JKnEot?=
 =?us-ascii?Q?ogZW5uUAE/jsxrO1y6OtkBI4TqSSAkf7Z9fobmN5pL17pDL2UaYrmnaJzZjb?=
 =?us-ascii?Q?odNKhrZi6ox6ALwxK90yjEp5cVzYZ+hrUTapua74ic5LNvu8ysygoi094IUP?=
 =?us-ascii?Q?Ykq9NxUWNtHl4VFi5cEmgFubV4cChTCgIucScs7kg6994kWiZqLygjMVfzmz?=
 =?us-ascii?Q?LKa8+em8WUXC8O3IQUf9WId/9kaNyV9Chf0bqhw7PC6+trAQgd2WAsnqjII+?=
 =?us-ascii?Q?8SSYliVTCzm3QewjohZAuOcIU808WGfT2fViBsOt7gXAbTtpUFMycmZdhQok?=
 =?us-ascii?Q?HxHIp6YFtVqdyT9Jfj+lyi9e+NtFoXeyp7fG1EROxYm7q4S+iuMlS4Id4Kq0?=
 =?us-ascii?Q?b6ZG1IZSoXUvwx/0TKR6/DTCK6uObKquF260NjTAZ6L2ODdF2VTCmUm84Ndl?=
 =?us-ascii?Q?G7HHG0+W9k5gvg74dcYMuCii4Vc5l6x5ZQbB/K/Ldf4cDShP9LnI0yxpy6mj?=
 =?us-ascii?Q?bVIbkJtN/rbJk+ezZdYsH6vHT4E0ze7JUla+5mqMigLndJDQj3XWMv3xEJex?=
 =?us-ascii?Q?u2JVqysKxzPPJHr62M+Oonn0H9pnNWngz37YpcvIwHn/zJ5weBcKvDRLYWs8?=
 =?us-ascii?Q?CNxlkxMyx3eUavS+6167KPdDRbKcwfCzWo0923mBEZqpPP/lAnQ5BLFuNAnV?=
 =?us-ascii?Q?YvxrwQOGMt6b4mZkG99aPWhSYr7llRZx5HW3Fpd/G3Kr85ol5r7l73vy6+bL?=
 =?us-ascii?Q?kfLV/T3uIyX7t/ool1BPI6uh5MzIhqQ3J6kfqyfw53sd2Umy+PHL0KULR+hp?=
 =?us-ascii?Q?mClFv7QjYPf5zqlwkC2ISp/2TKAMKKwVEgAfArWQ/PAy8/D7Tr0IZXKTBNBI?=
 =?us-ascii?Q?Dz5cbhEyNRjRXVR+ac81al0LHqYKdxECZRcbY/et/+ix5NI6M6kLA3i6P+Wi?=
 =?us-ascii?Q?nPgN/xmdJsdnyrdgu2giEPIs0yavh1FBc09pzPUQ4tcWYbyBQXB2L+TrOzp8?=
 =?us-ascii?Q?bVFn7KZYo4cC5V9hTyuEVxPvthEa1iW8P7BGClKgAIYrs/5TOv3SDZjMOVdn?=
 =?us-ascii?Q?JAaEu0OuPLlLbmHc/b37r3K2QO34/giF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:54.5452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc648b2-e333-4b9f-e148-08dcd3ed41ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641

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

Note that the git diff view is presented in two separate lines in order to
suppress the checkpatch.pl "CHECKS".

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c | 16 ++++++++++------
 drivers/i2c/busses/i2c-piix4.h |  5 +++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 2c2a466e2f85..7e0fb51ce532 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -153,8 +153,8 @@ struct i2c_piix4_adapdata {
 	struct sb800_mmio_cfg mmio_cfg;
 };
 
-static int piix4_sb800_region_request(struct device *dev,
-				      struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_region_request(struct device *dev,
+			       struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		void __iomem *addr;
@@ -192,9 +192,10 @@ static int piix4_sb800_region_request(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(piix4_sb800_region_request);
 
-static void piix4_sb800_region_release(struct device *dev,
-				       struct sb800_mmio_cfg *mmio_cfg)
+void piix4_sb800_region_release(struct device *dev,
+				struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
@@ -205,6 +206,7 @@ static void piix4_sb800_region_release(struct device *dev,
 
 	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
 }
+EXPORT_SYMBOL_GPL(piix4_sb800_region_release);
 
 static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
 {
@@ -514,7 +516,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
-static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
+int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
 {
 	int temp;
 	int result = 0;
@@ -587,6 +589,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
 		inb_p(SMBHSTDAT1));
 	return result;
 }
+EXPORT_SYMBOL_GPL(piix4_transaction);
 
 /* Return negative errno on error. */
 static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
@@ -740,7 +743,7 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
-static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
+int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 {
 	u8 smba_en_lo, val;
 
@@ -762,6 +765,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
 
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


