Return-Path: <linux-i2c+bounces-14914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6FBCF7FA0
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 12:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65870300DDB6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F92326D44;
	Tue,  6 Jan 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="So4NBHpH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045983242B5;
	Tue,  6 Jan 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697868; cv=fail; b=r2Nm+tMv9MKzHuVHeWa5LHcd4oZrOw5z0Sfc53GanuTtvx4Pwl8iEMwNnoGRKmRsiF5y5uRzUc4rc7lHfUJlSHyJDTLBy6l4zWpXO1GocU+fVnwwA7PGvxsyL+Ir3nkXjUkwnwkwqtEYwuTenO1GOHmxIzHjjyN8XMCahnXgaOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697868; c=relaxed/simple;
	bh=Gefb5u4ND+xHQIaOGg8sK9WocwhXImHLyAi0AYUCuVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KihTikNVorKNyqESL9Hvr/HFaqelB81bBJC3feVoYj0tUhJ7Js6iK2shf6GSdS542Ui6jxxAB5Nmu+bguvwEOo1v24/puk8zwtWUZ9EicqcT/Quc7Gf65uQCa7FsYJCPW1X//ys2lhcnwB/tu7D0eT2ZoKlk9Vx6uiAdVUnsAJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=So4NBHpH; arc=fail smtp.client-ip=52.101.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0IkISPokL2awhiCAPKArltRfKcXc/fF9qc9Gq+q9E3MgEbv3m0KBvIG/Mlp/6Yv4W3fsI8VR4BQv1p0c5JnAWfZ0ivm5eXpH2oCZrgaBeaTmbqmGjyGH3G+4sYqa15RTIUFeFLdZpeoDxJiw+wxVEkq8XFwcsHa2zf3Xe8sS3edju05RVQWjhdKcDMTbran6kPpNumFGSKM2TqHHHq7RHAOv6I9CgtVDc8pXrYHp4QcliMtQITR1XFduZQx02ydLdevOElDfUQiQuZakURGvcms671YEBGyaeYO2Qs/rTF4LZxtYuoa6LZpPb+tFQpdVJRsebH2R0a2V5IIH+LaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=uqErJICru8dfhJF0CyPpsbr3irM9ZaXF6ORDmPMstQngfGeSDxw/xW3N7QTWEDHMrmUTk47inSzJcKkKesEcy1fq9KTkjFevamIV6QCXCX4eFQYZ4e9NxAxf+EySUvTOCmmCVgYwCBiXOBPlN5mzOf3a7KYyMRKq1le/WyHaHhcx94MbnCVvGy7z1T86QIgb2rPYo8u8GSqKXk1yWqUZek4cjFzqAIyIEND6FBNakd3nAvSRR6uE1rlAUNxyTIqLBQPADzoiEQyFAOhEaxWvOyBvAKIhtSU0BeDGj46smxcf4EtdrKk0jCTl5VZMqyn0z8b9pKgzI/WumWISEtzR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTYT6/ojseOosIBH1Asu8ri6UO68D/EWH72BQhod3RU=;
 b=So4NBHpHDthI4x6CpHgDxONfBMiwuj9eEoTkRsPM97wF2zr5MBpUZLgunEsac//yN0+8uv0ZDyEDV1LfGEsZbYhXEVXwNP8OjJewP35RROH12h/Jc9A6zzsLcRLYcpprVLvMiJ08ZjFkYa8+xyEXGB28mhmA/a7+d8DEDIybOpXhTdhhZYY5B9uOLMu5KenzjhYkUggaRJL7+kJHfJhhGSUvmwfSCNakpcr7mv/BPydqG8TtPgCG934RHIbDGsL6HjuaSar70aN/app8WDrmpwsKmEg9wK+LKPO2UrTiA6qCE03u+BA/Qa+WgM3zUIacJ1IZ+pfeGmMZqI7Hdr6LNQ==
