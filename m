Return-Path: <linux-i2c+bounces-14050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E010C4C9EE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C01A4F6B5B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971F62F3600;
	Tue, 11 Nov 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bM1t5e25"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEF2EC0B0;
	Tue, 11 Nov 2025 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852635; cv=fail; b=NHVwx5HnqMkXRbOWRc0O/tZ+mgOwPLQBjZ7ZZUHhTmbC8O7A0yg1l3Bu3Dv/DpZXfhf2Ft5a5kmO+GS1R7NdnsXt0PCmI21418W1dfZZh8LBOXs6YZBNDw0B8R13KwouElMovkLoS6zAQjdGyM3DM+aRgXiSr5AVVDoxE+3duKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852635; c=relaxed/simple;
	bh=h/h1wew0QQNAvq8b3zOLe8NakUL2RjbaqAB4noi4Oe0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxgdJjDGyyixaikrbAIDju9rkQwGvWHJSt7SdPrgBEeVAEu0NzGy01lyiWr+QlbkdvQ54Ld1k6tqu5TO+dk7huLNqjUmXyVzYTlQNaSbsXdr3L2Q6bLKJHW569MV4cFqUs3hpb7g/K+AsvSJNJOCdH0lOpMv0vEMkaO8TsFoZqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bM1t5e25; arc=fail smtp.client-ip=52.101.53.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvBLHmF/thYCM+hm9hytpdaEYRGugkA8ksqXSIEwLjNMiaFj2PKXVj/aaMDReiHAGrmquETA7A4bdl7X45zk0FWn08+EE9tcBIqDteR6opUdUNZYxn4ddrYB2K0bIW85sssCPuyIaslRZ7IYAz0q/y/Rt2h+v31g/44DzPpApICmqPocVaH4Ga2qJX+OjqrNDH00L9oM64oHqkEewaiH98Qi3Dn9S402E+3fYhIIwEAroqwKXcLnKJuvYmkCQL7p+Qxp0qQDD/ODvwxDYnJP6fNSQyKL0C0IYLLLhNjuqRSEdV6fgcnm2uixjrKmS5gSsPr9NnoPtdcoCOQfCZYmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzYZp7CWj589k+dlJt9KXEHS47lM3oCe3+H59zIac7Y=;
 b=JlpaxNtpqD42oulWOH8B/zCqVAq5ieHYuaJdvODk2DG9sH/HErsSWXb7NJCbmAsuDYnP+RgyCBO2mQQ8sXcySiBKjIPhVGHstYQMRMgbqtrHTgsOWCVn8hvidRqBsrQS7HadBffJXe8WcJ1A1HdEhhg33E3m/sSal0KWS9+lg48P2DLTTOEh10Ad1ZgE2ShLz4WFYkHQBaSaPf0S2MsRMU4VlThSuA80xGuqyrxCZbTQRB9JB11Oo6GD5LBBKqtfE1VNncH3geJ7G3hrFPol+4AkCRM3vFzsQORmzGt7RzXfZJQWPfNZRXqHgnU8ufLPznaoKPKYP8p6/6xeHwdPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzYZp7CWj589k+dlJt9KXEHS47lM3oCe3+H59zIac7Y=;
 b=bM1t5e251+VtmahCtSig/z8j+tzXeJYA2EjIC49BT/7mfPggpj/hs2VHES+g4FK83fEA6ZgZeGBket1ITtK+k+Wk/7eBoUIx+eFrPekv0bJu+pCFwm3mfN2DWVLF8BIDBT96sgA2hakhF89IqDJ/TrZlNzbafTx6VnPJRHFlbfXIbu/xIC8BN2NucofAg710ENEvKprjUo9ulVO07kWId5Q209zyqIbuD8C20vh8+inOd/9c8jU9JY2DybJImybr7sTu1W9xhYL4ldqBYDfT9ysqqz7Kwze64P2wnOon9M5ovODD/Lep5KG6FBFjKjdpBLlALyFcUSlMEMEYTXGD9A==
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:17:04 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::55) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:17:04 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:49 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:48 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 01:16:44 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v11 3/4] i2c: tegra: Add support for SW mutex register
Date: Tue, 11 Nov 2025 14:46:26 +0530
Message-ID: <20251111091627.870613-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111091627.870613-1-kkartik@nvidia.com>
References: <20251111091627.870613-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0d780e-112d-420c-c940-08de21031450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6pJqve84RbAvXoa0meUDYnv4A4liVTOl4/5eGhzn0PrDV8nPKUlTjtDXissk?=
 =?us-ascii?Q?DwVSVOXisWpmHvybzuDvxGZJBrbWUsp5zAJfe/4Qh27DFVubmq6kTSMQBDM/?=
 =?us-ascii?Q?vFTM/jj0b3qiUEpAmtm+3zJVh5g4Z0IgeYKlZXstlQuOYBrL7paIVMwoa0T2?=
 =?us-ascii?Q?04OF2rxTvddadMvglTivoFX0W+RzkmCyXaYosp6Yiqj/EARudPcLNTu5xN+e?=
 =?us-ascii?Q?WSbqaw956VVc2+NELx29iTtzFez1iTV1WXWyp6IzMAttOt5PidqPC2MKOXBw?=
 =?us-ascii?Q?4JUeHZnYYOSIk8fpw2ervru8oRk0yQJkmUKcDKf9ma7h0z2eEubxZpbp7zLm?=
 =?us-ascii?Q?+KmnkMJ47hqm1QTood76XI9SS3qzpEvKJoi1Y9LsMwGtl9t92SROJzTCBHg6?=
 =?us-ascii?Q?OmSGy0f9bUwGv1k679XJ4CYkIjkYzXqXi7wckjDoWGmXjbLRYRmMx5yeWj5B?=
 =?us-ascii?Q?qZpUC21VPvXTMpsKuNeOJ25g2dzHIjYIXQFrC/dfpD5dBTnUg1//9YUQ9UbM?=
 =?us-ascii?Q?6QYOIYZxxYuGYeDflCytKQ16lZSHqeHIZ/cGGwH2f/RmXGDEKoBpANfs/Epc?=
 =?us-ascii?Q?fSVCfxkNfZCquxCb1xDRKTfrxd5ksR7JTLu6/i0LxQRCN8Odsk+vB5jRwSCW?=
 =?us-ascii?Q?9PDAMifXBtU3SayAeOh1wehAARc2Ob+LhY66/xExncicExylvkZsgxHPWF7D?=
 =?us-ascii?Q?b+JOqrhzbDwiVTodKOZ4ySZm+uE2GZ0BDECTlL3eJjVihscq1zMRLRvhTPGG?=
 =?us-ascii?Q?jmS09Jcw2CD1fMnOhN2IAeKfJfpbQ7mumlqR6wFcFNc+fns+RnJyLTbNcJeX?=
 =?us-ascii?Q?w2FmrdK7gmX5IIkyVDqTtfaBsrSOzlt6bOu7OAPt1WAAXHBEpETA9pt5SHUT?=
 =?us-ascii?Q?5ecjUwrftw4KFbxGS5Kx0UBQbxHdQkN4xdB2EWtuwjWzh3rZFVKO5rHYNr2E?=
 =?us-ascii?Q?OjjGmdYtvPmCb8PmSAYBCzNBhy6/656MmYfAM5IsFepKlXGnuxX8hIrzdRud?=
 =?us-ascii?Q?+maFu6MwhWjJBNUIIHBlZjvxvBdZ8bU8E3DDpe2A8OEchZmH7O3WPnLpAlBs?=
 =?us-ascii?Q?Du/WvbVqpG9CI0cwWNQmeUq+LAHdFOa6ib+aPBz20nwnaxSMc2up+x+CUAQ8?=
 =?us-ascii?Q?mgGYbqj158t6vfQUzOf5qswtHZ+WV3PnFBzShWxVSsLxZhMZ9r4DqehD+fCl?=
 =?us-ascii?Q?Ds6TcVCTm+U2+zadgwlju5DYzgkylgsfsUDCVTNNn1HKuCNJ/xdOSB/dbMLt?=
 =?us-ascii?Q?2N7IcdT5y0l3ZsSB6rS5AlNG68b5vq38CoqigpV3JP8PvhS7P0UltZHCFXUX?=
 =?us-ascii?Q?Ag106esqCIBM6b+FQw7grgWTnGoFaOQXstQRdsD73U8pRfN79rlM0C4c+a6k?=
 =?us-ascii?Q?T75RDUFlgfrWyc5wDdHNMYy4neXKo3l9j1RGFX5l145U0xLRrpC/9mtGndM/?=
 =?us-ascii?Q?GxAPU0dNTq03nfVf/L38yJLE84sas4JeA3raVFa0orkaW7lGRfJCluacx1u6?=
 =?us-ascii?Q?CjOakMNig/yi2DI5WoGq8fBmRibut/Zy02tuh2gSvxGQ31lv0fFrcTNZts7y?=
 =?us-ascii?Q?1oKUO0iw8wlVL5K8Vyl/2VYIeRfd92C9rmsLuh5x?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:17:04.2289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0d780e-112d-420c-c940-08de21031450
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs. This involves following steps:

 - A firmware/OS writes its unique ID to the mutex REQUEST field.
 - Ownership is established when reading the GRANT field returns the
   same ID.
 - If GRANT shows a different non-zero ID, the firmware/OS retries
   until timeout.
 - After completing access, it releases the mutex by writing 0.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v7 -> v8:
        * Use `bool` instead of `int` for `locked` variable in
          tegra_i2c_mutex_lock() function.
