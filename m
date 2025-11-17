Return-Path: <linux-i2c+bounces-14114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C9C638F6
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5BA034EEED
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A7931E106;
	Mon, 17 Nov 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QkJcnBqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A141246BD8;
	Mon, 17 Nov 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375154; cv=fail; b=DKbUSMfThXcg4g1JtO9tIwoiyypVEgoxNxcafstT+nhpLl8w9B0ZFcO4yLgnQFFmK+uUxOuDtn7f5Mp75b2s9wnrBJ5mcPgbXBZd0ndRzomCibZ3Yj/+xQISXjmE+JN6OLF4PXWBfxo41+znFgw21E9oFKC1ZYCHHZm5ltpcF7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375154; c=relaxed/simple;
	bh=u9P3vgK68f1rr3UArsikx2/95iy7P8RjrAs0Z1HebBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y73W/Dr2E/wBiUe5S8fSVckAxOs1J/SOMMzygpRKgQsVRklDXjb3Z7e+ohNFuYmpbyYXkGufcevc0XtTKM6NYDWbi6ZB9KW66oKqCGUitrOzu8QMRjMp2CGQO6yaKolTNgdF0mZSmX5JZNDFujB8wUJaugUayHbifMRTie6vUHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QkJcnBqR; arc=fail smtp.client-ip=52.101.56.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2D9uG86+J4zEFhGZoluL1nO+Vt0umxcM9q8YmKvwU9nKdO1pVhkDpsltA03BKlQ5i1u7yU088lvOVVVuuum6134eVRoeCrf8fli3n8eLdwZYCMIKxm2lczvu+e5dqAd4oC1o6qGMO/D08xBxu19CErBilC2fbMmcG5TAaLrE78Jib8nHdZG5A1fvFblI/k2hNS9p8LdQ4giSUFpHE3DKeXoSBXkSxOFpaOK6AgTPEi6R/f88KMMa1SkHX9khmMS2K3E3u3KJ42SYAPRn2hG4Y64Sk9axaxmvhTI8ahXAsdEv/AedOkVBUIhxMo9vvrz7Er010Yn36KT5aiPYDGNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZZT5x4f4BUAjI9Csd3SC60vuE71oPbVL0Meyb+JUnI=;
 b=XdWAuPdr0MIE/1pvZktu7SeDRnaY5mods+dl9VEtDOtzosWeEBtVi+KdznqjNTfKXwDzGoHzktJ2wNaVAK86Ocyp7LxLr6VCRAgGQucFk8HBgDvqtsSqYhQU6aZeVoXUlZsUnMJfK4eTx9gGm3051fsN12mIbVoUFN9+CoppDFoVQxqkl78Gb9ZthVKWjdGUcJTiJ5R2HqvIkTtM6AXjbJkT3YA7+PP0+UuqfAxjdqW0/gSCcVJezB1pUYu++pa4zfX5w1ZGhxMyHLYOjvGlIG/R2Psy/x6UtIN9uS6rAcs6XZv1T0U0K5dLhTV45XJVuhYI63qtNFDytNrqF4L48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZZT5x4f4BUAjI9Csd3SC60vuE71oPbVL0Meyb+JUnI=;
 b=QkJcnBqROySegIxW2qM/avBopa4yJ+NYOYh5a4WDYOvvEmChO9OQEfiLmprCv0ttheSuszmHymMZvrpMgyBvIxRjxVk7j7Tqg4safp/o4X/HYQN0apGMwK2Uax8zS7w4P5RMGXLV/3+kQLk4cUeB2BAQL/yg/674Yat7H1TNQl3R7NwB1Uw5YZOlbBG/75Jw4et+Q75JBVxYZ/1WuFxUpHWTl31gD1PW3FRo6MDlJfhdw3CF5EhQ345sflMvJ/rP0gdrHNqxWFoQ4i9YLUaRjjuC4vmRDTS+1do95k4PdXeNdOBWarekVrjrojNLoL4gj+3+ZjEo5vDayJ1xeDaFmw==
