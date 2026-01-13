Return-Path: <linux-i2c+bounces-15087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9365D17846
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546C330334E2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 09:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351183815C4;
	Tue, 13 Jan 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FYRl21aX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC232FF646;
	Tue, 13 Jan 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295127; cv=fail; b=MlFCs0Ca0TjljrjX4V19odHgG1+8K5QvXNyN07LtyAzGIbylCW8ZMUEa4YBhrpnu+nSXYsi+VrxvdUenDONvMvA9ZCGqyTceuaStmQtvpyaC4oqvIIJsuNc5Q5L4i4EI6YZ9/SpUMvUEb7yjn7Uy1cX+oDf2t2ymjt78miHADdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295127; c=relaxed/simple;
	bh=Q+PZUzkWUqeWnIPZtS28WzeFn+NBqe/W//fUOHoFXZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLSuhHAaOiGzOSulJlMusiamfUYSyfYbi68kmgPOMBJeAwTGnA462DmIMKHpwA2vx+sa2pGFxu82kPX+9jcnBQF2VDzHCm3L+KbempOrPAVx0yL98O1XV/3R+Dvd9DYRPdeHRgO6lE1u48hM6xUJJpQ7kLdeUjw06f00MZuChrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FYRl21aX; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLJ75U6DBFeYhPF/PiYD1ofzWIJ5jCdgDwGU4c0wbRNY6jCFgi6Jojp/Zi8NFKl+xueTLU9x2AmNjdsX771NzJkBRLiFxHcHoU7+w+zOuOo+MJ1qFdqD+U9nRbBaaKJ7Td84m7U6R+vq5gW7WQ8KNmPF3HtqRYtGNEqrTBoAkIBQGBNvlulEKkY7/z6XNnyaBxqLCaei3Gquqx36TcLj4GBtv4mcmsYMac0m156NNNf2q/7XX5ZSIdF37kEX4x/5GCOH0ImPRA6hPVU3sGUrUOnAf53ic2ywRvsGJS2A4GfrJAPC+OCQmwRJl3bRvZcf3dp6UvQ7PGH1WmJjcEpU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUUSZMNXeddjL4OBQeoyEonUtav0YN5dqUecO/60FtY=;
 b=Xi7NQRzOjTuUP/Rc7wVz+nVWP9ZNoN3nQ/KmTBcHn5srE13/8ZGyzFC+XKvAiM61aIH59J1U+2ffmNKuS/kBOrwax81VKBhfKRP8guDJDkeU0yXaZe6oopfZckOAcpE5ONZaebFJ+/fexyZx3MWECKmANu+7Sr1Ei997i6fy6/WKkNTj023k8IqxmHp5W5OZL53ob1pvrcb+b9goDwdJKDB7jsZlat8fTRUJqa5FcziGxW9HAs43bFOrp35FmJqVwbSfaeFdVEvyB+l5pAw0kvx2EXW3SCdybIx1V1+484hGwiHQLuiCVS86Vig1xUTmQmLeXPjVNLFQoEcRTGu5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUUSZMNXeddjL4OBQeoyEonUtav0YN5dqUecO/60FtY=;
 b=FYRl21aXN+FOsOno/B8lPPJns9uLsmKyTo+pWcDbMoFcUmfqKqGc520wDn0No8uDF+hu97N+94gPUh1lpEvSfs7ws0wFmCr31Sj1gmvMo+JtUIazzJKL3RnTVAsl2crImxLTnOSErZceRf7bA3r60Tvf+rTGElXksjbjb8PpYFF7PwP11LdayMNkkWdjn/uFZmr+gj8IrHMBFHJuzvz9OZzq65PTw231PUg4+JAG+QpZZ0CR6ggo44vbLSTdJD+DNr+dPZ8VPSvmQGQeyKv61+HWTX8H6zz50+msSmNA6EhqzBD/uXkFnvDYkcym2dWFT2POpfIRIqg5X63od6sVHg==
