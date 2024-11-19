Return-Path: <linux-i2c+bounces-8059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776279D2FE8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8469B232F1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 21:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172531AAE33;
	Tue, 19 Nov 2024 21:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6Nzy8m7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2050.outbound.protection.outlook.com [40.107.212.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191CC1547FF;
	Tue, 19 Nov 2024 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732050763; cv=fail; b=NM0SN2N34iB02mcWV3+OhNrk9cEy9CjeMZIA2aLSmO0pBRVAYZg30liOcmIeSb/CReN/GAUAebcXwAd5Km5M3yBNTCOzyeze95z2bLS+PwM11OrSccbeRSVpS++bBv6PuCzu5rZmle2uio/A53lfhVV6ZfIBUFAVgX9VEZfNMmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732050763; c=relaxed/simple;
	bh=Fm4po6/YHVduCuUrYoAPVuSasv1zyCrtEVmXzM9HFWU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hgQJKFW/DUk7yGwmkoMUqgPnka7q35VVEbDsdzQH6gQXPoFRDS2pYbw0X3HiCaxZxaaxWquAZOTTqzIa0XXIxhwtWzQ52ZQtiRLFfowEsX+Wnk4jxeY61p6AaLJ5sph/Bq8XZOAFA0f4c1D6/AcZZ/xA8jViC5wjMf2dcplsUhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g6Nzy8m7; arc=fail smtp.client-ip=40.107.212.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+6UcOX+cjIxQIP1+6zc7E4jrnxQYsP4sol0Hp9Spr+Flf37kZU+SCNJCRDYlrnoP8wTJmmwESYy/egSC/fapib9SH4J5ssdLCHRVPjmwqX+39fq250vvT0+44N7ljPmXcbBVYB0MN2wdBDjENyqhQfc7ySylLHtN+W49hFfkkW4YsrpclrRiPQqEwk1bVBgPNQc3TOZ1acr+wHJc2hBrwVV8m26WU3T4OePIqi9BKxFJJY2aueiAG8rBi8tKwSAsLvsRy7Deh06Cumi8LXx/uCUzfiAdGKkedz1l8IseBwreHNAH26mpdYosijxLGEmNcscZMFDqSb7r34n8DBqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AihccpOYefC7UoTP8kZsnFoaczzI36/QowcQVyBkwJ8=;
 b=Y3D6Aud1wjJu87BgzZZfozE3SxTU7bel/JFm6Gpu6+MXPTCKhlJQO410q5DewQN17KCQuNONh0JFSWkpPrTY6C6ivVF0GR1Yvbnr9N/JoibG7c2URT7RdyqBLNRK1wkODoO6WE8hE+lUH2KPedNblx0zNJE4t/G7UdIBy3X4YdZ/n5AKrRMkqiugj6PBG92N3z5M9CiS0MPHsyAjhwCBe9PoqqhNG9NHNQdu2MkJRhWDX2OnJnS/yWmsUxiZZJmEjAKRMqmWSF2KuzCuosQ2N2JmYpebiZIz3ook+kU61hexHisD3OeSo18t7fvSnYZ9QzmTOdBWug9R1fLvhemd/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AihccpOYefC7UoTP8kZsnFoaczzI36/QowcQVyBkwJ8=;
 b=g6Nzy8m7Alw7G0bI905whh7QEUmJEutPwcj05bCUgslQxy0FFXuJFRvkLIP08lcBvKSsxfTa98W9Eg5NB+TWO+kxxm8kfWThKb/a+/vzlPXcKPpLYbib9VFHeXVf09oOo1ivGwpOTQryX1Gmv2Mbt7V7P+KvHklqksh/NdHqfbKX58llZPn6vRqLquJRvQcMUAnw56ljuJmd+k5qwB/T2vlmo/0btQNRr4LBsbWMUSteYC+D6S+93MEVvP8LiKSQy+H05bJTK/BzF3foZ2PklaBh3iNmsiHwdCZ4jODuwijJij5rR59/orEiRo8jT2sS4FIEpVzr4yqu0CXdnZEEdA==
Received: from BN9PR03CA0315.namprd03.prod.outlook.com (2603:10b6:408:112::20)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 21:12:38 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::dd) by BN9PR03CA0315.outlook.office365.com
 (2603:10b6:408:112::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 21:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 21:12:38 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 19 Nov
 2024 13:12:22 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 19 Nov 2024 13:12:21 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Tue, 19 Nov
 2024 13:12:21 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <andi.shyti@kernel.org>, <kblaiech@nvidia.com>, <asmaa@nvidia.com>
CC: <davthompson@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cbabroski@nvidia.com>
Subject: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Date: Tue, 19 Nov 2024 21:12:15 +0000
Message-ID: <20241119211215.352797-1-cbabroski@nvidia.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 308e04c2-7557-4919-1a69-08dd08dee595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OEXxa06Z5sDF7mMi+0k8/Z9909FsrQhBHua05U2mnmqJvqmZqxRYN9gHQs94?=
 =?us-ascii?Q?itPoWGK+Zl9NV5uxf8pEbX6jLlFIqAZQpjKK+zDhbsT6vmbsxw9102reB8Nr?=
 =?us-ascii?Q?186VekJ7ToKWsq8p3GRTcBQ5Xr6WNEaReCB2ewNyXKZlOaDAACsF9dcZ5je3?=
 =?us-ascii?Q?oU0Vsv1qg+/CoWQm/Kt8pYiXVpLuqyB6p9JpgswU6Fz/Y70QMUwjBK6p3y8w?=
 =?us-ascii?Q?fSJUMxvY8c3PDSJPx9lRm/xx5Ky35HUW4sBTRLqL1lKBYXF6YD58c8E1lMdU?=
 =?us-ascii?Q?UAo/F8za1UHzeVuypjtNUMRHm4d+0+CLFM76vmF+0m9ATVo9GKi61yo4xBqk?=
 =?us-ascii?Q?5XoMJmpvL4Hb4BwUjB4oyVA1XcnYB/vtwkVd7SSCZywiQYTxenTxjWQgYFLj?=
 =?us-ascii?Q?mjmp3stLqMpqb9rNy+oK50xRN77AS+ElrEpals9jaHy6mEjmzEGpnw2NW2od?=
 =?us-ascii?Q?Y1BwK4Wa081VjXf+MppPcdBpvXFqIbw71t8yHvHJXDUvCcufIWoka0WR+2S7?=
 =?us-ascii?Q?P5G0W7VxF26fB13rniCcWhtDvf5fCNDHyIOWMJDKCL01wISyEMJXPCTrY2kf?=
 =?us-ascii?Q?g4M5vQQLFvcWLHajV9F1FiSuyBEsEDE0OuNmO0WBEiMCdtl8GCdOpxkpv1er?=
 =?us-ascii?Q?8iZ5ajbsDvvwsaTN7+Jzkp7J3aESzzi5vf8S35MHpUtu7SLBx/yTKyHLZnN0?=
 =?us-ascii?Q?XXe/LzFLETkXOAY7Kc1K2tvuv6R7tVTjC/i2FjB1WHuWDiZHzFYs0/PNcg0F?=
 =?us-ascii?Q?G2rNi5pNqBPyNw6AOp2AiltmPDSOgdbO6ivtdEwbnL1aVbFbtpMoBFnyZ578?=
 =?us-ascii?Q?msg/2O+/1ZvtoxUgEuobcb/ANO2LUiNkqsQRoE5QZbZU6ptH1O8/l8joI9/n?=
 =?us-ascii?Q?TmvmMGxBIYXEAyrfFZfL+g/p343bNAgZJOWe7AB8VOJspj0GdzVcbVLrS0S3?=
 =?us-ascii?Q?AfZIuAbLVCslmjJ4ZU2ZmbEMlE6Lu7GVHXuCOzeigqgfAKCD1buAcuQCbuaJ?=
 =?us-ascii?Q?xv/MZna3jhkLBXByneedjX32odceBvtX4IFWAol+AlksNfnHgYLI+iuOSVlS?=
 =?us-ascii?Q?AS00vC+Vs5tsXaMRZ1tPmAiByIcCVvzDZ3cD59EAUXq/QFGeHlSxyBaLNoLT?=
 =?us-ascii?Q?kH9YfQz1LjnLr60FF97VnBeF/8/C0kIcwmjIsULFgu+Lms+hixQ/rktI0/xc?=
 =?us-ascii?Q?lhuTym2jjo/FP9Yjkgp4IHsuGjRQ6Ook1gjkcfGJbl3+roGeMUwITVK+Bjls?=
 =?us-ascii?Q?lDWy5PP3ybYNKP560a673R/jlo7P6JiLRWVr7mRep/3BpYYxkvfnJrX+Ze92?=
 =?us-ascii?Q?2Pt3K0cvbBKCMxx83WXQVJ7e5WpIUJ3sLDEgn6dCzj2EMaBfGDrDo5U9V4Mp?=
 =?us-ascii?Q?GRnrvA/bK1VnvkIso89CEf6/mre427hcscYD0C7KBtyF/2eUBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:12:38.2119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e04c2-7557-4919-1a69-08dd08dee595
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

Add support for SMBus repeated start conditions to the Mellanox I2C
driver. This support is specifically enabled for the
I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
communication with various I2C devices on Bluefield 3.

The I2C bus timing configuration values have also been updated based on
latest HW testing results and found to be necessary to support repeated
start transactions.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
---
 V1 -> V2: Removed default "Reviewed-by:" tags

 drivers/i2c/busses/i2c-mlxbf.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b3a73921ab69..8926dafa0270 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -196,6 +196,7 @@
 
 #define MLXBF_I2C_MASK_8    GENMASK(7, 0)
 #define MLXBF_I2C_MASK_16   GENMASK(15, 0)
+#define MLXBF_I2C_MASK_32   GENMASK(31, 0)
 
 #define MLXBF_I2C_MST_ADDR_OFFSET         0x200
 
@@ -221,8 +222,7 @@
 #define MLXBF_I2C_MASTER_STOP_BIT         BIT(3)  /* Control stop. */
 
 #define MLXBF_I2C_MASTER_ENABLE \
-	(MLXBF_I2C_MASTER_LOCK_BIT | MLXBF_I2C_MASTER_BUSY_BIT | \
-	 MLXBF_I2C_MASTER_START_BIT | MLXBF_I2C_MASTER_STOP_BIT)
+	(MLXBF_I2C_MASTER_LOCK_BIT | MLXBF_I2C_MASTER_BUSY_BIT | MLXBF_I2C_MASTER_START_BIT)
 
 #define MLXBF_I2C_MASTER_ENABLE_WRITE \
 	(MLXBF_I2C_MASTER_ENABLE | MLXBF_I2C_MASTER_CTL_WRITE_BIT)
@@ -336,6 +336,7 @@ enum {
 	MLXBF_I2C_F_SMBUS_BLOCK = BIT(5),
 	MLXBF_I2C_F_SMBUS_PEC = BIT(6),
 	MLXBF_I2C_F_SMBUS_PROCESS_CALL = BIT(7),
+	MLXBF_I2C_F_WRITE_WITHOUT_STOP = BIT(8),
 };
 
 /* Mellanox BlueField chip type. */
@@ -694,16 +695,19 @@ static void mlxbf_i2c_smbus_read_data(struct mlxbf_i2c_priv *priv,
 }
 
 static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
-				  u8 len, u8 block_en, u8 pec_en, bool read)
+				  u8 len, u8 block_en, u8 pec_en, bool read, bool no_stop)
 {
-	u32 command;
+	u32 command = 0;
 
 	/* Set Master GW control word. */
+	if (!no_stop)
+		command |= MLXBF_I2C_MASTER_STOP_BIT;
+
 	if (read) {
-		command = MLXBF_I2C_MASTER_ENABLE_READ;
+		command |= MLXBF_I2C_MASTER_ENABLE_READ;
 		command |= rol32(len, MLXBF_I2C_MASTER_READ_SHIFT);
 	} else {
-		command = MLXBF_I2C_MASTER_ENABLE_WRITE;
+		command |= MLXBF_I2C_MASTER_ENABLE_WRITE;
 		command |= rol32(len, MLXBF_I2C_MASTER_WRITE_SHIFT);
 	}
 	command |= rol32(slave, MLXBF_I2C_MASTER_SLV_ADDR_SHIFT);
@@ -738,9 +742,11 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	u8 op_idx, data_idx, data_len, write_len, read_len;
 	struct mlxbf_i2c_smbus_operation *operation;
 	u8 read_en, write_en, block_en, pec_en;
-	u8 slave, flags, addr;
+	bool write_wo_stop = false;
+	u8 slave, addr;
 	u8 *read_buf;
 	int ret = 0;
+	u32 flags;
 
 	if (request->operation_cnt > MLXBF_I2C_SMBUS_MAX_OP_CNT)
 		return -EINVAL;
@@ -799,7 +805,16 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 			memcpy(data_desc + data_idx,
 			       operation->buffer, operation->length);
 			data_idx += operation->length;
+
+			/*
+			 * The stop condition can be skipped when writing on the bus
+			 * to implement a repeated start condition on the next read
+			 * as required for several SMBus and I2C operations.
+			 */
+			if (flags & MLXBF_I2C_F_WRITE_WITHOUT_STOP)
+				write_wo_stop = true;
 		}
