Return-Path: <linux-i2c+bounces-10831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D7AACE12
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 21:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C549804AF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 19:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9427262D;
	Tue,  6 May 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dVGH1GQ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC64B1E5C;
	Tue,  6 May 2025 19:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559900; cv=fail; b=JRMYIYad2rxy4NLTm13X7/lMtwoeSsQfkV8/JOu0z8+VB3epcJOY0zClpfOoBc+NjRoz4lICjpfcB744tX0LhubvE4vmquYQ0ttF+Yiyts6md4C96WzX4v/qJ9wNfbtvjoFoVuRMF3/tDrMOqe1ir3X1KDLReJbnsYMOU1NXxz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559900; c=relaxed/simple;
	bh=ngwtiQQYL1B78qLnl3K8qH8ATs5abEEqiotM/p6xWpI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bwqAsS6myQ/SVevcSRbedyFL69gzC1vOJf61T49MPoIWKyEknC/mRwxbJ+ozUVfLkaEWq+Z8CEhWcLn+auHmB2kc5pxdBNkHMrLDY63fGYZ3G/Z2M4L0pjQznuG5n5UMNP2J8cvFimNzoACsL0PFYHnhFtWYHosFqHzcvq3ogwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dVGH1GQ7; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9Wt4/WpWuIOnAq6jMHfIKqxJINR2C51g87b8NO/4ZrZPBsbZeCyJ2kEuvpvPAPT4fZwHYmP+v1EbrWn3RgPLkiaJOl7ANp5co0MsXVeIo2DfncwP1Mb3c33HnID6Jr51DaGOREFiuYzsECaI0tT9Y/bRGhOqIyJXLG6O5jHK/9EVWc5TuSZmCI0B+/5DzzYgBdocwad1cLziiMt+UGQhsSvpJ01I88vEf6Ym2GITGiNq0/UlPw8JzViT4wlWMZWzs8A1lZFHYcPpZnrMFP5KQY6rg/uZeoYFJQrzZPnSq+vLIsfrN6B2+UvOLmHjkgis3k2nOBd9zTaBVQDSEwdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGsrda9jqotu6dGKepwo4n2eSVgY0yFNQgO+XpsLSXQ=;
 b=JcVB2qlgow7g4Te8e5svkU7iLsq8PqxzDwRN0fP0YzLYrxtkkiwOvGBsJ/FBusmwNjT3GqBQW1Fwj+YOh3h1+2OJ6r6hP7unUPNGQVstDfU0mGiLjR2a+Y75wylFED67m56IZhY0xbyp4jyj/iaIs5GLFZm8JTX+jUpQab0u2dCjjDe5qXi1UGDS24HjH4NHk51FKE0d5frdaVb3QMrKxHol2Pwf+ZZuQGFCMQdY14iPKBzGxGSllhSw5R1pB3dWH6YAx9JIY0JJ1S7imeQJ4Pvey9GVeVcx7Y8PK0gslfU5hb/AvCCjPkFVBx+t01BF4ln9JUKdU5aLN6hojH4XkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGsrda9jqotu6dGKepwo4n2eSVgY0yFNQgO+XpsLSXQ=;
 b=dVGH1GQ7edrWhjDgL/ExdE0s1ihEPIddFwRcC8fFEBViwow55r3maIjZCFWM/RRg6twpWNo0GWb4kMcW3Pd+KIUC3KiLTh99ZAMH8/9dDBRMTOWUAwgmiawXD+shi9enWB2FvPBymjMwAqRmoTprYJWSRrcS7L/pkVeCO6iScg7aC1N9/zsrkMtpWS96cA/B4k0vg/ATvp+AdL6ncCFIRCUZAA6vQLWKo8l8SMCgIAr3RMOqpzyuyvM5xoXOQuazItbZZYcjjdBpPAAWGYtdKxil29/cf8GEAXgnW6Jm07zvoxwnieQqZW4frVbTS6QHV6bFIp1+9ndj49piN48X9g==
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 19:31:28 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::d4) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 19:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 19:31:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 12:31:10 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 12:31:11 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 6 May
 2025 12:31:11 -0700
