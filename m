Return-Path: <linux-i2c+bounces-12431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468EB3570C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8D8E1B65992
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D262FF179;
	Tue, 26 Aug 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pyCmIizb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0F2FAC1F;
	Tue, 26 Aug 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197212; cv=fail; b=Yv2sm03PrRz7EoEVQah5loH2SJnd5HC3q8IHqQ8v+fQizmNRNBQsBxg7fkGsZkDiWdj1WNJV4s51pcOBYuBpFUl2fQrG3MwKYVY1AcwDdrl77YRSEvb9KHnu3AETRXicfPeaIDugmxLHTAg8trlEwJpQ5NaWg6pZ4jxExK0kPQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197212; c=relaxed/simple;
	bh=JW1mgETgSFmYyqZhQH4uV/24RZBAO6rS3OMVvpKLRxc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFKm5toT29BdnKyO9IVWnMfrqHT+5HQw02VP+y8kHerpn3MsSV+nUa0nCgmPI3yERMD6/Y+C4OLged8nx0PCd4t8thUh0NPhbmwFI5qTFfBndQm0YpCqUBSaV7unt6wBMD3R/in1kZGEkYpAud/xrgUID1XqYuq8tXU7k3dZyCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pyCmIizb; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/vm6NDdbTwOQEkmrLJJ0lugTYwX43rQuGckKfblRatKOxiwG/Q8UOubBxUAJjP697ppOYh3ITUrwTibEBPa8kEO+zKkxcOt17ysDhaCG7AZP+nCVMUZtvpo/rTrDDqsIUQAnMUGTDwADrUmDOgBP1d/sIcWkLjpN3i4CweSHH6VtqjOFEjezN9aeDo85G2RqjCmT3oliNTLRjXiZbmem8Nh5gQZ0s68dPNXHejTpOzxlsQa/5vlCQTT5ktItS8/FlEUAauWLaCVrucAxSJzi6iSiUQUyW6Jjku4ryoK6wUG9d6XeM+4oRL2i4S7rKph/PjNRsWbk+Z+5n7HNXhZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjg0C956GIp0dXz3R2XRKTbAadMqS+n/2ZmeoKqqCU4=;
 b=K2f1CG9UVgXWruLFH6eFKtSNIgXicqBwHyONuF68glsnR03rCUq6KYsywt1ZZMCFc0fm2Whcp1IxvBJeWKPHcsDerGmuhM3642bZ/4mwACQpSaU8zJXBPiXRgmZtnDM2LdJrEj0BHh11JXRqRo2eUypjsjyLQg25KbnVpdF3fqlsZWWZM1N69DXGIt9g1SmhUDF3J7TiQ9DPH/lz7/Vfzfhx2VO1uK/yxf3gw4kdv+cYgslNTkv9CuyF+5Ptqhkdo9ym1L11gJqO8xSMEcIkgtX7W+ats1dvKeG8g76FJC7f6nTQr46NBGTN1HEb79hotvSPTHaUz4I68NgD4ip6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjg0C956GIp0dXz3R2XRKTbAadMqS+n/2ZmeoKqqCU4=;
 b=pyCmIizb1fT9pXF0DKT0lkZBrhUt9zjx6TMwS4ldSaBIuhfJtmTl2ecyD71VHHQx9Wiy6fJJC3w6IAJT5gLA3aGCG7D1nhvCuoiUOfR3X2zVW/3B/EsrpJkU3R1OWCJNzBIzdJ2VS8AuvlZuwEkjmx5X+OiKEPIGQSjHlokW/o2ZxylpmXxOQA8QZHN5PugWv1ZUK6Dm7gpz96GtoescefaqyxKovTcyY1tjNcSUSXOMzgDSoviZLh0fRr/o+W4GYu53zd+OCTvN+paU+zVh+w7SjpTvPUnyEUcCHZz6cc4KcxRKAp/ECV4BeBaMR6ir/xDf3paBz+XxTMoa0+XLxg==
Received: from DM6PR05CA0045.namprd05.prod.outlook.com (2603:10b6:5:335::14)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Tue, 26 Aug
 2025 08:33:26 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::22) by DM6PR05CA0045.outlook.office365.com
 (2603:10b6:5:335::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 08:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 08:33:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:33:09 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:33:08 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:33:05 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v5 4/5] i2c: tegra: Add support for SW mutex register
