Return-Path: <linux-i2c+bounces-13282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9ABAF4C5
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 08:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D54FA7A74DB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 06:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CAF26FA60;
	Wed,  1 Oct 2025 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6nl+nlF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013013.outbound.protection.outlook.com [40.93.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C27238D32;
	Wed,  1 Oct 2025 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301332; cv=fail; b=MsF6TxESnli8opjQnXPG8hjALjKMgs31sJ+sWngmKNB9q4l9RjjHvKfWV1Axtt7OFrvw4kyqdKJsQqGrTM9V7NaDzG63+6mbjLN+auUgXG9oPMpU0aRNgJYQ/pomU8t3v5fO+TEWgpTQ3ca4rAmL6vz26i8mFBreodnWs1YBhkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301332; c=relaxed/simple;
	bh=eqs+8l+1tKVv0YvGXO5os6Zsh9hvMca+IOQKGxeEJO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0FQ/jBu/C7bymRse0HRX6py5vvIeemPXFcCrAQDKFHgP0h7vjVgX8M/VvIbu42/s98z26RVlTOANUGY5CP0QbyZzXZ+UrVq/+94FEuG6Z66J6O8zaHsDpRI6+sqWfwUbVgJx8BDE0QM6sI9iweOelk9aVJmVvsaPQACp+07omQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6nl+nlF; arc=fail smtp.client-ip=40.93.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EII48k/HzCeq3u+YuWKiTho4fxAckIaCKHmXEzjq22a6mLJtjQbfqlboMbpMAEkvapRiwHGckCpHNyaqVgLSwsjZy9q+CPuhnKH/9FuaAXMu3xUuJLI/2VQt0jdDq9AYFX5s3xYDpheC7kJrs0Y51scfeVzG3G35dATVPa14OZBzwB+XmoN4kExe85LaLFDv4X3G9gxSwoPsL4KmIvX2Pje9pGB8h3guJjGuIzElBiuhrgBQQhgWTblnTV6olL+a/Y2Glch0UnaDsgMHDYJES8xRnmd1iJjT+xTki/M5k7kRSTQTI6oom4EwN1P8rg18ZFOShERl7VV2du8olsPK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmT2tEpcYvxDwmfvayDqa9J14rUB8OymWeMjsgEEMu8=;
 b=VkTwMVVN6033O5YZnxPXqpGt2qGWIFc2TkK+C7GPA6l0pM1siOl/c45B1PcX0KLnKSWkhFSUL831D9raKLs+eiSak22VX9CX4sxayS+nkryCn+48gtJujOzo4DGTXlYGv96B61mL8RpW1s6kEZCxCF5oYPvT47rRkb1QAjZiS/9jsNzbsBvlk2+T65wsyQxcM96kLRKW4e+Z6s/Mo6Rw3IMcV/5iu6fz2CtDQQ7txRRN9LJ7WXRn2UWS1j99XjUIDZem9R8iNb1gQ+SbjbJpuMyvAQj0Qa+BfGk5z+RXycHe+LBnygMO+m0V4T/iwjXYRs9L1Z8icUGRqSWpznsZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmT2tEpcYvxDwmfvayDqa9J14rUB8OymWeMjsgEEMu8=;
 b=U6nl+nlF0SOFQAQnOSCT/Azn3Zr18ERWd2lEeOOwzZepEq9XrLc3jcJJdSNF+k7pmTI7N3JEwUbA6iBgUMxBKUfvtgBmHsNkbiVTT7CQSST7M6rM4B/1nIBcB+ZWhfkI5RCicCPpVZDzTfCyyFkADBg+t/lgbJq/HjzN+qBUcojV3TrkRMN/LyXDx+4EweWb1lnqgU2LODjAMNt+jmpj65RYYaq3OZ9/Wjk5VygcvnEBDpJtwOQX53eQkfpJwVhUOfQdKB3L+PuUGVnM4ip267xtUCgfLQOl1eCzBfXDQTj5f1vvEQ2UG2KRC0a9LIN5ornFaEpxj492SKt9x//oHA==
Received: from BN9PR03CA0867.namprd03.prod.outlook.com (2603:10b6:408:13d::32)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:48:46 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::10) by BN9PR03CA0867.outlook.office365.com
 (2603:10b6:408:13d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 06:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 1 Oct 2025 06:48:46 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 30 Sep
 2025 23:48:19 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 30 Sep 2025 23:48:19 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 23:48:15 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v9 3/4] i2c: tegra: Add support for SW mutex register
