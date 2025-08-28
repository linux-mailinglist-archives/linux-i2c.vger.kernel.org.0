Return-Path: <linux-i2c+bounces-12456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68DAB39388
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394EC17584B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 06:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE98A1BE23F;
	Thu, 28 Aug 2025 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ikP+gfeA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A0278158;
	Thu, 28 Aug 2025 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360812; cv=fail; b=nlSM8GwZkp1OPo1de0ovc2rIDQnx22v3JLkRHF8rP26xI+ZkOIAT9BPQ8OKw/fCVLjqZzdiw1Nu7+wsO2DWcHsaLmtpop6NkOS1pzh1JjHvK9QncX+NUz6dPOim9B5ka2FWVGPQfgwfCo2Gdunm3a1udqsF3UvkQ+mCVRK/vx68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360812; c=relaxed/simple;
	bh=Oljk+NrQM81Yd638pCNPdPGte1+VQl/Uo3zi24cK6XA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPIntL6K+Xc4+hBQx7NkvsjD1mo0X3wb4kgL4/28DtjTk3YtyPWHdGpvKfVNOm5lrlZC111o1Uw2uoPiwk6mLLR5aoEvf/gREBKfQ1o2iotLhY4OeJhcuWETprYCOIrv5tTJh158GgdaPZKC3cXtvr7uqW6Y/w4ZvJqUv2CCJCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ikP+gfeA; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN8NkDnhsifZn95cypxhE27d2+j0lggEr0/KmWZ8AppiosgzRWTGPQwKMbUj4WgH2xsRjj7oF6D57JqeIdxQhDfo+6wPlz6RaJtWRT+2SaqO27i0cAUaavzKlg6ctRoNnP7rKJPWPgp1wBpgX+4f4bPgYT7q2pBTZFPakoS1nsoepC7I9mfvfAla88YdDkxKlkFfn3G6t1AwysrbQ11JstWkkGlwE5SvMGgerEVZvuQnvAoeJJZ/6Ne2OgAG8SiyZG3LNOBC4t4nYVq2O1ehswbADDqYF2p839v68eRL4XiC3XPrSATYGRMNgLjGlqLTP4scSDYXJ/A7NYl3NNCTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReUomarV8sR9Nn+0rHkhkpulrzJUqqUjKScErWMjDcs=;
 b=T6sJ7FVCAH/YHJuqIgcuekocU5VTDZx5PpPejqECNfSYmatuirNRZvCPLJZTZISvm28TZT+jG4gBRAop6b0xOC1nm9YIks71/XZNICN9yNg9iq9oG7j+iz86GuxtuBD8EiJKL0pLWl9v9f27wI5xdiAddA62KqjdvgTPWEoP/7u/CM89cjTzPPrUONFy0CV8Yrjq8+pnToUcJV4UUEP2ThI40HoiS0IyGG2l7/5Ig8XR2gTXjlaNUCrdnK+b5GpQ1idh3nw5xLFi5n3bL5UqiuEEjGPIKCRPOr7I/95H0/UQQF5TMNRYhYcwFnN0Xx0tbzGtOFYREBR4GsnyETcrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReUomarV8sR9Nn+0rHkhkpulrzJUqqUjKScErWMjDcs=;
 b=ikP+gfeAKfdGkGuTBCMlkNzfZbevNyhlULK+YUZb/6RiGKt8BZ9eovbNg8pIajCqbRj1J1jUU/vYB+lO1bAkQ+EmZcr9JqgMoYQaJT2NzRxjBjWFqacQ7pXSb97vSwPk9p8kL1sGWAoNF4wyuD7txwRIjUyfDSlmo1qGnDsehV31QvGOg6TivlMQo6m9lTkDpIcIgYQp7Tfwec0lWf7NWNJZRHAdKIkHpRWGM2JJCFjZNmjHjryw7R/dLMSTtsAM47TY+MSKanXUVO25PErzosnN/PEvD19Rfa2Gl6BmCfZ/1TV3NphjLB6vrmy8hbvk7mCYNNGVVHTtnfkv/Q3RZg==
Received: from MW4PR03CA0242.namprd03.prod.outlook.com (2603:10b6:303:b4::7)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 06:00:05 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::bf) by MW4PR03CA0242.outlook.office365.com
 (2603:10b6:303:b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 06:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 06:00:04 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 22:59:58 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 22:59:58 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:54 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v6 4/5] i2c: tegra: Add support for SW mutex register
