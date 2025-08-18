Return-Path: <linux-i2c+bounces-12326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E5B29DCA
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3602418A7E52
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B7830E0C5;
	Mon, 18 Aug 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nsDI7+Ao"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DE30DECD;
	Mon, 18 Aug 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509107; cv=fail; b=YMuQbdyiDlNltTzhmdynMCddOealzW92KJPw6e4fmrRjDQd10eUuRSF/40FY/5QsL2g5A0lIA8bqT11Xek1F9OqEPuZl8acR6u896YmB2UBN5mWTT2qRUJ1efQGz+QWdwe5zMbGiJA+i/zVq2vV1o9jSZu+ppleoiKoqr3uNsf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509107; c=relaxed/simple;
	bh=XxNO3jtcmVPG+rKbJ+OdlxJ9ZFGcbQaAk1NPg7CvPPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xa4Fkb80Z2BRHwv1qhEZR5qZnFzIWUJv67+oqT0AVA6TsiosTwJkBI/VtLYYnRaevTyDatFCy/0bnKqzJqLrsgCqIMWEwh5bkzc5gMIbz9dUw7s6S+H/8U+wDLd3fDotgSPhzXHlFVdkf6JG59u8sVaLcy9WcFvxnquNn7JL+yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nsDI7+Ao; arc=fail smtp.client-ip=40.107.100.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng2I10FIYOgU5lbpI19dphteL5FjoNP/WNBzJK0vmON75txG6UibdFEEGVx1LNDYwXuPVEAHRUH5i5HnHNb3JaGgPkHR6WmpXCAa13bLxiOW46FWLf5J4nlR9sXuhWdn6tTTTX+8uG4kbQJ1jo2TVSIG42NceSOvTpLoXnxS4du4BwI/rDLQspepDo9Hw1iSUcMhQKN5eHT2zFKaTgo+zJS4a0bL/uF+T+2IZjl+aN46q1ioCa0AXeA8zObnGdMp8SHFzrYeRqDXSeTlUhqRvKAk5uLynnCocSOhBi313EGpUdBTq28L6jwkXem4vMXK+K4xywVgRoyrohm2MLQS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32NwLdZTBbvWbF4G+GmyLV39SNwcDUUQmNzb8stjCkw=;
 b=c18l13CIB/WvDwMJiTF/xWNSbQfUSYu9Dk84k4ueIOkzGxu6iw5QTWxK3EjItIHyr1MSxzXD7DLV/FVGnbsU44p1GbUGuwGTfjgLq0lzH9g2PAxOSxU5huFH+aQ0dJ1KslvjFc0DoIwp2f9wpypOhTWpjJiT3GrsynZj7gtTx5EqD472EBtLRgG7KHV5nHDt686L++pgadCFQoYAPUODDpCuXZui3IrxgWfMHLVHisa7K3GxQB0wZkbiuId3f+8//T2B8N0tcr0bua1S6ssl7CyKc0Nxbq6TqkjWkiCX3YFRVocr7CbcAwtop13jxZOtV7wkHBAwYpf4qPtJKNtj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32NwLdZTBbvWbF4G+GmyLV39SNwcDUUQmNzb8stjCkw=;
 b=nsDI7+AoSg21blxv8kpRgc7l0Ja2+F34vS1IttTOTda01lq8A8dHeg06h0db/MoPKsH63slKvOO9XAqqXMMfrciit9k5MprFGe627PS4orddjqjFEI1ncDgSjlGvtTg3Homc8yHzkCu+HQKPnLYhlo7rlFaTgZ8YYJjHfSgCOLU142e6TukM07I2kmfKXVWno6dgMkbDzDh+5+V294UWrd9i5mZGDbx8/L+ppHfDTTxxZJ7ryO0lefYpBLJ4C30Vz1lrmrpt9i/wjwgtAmVBBr+aHyOqfGT2qkHFqvyZjHneHh9uZLIHuENHOHrpxFcmX3j1JhxkBmPXQQSFLgSuqg==
Received: from CH0P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::16)
 by IA0PPF6E99B1BC1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 09:25:00 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::1) by CH0P223CA0005.outlook.office365.com
 (2603:10b6:610:116::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Mon,
 18 Aug 2025 09:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:25:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:47 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:47 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:43 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v4 4/5] i2c: tegra: Add support for SW mutex register