+
 		/*
 		 * We assume that read operations are performed only once per
 		 * SMBus transaction. *TBD* protect this statement so it won't
@@ -825,7 +840,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 
 	if (write_en) {
 		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
-					 pec_en, 0);
+					 pec_en, 0, write_wo_stop);
 		if (ret)
 			goto out_unlock;
 	}
@@ -835,7 +850,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		mlxbf_i2c_smbus_write_data(priv, (const u8 *)&addr, 1,
 					   MLXBF_I2C_MASTER_DATA_DESC_ADDR, true);
 		ret = mlxbf_i2c_smbus_enable(priv, slave, read_len, block_en,
-					 pec_en, 1);
+					 pec_en, 1, false);
 		if (!ret) {
 			/* Get Master GW data descriptor. */
 			mlxbf_i2c_smbus_read_data(priv, data_desc, read_len + 1,
@@ -940,6 +955,9 @@ mlxbf_i2c_smbus_i2c_block_func(struct mlxbf_i2c_smbus_request *request,
 	request->operation[0].flags |= pec_check ? MLXBF_I2C_F_SMBUS_PEC : 0;
 	request->operation[0].buffer = command;
 
+	if (read)
+		request->operation[0].flags |= MLXBF_I2C_F_WRITE_WITHOUT_STOP;
+
 	/*
 	 * As specified in the standard, the max number of bytes to read/write
 	 * per block operation is 32 bytes. In Golan code, the controller can
@@ -1174,7 +1192,8 @@ static void mlxbf_i2c_set_timings(struct mlxbf_i2c_priv *priv,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_THIGH_MAX_TBUF);
 
-	timer = timings->timeout;
+	timer = mlxbf_i2c_set_timer(priv, timings->timeout, false,
+				    MLXBF_I2C_MASK_32, MLXBF_I2C_SHIFT_0);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT);
 }
 
@@ -1184,11 +1203,7 @@ enum mlxbf_i2c_timings_config {
 	MLXBF_I2C_TIMING_CONFIG_1000KHZ,
 };
 
-/*
- * Note that the mlxbf_i2c_timings->timeout value is not related to the
- * bus frequency, it is impacted by the time it takes the driver to
- * complete data transmission before transaction abort.
- */
+/* Timing values are in nanoseconds */
 static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 	[MLXBF_I2C_TIMING_CONFIG_100KHZ] = {
 		.scl_high = 4810,
@@ -1203,8 +1218,8 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 		.scl_fall = 50,
 		.hold_data = 300,
 		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.thigh_max = 50000,
+		.timeout = 35000000
 	},
 	[MLXBF_I2C_TIMING_CONFIG_400KHZ] = {
 		.scl_high = 1011,
@@ -1219,24 +1234,24 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
 		.scl_fall = 50,
 		.hold_data = 300,
 		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.thigh_max = 50000,
+		.timeout = 35000000
 	},
 	[MLXBF_I2C_TIMING_CONFIG_1000KHZ] = {
-		.scl_high = 600,
-		.scl_low = 1300,
+		.scl_high = 383,
+		.scl_low = 460,
 		.hold_start = 600,
-		.setup_start = 600,
-		.setup_stop = 600,
-		.setup_data = 100,
+		.setup_start = 260,
+		.setup_stop = 260,
+		.setup_data = 50,
 		.sda_rise = 50,
 		.sda_fall = 50,
 		.scl_rise = 50,
 		.scl_fall = 50,
 		.hold_data = 300,
-		.buf = 20000,
-		.thigh_max = 5000,
-		.timeout = 106500
+		.buf = 500,
+		.thigh_max = 50000,
+		.timeout = 35000000
 	}
 };
 

base-commit: 0a9b9d17f3a781dea03baca01c835deaa07f7cc3
-- 
2.47.0