Received: from SJ0PR13CA0184.namprd13.prod.outlook.com (2603:10b6:a03:2c3::9)
 by PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:05:19 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::c9) by SJ0PR13CA0184.outlook.office365.com
 (2603:10b6:a03:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 09:05:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:05:19 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 01:05:10 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 13 Jan 2026 01:05:10 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 01:05:07 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v6 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Tue, 13 Jan 2026 14:34:54 +0530
Message-ID: <20260113090457.41689-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113090457.41689-1-kkartik@nvidia.com>
References: <20260113090457.41689-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|PH0PR12MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 51352a92-6c62-479c-4de2-08de5282e052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bsHmeVjErgLBwp6KKqosmvZ/WTn/hrbuxeV23T/+euzp7RPuYA7RRFiDSJ2t?=
 =?us-ascii?Q?hq/Vxs0VVa4uG0uQ532PRv+W6SSzvTzT535glSAMUD94QdrbAyBUFRieDhOU?=
 =?us-ascii?Q?bcSp3DzRU+vyvjXmUPJvM7Bzmn/rjZXTTqIcO2iVY7Eh8bkPL2l+zI4uWBiD?=
 =?us-ascii?Q?SLO3fAJHLNVj11VfwE8kRwUOwYpLLG2/muDdH/5VW86W7dvHWie7nINhy+fS?=
 =?us-ascii?Q?b9bUHPsq7dn8yAWO2YtPwE2BZ7d2OIYvv0IMu2sGZHw7QGY03p/LxAu7Dtl9?=
 =?us-ascii?Q?b9hvESGkSq+IOX36ZdGVZoZP36J8dDnwhoi7mTtyRlep/s9e+5OYtZ2yGdRN?=
 =?us-ascii?Q?NQYQvq/by80aoZdb6HuwE0Lj9OrHqt8gBSDtOsS9pn69MjBYgAEvKJxiMD7V?=
 =?us-ascii?Q?qeGzs3v500WWFMJhVg6dVY+rS4NsvVaPoB9yaNVhF2kCuMN1q5ko3tB/L+OR?=
 =?us-ascii?Q?g9rSQE1olbvHqAzpj9tNPrfedQgFSuAxSlbMIp9gu85BGrXkbUS5s0BrQAQq?=
 =?us-ascii?Q?cAeKypY8UK/mGbQ0VboEHuxbf/VG0TaF6AAfumg1dlzSia6Yk8u08KNNfrTH?=
 =?us-ascii?Q?9UllPelt6qaB/KiIXgbDwWQxhFxXTES0PdoAwGiMXOzqNnSMBB6bzHH9SYWK?=
 =?us-ascii?Q?XAzHqKuOql4k4U6IiRbJp+icazn6XqAEmbmB+GtlNUCWtBTG0POaxMN4ZFrD?=
 =?us-ascii?Q?8EuwcLipTtu6vR4cdnAdQPt7OSMBRcN+tNKCY2o8vo5t5FczcJH/TCGQhJL0?=
 =?us-ascii?Q?mcyUJtNkLVVALX8U7OB5VLpCsbOHpJDmhbW85f+NIc/ZySXR9yESShn9D2D2?=
 =?us-ascii?Q?0oGSxHum3veortMyfdpxR5Br4lfAkNhDvmn117dKYo/EqdjSjROsy1TvQY4J?=
 =?us-ascii?Q?IO/bvmCo6hb5EQshEN8FlV+xBAC0niuCc4Opt7/UStUlgoLmLR/N1Q1zjU7n?=
 =?us-ascii?Q?oYmOYkvUIHiGoailUdRVdReIDBh0fEFTkNCnTKLEBShA/T/tLpyiUHkn5Q7d?=
 =?us-ascii?Q?jiX5Xmy5iQ+V7/GvmpBEtn42/1MiRaD/l5f3IIvErxqkz7XL4qNEys7d81no?=
 =?us-ascii?Q?1VYO5VEV9O/opl+/xpY8kZrCWJfKxpZm8zb7P7JzkgYR+5MFs/9Msq1ANRCD?=
 =?us-ascii?Q?H86APZ/9uFZTProysNo8taYrcOvJs5+Udp8S1y2iGWL0bTzrZIFKXlL+j1F0?=
 =?us-ascii?Q?oD0Iy8zEkGtBqYGF+YeMCEZ5LYeBr7L3yNV5aMCHV7qjmjll4w27vPsfQGxS?=
 =?us-ascii?Q?AF/ryBnWXylJRpfz89n7tJ55alJqMtDiz7ZiI/3PD62jF45D7a7DEJM1WOqe?=
 =?us-ascii?Q?7Lq6bx0hmQXauRP3kGu75b3RrirXFzlqtmk1AzZlOHBBrqXHlwtEv1mH8UY5?=
 =?us-ascii?Q?dmo65EUNrXhVUXaV5IDVBTyirEJac8vimA9ae8J4SxkQ9rzXPgFl4u8H043I?=
 =?us-ascii?Q?hfmIFIqdzGqZQb/uiLHjm3tzEMy1cIXmSWXkwm/uJFX0pfnlFShS088P11iN?=
 =?us-ascii?Q?DwW6ijSja7xzvjBr+1DQT9gzPV3/hGxA5dUQTTFB1TDo0y3KVqp0si0EFhZ9?=
 =?us-ascii?Q?O+glnpjoNiMlbXChwRtHH2xUB3o6Iia8V4kHCjA/?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:05:19.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51352a92-6c62-479c-4de2-08de5282e052
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v5:
	* Updated commit message.
Changes in v4:
	* Reverted the change to remove config checks from IS_DVC and
	  IS_VI macros.
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


