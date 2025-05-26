Return-Path: <linux-i2c+bounces-11137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E92AC3917
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 07:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B473C188B558
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C731C5D55;
	Mon, 26 May 2025 05:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qCTpt3Xj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813281C4A17;
	Mon, 26 May 2025 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237205; cv=fail; b=oADBka1UVHRrhiJ0lHomNn2G2F/ENxR2J4kf54NyQLDXkWLuNAc1W7useIWIpfyIVW/1/y9U9GhbWnb9S9oI7GLuN/MK3mDUimwVTsnJlyijhQhaIblAO1edEoxAVh7njAdRsQpMtT97P6E7tVO940PfsN+JK9VBMDHPgscvsvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237205; c=relaxed/simple;
	bh=W1XGataJvW7y/wD/T4f0w0DtvzaIcqhSRufmsydzVMc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePNjxaaYIp4FMbUgJcWoM2c4OD9rTEk+9nTbr1UFqNVJ4XxfxuYRwsWxN48w5kdkMuwUFuuRBcxf5ztpoI9plmMlX0/nKvWvw/BhTNMdwarrARIh2AWAKqYPF6wp90QpAm1c+fFxPZUzaBOBvhutrAu6lztSYyS5zRoZChjz4BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qCTpt3Xj; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw2SB5TSYWWDeyuQQUAv6FQKbT20wb0a0eoAeh3F9IipbSFFPeWP2SJ0Yi24Tz16fVf6BRqdprxyb25Ohl5eGsXSdKdsaR+J02zsq4sqfrBqer/+/AYNMRFgNH7ptpj3XHIZn/vOHhhR4f7UkY+CBE0bOO23jvzCvov0R5m+aUk15ms8UGCatTKWRyN597d1gBGNu2JbjrA451J9tpfCddz5H5QfXz4QnXrwgqhL92yTTPOxyKdGqq+foMrs5QeJgfL/OD7ku2rKUAK7LxAZZ86uYd1MljPRZljg/wpTI607HS1iLaNVm+7LKnkzVzIskpypn9uOs5gz9O+8PIKHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=And/Vr+9g9p+CZRWc11+Mf8xS3P+b125IgPGxjWD8Zc=;
 b=w3g6s45SIymNCujO0XV7sxRZ6q7msDtefbOb6cAYyQO0zj6jzs6vTSDblylUcR3KzLqCqzlGQ8FzE6HRQBJDdJeZC68iKmxr/pG27c+SntWlaeKASlwajSQeUiMeOpLM/gpYqk/VfJ/GngIZSzfOdeGjHT7BwdSz83FFQxp/9m/ugV3fZDtfM7oeAVQMCtC1jJIXLMjzIdQVwiuIx6TFayF0HGRd834QCbsaiWFqEHIm7ie4mg3m5Be1vfRkrWyX3kgPeSP6KJMcRZaecJ+UkQfDA3kVMElz93+Oa8Boi168jD0MgnXXUijKtVCEqalj1lDMotpH+8/xZgUW1AjbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=And/Vr+9g9p+CZRWc11+Mf8xS3P+b125IgPGxjWD8Zc=;
 b=qCTpt3XjxfetLDpsibP6EJDA3hTPOWha2sz3cZyQR++VSnRYX7VN6v3tFwtbNXL5Cpw79Amya4nSdhXl4ZdeqBBj/c8B6T4rUDOhJDAqqQ4NnNjuu/jyWCU0XvlrW2M/Y+wv64Ko1xhSYe1Y6gKOMdvdGHjYnzQ6zZVeBr90EAUzCCBjKKdDatNnqdbvFNPPMrRiKz+Qhbuql5F9t3IkvaSAY90dbuWqDEt6874SouxQboJGrNIoRhZWzalVze3ha3IyDsdN6K5Va0fRJLZjmHtc+h8hqHv9RCnD7EasmTbb5QHoYKTxUsT8yqcz9aJr8bJCEGcK8xfpQ2Llc3oNHw==
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by DS5PPFDF2DDE6CD.namprd12.prod.outlook.com (2603:10b6:f:fc00::665) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 26 May
 2025 05:26:40 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::e8) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 05:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 05:26:39 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 22:26:28 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 25 May 2025 22:26:28 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 25 May 2025 22:26:24 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 2/3] i2c: tegra: make reset an optional property