Received: from DM6PR07CA0113.namprd07.prod.outlook.com (2603:10b6:5:330::16)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:10:56 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::4f) by DM6PR07CA0113.outlook.office365.com
 (2603:10b6:5:330::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:10:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:42 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:10:42 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 03:10:39 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Tue, 6 Jan 2026 16:40:30 +0530
Message-ID: <20260106111033.5556-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106111033.5556-1-kkartik@nvidia.com>
References: <20260106111033.5556-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f538d12-0875-4cde-51fb-08de4d1443d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AC5qDILj1vsPuO1KtStHQN/yTXlVniHdIdKPYMs+CSDvUlSpKOEu8Uk+stG+?=
 =?us-ascii?Q?+lj7I3z/IhtvHCnml1wH/9H9iBSG6tUYPsKuYomJgEde9ncwkWbugjEzfe34?=
 =?us-ascii?Q?wzfasVsGUp1sxvGU/aljvZYE5F36Ihe5B7gTtkk3x6BCTH3fkLWEpTQL7ZGU?=
 =?us-ascii?Q?Fkr7wedugj/wsmNX0o6MObBjStZTMgni5Ynv1peN1+GZyDKZTlTeXhJwWA/h?=
 =?us-ascii?Q?FwTAET0zsuLMQaU8tGB1eT3h3liQ4tGkN+1iCXmuP5ZQ/rs9jAYBi40WZEJv?=
 =?us-ascii?Q?uEi9HeDQyjwB+1idxjAsQiLTULepuwUNvBIcHGVA28VGgAI6JJC9wEsFzhDA?=
 =?us-ascii?Q?WqXKBR6TuzraSfN9PoJFh5BMen2wwVv57zNRF90ygN0dR+puzymE7KG2lbtD?=
 =?us-ascii?Q?pbM4zz4TJ3R1k/jLm8xv01wB0hhWFVGxQOxRoyVSrgsEus7cGOFVQ1mLrGTR?=
 =?us-ascii?Q?K/dN/wYEOwjdPKtB1Sm+006x7jMjcYoPclRVBiDjodWdSuEQSFtaXHAcmVgX?=
 =?us-ascii?Q?BvZkbv2naigaRXiMe3kcdG8Kwbao6N5JJaY1JypX370DfMNioMMUlU0GMBJA?=
 =?us-ascii?Q?qtLfOf0x5BgNpiej2r8/6ju4YXqBZD7e/moXsmm+bOP4HmhH1ErQzII9qJJM?=
 =?us-ascii?Q?cJ57z2z4ugzBbGIZWHuvsu6EYXxQ37/X55NQCfo0/oh7j3nnN2liIFuL0KQM?=
 =?us-ascii?Q?SHdx7RZU7BZKJ1p8MoNlfNw7KQnf0wteMR+pnCtp8No6qswzuXtvj0dYo90Z?=
 =?us-ascii?Q?qnZQYr8bqvR7rgS2hnJMdloGVZCx8HE0ZLwgFZvYiwMqRf7sCVpqGmolbqpM?=
 =?us-ascii?Q?hKDudztpeLvekkEKEVXQBS3rHzgKVPfoIT9jfDZequFN/HPwqLdgp17fJNCK?=
 =?us-ascii?Q?qm/9fyHrjrkK1sbqedjz5fmRU0ZSXLgQKBn87qay7UI9VQl8udi4O6Qe3Rfm?=
 =?us-ascii?Q?bzY6dmxCqpI25GNuCZl2GyrtBr8Vr2kpon7+8kuOFR2p0CGpFzAThujcO2S2?=
 =?us-ascii?Q?sr3ZT7XqvtcIdgCVhDYwmhubBC8F1BYdTzv71dNcXq/l+dpQeUeYncwu1zlG?=
 =?us-ascii?Q?ZcOAIg1Y9Gk0fNJNgiFZHOKQH/j6Q50gMLxQgBw2isx0PNv9U7fIJuzJB3Xh?=
 =?us-ascii?Q?5yRkHps78KzkNYtMkILcX3rWO3FVNv2TXeNpv1oWg2b61XN328sNfkrhCHlc?=
 =?us-ascii?Q?0vGaP2Hf96bryEaxBfKWJIqeoTAsCxVeBCidPCYokRmsg83HAQysERPKD5yC?=
 =?us-ascii?Q?RMYQyv540ecXCC7y1RJkZ95woiEjdQZaBdtmOd5H2rwvaRMnKK+POv2vVC/B?=
 =?us-ascii?Q?WWSnsxLaTrZfVz9agf0STtMZjud7tqIkeMDVDyeC4eBgQfg4HldD60rZaRuT?=
 =?us-ascii?Q?zvgJQGD+4W061O7aiUrtqjFGIwAg58Es7c8zJeK+YREVEFLTVZghPpIWc/AE?=
 =?us-ascii?Q?D1j9m6/Qa/bA01wA75dkgZR2kfJLSloZOI3M9mEWld8lxkh0g85ke0BzBxSO?=
 =?us-ascii?Q?sUCnPVO/LncyrsQD0P4llKTISHTUmdyGDTShuvccuqaOq8iZ27ZvOcuPwkBL?=
 =?us-ascii?Q?rxNZNp5O4BwjP/4c5jItBbYaoa0Sizy/ghn+NDYM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:10:56.4378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f538d12-0875-4cde-51fb-08de4d1443d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084

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