Date: Thu, 28 Aug 2025 11:29:32 +0530
Message-ID: <20250828055933.496548-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828055933.496548-1-kkartik@nvidia.com>
References: <20250828055933.496548-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a43d10-3700-4296-a40c-08dde5f8227e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KvAiTpvBaLn6rI/OaXinSrjOyIFV6L/pp+56SeMdiLuj8+h+JFFxza3VFt/B?=
 =?us-ascii?Q?nQW7bKIbRsUKxzmWpTlR0HFjL2QkvDiRikHmt0li0wRVdRotHTCn2ft/vsqM?=
 =?us-ascii?Q?ZtivXqDCWMsk6wRvP394kgughZ/4hNtLcGz05sjwEudm9oK5BygGdtFDcqOw?=
 =?us-ascii?Q?YsDn8aqC0seRWsnHFKSfVj1sT6uuVRva0XJGPoHMQ+PXUnQVJH3WeUh9P/3V?=
 =?us-ascii?Q?G1puS4tluBXiQULDChfG+Ti6ExyiIEjuvWEDj/CkBItxXbh0/+2lbK40ZFNG?=
 =?us-ascii?Q?FsqG5nNpOF0MvIONNI8uTDv0N2RxxF+raATIhY6P2hLayBiejdiCpxGKcT5+?=
 =?us-ascii?Q?y5V8ouY1NZk3cT5f6DMcir0lJpeIFLWtgejhoGqQ8n8f4O4GzGUq5I4psGZ8?=
 =?us-ascii?Q?33SQOVIMSIjGyvfa+UpfQBBXDQQHva9ManBv29jzYYeUS6zAyQJ8vYTzrtWW?=
 =?us-ascii?Q?YyPljOxpNy3ozRGY/v+6kCFeZSrQ6EvmgdoVI7mF1iGG23XXE5oQMeXbPG3E?=
 =?us-ascii?Q?WqoVq9HkzXpiRVh6yi3rF/sBQ8/iz+UyvLNyIjzT3e9ftHWWDeunpmK8oryd?=
 =?us-ascii?Q?PKUsDEYZU/1U7DfPVT4WPRK1g7VsB+SwXFDYot0cqN8BZo7Kxw0LNgCcFkqp?=
 =?us-ascii?Q?Es+G/GqjBHX/pRqxV+tHWK0+rPYcny0AUwtQ8LSWOErpU118s7LVnzIAdR5D?=
 =?us-ascii?Q?HuYEWEWeXVmDilfkZsr1t+Og+CCK2ujDvUZBgHSMnVTrg+R76RRRUMs06sgB?=
 =?us-ascii?Q?IO3eY1997FrbXGSTFQ65XcLmw52QQ1KVTtKkdaxA9ICo+xLypIxC5zy4J9Wl?=
 =?us-ascii?Q?1ySCkskQYSeUuhU4GCriV9NjHN6WKaqsNtozu7CT7Da74tR6F/ip7we1zK2o?=
 =?us-ascii?Q?uf6OhoAwjHMAvxFoaogaAq86bN9B79hcurZ/IXLQJ1ArzwjfRvL1AIiWOgQv?=
 =?us-ascii?Q?+daROGlZHL2SofJ2Cy3fRPoY54fM+9Sfy1Of4tvpAfGb90yfanDFjr1Ov4Ai?=
 =?us-ascii?Q?7GsGJ73hOuKqvS8t5lFHBpn6LmWTYWgrGZrsNwXRFUFQWOI6T7iqHzM+rYZF?=
 =?us-ascii?Q?+I6ZLj4IX+BhOkv05q3J+/CPzvaDXNfG6sJ1+7JMBsxq2g5daeyT5DuOXzR0?=
 =?us-ascii?Q?yNYD7skMvL6ij4Uk7Hes9dLBULgpjTyvTWyXsIrq7OvWWwfZL8HQ0vg1YloM?=
 =?us-ascii?Q?yj7O1OinxZZNu8VzxXqsWdyCXYtUoxrvCKHgC3m6TgfC6dCvynEs8J+MlWFr?=
 =?us-ascii?Q?OIh8CgP7SDV82os+CBJW66cg0smBvsVmGlRizg7GhV6BzB9zYRLyQy4t+UvT?=
 =?us-ascii?Q?hRgxV2e0HggoyWemx4/VBI8rt5y1/4xSd7fo+/lr5xVrzUUKt90C6SUYJk7z?=
 =?us-ascii?Q?rXPMsmTEoS8KDaCKVnqKTkyN8fgPSPXgvy12cXlSL/2EReP0VhKqjhPMcY2/?=
 =?us-ascii?Q?aSslVjDtJCG5/cne7CjX1M3bivNDsnHhywGOvJ35XI/4LRvD2KCUlxwLaMBr?=
 =?us-ascii?Q?CKxCwIwhbS96GGgBlVI7KWAqqO0x97XZD0GAN/6n0kBq6X295kDP/+aGog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 06:00:04.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a43d10-3700-4296-a40c-08dde5f8227e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v4 -> v6:
	* Guard tegra_i2c_mutex_lock() and tegra_i2c_mutex_unlock() to
	  ensure that they are called on platforms which support SW
	  mutex. 
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
 drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 20d5c8a6925d..88ee27f90526 100644
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
@@ -1422,6 +1499,13 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+
+	if (i2c_dev->hw->has_mutex) {
+		ret = tegra_i2c_mutex_lock(i2c_dev);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1451,6 +1535,12 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	if (i2c_dev->hw->has_mutex) {
+		ret = tegra_i2c_mutex_unlock(i2c_dev);
+		if (ret)
+			return ret;
+	}
+
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1527,6 +1617,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1553,6 +1644,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1579,6 +1671,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1605,6 +1698,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1631,6 +1725,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1657,6 +1752,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1685,6 +1781,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


