Return-Path: <linux-i2c+bounces-8966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ADBA05933
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91BDB16613D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA5F1F942E;
	Wed,  8 Jan 2025 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dr/GN3yx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB31F8925;
	Wed,  8 Jan 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334421; cv=fail; b=XgCwX+z72Az2+dDJTuIPGyTz5A654Zo/2GWEII3fodDB2ntk16G+yfEaHTVqy+XBUthGf4cu/JFviqazKKHBZS7L6OITkDXb4BHpwBDboQMBgF+8vtsV/9PM92Qy5DS6hIHawk0WaQ/K0hWpr5o5q4XzRRq/At+ehZFtX4QgzYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334421; c=relaxed/simple;
	bh=w4n84pNowTeVh9o2HWlpSMo8lxPu+rBOjdIc0J24o0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3BuCyNIK8YxOdtvMblmP1mAXQOFMxZBy8bgjI4T/NS0XPDta9DlnAKfah7EM/SuU+s+RDzvs4mv+oMiJnNXX+EZJM06YUWaHruNflUzUoj9U8WNrnc+q9+pD0da0ebeQZlFIXvuJosoG9FCXgBt6BGXuZC+Z6r+TmzqIOeZeXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dr/GN3yx; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rufSQvPyqXuMu53SGDtaswY7OslCYPjaF6ioq+Sf6LQZOtnfJClkxO2Thwb68jU4MTLDSkkKtUAeelZJdTZ7IVv/j/zy4mlW9Mv3Cw77wcxr/3uLMXQJrDLoB5TVHdplcS+4Jt6XdJTLL7aLD6HTzw2i/Mpm1T4KqQPYU8zb0sO4ClwDqHp7E7u6spqNBRPUz5qndbt0BWm/pvnF2zvEz+LeGQDgGsQcv7llXLtMWZqhwqNX4xkDuideQP6IYfIKBAydqro1ocSkvzfLW62qFbs22Upav8MneAH4cOo+kZw8G3UYK03oVk67/a/gShL6WFbz9aZpamJJJaZm1qgivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSLxZ1efcMUuFS6Hkjg4eON7JAb9CTjCRpeERquptNk=;
 b=p3Wop4k6SZ5t1V5VO174L4KOoj8AG31CDawQ2Fn+V4LRIE9qdon8hrmJdttO8bqPVEEdbv3lpgyZhcjA0/ICjQG1BNULcnC2bsBI3hxh40xQUslKPsLM/u++lmwoind8L80yQ44jOWwu9bmKLsGh9AaRH2aa4Tpra1w+d2Vwcr/SLk4ehEwbP+8aaKMKLGxW+xa0LsMHYl92hELcyTQjrMHlMIhHHqfYYmgT1xadC0vQ4/N1BaTn5EeXXJQS8wTWQTiVLFV6s3hyn+JtnsQurpP5VJMIeiXLcnH5h/qnIvVO5wgCnspyemD7gMgEFQvOHoNh8OwUN4DyogAdRqDh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSLxZ1efcMUuFS6Hkjg4eON7JAb9CTjCRpeERquptNk=;
 b=Dr/GN3yxqrkFIaU4ppw75io9L8z8xjsY97kM8U4l8W2GqvyogHXcpj8f4PDPbdn2khZliWylGHfa2ycDZnrufVcGEwME+6LnaLROv1blXGrt8zZmtbxCbzMaJ3Tw8jlEEWELW8eazLAUq16FoaE64yuDAZ9KFkdZj07xqKFE8rvrLsvNuW7IHobpAMOcoJ3ihjtRiE11sxTt/KwrUh/68Cz6/PBB0JF+hAkHK6xM+KKFqJ1FRwDH4fyuwtMVliM7ahwKbCAE+MVAY6u5Ul6/1ki6/7Fv1sbHGguUB7x8DJTx7EmWnyc9EZJgDRZOAoXHdALZYIxk1DeLXaXsdgy10A==
Received: from CH3P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::18)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Wed, 8 Jan
 2025 11:06:52 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::af) by CH3P221CA0019.outlook.office365.com
 (2603:10b6:610:1e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 11:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:45 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:45 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:41 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] i2c: tegra: Add support for SW Mutex register