Date: Mon, 18 Aug 2025 14:54:10 +0530
Message-ID: <20250818092412.444755-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818092412.444755-1-kkartik@nvidia.com>
References: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|IA0PPF6E99B1BC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a19b288-12d1-49c9-1afc-08ddde391b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pYYcGnZiqyFROZu9NczYs1GekSTAKcWnsYv3WSjy+AtyAggdblEch7UtvcVP?=
 =?us-ascii?Q?PsFgkZiNMJuaughyxrVqvEmgyuKunx8xIWwaQ2VZLxke2ZV5Gsmd7gu+2+JD?=
 =?us-ascii?Q?rr1330vDnPzaN/vWCmSaCZWu5p0f55GkhzZdGwCvT4yfG0z1MymWrdhCAnvk?=
 =?us-ascii?Q?x8nqGTrh/7Y4PtDnPZeI9McUGQh9xYMelQmBtrPi+EtCPDn0EkvW2fvEWdn9?=
 =?us-ascii?Q?DjbPUzNS7U6EqRlcgscuLqSGpovRdMhejHNwHeoLAX5rvTYik60MlcqllfHR?=
 =?us-ascii?Q?GqSchbOlyVibPQSbS7khtOlSkKf+mKIuPmLc4R9XI4e78HqNoAjVCKwNmZ9p?=
 =?us-ascii?Q?7D+T2c+2GTlSBTiY/f4LI/U82xDdDfB0GQbfx4Vl7+IiyokDodYgZYv3wJME?=
 =?us-ascii?Q?7nEdv5nr86eHXmmeCp/guKTYqsAc6tzNXv+1f61KnvSm9DrCTlFCwSSUy461?=
 =?us-ascii?Q?jeiVBzOhkyNisDfbN4tLRQ3a1bCcPjis4p5V1vYJpwc0R3s8aXZtCEwZTiUF?=
 =?us-ascii?Q?N2WUDbDCwGpD6LwQCM4HcBUWePwDjLvf5LhLf/oN7Q742ykqvzwBnrEwoKIq?=
 =?us-ascii?Q?MmW8lhH9Zd1oaTr02hGoRf0t5JczmlcZYbGXiN6o3sA4jRCsd+jq8KGX2ZgW?=
 =?us-ascii?Q?3eerrAckmpNDLa9HMq+jS9jenXdN8iGqUP/rUIDaFW8QawFMuGWai9tjNmxU?=
 =?us-ascii?Q?Z1srraHm3b6RGmPlbxLANCDwBa8OUtrYxqzzg6fmroGkoBbTHw8gpru8ytHG?=
 =?us-ascii?Q?cUgOmU684czCgdzP0Y6zRqjkuQ1ffoKOXvfoczVRMIrxKrDVfknai3aNHRcG?=
 =?us-ascii?Q?p7uN7qj9E1m7MIqFiS3luRFeXwEpFjuFPU3qPA9/wSb9StUMZ1eaug4tWgP7?=
 =?us-ascii?Q?LDlOGBRjcuTeTyzKPjjj+S55v0+v1EaQVvo6ztQCAxDwAzi1ACwQX0uOXjLC?=
 =?us-ascii?Q?aFH1KG76Ab/6swt5klFsYWacHyVs6QSmY+eCq5ymsjGCQwoxGRHB8Yz/4tqL?=
 =?us-ascii?Q?ReeS7PEyWrXJa7fQwDqXVw4fErvwSHaiJ9HG0tkrx+dlIoQERWQpqbZIMWi8?=
 =?us-ascii?Q?bPxZD/mzO2J32jIJtk4s+XLTCfIxDEb+RNuki/1ajJ8jomIA0Mcpg4bUpaRs?=
 =?us-ascii?Q?FCKlOizwFZyvHN2AM9pjje9+btUZJZNugiLpMEvhriUxkLNooAXQVRNGUYGt?=
 =?us-ascii?Q?nJ9QSJxux36aX+oouod9l6Fknqydgxz0Pz9FoViueUaxB/6hTO4bEgxgpnpI?=
 =?us-ascii?Q?033R4pCyflo68BZbwWB6VmhCxaL3Wn/54ya4HwMbJnngl9RkSCXWfbLkZQvY?=
 =?us-ascii?Q?OmTX65xZdexhTO/7N1cvGy/Yw5DsHztfEMJcJlH3f7MeSxXtqtGzPZcnaTRj?=
 =?us-ascii?Q?+MNNLz5w/NpC8Mpx5fnXURzbE8c9A0pmB365ECj698bcLvfBoA23Mt7owpWV?=
 =?us-ascii?Q?+/qbNUdbEfgHQxPOMGU6zgvA3KCt4PViuk04VcW43tpuVFtYMTKHkY7J5vGm?=
 =?us-ascii?Q?7p9fZiH+IDmpQ5ZtfXyZ/4EM9OQV/PytdDiYgk/+ocKWlg1XarRAwqoJvA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:25:00.4153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a19b288-12d1-49c9-1afc-08ddde391b1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6E99B1BC1

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v3 -> v4:
	* Update timeout logic of tegra_i2c_mutex_lock() to use
	  read_poll_timeout APIs for improving timeout logic.
	* Add tegra_i2c_mutex_acquired() to check if mutex is acquired
	  or not.
	* Rename I2C_SW_MUTEX_ID as I2C_SW_MUTEX_ID_CCPLEX.
	* Function tegra_i2c_poll_register() was moved unnecessarily, it
	  has now been moved to its original location.
	* Use tegra_i2c_mutex_lock/unlock APIs in the tegra_i2c_xfer()
	  function. This ensures proper propagation of error in case
	  mutex lock fails.
	  Please note that as the function tegra_i2c_xfer() is
	  already guarded by the bus lock operation there is no need of
	  additional lock for the tegra_i2c_mutex_lock/unlock APIs.