v6 -> v7:
        * Return bool from tegra_i2c_mutex_acquired() and
          tegra_i2c_mutex_trylock() functions.
        * Move `has_mutex` check inside tegra_i2c_mutex_lock/unlock
          functions.
        * Remove redundant empty line added in tegra_i2c_xfer() in v6.
        * Fix pm_runtime_put() not getting called if mutex unlock fails.
        * In tegra_i2c_mutex_lock() simplify the logic to check if the
          mutex is acquired or not by checking the value of `ret`
          variable.
        * Update commit message to describe the functioning of SW mutex
          feature.
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
 drivers/i2c/busses/i2c-tegra.c | 92 ++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2b18ceb837da..3c20cb4a8fa6 100644
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
@@ -381,6 +391,76 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	return id == I2C_SW_MUTEX_ID_CCPLEX;
+}
+
+static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
+		return false;
+
+	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
+	writel(val, i2c_dev->base + reg);
+
+	return tegra_i2c_mutex_acquired(i2c_dev);
+}
+
+static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
+{
+	bool locked;
+	int ret;
+
+	if (!i2c_dev->hw->has_mutex)
+		return 0;
+
+	if (i2c_dev->atomic_mode)
+		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
+					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
+					       false, i2c_dev);
+	else
+		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
+					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
+
+	if (ret)
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
+	if (!i2c_dev->hw->has_mutex)
+		return 0;
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
@@ -1423,6 +1503,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+	ret = tegra_i2c_mutex_lock(i2c_dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1452,6 +1536,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	ret = tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1528,6 +1613,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1554,6 +1640,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1580,6 +1667,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1606,6 +1694,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1632,6 +1721,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1658,6 +1748,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1686,6 +1777,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.43.0