Date: Wed, 8 Jan 2025 16:36:19 +0530
Message-ID: <20250108110620.86900-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 81874bb7-5436-4b1d-902a-08dd2fd48e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q3rlwjjUkYr4GAytYf6k2ocVcWrE9Vc7wrzRKLUfIRto6pIINUNX8iznTPps?=
 =?us-ascii?Q?yotgMI5Z7ACegsRR4luZ5W0n0kBhAbgsquZMHU/tkXbMm/GEEhu3pupwAZTd?=
 =?us-ascii?Q?Vqa7np3re0YqRANf936KA+cI+WSWmyNtX1wr+Tl2iNN+9+1wBEErbrIYrkZf?=
 =?us-ascii?Q?zg1Xyq3yQxd6989kbTDVoXRRmL5hyhJpal3gDlNdNHbBJH8QfCToUKniJMCX?=
 =?us-ascii?Q?qPXnDiUduNJLpP04/NKea374IWNdCspNLOSbyPMGIccWUkiD4zr88zUjMolB?=
 =?us-ascii?Q?tqwkf+XsaBI+4FsSZKSFD1FoBzkoDJuG9CT+VxWV6+fY7ysKg2IDH5+4kGXH?=
 =?us-ascii?Q?XpFgbzuE6zFtr2au0PaUgprw+/vAgB9beemsukeHTsegwrjQPV+YnpxmQwJ9?=
 =?us-ascii?Q?+Sf7LLliBMMoCXB+jSOkqIYPekKI23mDLioGboOoMy+62ipkIjjYh5+qWLg2?=
 =?us-ascii?Q?mkN9s45oIgv4BTYrJUJbCdv23GYbvm9Pd29ta7XMbzX4SV2iYkmbJsgMHOsf?=
 =?us-ascii?Q?aioVWREuyK3BFi052wjlgLpn+ptySDkP7hUfL5B2ojy9AldV1a+y0kvVVpjx?=
 =?us-ascii?Q?oXu7VWfg7p9DlGs+6b1fx3qfJ3hkh8fw309udhsGGChbpiqy2H3soH/CtqrQ?=
 =?us-ascii?Q?g3kbD36uHdozRLls0WVAfBF/KsbUh5WckX/SdEXrO+B+AwoxFWAeZtVPVj+o?=
 =?us-ascii?Q?so2Cdj7CVobb67A87tlvlutly83nr0zU/cs8+1ebvlj8t3ICinsigO6d9Ngo?=
 =?us-ascii?Q?N3D9AfKczN0Pm9MIH+m6MUH6abgjOWTa9Ed+T2aC4ROEir2vWScb/40vfi8u?=
 =?us-ascii?Q?VLEiKzv7FBZX9kGreA1SFO9bpQFgkUIPQNQyLuPnJ2gH4W0fVS2Dh1sZ5dBF?=
 =?us-ascii?Q?HXHc0orlPXbHWOb4SjyA/P5sYJFI7jyCCVEJCOR0rj6XNlSbMHeEFC+SXHCt?=
 =?us-ascii?Q?opI9J27IXZjCggT9S5UJYqIxIyeixfkajb5JFY2RLp00x9oHpifX64+S+Qvl?=
 =?us-ascii?Q?WkYXzAonQANyEFX/KgXNvBKXpAahuOPFozkBi8wBLcvTC3QUdCaog8hY7kpc?=
 =?us-ascii?Q?pKpTYYK4iy+2Tj3wRtOvN+1EudqZoMNN9konmVSnDj+IcgIOj8jHy5AcE4RU?=
 =?us-ascii?Q?HJ09k0hHkIduKkCUA1aArfs02kJlsziqn5L3tedikF2SBW/RWJ+nG+dVabHl?=
 =?us-ascii?Q?bbNsN6R1B24XHK0W4E9C+vCHL0c4qudXJvA+Qzvfdcw7O8H0gIa6xEvLyclt?=
 =?us-ascii?Q?r+MRxfKSWH1GN2DTpGjXqbVMzn5K/Zh79NuMumDKlQx7rvjbfpYuwc1EqHJj?=
 =?us-ascii?Q?Gj4hwc/oeXD243L/uAvNY6NtoOW0E4AloBtlRsK5pRpf4GMP6xxGW+z006yK?=
 =?us-ascii?Q?44Rw03ot94kusSvZPtCwy/ZpaBwrdE2+wRe5yWfHY5E7BnMbZ4l5AKzVzDBE?=
 =?us-ascii?Q?tiP14pBeg1ioKPDcaPhKIWhLOrSKTkkpft8XimU5SJi53z2PunhlyOrTD+R8?=
 =?us-ascii?Q?I0MPRW12hObhfNkXnN3BPNyywjKcEVhuhYfc?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:52.2853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81874bb7-5436-4b1d-902a-08dd2fd48e5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317

From: Akhil R <akhilrajeev@nvidia.com>

Add support for SW Mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmware and/or
Virtual Machines.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 126 +++++++++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cf05937cb826..a5974af5b1af 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -135,6 +135,11 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_SW_MUTEX				0x0ec
+#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
+#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
+#define I2C_SW_MUTEX_ID				9
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -202,6 +207,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_mutex: Has Mutex register for mutual exclusion with other firmwares or VM.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -228,6 +234,7 @@ struct tegra_i2c_hw_feature {
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
 	bool has_hs_mode_support;
+	bool has_mutex;
 };
 
 /**
@@ -371,6 +378,99 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
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
+	if (id != 0)
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
+	/* Poll until mutex is acquired. */
+	while (tegra_i2c_mutex_trylock(i2c_dev))
+		cpu_relax();
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
@@ -546,21 +646,6 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1497,6 +1582,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1521,6 +1607,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1545,6 +1632,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1569,6 +1657,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1593,6 +1682,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1617,6 +1707,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1644,6 +1735,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1671,6 +1763,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1875,6 +1968,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.nr = pdev->id;
 	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
+	if (i2c_dev->hw->has_mutex)
+		i2c_dev->adapter.lock_ops = &tegra_i2c_lock_ops;
+
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-- 
2.43.0


