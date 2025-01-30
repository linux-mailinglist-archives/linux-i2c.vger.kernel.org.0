Return-Path: <linux-i2c+bounces-9236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7424A23078
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5103816206E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260B81EBFFA;
	Thu, 30 Jan 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="calUbYB4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF051E7C1D;
	Thu, 30 Jan 2025 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247723; cv=fail; b=lPcT4aPS3saDRzizT1zOEPMh19NGUJs+RYWrECNhzmqEv/Bw4KB74lj8zOJ+bsmY+aER2Xx/95v4GBxD6PZWKu7s5N5p8QPKCpqiYsU57jVOFKgDVjR8BDuzEw6M4B2t7hOnpflP5Dq7APIDqPRDmwhAqok98IMl5qihOXisVqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247723; c=relaxed/simple;
	bh=opXhdmYz1LS7byvAdZ9HVJU6C8a3eC4IpvVYKUQsfyk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXKxpE4Bk4riJ9ARWFoUMU5HuLWU8SZopy0u9DenoZyx064bJ75GqKmqIG6RTzAifR6OJ0cNTw0jJjxSE+3ObLRwfe/ONXONgXC8umzHn23EXuUEedYbdNlqKSE9PpVWirFwS5Gp7zlfg6x3HkOLj1ysQxLcPgx3ibIubPIUxrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=calUbYB4; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2qSaq4WmQRJb/xqyvBToPzQDGpoujVUij/rNIBU90YQ4dZIykQ87PGd8KXNmvGyGQ7Sxtie4azmbz/+Abv5E7CFdRlQvYywftStqAYYziN6fT5aeVQppcJoNk1/8OlEqKIrausEXXHBaZWqEFdXe7bzJiHE7+6ssc0HicCkwAOIZtQHXuH3c2hW8l9c7cV/6ZZc363o7yx6QqkTmhcrbpHx5kJcSCP+DbzwvpEKawDs7y6IXt8wUcBW99JLt6iMK02HbCxF+jpaupv7RPU/Cr/AYNfMuksxYSj1o5w3Gx2mjnTkAXB6oiRBlxZXm2gii2+JR7q08atWq8fTdiQLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVM6QjmEp3iXE2SzTI5UqOKbbBSo5P+JS5ZIgNwd6zQ=;
 b=BIi1v5gb+hZuBuGDGEBZH0VhJa8UIaPv2FR9+Rnom6qlW2cKZ7Q6SFetzJz0TzoqTkdBO3RCCm5ae+P5ymPVJEGu0J4azDamPh/eWENoJkI9ib9IDhenyLsXkh2KVi+Pm9CXkO58T/L+j5pd4Pi0LlN/aM1wYzrDMqEE2f4WjilrLd+oi0wldrBaiXdLqsssfYmR7Sy9g69KjrsHNe2WkTJryF6RxfhbUqN/30xdhT7yKF4oARZP1lQ2c/xkfv2aqXQIGaEKMOEBcBpQatGzysI+1F7RifeAqvhmRfNtvU3HbPVFnU4QkgcFEvPEcPOLK+F+7Jymx4JNp47CbKvTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVM6QjmEp3iXE2SzTI5UqOKbbBSo5P+JS5ZIgNwd6zQ=;
 b=calUbYB4ylgvMuf27kULB+3rcSw+6bN4s5eeQMuU0t6vs/MweOvwUEeKKs8z7MAgZoHdADIPGbXNKH08fleKff/1AnAboDzIWxIfTz1BpBO7RrcR9eJcC+8nNOjhJZh8wwjym+ppT75c41exgk9Php4i2nfpX3lSUwhdoHq6pQgM7ZGhiEhffgwTteM+nKUiC8YJ7vGHG5pcyjgQwN0a2aO+CU2qJPbLfWdwATE00D3XhaczQcI+Ag5ssmpmRe2mwdpUnwJjkfNNs/MR1HYCVFCL8hCLR06h/p5RNZUW+3XUCK8IuD7MFHRhJRa6ifd3KtNEynKEYmUKdhWEwoxxbA==
