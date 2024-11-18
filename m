Return-Path: <linux-i2c+bounces-8028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4829D18E4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 20:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A7122828B9
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 19:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE54C1E2821;
	Mon, 18 Nov 2024 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CL5fFL46"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93101AA1FF;
	Mon, 18 Nov 2024 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731958156; cv=fail; b=HAbCN3PP6j0NsE3aWtGQWJNu7kCAvxS7/vuDq/9a+K+zwBBi5igq92QS6GPFoy6db+56Fdqu0Oxcr60w9NLg6ehkn5zGp/ZCMDiQ7rexzQrQG7Bg9N/XpVGJuFcCADAHE2k5+e1RJezPhxXKITDD7RLSpn+aGnNwejTMqEFR66I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731958156; c=relaxed/simple;
	bh=VXvnW0oZYJMRIfiH6t6O3laSj5EqcfM/Gi9CsCCKzoE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GClzz1XltG5G+MUMUY0v7zIn5O/bVPDRt4owUof58U3mg2n8dCL9QHtz+dwXSHQwZ0t+HkekTJZY9IFdEG2BHD4vfsi98DSVHQDDqbBKLJ5LOoVuYRQDMz5dEG58UJnTvg0CXtzDiO8BJVcjC3H0pElK/NLm3VaZrAgwATVWkLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CL5fFL46; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Urx6vlTup2gLF1CkLLzdx3raX9D27U2tPuHK42qNQeKOkVyBS7Z6TDjlQgVZfEGe+x+gOuV9VX/LD7aQGia6hWBTDbI2wU9vyrPdhWa2+HLDsPaN0wcC1zS+A74CWJa0uguUXVyM3gHCzsHsCX1l2+vuBwKCALp5tFH/Pzb70NadoSGWzi5fXDgMVRths6gEIS5zFUt1R7L/DWpPqpmS+FSS1dfFdo0Kx9ZOoVF8PMe0TVFbSY+wm3VS3XLfx1T4O/dSQxI9FJFhVjRWa3N4rIuqiaMPCVLnyLKCyMcG1Y8WEE0CjfGyNjjuV4KNw7OuzUHukvBQHAtpbwhar0uBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWJ/s5DI3ooMSM1ein/u/gaaf9/dYeqyHHhyMeKlrOE=;
 b=y89fmDNTX//oQyG4TtJEoISEHMxELSvDpQ5OkMW/YQPNqUwog9zW9USQasv7n+BseTsKaLVC8g++qQEOQpW1tDc8e4M9UKrYQuq8lNpOUs2BIhV4+p8uzJImUO7ugbMZVui+Ob6mGBDNgW/yk1AprMi6rZj2wa6/llz4bmqMLvwBmpSlyMa7N50tYZOUvN5GsGpNCkTyD4LMAIF2Iu0MHXE/zw4GVtbG5ZIC2EExoUvCleEgUMfcrdSDllRpP5mDRJUvDFgHGOZsUX/exhObFDTXdy3UTb+f5aQrHXxUQGhZcIv5d0nsVsbOS7x+sGPvvC8YaRWZRtloyOaxyQaEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWJ/s5DI3ooMSM1ein/u/gaaf9/dYeqyHHhyMeKlrOE=;
 b=CL5fFL462JwOBeyZBVkwXH6MayeNCkmM7a4eT2Ut/qq8G2EJW60lTxalysp7r3D9mIod3hzB8z/+1zHKFNrxVbAkvsvJ5xNVm2vJgIElOwNOr2h6D0PkurQPYOfiCldkPBVr6ltgILV9W3qCvrfhNUAmH7rxY08GNd58Sq7hKzE3+9+3Fnct1UVtd/52uS5DiiBH7fIGEbxBZSOI5gbFcKU0UeORFmNv+sWHWWyiyhqMTqZIR0uoZ4YlJkCeTOX1IehGMiyVUaRPUD/z+ravBbWqP0r6UIBcnDyNrgE8KWIYxNwBrmkmoTOoY3FbhRhNXwP6eBYnYOVhrsN8tMC/cQ==
