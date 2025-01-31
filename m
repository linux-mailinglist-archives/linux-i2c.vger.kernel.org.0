Return-Path: <linux-i2c+bounces-9245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5ECA2423E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 18:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C496188A124
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 17:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496A61EBA02;
	Fri, 31 Jan 2025 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eLAPV4Vv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2741CAA79;
	Fri, 31 Jan 2025 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345847; cv=fail; b=sEpLadRekXRrhHHXqOCPcANoYfOBsJ1ol1T7DqZhhQ4s3OnpJo+2omKqztiWYruANYuW2fqJk8gz5ZpXX989RZxyp6/AhnCZjGA0QVNmwTYhGC0asVn5zXhzFBQHB9AmMplgKVbgBM11RlHayAxrnluUDRy4pOct2Ks0dXob4Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345847; c=relaxed/simple;
	bh=5w9hnYt6m5DAMmKVvxYOVf0Mdl8vuu+0HBUGkEMGvsY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fJI2uwCtQpeWMp5sS4WcccLRQuScdgVB/jL+BWMsfahM1tO5hCmeSz/gE0p/3zKMrvWg+oJgobBGRSzU3JIeJ6TX6C98U7FlpXNOT5jfdtupDSTq+8SI2XseD7sJAmj0wJItWkbgNJQrmvPlAuLg8eZE42tt5LKZ4hMDF4zcjiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eLAPV4Vv; arc=fail smtp.client-ip=40.107.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh+QNjxTBsuvB9hFspYC0bSFCAG3IaO7t2Q3e/nlejMtfo4LGoIzL9Q0rHzG+jczEOgu5hXYoKWmxpXejEZ+vNU+c7kp5ds8b8OVUlgbwRTPKZ6X79YeMLQl30aLNoBUKgPxiAPVGzDZwQ6V4MYy24ASX0HX6fxKwl/YclckjMmTAL7aIgq48smapMUgmUkr91rCI0RIAoFi1t+TQOLaRXUPQRaJHcW48R3XtCb5r9MHa0es5sDUVHEHM4Y6frseoGiVBMJQE1PrR3WbLC8WNCZCIY/Xr3chOsQ6We1XrE3Kg4qz5wUBmEgGJ1FpiT5hc2/zoEg5CSMS2cSzTyrvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxegOrBEAMTAd/VC17rtI1U40KQ1CWCJhon5X1u9eZs=;
 b=bfjYWHubzASgSdQ8fzq39jaxzCr1anjMoXzFJQawe3F3h1uA16nESEL8bj7YDBkbji8RCsIXabNDrZbWbYtzcT/94qEGmdcSUYUtOKWVwcBFqheqV719CwJONqLnLPTWkK+DG1BxATamvxltbnG99jlUTPx4zSe2/lBSKWXfizT4X2MFGunSHsyGhp9F2hf53YDsQWrSABHueIt8/MyYtvLfCKLe1p2o2ISeWg1jm5XOM48tq2dHZUQB3sW5sGO/hNMm4TyygS92XdhTSo6MiCcz332Wy3+ws9kNR2qtx0uh3IBm/r2Q+qpotlIFGDRBR302oBwrPoIGmJQdbeSsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxegOrBEAMTAd/VC17rtI1U40KQ1CWCJhon5X1u9eZs=;
 b=eLAPV4VvbDlwecr0k+wnKKFCu3M7JCECh/O5dc7u/0V2e4AQaAq4pBDx8pc6VFAxCDh6QmVE7aBXI8+KbPcrTTt1ESvMXMJ7Jt76LEq40xoO5U6oty/CwGBIQddh8f0qttXLwwnFezzOW246Y07dQ/2fYlLHP2cz7aKcFw64ypJdxi+OvfX8eKoOcy51lL7JCpVE7Lkv8GzWaOlRULLIoZ0WarXwbORbTWnoxXXE0Q6uV78QG9TxmEDgaCGFZgUVR2JTkZQE5C820voFSlYdpPGGKaLp5N8OaTwptD5OCFpWVyDV01Mbrne03LktgFeVb9c2rppJO/tkAqXaOZ0IQg==