Date: Tue, 26 Aug 2025 14:02:43 +0530
Message-ID: <20250826083244.487610-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826083244.487610-1-kkartik@nvidia.com>
References: <20250826083244.487610-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b082c7-d69a-47d4-8c53-08dde47b3999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tXKjf69rvUASWL6RV14YWP7/BCfW/qLCWGqQjSHNDZtxqbRq9vu+LS7RbM0S?=
 =?us-ascii?Q?HhG2P1NAESxlzUKkLN+W/3kgOwZmV9w8NW0aG2VwAOVKArXVL1ju/E5yTpr6?=
 =?us-ascii?Q?4MUN3oqob4mB3MDa+L+PNv7c2qR1zWetPZjrDuqrAxc0GpwXaiCANtitjWi+?=
 =?us-ascii?Q?p1Sty7YptugHf0FfsSj+jLcCZReJhXN51SSG0WvqO2d7GqgichqQD8WV9cS6?=
 =?us-ascii?Q?+fbsNR75TYmg2ktnGhlpEy4xrfHWUxmVlYEufJb6W46gnTJUbwvG31pFcOne?=
 =?us-ascii?Q?l0dNSH8ZxMCxK5d4emufwH6mzE5wqygvTMqh/orbYZcB8vOIieMYeiIrwRfz?=
 =?us-ascii?Q?xfGgANPi1UHlqzl15BOozoj1KEqYGccBsmVk2oE+T95z5RC8CWBzZRounpmt?=
 =?us-ascii?Q?0mOjPgGBRsMaV6r9lLPazloN5fnlQUXs6h5pGZUCBq7t4yStHfaCtcMZrkcS?=
 =?us-ascii?Q?KyYh3UM1sBqTfyp8D9BC9wTBKdPH4DoQtt9kARy76bIgGIyzE45lF1YbQUTD?=
 =?us-ascii?Q?pIQ9tvHGsmzUcRDuwJyg+RWbDpHxw1qgpz3v/7TEtN4SDOV8P0k0Sr2fBEX+?=
 =?us-ascii?Q?39GXorG9/a8+2IYRVCnoQeHI8zXeYW4/6IItydTWvkmXHGXlXhiVSdTcZg8P?=
 =?us-ascii?Q?5mA3MWa/GWL0+RvOTLXvsbjkcnQmpkZfW+8nPcZDeTGQszEJHu4nx3pZM53F?=
 =?us-ascii?Q?pRt4K/GPAcg8aqScipZTKeQPae2vvG/LcjBfTMpQrNzvyer5G+1EomGXm33n?=
 =?us-ascii?Q?DL1ERLNh+vS9vfFN0zznk7rDqaXhKbWnWbPSY25BLhxEpUJ2cGvH+gz1g0b3?=
 =?us-ascii?Q?77HJusLPQpfgeU6JpDZYBDLMgtVW2uErjJMNfMlOGr0lCei+/FaOtAhqcezd?=
 =?us-ascii?Q?CSxV/DqVU7vFfJfqvoqEfDqJbDNKCic9pH998ZNEJX1cHdYh/7vPOnUueLAX?=
 =?us-ascii?Q?z/3VGSiPt02tyJx3gM7zE5N4dgEunHDGk77uvitee+0ajeG6+3fNd3C5erMX?=
 =?us-ascii?Q?HQ+/Bii/0p3/xgdtJaszMZksy3jB9XzxYWmKogfBF7RfapeEb6RPbwqVZHUx?=
 =?us-ascii?Q?jorDnGck9MO+qvm4ezduvcQ6cY2HsjodA2alOLQLRhBTsd+atqq+rIDpsEis?=
 =?us-ascii?Q?8BMNyumAYUkvOwB6FRuxJ7K1D3nqS+mYl+Ai6jy+/0sG0d7NiSMlUOCT6CnI?=
 =?us-ascii?Q?4ghUU26XJYOadUcGqOjgLMloGL0XSzhY85epEcFtNOrAEzK7EatsWJgQc1yB?=
 =?us-ascii?Q?hFk+r+gbjrYC/ASWuA3kHh7nBXlpRMNIyAphKqD/rmvs7fILwYE/aqzmo2lv?=
 =?us-ascii?Q?Gl04/NsvA9A/Xe0BPzhnlrLtTSdfIFZFE0D5hi/ZJRRWc7FFzeDQNKuXZUkU?=
 =?us-ascii?Q?dSr2ZAh7QPn1RvEBvT66oQuprf2DSjb9VtPzv4bhbNr7kmlxH51wQGL1+bSe?=
 =?us-ascii?Q?maacS6dsARCUbe3mYDTXXf0dD6EohCpdDR4wK7Zylt8Qt6bGLiwISkKs7oVD?=
 =?us-ascii?Q?qEISGvyLEFTeSuqI0KmVLR4AoJaxkUytkRlfHT9j2XOvVBVYYB8EMowxeQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:25.3680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b082c7-d69a-47d4-8c53-08dde47b3999
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

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
index 20d5c8a6925d..aae1645dfd92 100644
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
@@ -1527,6 +1612,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1553,6 +1639,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1579,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1605,6 +1693,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1631,6 +1720,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1657,6 +1747,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1685,6 +1776,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