Date: Wed, 1 Oct 2025 12:17:58 +0530
Message-ID: <20251001064759.664630-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001064759.664630-1-kkartik@nvidia.com>
References: <20251001064759.664630-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dce2b4-0780-44ad-c2a1-08de00b691dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qvsvuRPm3A1I2CbtZ0XH0cfDNoAOh77/0oiEXPm0t4x/pu8WUd10zt/SnZo7?=
 =?us-ascii?Q?MUDm2ltESpg/kI0MVE9yc29kxpscycXaZm/lbXsm/uFGy9L+S1wgjocyzlJ2?=
 =?us-ascii?Q?D4HYcMniaVlH67D8XuXVdYgT7VLgo3VlYLAhDXoSAcWN2+F3UlyHcn1g+Ucx?=
 =?us-ascii?Q?prSCGHhOTAyhP3HRrZK2q0n7ilx9/R/8ZszzQuipFT+guarxkCN9RtM9LhFA?=
 =?us-ascii?Q?b30RiDjCmaocQ0iXEzK4nT9+B3BOEjuPvatlvNnLC4TFX5OxThn6erm6D7zo?=
 =?us-ascii?Q?uczSCa6QwQeK2RRHR8uBMI71NsGptKwiADeLAwdxqgiM6RqCACetnPXO/DCm?=
 =?us-ascii?Q?sTj380lqCCyMMa51v8lHR237Vfw8ZlOczmuk+Ff3vVKTw0/Y1m/3oj9Nb/Au?=
 =?us-ascii?Q?xbqgGUTrO3EW2MVLCvNafEVR+BhlGC/MlPLoEESRAXZIXkQBu0ixc3vxTcIf?=
 =?us-ascii?Q?01zJQet7AcbK4la5WksWsF6WqQi85gR5Td4tlhoz+MHJuko93ZzSf7amx5XF?=
 =?us-ascii?Q?4OI7kABZ57OPiv+iKCFRqLdld6lN5EivFNQw7gRGiHB/Ic8iIsIVOvGUYk49?=
 =?us-ascii?Q?5y8A6NuZJKWq9km72ukDL3RxnGcR3NH6VXpiRODKEDVxtBVBiIOTcKqdU8rb?=
 =?us-ascii?Q?q0rENl/TJ9pQoBwAQjQhyXYt0HFrO6JZk2/1mmrCcb3faarwzPNDEppufbyi?=
 =?us-ascii?Q?sMRr3zoilT7KQUc2w2fKr1sQoz6uF5NpXSAbCBidYubi643TuWYT0Bf+zLwd?=
 =?us-ascii?Q?ppWmKTb89JTHBsnVpLny27UJhVzKMCuhM9H2+wLGonSFBQhoSTcnCXr7NR+5?=
 =?us-ascii?Q?IwqImcCnVtpBDb3RdMFTdEiBSPOHoTFldIhF+I7xhtkDTXro0SsUYeQ1Qs/o?=
 =?us-ascii?Q?YLFbXX5KXyStIr+iegrQ4KBlBZyRI2tB8wymQjPY4TAp0hCwmE5bifa7v9v/?=
 =?us-ascii?Q?jcxYcR6pIV5Xqz7PD4nHJJmnPDYpjfM9yCqrCnCrZTG5Pdr6ZTWhJhq61QnV?=
 =?us-ascii?Q?+NVZ/oHs0J/QgWpSwnYm5oF9dg8I3TUfB+4CjQZUqwSQQcR3qt3fnR4PE5cM?=
 =?us-ascii?Q?fZgjJLL62oAJ9rUSIbriELOJwDIaYH/DzN06CVYVbf/Ctu1ieLHUbFayUw9k?=
 =?us-ascii?Q?et5vm1TvoZaJ6JVxOY0YlxbiLOyUh2hSYbW6EZK+f0tfoZ6hLy5YTVvYrePg?=
 =?us-ascii?Q?df2iphX+ZjxlQTanDpeP8F91Nff+QvYLMnaEqa5F9gPP92WcRU3oWUqJjhfG?=
 =?us-ascii?Q?IKGu6l160o811buiJyZMjLKB6BAp3xwFQa/oAD9FYW4SZudivDvVtireedEZ?=
 =?us-ascii?Q?eh0kR8W4rif9fhq8Y0hbYoZhIK3Y0/e6ysL4uA8t7Nsb1FC3DNEZiBN9YtON?=
 =?us-ascii?Q?oaee30sadf32PA2DKc3RrdeeRCi05zyfUr6oweyamX2VXo18R+V2DPlDEMgb?=
 =?us-ascii?Q?url8Ruq6dk+9Qape6DRkJ0a0z1y41jsjfxlP4qCXaLNU5bjtpTYJscDMYFbV?=
 =?us-ascii?Q?TMWdTO+NqZXv+idasTUcNhlgjqTJw+SoH8uh4FlVO9HoO1iLgKkwgEdf73u2?=
 =?us-ascii?Q?wGfWggTzvNwCIrgfUfUYyWcfVZWun98h6yADUCUT?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:48:46.2455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dce2b4-0780-44ad-c2a1-08de00b691dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849

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
index cc75340f6cb5..1c8c24ae54ed 100644
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
@@ -1432,6 +1512,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		return ret;
 	}
 
+	ret = tegra_i2c_mutex_lock(i2c_dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
 
@@ -1461,6 +1545,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			break;
 	}
 
+	ret = tegra_i2c_mutex_unlock(i2c_dev);
 	pm_runtime_put(i2c_dev->dev);
 
 	return ret ?: i;
@@ -1537,6 +1622,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1563,6 +1649,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1589,6 +1676,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1615,6 +1703,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1641,6 +1730,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1667,6 +1757,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1695,6 +1786,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.50.1


