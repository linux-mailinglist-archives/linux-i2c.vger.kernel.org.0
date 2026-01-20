Return-Path: <linux-i2c+bounces-15278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA4D3C38D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E60AD520B23
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFE03BF2E9;
	Tue, 20 Jan 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qc9AqtVA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C863D300E;
	Tue, 20 Jan 2026 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900867; cv=fail; b=B99HzmHSGN8t+QUPf1QxtpaCIy3yVpy5TpzSKc/I8Haj83bdamLYb970bB567zqIHEESJsbumP8GsQ9aWYlNopDWaAiqj9np5xISZXkmjiXstzYObDKp+Ovb1oI7YdbelJMDwiH+anQe0M/BIC3o13+Y961xnbLdqc/IuBTnbLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900867; c=relaxed/simple;
	bh=wvKBrYil3lJv1ZjUk6HE0tJoURZd2wnCX258RYfOJM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CxP5qrCQl36usYzQPXSmmkl+jBUQvWZ62XNC3Ld5k83uWfK3vfJT9qF8KNsNoKoVf6HBpKqcOon/Sy3+IZUWrot8wlci8pvaEg4RAJxLjA/yO7vMb7PHHBk1Tbuq61fgMt3XQfrG59/T0+xA7O4aZZTM87xyb9lkuXVJ4eWn/Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qc9AqtVA; arc=fail smtp.client-ip=52.101.56.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gdkpb2IxzuVilu/WzchEZGc9xKstWVlv0GtbUAjm3/sCsDo2oHVa9UjNOTgao/0ShEJ4g5rq299zR1JAPpnzyd0xnZAvo9iQ0QxwzJ5AUD3nugOIOrAuFndvqnMjFreoPGngHOMRheHtU5RBtbd75B2vet83aDniezcqzlmySyC7FAFol8LzWD7ruV8cWS0v8o5jEiGKQdJQ+gj0CgygBAFNPS9e2AtLqwt3BSzJxphESNI19+DENGVJk3EebjYvan+cJ4FWMu8WQui39c9Q05Ais5alN+caWw4DGVcHdBuv0803LasIn5qb9zp0gmXfIa4W0k/Oy0Qb7YDCPCOl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/4MxM0v9Q8nvavAj6lDMKiYujcnbDBrIp8y4RrY/vo=;
 b=V+5MP2F5cOcQVWZ0h+9QqMDOn9AamW8pDLkBFkG/6xrg1bzqVgf/uzFrBAuKUll3kWXeuJ7+QfHjSJQG7xJnC8dSFz/Ipsgzw8e4RQN86EqPGhvkZOee8g6ckc2Zq77bMC/4+DxXG/Va0RFla8Aa3xtjTM01zmxCq+8MyrAjuHM4iA1sWWyDEcFu6XCh192m5EEOW8tF7ATxkjABNFGb14vgTY9j3ms2YR6XhfsvRmNdttItV35Ne4p8OjkC7BJxQU+2J1YDhkCCXbDxkg9ALHpwLSVkNPn5qDLvBXfZ9jLfCCq9Z3g2hm2Hb3wOsfj7/TW+I6/cnmnsXXvjz9tGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/4MxM0v9Q8nvavAj6lDMKiYujcnbDBrIp8y4RrY/vo=;
 b=qc9AqtVAYk7nm/BpVyPN4Zxp4fTpXaX5Zqa4D8clJW8gRS8YLG5B1+3sh0cCAQlBAQ1CZOUkRW+GLju90diFQ9FMWLNS4OpTAG0EnUwEkkc18d3wgKrHx5yMh1j5MWIpdOUGqHjbtpKmk7K2uOUyyE6hF00HtkO28D6K6HC94nukOaIDGetqBCZFmoNHzMLoyUnnAh8ptwLUjaswyj4MHY9Tgs06r0DEVBwAsNHj7btABz71s3MRp7FroNAGKgj2Dv5LjOILlbNdULmmHFK0GZm39e6iX7xQiVDtqO+b4+IDTnplPRz7ibCzlNKZyyqK/Nqv44grVKEPiHYrwPL98Q==