Received: from SN4PR0501CA0128.namprd05.prod.outlook.com
 (2603:10b6:803:42::45) by CY8PR12MB8315.namprd12.prod.outlook.com
 (2603:10b6:930:7e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 14:35:18 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::ee) by SN4PR0501CA0128.outlook.office365.com
 (2603:10b6:803:42::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu,
 30 Jan 2025 14:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:35:01 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:35:00 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:34:56 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
Date: Thu, 30 Jan 2025 20:04:23 +0530
Message-ID: <20250130143424.52389-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130143424.52389-1-kkartik@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: f92fc60d-7c12-45a4-2890-08dd413b513f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WavUVM3HES9KIjKC0X2UUj5wR26y2D5U1GV+XNsf/NeBTnneLWrNJRMkGq72?=
 =?us-ascii?Q?cvFSDW1qicMJ3o8meyqVSODHvcotTLI8LIKYWHskIsbY/cKb5dvnypfO1eya?=
 =?us-ascii?Q?LkT2tPW3SK8FcmV6WhIk5E8ghGT40xW7HYFN6DEJKgyKmXkd/OWxbhT30Fn6?=
 =?us-ascii?Q?A+zZi6fuxSBZT4HOnhw7dUeBt/ovaKWbHedzhbLsGnPahKAk84/NoAcS4JUj?=
 =?us-ascii?Q?wh52xfGdX54/50eEy6//J0BUuM6R+CI4EWIyXpaxCSGee4EquTcbKnUWKvnH?=
 =?us-ascii?Q?fbfLVSwyXKhtbWodr5Gk8A4ZI+37ChBQGhS3Sjib52kY3U2TGSmCaIZ7pGUT?=
 =?us-ascii?Q?VbcaZuEBBI2vPEHaDdHBr9iU8XEkWuuYqqwQq87vCH7aA33H+k7/0fVaj/GV?=
 =?us-ascii?Q?aSP9h1Ruos5k16ZqKbEvbQZHScMc3Fq7wGHfI4ET5RTR4BqtTbhqsHbC75h+?=
 =?us-ascii?Q?x28pZXKCU7OEDBNkFL2g86oifow9Y4D9IAjpRB3A9We4eriBGTb6NG5zB0f/?=
 =?us-ascii?Q?LY7+Zg0eL+9vzUqjitcbjcb7Ezoz5IeDEOxrBdRPPL4ibJETlZpMD3t7CzYa?=
 =?us-ascii?Q?Sq/hEeUTAeAf+LsztnaoTlu8AyRwoWf61yTODvD5mPm7uYf3qy+C375XaZJb?=
 =?us-ascii?Q?P4e7KhCu50y1GLd2TF8oTRWFwyvoMgu/atUlLNHWHULk0MDSCm5W0IgW+Zmi?=
 =?us-ascii?Q?Ijz4O4/QSn7s8cH0DG/dhaLoR7BWXiF4zHRazux2ApQ5welo1i4MHiwOAEca?=
 =?us-ascii?Q?am5aOo1ZE9gHg0jW82Ua1yByrQHUcsJFbDZe+blqRBBPuRqCBINDDPqkTKDC?=
 =?us-ascii?Q?UkjaVzdNsoHOTkc0wUWaS8h7Z0yPlN3AcLURm13xjOLGxgdpF4Z6EQG8W/bu?=
 =?us-ascii?Q?gW4oTI7B3MKiYMczVN+165+mYDWMjc9Zp10AR+Zaiq/fzRMfHjLr8FFuwYpC?=
 =?us-ascii?Q?O8/y27+1+aEXxBJLc4mlsh5CPliCb71yjLOj3wHJ7GGp5nSjSVD25N1NGo1J?=
 =?us-ascii?Q?4cD4taxHxwb5su/VPZ7WCat9Vv4qjxMZJ7FMdJHVo6hXOmJRNvlG4771sm+v?=
 =?us-ascii?Q?iWhvG7KPtXr4lWqwhaIRhPjoDqzJ5H7AHYMYrY90gJElKAIyj+MEKHkswxFA?=
 =?us-ascii?Q?INWdVaPUuPdiSq50+VieDbECApL9H0SudPtjIt67f47w9WRRA2mi3SZstqBe?=
 =?us-ascii?Q?H/IeHFsiRaKCMa5P7+djfZGhsK1fmYnrN4JLfI92UQRk7wVwNIFhFKnZHmb9?=
 =?us-ascii?Q?f06o4RNOnECDO2MGze2ui50HBrt3pb+2oobqhHLKa7dJtDeI0A3jZ6QffxzX?=
 =?us-ascii?Q?HPX4Pq4PiafdUjGlFoLF9s65RkgwoSZfKRkNIrAS9LrUIhcCZ7/QktfQzJhq?=
 =?us-ascii?Q?tQwOnj4kcWTKkmvDDVDWWP0RXcFfkvMPFv4DuEsRjb4w4Nv4Kmi8OukemCz7?=
 =?us-ascii?Q?p6bxpAezVxIJdjywbUZYt2u3O926t14cQnk1Of3paKOJhOMlpEkSaw2B29Wm?=
 =?us-ascii?Q?9xzxUvO8vkfLvsV/JlS2IJaY6+YL2NNKD3eL?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:17.6885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f92fc60d-7c12-45a4-2890-08dd413b513f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

From: Akhil R <akhilrajeev@nvidia.com>

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Fixed typos.
	* Fix tegra_i2c_mutex_lock() logic.
	* Add a timeout in tegra_i2c_mutex_lock() instead of polling for
	  mutex indefinitely.
---
 drivers/i2c/busses/i2c-tegra.c | 132 +++++++++++++++++++++++++++++----
 1 file changed, 117 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7c8b76406e2e..aa92faa6f5cb 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -135,6 +135,14 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_SW_MUTEX				0x0ec
+#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
+#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
+#define I2C_SW_MUTEX_ID				9
+
+/* SW mutex acquire timeout value in milliseconds. */
+#define I2C_SW_MUTEX_TIMEOUT			25
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -203,6 +211,7 @@ enum msg_end_type {
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
  * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
+ * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VM.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -229,6 +238,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
+	bool has_mutex;
 };
 
 /**
@@ -372,6 +382,103 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
+				   u32 reg, u32 mask, u32 delay_us,
+				   u32 timeout_us)
+{
+	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	u32 val;
+
+	if (!i2c_dev->atomic_mode)
+		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						  delay_us, timeout_us);
+
+	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+						 delay_us, timeout_us);
+}
+
+static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val, id;
+
+	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id != 0 && id != I2C_SW_MUTEX_ID)
+		return 0;
+
+	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
+	i2c_writel(i2c_dev, val, I2C_SW_MUTEX);
+
+	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	if (id != I2C_SW_MUTEX_ID)
+		return 0;
+
+	return 1;
+}
+
+static void tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int num_retries = I2C_SW_MUTEX_TIMEOUT;
+
+	/* Poll until mutex is acquired or timeout. */
+	while (--num_retries && !tegra_i2c_mutex_trylock(i2c_dev))
+		usleep_range(1000, 2000);
+
+	WARN_ON(!num_retries);
+}
+
+static void tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val, id;
+
+	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	if (WARN_ON(id != I2C_SW_MUTEX_ID))
+		return;
+
+	i2c_writel(i2c_dev, 0, I2C_SW_MUTEX);
+}
+
+static void tegra_i2c_bus_lock(struct i2c_adapter *adapter,
+			       unsigned int flags)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adapter);
+
+	rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
+	tegra_i2c_mutex_lock(i2c_dev);
+}
+
+static int tegra_i2c_bus_trylock(struct i2c_adapter *adapter,
+				  unsigned int flags)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adapter);
+	int ret;
+
+	ret = rt_mutex_trylock(&adapter->bus_lock);
+	if (ret)
+		ret = tegra_i2c_mutex_trylock(i2c_dev);
+
+	return ret;
+}
+
+static void tegra_i2c_bus_unlock(struct i2c_adapter *adapter,
+				 unsigned int flags)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adapter);
+
+	rt_mutex_unlock(&adapter->bus_lock);
+	tegra_i2c_mutex_unlock(i2c_dev);
+}
+
+static const struct i2c_lock_operations tegra_i2c_lock_ops = {
+	.lock_bus = tegra_i2c_bus_lock,
+	.trylock_bus = tegra_i2c_bus_trylock,
+	.unlock_bus = tegra_i2c_bus_unlock,
+};
+
 static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
@@ -550,21 +657,6 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
-static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
-				   u32 reg, u32 mask, u32 delay_us,
-				   u32 timeout_us)
-{
-	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
-	u32 val;
-
-	if (!i2c_dev->atomic_mode)
-		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
-						  delay_us, timeout_us);
-
-	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
-						 delay_us, timeout_us);
-}
-
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 mask, val, offset;
@@ -1503,6 +1595,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1620,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1551,6 +1645,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1575,6 +1670,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1599,6 +1695,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1623,6 +1720,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1650,6 +1748,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1853,6 +1952,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.nr = pdev->id;
 	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
+	if (i2c_dev->hw->has_mutex)
+		i2c_dev->adapter.lock_ops = &tegra_i2c_lock_ops;
+
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-- 
2.43.0


