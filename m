Return-Path: <linux-i2c+bounces-11286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECAAD1ABB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF906169262
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFE925484A;
	Mon,  9 Jun 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQCV+I5+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541724676B;
	Mon,  9 Jun 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461703; cv=fail; b=OBz4FJm7oU+Z2OQMw3ub4ByqBJ8R7bNjh7YwklDI6ix0OYP5UWbJWxayGFT4MLJFiLgOKXGGVhH0AQO9apeA4nlksTP7QoGfI/1O75BixF0iaqt9dezOlMl9qk2puos5Hf/RJyCKthvG0BwtKcBjG5ON3cHJVEgK+ShYvhJtGhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461703; c=relaxed/simple;
	bh=LNN8hToxi6ZlBYSTOgOiV5UGT/6BHB5fOKxoaaANEDw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BABLA+yg92gCOT89gW3PaztoF+vFMJcGg2nY2QzfTcEUjRn5dHzEj5mhm8OCQFz4/siROdUdJnXjfME3jteZM4YtWfn0OpdFOkTKtUBcCMphDyRVIVL0+hAKlKOrEaLZw8LlflLXud5Iw3WBRmCiRWPOjFUzdf4ESd+TFFcP4HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PQCV+I5+; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M++FcPTTCdyEHImEY/31cCM7yHzosTfdorG6MNXCLkPFsQDFGU/XLscBs2a1+gA+5c5QbkvFOj239NUUd+KM5n7afbVtkLhAjZHmvziIxtb7HEOfELUR+8IC1qhbJzDw+eo2HoNSGOpbA0NRBrd35yWpoAmdKfdysB6rM8YABaxTEPgEV3MW2At8darL8ovA88HSplUQevutsKsSkcsTcxqDiVsNC4FJohzDcHD/Tc3KP89W55WOHfhN7BzSlZmJsTt6V07K8dGSbbanmbg7QlmkfFKr3BVD75cWrWLfcOcfz/gOC0khtFeavzh1Q0HHJUnv/6ZgaXM1qxSjTcuteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQZ/OfcuAQfMEuohuCRtzhtjU/TrdiWzPY6Z5m1uQzc=;
 b=cH/cLnrUZElviegg3thakfqooMFqXv5+5prj5g2KdL9HOhmXxz7mptPuahTAtn80QA7mlUPVWCtQ+kHZ5Qb0bRlgAWlV7YgaGT4iFTdefnpjd/bniVuzXS4v8xrc+YolHYiZJm+CNxBUBbPVQodajknQkZR+fCC3WYk/I+24nIuXoGPqr5iDbNvBlZd/3wKkDGIvIbYNiuGXRdCn9bpIhJ23viUsIzUEcppndlFVsf7PQT7ebHXZqL3MrMcFFuYGZAHW8YmVovZB2oq81R+kHdgJSH10BvOgirfrz/szzIE/5yKC/bkErlpxJXbkG5hFV+8PbNp9g7XtFeI+GhxziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQZ/OfcuAQfMEuohuCRtzhtjU/TrdiWzPY6Z5m1uQzc=;
 b=PQCV+I5+dNc9jtJtqvfPVg4XWVOeswt0u7qDDQ3OOcu+cOeBfH9rCJTMyKHbHdqc4X8xH0QH8KTcRBerR9udHzy1sijTC+NSq6p4y0DetfENoljGikQAza1rRm09mt/m/iD29/Ki//fuNHNNiTyCERjxQ9nKx7zNzPVRu9WxN1sfqMmnJo2ANm0JTL5ygGjR+hT59azWu5qodEKxAtlOrcmnErHNx5x+3j4CpF7RoXICaVrSEGRPI0VxJnxEB+yQYxzoviRIVOLn+knEGSV2UlCFECBOfid7wYt+aEYnqfxG2zYfHFEY8nbCkAzwlShWEErbKw6qxFbN5nN8Xtl1fA==