Received: from PH0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::22)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 09:21:01 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::80) by PH0P220CA0004.outlook.office365.com
 (2603:10b6:510:d3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 09:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:21:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:43 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 01:20:43 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 01:20:40 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v8 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Tue, 20 Jan 2026 14:50:29 +0530
Message-ID: <20260120092032.83100-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120092032.83100-1-kkartik@nvidia.com>
References: <20260120092032.83100-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5058673e-da66-41de-6f1f-08de58053a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8t2AQqIYUqLURKsIg9pYIZYSKZtAAjqMQPPwxgiGbgL7+3EnauNmWzC7+ls?=
 =?us-ascii?Q?emgXTHk2/jovd9cFG+mZbON/hVfnwVW4iIG4guNRMHmRHMqipgkCGHOBRMvX?=
 =?us-ascii?Q?/pVx0gOpHd90+YWIVigTCSGJDOQrji+i79NSBSpLrfiN8/wiP+8M8TKXiIHv?=
 =?us-ascii?Q?+4v98qcUDGP1S/QjDxpx0yTILCbVYf6lPKD/Scd/9iNJLlKs9Vs8fq8GPSGd?=
 =?us-ascii?Q?a2xu7S1jmfPGLls5ptOnYxr3vwCqB0IjLyHfWQLLt+tQWCfWoLb0Gn3/C649?=
 =?us-ascii?Q?avY2fU1PrXqUPSiIywj3KILbDZxPEjtVbV60kSgx1Ia3hKezuHG9kF6M/BiX?=
 =?us-ascii?Q?rZhxgbWhuFybCf94GgUqDQUBr6GU5CBEU3HlyOg40yErwlOtMaDvceFfOHVK?=
 =?us-ascii?Q?7r87ScByXUw48GkamZoz3z0FcUKTYU1A61tcMWxk5f30x4rC5U+E2vdyDpDn?=
 =?us-ascii?Q?eyKxy1lhrdMeaXf01g3sAYPYNMwi/QyGsuoyF6CCFdBNWhqmY1u7sTvHX/bA?=
 =?us-ascii?Q?2KLa8H5vqXDRBsaUfn++pDE3a+4l9JbkAd+w/ycboIqh5IzRNHA3RxSluXjw?=
 =?us-ascii?Q?K6dnd3gu88bUhVxDjnTuL0Ypv3N5hmg0cEHILEZOO5GVSE5TxEG9Bv5QWkQ/?=
 =?us-ascii?Q?jNRxoRVQOud94Jvl0tKd2qml7oyif58f79puDHyDAin6drDeBH4oQpc0o1le?=
 =?us-ascii?Q?gW/fOHYohA4Cueax/5o6dh9W+658nBIxm4aPGIAO2jp4hSHB3yR1pw0IyUJL?=
 =?us-ascii?Q?OZtGlwjOcUU6ZtiPp3S/uBCsm9LJ3PNilQ7FXr1107gAniYuPb/dnQokJaMJ?=
 =?us-ascii?Q?7+vg3cRVZ2EzdPDZ4eC6jspSC6ZkgBegVvHlj0UxCiYgUkeSTqhOUDgbSsMN?=
 =?us-ascii?Q?h9y2BFhRPwOokMRstxLkQdj+eWliDZJDgNsDuO+nDI67BMly7UNqByaHl+TD?=
 =?us-ascii?Q?Ia9Xnqq/U0fW1HEeKAbhdkWNxkiDiNkDCkIQ6V3e6k7vTaSgDBz3d6G+E6Y3?=
 =?us-ascii?Q?0Ca3ff3p5yys6lxq6CZ19wZFIGoVrlVYizgnS44DNiEXlzLo/2bap6Ku+dyj?=
 =?us-ascii?Q?rMMCJ3ue7IKrDe1sn9x8lHYTvQdJZXTm4Mg1Lx76RP/0J6lOaDk5vszP3kS3?=
 =?us-ascii?Q?lVX91i/uARopMAFtDRx1M28ZJr/Iy+Pq4N/UbWVdh/epemHyVZuYLhg1E5mP?=
 =?us-ascii?Q?yjuezay8XPPEwzaK/iQtZwCTMWDqmBtrmtPrbDYADErwdIoysNWNo0hXChbs?=
 =?us-ascii?Q?bL/1mvmuP0t3CBuANvIiCkdQGXEbKfzp+kQJirQW1VRmomJHKVYKH/IxxnFV?=
 =?us-ascii?Q?g9LVc7jFggTp/yA+9ISMq1qvAtFpyYw4NS8g16TnfZxolj3TjnjaLjuByDDZ?=
 =?us-ascii?Q?s/KjRa8tstA4R75OmpY09u3MiI1DRR1lff4tWt6oBXSf1Ip9lKqsuAA8yMLl?=
 =?us-ascii?Q?VpRiqYwZeQ4CxVjAQo2sBnmrFhDKGfw0+hqf8D1RW3YUuf+ijPyzAl80DKHu?=
 =?us-ascii?Q?nYH8i1q1EevYVqVzMYV5C08fPOImSoUjCBnPBoJf36I9iJEoWKpGX3o5NgMG?=
 =?us-ascii?Q?VsIVeDy87BMF0ch56BLCFxipUwnZrm6eheJ+tVNGb8cZGpQsth0pQp2shFOL?=
 =?us-ascii?Q?kVjTvFUNyxWQ4oIuov5JcQbFdYIHMXizjCtW6QtjiiersiDEOQlb2ILqbEmj?=
 =?us-ascii?Q?3JaT5VKJRS6kDdsPWg8QpYmNiCk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:21:00.8460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5058673e-da66-41de-6f1f-08de58053a48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..c2c60ba4fe5e 100644
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
@@ -268,8 +280,7 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
+ * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -321,12 +332,13 @@ struct tegra_i2c_dev {
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
@@ -1913,13 +1925,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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