Date: Mon, 26 May 2025 10:55:52 +0530
Message-ID: <20250526052553.42766-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250526052553.42766-1-akhilrajeev@nvidia.com>
References: <20250526052553.42766-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DS5PPFDF2DDE6CD:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fe8027-3087-4f76-c2c7-08dd9c15e4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/mo9bLPKGT15wHASgcmrFjMz1nX29qn8H/YKvj2WqOG+1X0BNWsLlnNI6jR8?=
 =?us-ascii?Q?W2k2hgKjTetxx75CFYgO+CAjH/qdGyPO303nrWXPH8Mge7zp621P+Vm3VK5s?=
 =?us-ascii?Q?OIxyttA8gl9IXAETN0Juf8H30JFcqu2RwHq4AuTlkJOoKWnGIngFJiFYqJWL?=
 =?us-ascii?Q?kbthzrys6Y9ohF2Ih9BAuieQqkAFTxIM/yk0XrUuWWdYcNIgwAEWfocs8xId?=
 =?us-ascii?Q?lvTwhySEleo9kfu2sBh9V8UTv/W0fOMHvop//SHAxN/VwTHDLvv+K6IiUdCT?=
 =?us-ascii?Q?Or0QpRxAg8sC6kzeXoAKJYjI737xcDjPDYA9EuHieFZDXlwXn+mGvXQviYPk?=
 =?us-ascii?Q?Qwz/hb2cZimteUfQk2rD5JSVQtKumXVQiUggoRZiRwj2Ve3AxwmZi2eWq1Uz?=
 =?us-ascii?Q?L7L/9NxPrZ/HY3D32DfuTqic3e9CKkAp2RTY3bunPUTWOT1+DqP2NlVi3ybp?=
 =?us-ascii?Q?S+bKIABOV4vQqUmk2nV3y45LLp9oz11y7t76qF5UU0nrim9PXP37Bb02Skc5?=
 =?us-ascii?Q?hUeTDWNgMc0wn+RoI0K9tZ99aFziFRErHLTsomh1s6W2eaQHSA7YiprjpM0J?=
 =?us-ascii?Q?SyxS+wtwVDajsgk7b71hko/VCSTBCwnVj0r6z+ulRqDPqeAHQGtg2KaenniH?=
 =?us-ascii?Q?rNyfePTX07NA2r3mmS9Tf96y9U+AmxMJnUnIlU4bA/6xtSFO3KdfTxrU4ey9?=
 =?us-ascii?Q?FOLL1TkQYclNZ/H1wO6kMji8roM8syGl5Z0SyfVB++pUzwiUhwm95VveRZLs?=
 =?us-ascii?Q?DM8hERpBkySJrLeBS2WebDkZKwgM6DPMuoQOYuGfhxrxMCEi9LSpcz4Cxwp/?=
 =?us-ascii?Q?vt6i6rNMxB27bHlWrHme1+1O7zbnZdIXFcKw0fPEiMX9gLthN3qxBIv3Ne1J?=
 =?us-ascii?Q?qU6l2//MKZjSptNDYO7Vrf7uvzb+l5UNEi4ARZxXp7SdGU/AkuhsbjuOidFv?=
 =?us-ascii?Q?TRcZbKeAya9mOZwFGqFcAeesa6l2yv6GCkvqWZY+HcgligLWxz3dXEMEa3Pk?=
 =?us-ascii?Q?6ibKcpnchuRoS3PgVyg6SuaJd4KogFxbDg0wdn4bmOFWS0jNrR9fd4O6z9WO?=
 =?us-ascii?Q?n593PQaq8ojM3CEtudCulq/zbVAtWa1pizW04Hd6y/wNBn6pPA/6G8VuHXO0?=
 =?us-ascii?Q?WbiymXgzhZjxrX3+LzGSEf7F2CPOeNmMVM0YrJ0Y8ZldILsqpGQn/5U/F2Eq?=
 =?us-ascii?Q?Vu8+M+ukZ3flRhMa9erS5ocYFfHd5IvVEegFSWN9O+R3H6jMzoEnQWpACf42?=
 =?us-ascii?Q?u9JFxCyllPsC4q+g+hgAV/qE9Ko4sXOI3zrkgrLtU7U5h/WBac7P1P5Xd30s?=
 =?us-ascii?Q?7Bqpu2GZJDvxXjmZRj529ZYftonYGvjCi/OlCW7YuKLmswgBctBmgxlHuiBs?=
 =?us-ascii?Q?TzTTkJJVZFvGzJhvm4glwCKL/4JU/YNSFZzaoNP1wci9EC7e5a98PxjV/M30?=
 =?us-ascii?Q?HB+GeyyTrHEdZt4dRbG6M1fzQUvXVOF3zcqy75e9vYEb0rknC1JAch5+G1gs?=
 =?us-ascii?Q?f7QLu4xUO8DD1wfeg6WHNxRd2bCf777EjbQ+5vmTQVZ9XDMOvXC2eTiFYQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 05:26:39.9989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fe8027-3087-4f76-c2c7-08dd9c15e4af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDF2DDE6CD

For controllers that has an internal software reset, make the reset
property optional. This is useful in systems that choose to restrict
reset control from Linux.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..22ddbae9d847 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -134,6 +134,8 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_MASTER_RESET_CNTRL			0x0a8
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -184,6 +186,9 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
+ *		provides an alternative to controller reset when configured as
+ *		I2C master
  * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
@@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool has_mst_reset;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
@@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
@@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (handle)
 		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
+	else if (i2c_dev->rst)
 		err = reset_control_reset(i2c_dev->rst);
+	else
+		err = tegra_i2c_master_reset(i2c_dev);
 
 	WARN_ON_ONCE(err);
 
@@ -1467,6 +1489,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1491,6 +1514,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1515,6 +1539,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1539,6 +1564,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1563,6 +1589,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1587,6 +1614,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1611,6 +1639,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1666,7 +1695,7 @@ static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
 	if (ACPI_HANDLE(i2c_dev->dev))
 		return 0;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_optional_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst))
 		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 				      "failed to get reset control\n");
-- 
2.43.2