Received: from DS7P220CA0055.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::7) by
 PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 17:50:42 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::f8) by DS7P220CA0055.outlook.office365.com
 (2603:10b6:8:224::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 17:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 17:50:41 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 31 Jan
 2025 09:50:31 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 31 Jan 2025 09:50:30 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 31
 Jan 2025 09:50:30 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <andi.shyti@kernel.org>, <kblaiech@nvidia.com>, <asmaa@nvidia.com>
CC: <davthompson@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cbabroski@nvidia.com>
Subject: [PATCH v3] i2c-mlxbf: Add repeated start condition support
Date: Fri, 31 Jan 2025 17:50:16 +0000
Message-ID: <20250131175016.2790291-1-cbabroski@nvidia.com>
X-Mailer: git-send-email 2.47.0
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a00c8f3-5e1f-4cd7-ee61-08dd421fc7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G1zpNbQ5hSH/HhId2SfYQFs08qNtnDhenTkvvLW+e/kZhMSG0Q7Xc/j/XTUx?=
 =?us-ascii?Q?xcOhTt8niOTHIp0wUaXDUs6nE4Z68/PNlV0Y5BbF//qrbrwSNG8po2iPounj?=
 =?us-ascii?Q?frNNy2MVKROo25FOwj1azhR8rVnZC0rEcOrF0fy++ZXgP91P1eXegwXThwWh?=
 =?us-ascii?Q?4PGQecRleoumQVtgSVnpUxicu3gcse/qOcqHP2WvpH4YJVcSX+soSV36w06O?=
 =?us-ascii?Q?xBxYzhyD0fYjB7qx60QQ4Hl0LPjO53U/vUq1YPSkzSRF4tvvj7Wvl0AXF38R?=
 =?us-ascii?Q?Ir5dgic5HzoWyZ52UI5Rk1S+EXULo0CAx12kv43Jv08bTmJHvIxqExRLUPgr?=
 =?us-ascii?Q?HquKdZfkPU2o2dvdX+Fi4dqqsJnol4A/fPifPB1eHvDUMWIhsPOZpQ9NBZOR?=
 =?us-ascii?Q?ljXz5PC6Fnzc4ZQux1ueaIKhoyc7lkhhHIEDHsJBcTDDpol/YWVPAK4jxnyC?=
 =?us-ascii?Q?82bLGZxasAhjdlCnkP2lxdaF//qi/vlSPzbOac0+4LGLLlPNXxR2pwWR9mXa?=
 =?us-ascii?Q?Qq0T7SqGWVQs8oTUXSg/fo6Q264QTlcXJJeRH2+NoNE7FLItuY8GPdionUNk?=
 =?us-ascii?Q?c5IY2mfs8X+hALWXlCNSOuKMbw4q99nzHfjljLyNluuEIHYkaPj2pmvDJxhb?=
 =?us-ascii?Q?j5YmRBS/rVdmoxfIP2UlYUMU24aAhmgj1X5mW9oqnnZ0aYQRAVU8d3A2NsB8?=
 =?us-ascii?Q?MPnSryDjXDvWj5TLfUI4XtqZCVRVmGhboF7trA6bO7IyG3Qx3nnpd9WFzBrb?=
 =?us-ascii?Q?per7c6YFldXEGYeg+Or+SQDsHIv5GyeMvSVpebaKudX/GybACvlz5FcOa3CT?=
 =?us-ascii?Q?o6yOB2k0puoU5nMqs90TITlacT4IMrFmMq6pqD8rV1HANl+v4fPQhSPYKUA/?=
 =?us-ascii?Q?GrDEcP9oyDTJJpTd+s3ztHOimyu2B+Q2Ox3WaKtsd1qVSSIecC/IIcvjhlB+?=
 =?us-ascii?Q?Ji7WUjKNqRpJOZWv9xOx7cODhK1LL4mR7Sh7aJhB+OekZ79zILU76Vh4+Q1M?=
 =?us-ascii?Q?pLjg6Vzqxzoj3x+9uf06fg1Cqjkf3ajSAbWu3VnMFWWIoE5KHZ4eHX1luQXp?=
 =?us-ascii?Q?xKJzxkoKvOymVaa+oSQo7VirnrbT5hMoDrv0g6wBDnLTP8tlmU+1d7wwZpzJ?=
 =?us-ascii?Q?T1kAlwHUWWF50jWdcIPWE5mufupdqFJ8TIax4+OSYMQ4JJzwZVbAzmTk0fXE?=
 =?us-ascii?Q?9xACjWb9pkCYlIpnN+mWEonvuiTB4HltaL8PtGnaoj8bt/KkxAbWnG1ajRrU?=
 =?us-ascii?Q?uNfzhbGUI5L1nNSGlNeQjFMtt3HAQnRhNW+/S41ZEbkekropgB0/iL+iy6B4?=
 =?us-ascii?Q?l3/hbfJHF/w6uMjFS4SAU7Yum6CRUrV73o7yI0+Mq1wfD0IoVw2MXr+OGrbP?=
 =?us-ascii?Q?/qiZt2nV3qlAcMZMd7jqWyU943pstSvE0u9lLN3AmGsSvL3Dx4TT18lsTkuV?=
 =?us-ascii?Q?I0Gm/sxfGVgmQDUfXMAxql7t6waGb9nd8ivAgA6jmjdOnwuMl1cOueCBut5o?=
 =?us-ascii?Q?k8n4uPnegxdh0H0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:50:41.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a00c8f3-5e1f-4cd7-ee61-08dd421fc7da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607

Add support for SMBus repeated start conditions to the Mellanox I2C
driver. This support is specifically enabled for the
I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
communication with an I2C device on BlueField 3.

The I2C bus timing configuration values have also been updated to fix
an issue found when testing block reads requiring a repeated start
condition. The "timeout" value, which determines how long the clock
can be held low before the I2C transaction is aborted, was too short
and caused unwanted failures. It was also found that other timing values
do not match the configuration that is recommended and has been verified by
the BlueField HW team so those values have been updated as well.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 V2 -> V3: Cleaned up code and address review comments
 V1 -> V2: Removed default "Reviewed-by:" tags

 drivers/i2c/busses/i2c-mlxbf.c | 68 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b3a73921ab69..3f8b4574f735 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -196,6 +196,7 @@
 
 #define MLXBF_I2C_MASK_8    GENMASK(7, 0)
 #define MLXBF_I2C_MASK_16   GENMASK(15, 0)
+#define MLXBF_I2C_MASK_32   GENMASK(31, 0)
 
 #define MLXBF_I2C_MST_ADDR_OFFSET         0x200
 
@@ -222,7 +223,7 @@
 
 #define MLXBF_I2C_MASTER_ENABLE \
 	(MLXBF_I2C_MASTER_LOCK_BIT | MLXBF_I2C_MASTER_BUSY_BIT | \
-	 MLXBF_I2C_MASTER_START_BIT | MLXBF_I2C_MASTER_STOP_BIT)
+	 MLXBF_I2C_MASTER_START_BIT)
 
 #define MLXBF_I2C_MASTER_ENABLE_WRITE \
 	(MLXBF_I2C_MASTER_ENABLE | MLXBF_I2C_MASTER_CTL_WRITE_BIT)