Received: from SA9PR10CA0016.namprd10.prod.outlook.com (2603:10b6:806:a7::21)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 10:25:49 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::bd) by SA9PR10CA0016.outlook.office365.com
 (2603:10b6:806:a7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 10:25:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 10:25:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:42 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:41 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:25:38 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Mon, 17 Nov 2025 15:55:27 +0530
Message-ID: <20251117102530.903555-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117102530.903555-1-kkartik@nvidia.com>
References: <20251117102530.903555-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bfa3d0-8ba4-4763-6f08-08de25c3ad58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?krLy7aAl9B6VEeH0CeKyQPyVr/rzBuKJWvBj78LO3mDZdbD0AevICMMuGdms?=
 =?us-ascii?Q?2cDjBke715kG/Vv93yonDW4m5MnejmQ4GL9jLsPNjjSqSjmiP7klGBNzFcjO?=
 =?us-ascii?Q?ZeHSP9gj8PzNCz8FdVk3i13NSWwVlnwiqretFANo03H8Q1/djaVXasdxaEFp?=
 =?us-ascii?Q?7UDdWTGtj/n+hUcTYt1UbdZ/E1J6G1GB22i/JgoZiYIVXQw/vnHrCMZdY03l?=
 =?us-ascii?Q?NcoFpZNBx83XwK4cH9AI/lMtHWZccmoRo4VNhfYAIso4CIZS0b2jHxLXiHk0?=
 =?us-ascii?Q?/iHGUJiICYiR7SYWuyWrcz41BWUWiBUAQPws9LxA/wnL+K1Y8kbKBZuGH+VB?=
 =?us-ascii?Q?gLGemGqJrLUgsXrQXtP4X0mrVx7PgHcsd1fHZrm8gXCxqmNUtpqf7BqaSusV?=
 =?us-ascii?Q?7xH6VGopVxvh7Rc2kY1VNwn/iedbJbzQBF0t87tyf0zFLGSl8IrA4jT9uw6P?=
 =?us-ascii?Q?SCaAjb4OSw0jlC+a1WbxTe8K4/NNJY8HzJfd3CV2FIhhmJ2+GzEGW4FtUozG?=
 =?us-ascii?Q?OigW7/H+0JNLC8MgKvcXEsQCKMgqJigtmuwX6lKt6LdwJJA9s3MDKkLjJsCQ?=
 =?us-ascii?Q?JJRynN6IWUp9yyNMyeTm5KTgU5RlqjHlkBqTNGwLBuDjEFuStZi7ar3zVA0g?=
 =?us-ascii?Q?7JjtQQxk0BPUotIcpmPprpYSh6ihoUQtE48+DAYn5kaKEdia8dubWlMpunid?=
 =?us-ascii?Q?GD2AUkTRjuidIlMODuXUbjjjYL0/U+tHiJoyIQzHU7EgGbh8DkXgDtTt+yXr?=
 =?us-ascii?Q?Je4P+0eyfmhcuAZJZ78oa+D5d6zzLpsP6mtBvpq1NEesSdDFPyx4VGtPKroU?=
 =?us-ascii?Q?NzVUlJ317LZm2ehlWlX2WzaKr03MdkrhE2OOe48iDjV085nnoJ0GG121MTBV?=
 =?us-ascii?Q?g2vjvHcMWJpKxEftJY+B4qpbAxPh+UhgQfZeC7KQda0ezosr/m1bPo2me5ox?=
 =?us-ascii?Q?iVWXBM+iTYWuULzOMdCjPLNKG+a/adlvKxcxdMHrLIM9MjmqzUI3dM32Uwro?=
 =?us-ascii?Q?DFcTlcbkLsAVBxcdC0fi7BzP/cQTXnRqOFrvvtQpDumIHABLxcURzu9PZNnH?=
 =?us-ascii?Q?5oLlv8o6qqnvVrt1t2onLT93GzZ45+Afw4wlKchH1oEDgPkNszEpwDBUgMrt?=
 =?us-ascii?Q?4n21zKbV30ajC9HO0AM/4mn+VYY1Kt1Y7avbTGJsgGGxAHhxe8nU+A230qph?=
 =?us-ascii?Q?u9deah2omCrg9vFd+cyexNdV+ZP1viovESq+wangRgxPtCSYMFtSxnh3YtX9?=
 =?us-ascii?Q?aaNRpuLRDkB1kzaEzXqRNas9XEMDyBpFUkdmPZ4gIL0/lypJWEFVyA1iN9IM?=
 =?us-ascii?Q?TpSv1xUFHxSMCNhOF66WBVlSktTGjBQYH8mT3O7basBffUV5pyr/NISLK3DH?=
 =?us-ascii?Q?jXc7zGU6T3rDIcCkd2A7gHXfQfJHufMPgjvKCW9KRUEiwl+wNDjndje4yQf0?=
 =?us-ascii?Q?qb3xffnX498p4fr9PiSYh2uKAroGKNHkW0763Sl0bII8Gpv9PcTx1DU41/xg?=
 =?us-ascii?Q?JT/iDWz2Vx9PMdhSP5ZBYE/o1EaJSdZYPqEDjGsdjEhrdsAROJZcXOiMJeUB?=
 =?us-ascii?Q?qGUlFvqkJpznSb1cBBsNsmAUVRLRgosGB6Mm7fuo?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:25:48.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bfa3d0-8ba4-4763-6f08-08de25c3ad58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c89ab76a327f..9ef78c279c67 100644
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
@@ -1914,13 +1926,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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