v2 -> v3:
	* Update tegra_i2c_mutex_trylock and tegra_i2c_mutex_unlock to
	  use readl and writel APIs instead of i2c_readl and i2c_writel
	  which use relaxed APIs.
	* Use dev_warn instead of WARN_ON if mutex lock/unlock fails.
v1 -> v2:
	* Fixed typos.
	* Fix tegra_i2c_mutex_lock() logic.
	* Add a timeout in tegra_i2c_mutex_lock() instead of polling for
	  mutex indefinitely.
---
 drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6e322dba42b1..4b889dc66ba7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -137,6 +137,14 @@
 
 #define I2C_MASTER_RESET_CNTRL			0x0a8
 
+#define I2C_SW_MUTEX				0x0ec
+#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
+#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
+#define I2C_SW_MUTEX_ID_CCPLEX			9
+
+/* SW mutex acquire timeout value in microseconds. */
+#define I2C_SW_MUTEX_TIMEOUT_US			(25 * USEC_PER_MSEC)
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -210,6 +218,7 @@ enum msg_end_type {
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
+ * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -237,6 +246,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
+	bool has_mutex;
 };
 
 /**
@@ -381,6 +391,73 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static int tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	if (id != I2C_SW_MUTEX_ID_CCPLEX)
+		return 0;
+
+	return 1;
+}
+
+static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
+		return 0;
+
+	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
+	writel(val, i2c_dev->base + reg);
+
+	return tegra_i2c_mutex_acquired(i2c_dev);
+}
+
+static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
+{
+	int locked;
+	int ret;
+
+	if (i2c_dev->atomic_mode)
+		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
+					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
+					       false, i2c_dev);
+	else
+		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
+					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
+
+	if (!tegra_i2c_mutex_acquired(i2c_dev))
+		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
+
+	return ret;
+}
+
+static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
+		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
+		return -EPERM;
+	}
+
+	writel(0, i2c_dev->base + reg);
+
+	return 0;
+}
+
 static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
@@ -1422,6 +1499,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+	ret = tegra_i2c_mutex_lock(i2c_dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1451,6 +1532,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	ret = tegra_i2c_mutex_unlock(i2c_dev);
+	if (ret)
+		return ret;
+
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1526,6 +1611,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1551,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1576,6 +1663,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1601,6 +1689,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1626,6 +1715,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1651,6 +1741,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1679,6 +1770,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