@@ -336,6 +337,7 @@ enum {
 	MLXBF_I2C_F_SMBUS_BLOCK = BIT(5),
 	MLXBF_I2C_F_SMBUS_PEC = BIT(6),
 	MLXBF_I2C_F_SMBUS_PROCESS_CALL = BIT(7),
+	MLXBF_I2C_F_WRITE_WITHOUT_STOP = BIT(8),
 };
 
 /* Mellanox BlueField chip type. */
@@ -694,16 +696,19 @@ static void mlxbf_i2c_smbus_read_data(struct mlxbf_i2c_priv *priv,
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
@@ -738,9 +743,11 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
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
@@ -799,7 +806,16 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
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
@@ -825,7 +841,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 
 	if (write_en) {
 		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
-					 pec_en, 0);
+					 pec_en, 0, stop_after_write);
 		if (ret)
 			goto out_unlock;
 	}
@@ -835,7 +851,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		mlxbf_i2c_smbus_write_data(priv, (const u8 *)&addr, 1,
 					   MLXBF_I2C_MASTER_DATA_DESC_ADDR, true);
 		ret = mlxbf_i2c_smbus_enable(priv, slave, read_len, block_en,
-					 pec_en, 1);
+					 pec_en, 1, true);
 		if (!ret) {
 			/* Get Master GW data descriptor. */
 			mlxbf_i2c_smbus_read_data(priv, data_desc, read_len + 1,
@@ -940,6 +956,9 @@ mlxbf_i2c_smbus_i2c_block_func(struct mlxbf_i2c_smbus_request *request,
 	request->operation[0].flags |= pec_check ? MLXBF_I2C_F_SMBUS_PEC : 0;
 	request->operation[0].buffer = command;
 
+	if (read)
+		request->operation[0].flags |= MLXBF_I2C_F_WRITE_WITHOUT_STOP;
+
 	/*
 	 * As specified in the standard, the max number of bytes to read/write
 	 * per block operation is 32 bytes. In Golan code, the controller can
@@ -1174,7 +1193,8 @@ static void mlxbf_i2c_set_timings(struct mlxbf_i2c_priv *priv,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_THIGH_MAX_TBUF);
 
-	timer = timings->timeout;
+	timer = mlxbf_i2c_set_timer(priv, timings->timeout, false,
+				    MLXBF_I2C_MASK_32, MLXBF_I2C_SHIFT_0);
 	writel(timer, priv->timer->io + MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT);
 }
 
@@ -1184,11 +1204,7 @@ enum mlxbf_i2c_timings_config {
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
@@ -1203,8 +1219,8 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
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
@@ -1219,24 +1235,24 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
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