Received: from CH0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:b0::17)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 19:29:07 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::46) by CH0PR03CA0012.outlook.office365.com
 (2603:10b6:610:b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Mon, 18 Nov 2024 19:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 19:29:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 18 Nov
 2024 11:28:49 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 18 Nov
 2024 11:28:49 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Mon, 18 Nov
 2024 11:28:49 -0800
From: Chris Babroski <cbabroski@nvidia.com>
To: <andi.shyti@kernel.org>, <kblaiech@nvidia.com>, <asmaa@nvidia.com>
CC: <davthompson@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cbabroski@nvidia.com>
Subject: [PATCH v1] i2c-mlxbf: Add repeated start condition support
Date: Mon, 18 Nov 2024 19:28:33 +0000
Message-ID: <20241118192833.346064-1-cbabroski@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 8973cc40-e6cb-4109-6d7c-08dd080744e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RaqEupBSQpR45N9EAhrQuY1+j/V0dT3VAfUh8U2rWbz1Jz52Oo+n3e2lm8xp?=
 =?us-ascii?Q?t9A+G6AysFQIsNZ4NperoCrtswSeXTd+pf0DpYdfRDdgN+KSA1meXXWJggQq?=
 =?us-ascii?Q?o732aqAWvUuxesVxh+t5qZK9slsmDqlmA2d0JA5Gzy79KL3vRA44sTBF3D0M?=
 =?us-ascii?Q?dAiZQZGdnSrwlhyEj/4oQTeXAFJavB5xXhAvOXWVZSqNzSZ4/0J/jC1nPHhU?=
 =?us-ascii?Q?UOgsF62CVXlwGUFdoqZy6/HQp3iCWqYgnd52BPmfiXML+bI4yHERFx0QaXqX?=
 =?us-ascii?Q?voMwo7qye5RTvD4qFoHuAQExjrHKpmgZuA4U4+Z76kN9XNF4AoqbIB93NPFz?=
 =?us-ascii?Q?CJ6vnq1eKg98WZIxAHzvxBHsRtfqI/As7dFHMDN0kW9/DZJInqGUdmd68Tde?=
 =?us-ascii?Q?D+A5KS0o+DlLqiz2aN8KaSw56qPkU8LDjp6YGVETffJqZgCzsp5gdhExjIWg?=
 =?us-ascii?Q?vUjjq70on/4TuWvi8senO0jVcLwHxbbLnuoMhRG1hT9LKgvnffrCMHYZsfHI?=
 =?us-ascii?Q?dZ5QQKhha8+DvBjr0uJkPghGPaH1uz0Fhdo9Jr3V6QyZhsEsE5uhUDF2BYQz?=
 =?us-ascii?Q?9MaGWZkRBVE+woLwd0BUWwFvy7KLq6i6hZ2Mp+az5+G5r/YVVhcKF9icNk/0?=
 =?us-ascii?Q?2BxZ400R0mhsxsS9iWTuhErc1Qy2ZAxJk6ghL9rLUBOVZ+EOaWxqSGW7TOXp?=
 =?us-ascii?Q?Yl2+mNwT+I2PIorYoPJRpZqqkHLmDjqvfWZkUL5zoUGy+d6yzWp205Dfj/6g?=
 =?us-ascii?Q?a8WImk6Z24MV2c2YkamG8LOoZsWpUxlTQ0p0y/VbNm5EHLpyWbM4zluddna1?=
 =?us-ascii?Q?duztE4GjkTZUtfX3TAmxNq9cBdcpVS/L0b2GWDc9NOeAsJPCeR58TAS/3CDk?=
 =?us-ascii?Q?u/o7WW91M7vb23j6CuKocOicwodBq7AlMyYhlDuHq2YZY03TnjCvSuj2pf9s?=
 =?us-ascii?Q?G0vemRNFwMCXPDT5aeItdMw36XRnQYSSr8MzzMtGe04beHBjUIK2IGwgrkgR?=
 =?us-ascii?Q?GdenuWQwDhtC9ml72xVvIr+06mN1TPY0Qyj1q64tTfX/NkrNVUrcJUthNkNR?=
 =?us-ascii?Q?qmWYTfWBC3cU7ISD17HOlo9+2Ovjs5D9A4pC+SObBMBDgsJuBxhK5fzgcGXp?=
 =?us-ascii?Q?4WHDkkssxfCNSlNplVR0rIxszyKzJr9hkCePQNHlfK8xrr6KSgfr2NyS808R?=
 =?us-ascii?Q?TsqTDMNGZTBm/yzspqDNP6Gc115/XLNsYDPlBjl8T8q1Tt96yWAUEU1ZNi2T?=
 =?us-ascii?Q?8ijmKOraaXaVNFcrW0TRejDMSNPqzTUeo3QfdiKkzIr65jl823gE0hMcbS6u?=
 =?us-ascii?Q?Cj1Q3sfseRUxOjup48wQ2A7kJHhVaLoMOo7r3/kP1mfgaPScMo+eZJ+rNbiT?=
 =?us-ascii?Q?7qVY/DVKOSqYyjePqnqQopU4UpsolzRMJsZpYB6uPageEVNSxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 19:29:06.8661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8973cc40-e6cb-4109-6d7c-08dd080744e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

Add support for SMBus repeated start conditions to the Mellanox I2C
driver. This support is specifically enabled for the
I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
communication with various I2C devices on Bluefield 3.

The I2C bus timing configuration values have also been updated based on
latest HW testing results and found to be necessary to support repeated
start transactions.

Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
---
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