From: Chris Babroski <cbabroski@nvidia.com>
To: <andi.shyti@kernel.org>, <kblaiech@nvidia.com>, <asmaa@nvidia.com>
CC: <davthompson@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cbabroski@nvidia.com>
Subject: [PATCH v4 1/2] i2c-mlxbf: Add repeated start condition support
Date: Tue, 6 May 2025 19:30:58 +0000
Message-ID: <20250506193059.321345-1-cbabroski@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: a5440eb4-d03e-4526-ea63-08dd8cd49917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?01V9Npy0g/8TOms2Vd/IDDb/TeQWeSePMiR4zibH8YwgOKbEb+X4T1FhHiBB?=
 =?us-ascii?Q?CwHNlqdUGwBFXIo4i2T3PaSF+R5roQk3Qhlf3ee8L9JbaaZ0dP6BPZDlMGyB?=
 =?us-ascii?Q?l2fmhCeTFVZwve2fJXxGYYpFg+TeDNKIE5ey3ecQ5MC/2ewKNTMDxco/XTS0?=
 =?us-ascii?Q?RyKwkU0huvwsIiiY2qOSbY35ZQ/PGG1fBNVQC7c/wW3MMd5GWQPTzb1Siukh?=
 =?us-ascii?Q?gVgm13IcDL3cxoUTYtI7r1xle9m/05XkZCzncTCzjNhkRxpzxVGKGWjn2WT8?=
 =?us-ascii?Q?JIlXkYRjnCF/RRyQHOWaT3U6GoMJbzf8+3m1suER5jK4NTbxO1gZ6S5VbdSd?=
 =?us-ascii?Q?XCV/ONSDulx5jQEKX1pDViJW024ThIyJU/aFo8q4egtKVaFVOniDwIM+rGZF?=
 =?us-ascii?Q?NFLu32GkwlFB+Rf9S7jXeXgjeLLGFUS0hCmCRjNhSJa7y86ZXAZoYLHsPOyx?=
 =?us-ascii?Q?HVJwT7uk5moMAYt5IQUSyhSCQkYqIOo/IvlRMhQkUJxFHHKaVzSe0/nG8RAl?=
 =?us-ascii?Q?SjsPK5lqM07O9pfE5w46DH5bJacmKr/4L9BaYqX+oZ7FcEmmV6V3mdqjnrby?=
 =?us-ascii?Q?I/aj36WN+K0doar14W253u7TdtTrkvEfFdeV29EbwAZLGM5im1VahKhdL2/l?=
 =?us-ascii?Q?Ul8OqIOd1UbPQVPe4TphvpNJvZO7ilqtHgWfM9PbUvNJ0YLA4RIZcWEcJhR6?=
 =?us-ascii?Q?EddKIOUTtO8diomuaP2mvd80zmQDkCRVRQYzWFHFvXyWKuRzLs2c34WQTv1x?=
 =?us-ascii?Q?HsYBZI3upTx19MVSNMUFGrGEvYm2FcH6pfAGXGJu+ISVfyaRfU0hBi5LB3MP?=
 =?us-ascii?Q?/lkyt6t0AWaUTdCER9WF5yp9anK2jOO8T20BCL0e2VEVyUPZFEipOw50y6iB?=
 =?us-ascii?Q?JY3fqV/h6QMrFmoa4QpNz+3BEpfMd9dG64qDX2av10XE0Fxwhp09PPFmTp6x?=
 =?us-ascii?Q?8wu52mWdn/A/D/pxMcMDJYk3g+bUOFdkxMfmL3gfSHi4S2KStgztPW/5WKs7?=
 =?us-ascii?Q?qBZNDOfKB0Gv/0FwmcFz2lVPXbYZAJn2ta8cpb88lFF3F2C1Pwc8pacc9K/O?=
 =?us-ascii?Q?bq0wzWz9ML76Q8+Rk4e+CPkgEgaXlT3JE8GFGZtIUDyBG414swGyxBLoXv/0?=
 =?us-ascii?Q?M09aIaP12fAMEI3bpNsdTLTnaoIFun3YQfbkuLsTmsJPobnlyvUVb0X0+XHD?=
 =?us-ascii?Q?fhRHlWOSiowj/6+v4AzdDkt2BpwhmdT4XJznkSBOCZsOYxewZpUtb8o9fZn/?=
 =?us-ascii?Q?N2bCyjJ6fQksOdmiJAkUzApsLASMQ5LmeYLI48B/jCIl+vuzbBtElNYe/jsp?=
 =?us-ascii?Q?7RSPoJkuUBwB1+hOGpWwZfKNiUSb4I2M8m7u1n6UPNoRsyVOvIIdwwZT5uOi?=
 =?us-ascii?Q?yydhh9HPkcUqUGD76IBHmwj235BqkWIZ2wOK9fp8bLMzuKWYLTk/cPhF/5Mh?=
 =?us-ascii?Q?6yj+UuYy1pr1dKFaCsocDppJYhfPvlOwvHGI5hAiHklo/fa6OuIo3QZtNw/H?=
 =?us-ascii?Q?yCQpRN2BRomFAwh8teopKicgknJN7nRqwflj?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 19:31:28.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5440eb4-d03e-4526-ea63-08dd8cd49917
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115

Add support for SMBus repeated start conditions to the Mellanox I2C
driver. This support is specifically enabled for the
I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
communication with a specific I2C device on BlueField 3.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 V3 -> V4: Split changes into two separate logical patches
 V2 -> V3: Cleaned up code and address review comments
 V1 -> V2: Removed default "Reviewed-by:" tags

 drivers/i2c/busses/i2c-mlxbf.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b3a73921ab69..0f5b6a00c1b6 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -222,7 +222,7 @@
 
 #define MLXBF_I2C_MASTER_ENABLE \
 	(MLXBF_I2C_MASTER_LOCK_BIT | MLXBF_I2C_MASTER_BUSY_BIT | \
-	 MLXBF_I2C_MASTER_START_BIT | MLXBF_I2C_MASTER_STOP_BIT)
+	 MLXBF_I2C_MASTER_START_BIT)
 
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
+				  u8 len, u8 block_en, u8 pec_en, bool read,
+				  bool stop)
 {
-	u32 command;
+	u32 command = 0;
 
 	/* Set Master GW control word. */
+	if (stop)
+		command |= MLXBF_I2C_MASTER_STOP_BIT;
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
+	bool stop_after_write = true;
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
+				stop_after_write = false;
 		}
+
 		/*
 		 * We assume that read operations are performed only once per
 		 * SMBus transaction. *TBD* protect this statement so it won't
@@ -825,7 +840,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 
 	if (write_en) {
 		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
-					 pec_en, 0);
+					 pec_en, 0, stop_after_write);
 		if (ret)
 			goto out_unlock;
 	}
@@ -835,7 +850,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		mlxbf_i2c_smbus_write_data(priv, (const u8 *)&addr, 1,
 					   MLXBF_I2C_MASTER_DATA_DESC_ADDR, true);
 		ret = mlxbf_i2c_smbus_enable(priv, slave, read_len, block_en,
-					 pec_en, 1);
+					 pec_en, 1, true);
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

base-commit: 0a9b9d17f3a781dea03baca01c835deaa07f7cc3
-- 
2.43.2