Received: from PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::6)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 09:34:54 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:348:cafe::78) by PH8P220CA0028.outlook.office365.com
 (2603:10b6:510:348::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 09:34:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 09:34:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:42 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:42 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:38 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
Date: Mon, 9 Jun 2025 15:04:19 +0530
Message-ID: <20250609093420.3050641-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609093420.3050641-1-kkartik@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: f7714028-c4c8-4549-d613-08dda738e3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pSKOWR8PbLJQ4P+Cy5+YCxc3OE/FFVE+A01TAaNhQW4Jninq/BkrQvJCjFCN?=
 =?us-ascii?Q?rKSqVfvM/KLFKrqKqo6KO6O2VrX9EYDjpPPphZhMnRRwGCfXgwJDklJZG0GI?=
 =?us-ascii?Q?r0WM4Y9YD1YWdsbiBrbj1FLZUZo4jAmS7Ks5Q7wiUuIX8AC5tws7t5UfYLUL?=
 =?us-ascii?Q?MaD+jbxUdlxsjlTJOC31EqTjhIqaaUJZxLtVAnlQ1mvOPK/UpyXQOJuCzAHh?=
 =?us-ascii?Q?b4rdEAzyNQP7ZdLnvS7BNO6x2kaX/TkaV/vJlpEgcjFmgb419UrxACYEWPQG?=
 =?us-ascii?Q?8tg5nBsXqWtO350sb3WoosuAX0D3dqVnm3IXJJI9b22ziUihMKwfSN+icL42?=
 =?us-ascii?Q?U0fVSgx5l7r1wKdT6F+2t1C+TOiG9kVTJlrth5xiV1F1yzd7dJTcC9BYwS9e?=
 =?us-ascii?Q?I1Wijet83Et+tdFrg9pCdmlfq7LLF1Xjo1T4rjzEfthEq/BiB/5UZeMANNu5?=
 =?us-ascii?Q?whV7Kj5YbbEFwbLMYXDFMQX8pylS6ebAlweko1jv6I912LIAQEsP9jNhC1kC?=
 =?us-ascii?Q?qyQ9Z8J0xDDqEorVUDNd2od1eDWqvZe/72N7Htnykvjgl4ZW6TQpgy5fxts3?=
 =?us-ascii?Q?uUA4FefoebezPOt12JeoxtBC57WGDQgAf6RcuzxnoDFtjKVYieDUG0v/TjSJ?=
 =?us-ascii?Q?/irEGPxXJldyi8jz2F5a9PVckqmKs35iA1TfAQOFO1w1PlbprV9VdzCl/j+h?=
 =?us-ascii?Q?GteQfmOXp2iqXSgciCq+DBcu1K7lFJnVzJX9BbjEhzbq4vWVRyX1MMtrPaIm?=
 =?us-ascii?Q?GQF64QauB9I0dDhoznt/OomUJmSutNhr7WWisxR0AjJk0SkJBK5vmMris40D?=
 =?us-ascii?Q?zyrCxolMUAf0P2zVuGkksA1CuhI1GKvSmfS41LllXdjZRxg3BU+mlimSMp2w?=
 =?us-ascii?Q?ExA2Q71MM7ZxLOdd4hf5wLyt8xyjUVLQruxKkeXOvbvVAeFo+n2DFAw/k1HZ?=
 =?us-ascii?Q?4Vv13pfq0l8pt7Y1s7YigNNwQToPthoz4jww8OZJuvoyBkIZcbsWARe8kbhp?=
 =?us-ascii?Q?ze7zqjYiYLt/gqq+/nEU8MCNQqV4QionpMdJ7kG4XOaKqWZXLY8zGYOc0bbD?=
 =?us-ascii?Q?Q1NuOdONFV6tVJpocQJCdgp+KWNwKomxY1x4glNbxrzG3O9uxU2qfNv2825E?=
 =?us-ascii?Q?l5wNRbWwBzewror7erFLlaoI75OxhxkdL8Xoq04kx4RaqUSAw6HMuF/8Xoqk?=
 =?us-ascii?Q?hIWBI2C61MXXk3Unpddl8dKcwmHNxvP3UZzA517uCwDzhA3gw+L8xSzFgMou?=
 =?us-ascii?Q?hn90ecE2NK0S3zE2xJ38haqrwOjbfNlkBOkMJWmR6KjtBR4FeKzTzNxbeTS5?=
 =?us-ascii?Q?z9kzWQ2OyCv/6HpWMXJtGZMW4/xIEv+g2FbdiqJIlIX0QrYswe44uuq9CCBW?=
 =?us-ascii?Q?sqhcEdNBUY1cwa5Jyt/XH7yd41ktLuFgzlxoM9VKZ+BCf59cx9W2cHJV+239?=
 =?us-ascii?Q?sSY7kkrjCCh2xCu/bn2Sa2bVDh8ofDQ0LM4o8GVD98q9x9SU6awKRVHRaNPk?=
 =?us-ascii?Q?431VMahT+v4QLu+5psLTIlv455AZuhlcZEoBMh2U43P2Aqacx8QApJEJBA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:53.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7714028-c4c8-4549-d613-08dda738e3b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550

Add support for SW mutex register introduced in Tegra264 to provide
an option to share the interface between multiple firmwares and/or
VMs.

However, the hardware does not ensure any protection based on the
values. The driver/firmware should honor the peer who already holds
the mutex.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
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
 drivers/i2c/busses/i2c-tegra.c | 137 +++++++++++++++++++++++++++++----
 1 file changed, 122 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d0b6aa013c96..dae59e9e993b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -137,6 +137,14 @@
 
 #define I2C_MASTER_RESET_CNTRL			0x0a8
 
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
@@ -380,6 +390,108 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
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
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+	if (id != 0 && id != I2C_SW_MUTEX_ID)
+		return 0;
+
+	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
+	writel(val, i2c_dev->base + reg);
+
+	val = readl(i2c_dev->base + reg);
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
+	if (!num_retries)
+		dev_warn(i2c_dev->dev, "timeout while acquiring mutex, proceeding anyway\n");
+}
+
+static void tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	u32 val, id;
+
+	val = readl(i2c_dev->base + reg);
+	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
+
+	if (id != I2C_SW_MUTEX_ID) {
+		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
+		return;
+	}
+
+	writel(0, i2c_dev->base + reg);
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
+	tegra_i2c_mutex_unlock(i2c_dev);
+	rt_mutex_unlock(&adapter->bus_lock);
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
@@ -558,21 +670,6 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -1515,6 +1612,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1540,6 +1638,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1565,6 +1664,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1590,6 +1690,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1615,6 +1716,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1640,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_mutex = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1668,6 +1771,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
 	.has_hs_mode_support = true,
+	.has_mutex = false,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1871,6 +1975,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.nr = pdev->id;
 	ACPI_COMPANION_SET(&i2c_dev->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
+	if (i2c_dev->hw->has_mutex)
+		i2c_dev->adapter.lock_ops = &tegra_i2c_lock_ops;
+
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-- 
2.43.0


