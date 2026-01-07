Return-Path: <linux-i2c+bounces-14942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE3CFBEF8
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 732743027D95
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B29E22FDE6;
	Wed,  7 Jan 2026 04:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="trw1uUj6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7972C1F3FEC;
	Wed,  7 Jan 2026 04:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759903; cv=fail; b=EvW5wIzgffcTBiRf9IYc8qwObcPsvqLpuJ4jjib6f+i67K+c4h2yCzUJoUur0ikD0J9lgLLDpjfYty08Z15rGXBqFeIsPD7DSRAkvW576iyxeMxiLnw38mOvurNLWZoHtIfRsowl8gUqXZvftUYeprHrn2xD56jiaCao244QnQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759903; c=relaxed/simple;
	bh=Gefb5u4ND+xHQIaOGg8sK9WocwhXImHLyAi0AYUCuVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wv1lOCQ4X2YTIHIb2QllBOJXQipocpDGWYtD6sJRQ+CW+rrpLid1FY1qOdDC2gN3MjWAMz5/pqVbG5lN7IAl4r1tZT6cwFJHLERFVX3Q+xfA0EkReKcav3FM+wWCXk+C24DHJVYM4aqSppwk1MxW9UI10pCxy+dYa9xlCU6Jj04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=trw1uUj6; arc=fail smtp.client-ip=40.93.194.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4+uu9Etzwi+GqMOzesrLqKTbEmIPvXkYKdVolzwytR633pEJ4BBUhPzU7xwIkEaeR3JgokoZffraIeoAUXmH6am3+DK3V/O1UJ/1NcOGj17M9T8phMmO3pNJLlF5b9dh7KvYTZgJCSnH4+6w+dAtZmC2sht+SsJazQNWuANhx2aj1wC0QLUdqB/036LmOlT98RrT65T8DGVGiG83Ch+KYBXjRwAR5i6NgcbkrVpofLtyXEBQzz8ji4OgRkzG1NOL1QrrTbZHVsfFcz708uV19Vy8wKVr6LvFGe4cnwOcp5BZC0NBfrnyOyRipMmRnPdl0jYPcSIoQnKyRc3TbklZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=fZhN9kYx8aseeRqzk0nqbtN4nZjEJIfZJquG30Q4eJPCUdSfPovoGdJXURS3vBMx6I9+8HbjULfTuxtya+2u+wvtRqBTrenzEDbm2v3U3StcxRzynWUi/43MUbLW2wxUCMx3BpWI9ZPWHQjpfjHUs4/MUKaox1myQY+KVTdR7thJc5sbqy5EQhqBs1QIJ1wKv3y3Wl1mUfQ3NLt4I4ccA2toix31+ZoYg5u6hNb2aNueiiTWFBKB3jjiC1/8qlWAduS6v2tQd3fQO1hnPS0/WjnVaCTM6gxgC9xgGGO5vkiIB25u54rxT86P+rKF6DOTP84NMRoIjr2UiWXFofiFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=trw1uUj6HFrevvuHOUAs2a+GvUfSgv3EUGG3YZUoi/WcqVCpnOnZXX54YNYn0jgJ7OrazZyWtDQlndF8RhtDpnwg/y1oPxFrg5H9d690YW7ZerT8BBhXvuD2W0BUKugn97EKTaNuH/E+N8xqdGPuBdNrZfmmkMrdfCOkLgKMEDHWutRZikE9ee1Pl4yYe8Qmtm1HyJZX7ZPOJSeKksR6p4ZkBNlIA5KgSgAm4kJCY5SeOsfIt8kNBfmuu0A3WilxYBkFDCXAkWedlrtx01u7y+gKfCo6cTxKfxnJP/ey5wi6nKBg2iMFHYLbBI/fI01NbpnjU6Ebqq5RbROySplvmw==
Received: from CH2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:610:4e::28)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 04:24:54 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::fb) by CH2PR02CA0018.outlook.office365.com
 (2603:10b6:610:4e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 04:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 04:24:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 20:24:45 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 6 Jan 2026 20:24:44 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 20:24:41 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Wed, 7 Jan 2026 09:54:31 +0530
Message-ID: <20260107042434.10587-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107042434.10587-1-kkartik@nvidia.com>
References: <20260107042434.10587-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: e4de686a-d597-4781-277a-08de4da4b50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oog0duCb/+LZPqWhHY/Xo384R8qLZgoUoggYqvdBb3H971jo76TXy5wlTHjW?=
 =?us-ascii?Q?5sr+6ICNiIL/wowcEvJQsrYmSmkf7xACjvPKfbi7Iib4IduL4gHYk+N+y1c3?=
 =?us-ascii?Q?uNpj3MnrhqIY91wqLNoKK9A3Aa8+9OTLd4JG6ObSDJFl1A//u6c45MXrebAb?=
 =?us-ascii?Q?GGwG7+91ok4RJ0MqgbnpuEp3z/ZRk0P/EUl6tIOLDRMxUr0E1j2qqrkHQTTb?=
 =?us-ascii?Q?3b6xALcIvaJXiXScyKprKQ7M8CBoaHFxJIUK1RDHUU8sVnRVLTubQPnLN7Ib?=
 =?us-ascii?Q?v+o5Grl8EFetdWXMbmVb1H0EcgLYmVaZV2eHgqmnYHBYUs4kmueSAWxGD2iw?=
 =?us-ascii?Q?+0cd3okuF+M0mdWgfpF55MMO8TmLzTa1xt0aWXIRInYHuEkqBXjgUYyTJI12?=
 =?us-ascii?Q?udu4A1Fs6i8R0dsqMcMgljvZ8lYrrA2NNwXcpWjDNW2B3eBTYFu1kuo9eUyT?=
 =?us-ascii?Q?DgDDxVK78ePu+pg6YnbNYSw4U99Y7POx+QMJQ3MMwd6H8pnZWMnysA8W46N0?=
 =?us-ascii?Q?GdMEuI6KgbWGKvSDKAIgaCiUx1SWwTcLYGgsJkg5C3ZDkIE3nSXmvDcz4sov?=
 =?us-ascii?Q?gRu1CDbhvnXw/S+kCs50p6FlTT+TlJ68Vcp5ipvGlcOiNGofkGX9TEaDdfaw?=
 =?us-ascii?Q?sYFG31v1aatppwirkCPiRJ63ORRKDjTDJVY6XH8WSsWnx5SjfG4pQ7rhEzXf?=
 =?us-ascii?Q?anFW3NSyIpzV6Iz68sWbctAv07EcuQYClJ8xkbL2WAK6gBNEShi/XTZzb294?=
 =?us-ascii?Q?4p9sGwL+rsLpDsvga3AEH4netHFAoknPiyvhYEcYzxZj2E0onWlDu6wPIadu?=
 =?us-ascii?Q?vfPsqkoNPJTd8/VUmG28sHBfoT4ZsdvLAp5Pj9tFiEROfNNFFArOBImWiBzk?=
 =?us-ascii?Q?og6Ew3sDFk0OsBudj63I70IJ2dsj+IRVsKG7/TXILWQ/v3HVr1z+/zlGJBvc?=
 =?us-ascii?Q?/MRfAUKKABwz7sRDhJSnO1vQgEMystBE+EuqsJ0LzBCjezO2OM/RXBKlrUJ5?=
 =?us-ascii?Q?aB1Y7slWCEKQEQjVkW+kESuTiZP1B94fZlnRxftQ2MtlTzviJuwhzKI/RDlx?=
 =?us-ascii?Q?As0wbpQop0yf7idSUr8zvUMT/8EwepLZprd3OTFWBNZcJ6ScYEsbCRPRxnuB?=
 =?us-ascii?Q?td4cqk6fdO7whXTxxSnrwOHrSqK2Nn5dE0rDgTHhuwUbfqrY3BVHL5vqE9eA?=
 =?us-ascii?Q?ezVvgSVXjMR/Sts5MyC5SfEKQW4CuwJfasPFBrGcksU7eu8RkYknDVr25fvX?=
 =?us-ascii?Q?HwvluiYZA3+6J05APwrXdMghod1lYPeGK3oNsOsppSdGL7fQhMFhLLb7KKBX?=
 =?us-ascii?Q?aU4Suq4JEspparWbUPvDWZqOSluJappLPNEQpM+n0NEzMZvgGj+4I0XNS676?=
 =?us-ascii?Q?s0ucGYMnGYuTl2C89fnodXgcNjDqReZ+KSI9Vd9kvS5bHCHkcwK1KvoQH14Z?=
 =?us-ascii?Q?C65ASEtWKg9tH2QO4F2rNytlBMZxWnxzxasVkh+clrCAq8CxYus9E4vUzQrj?=
 =?us-ascii?Q?4xU/NvxwtZZQxOLcTFFN5sWOD93SDYDt30QlezinsJwza1vOHnwbGP1KryR0?=
 =?us-ascii?Q?x18+8aTadjSF/rj/vAwEsTcMUl4jqRckbXw46xTC?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:24:53.9080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4de686a-d597-4781-277a-08de4da4b50a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d05015ef425d..9a09079dcc9c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -171,6 +171,18 @@ enum msg_end_type {
 	MSG_END_CONTINUE,
 };
 
+/*
+ * tegra_i2c_variant: Identifies the variant of I2C controller.
+ * @TEGRA_I2C_VARIANT_DEFAULT: Identifies the default I2C controller.
+ * @TEGRA_I2C_VARIANT_DVC: Identifies the DVC I2C controller, has a different register layout.
+ * @TEGRA_I2C_VARIANT_VI: Identifies the VI I2C controller, has a different register layout.
+ */
+enum tegra_i2c_variant {
+	TEGRA_I2C_VARIANT_DEFAULT,
+	TEGRA_I2C_VARIANT_DVC,
+	TEGRA_I2C_VARIANT_VI,
+};
+
 /**
  * struct tegra_i2c_hw_feature : per hardware generation features
  * @has_continue_xfer_support: continue-transfer supported
@@ -269,8 +281,7 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
+ * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -323,12 +334,13 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	bool is_dvc;
-	bool is_vi;
+	enum tegra_i2c_variant variant;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1915,13 +1927,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
+	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
+
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
 
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0


