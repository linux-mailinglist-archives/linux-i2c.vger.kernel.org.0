Return-Path: <linux-i2c+bounces-13008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A0EB7CEDF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D12C71C062C8
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B1C30ACF7;
	Wed, 17 Sep 2025 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bmdqjios"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D92FFF8B;
	Wed, 17 Sep 2025 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098192; cv=fail; b=AbE7IYjrSz0kq87+J3G+iiM8MAoZjDYLixZS7E08YiRSmYZvJXACjrc6lCNEaautg+bKvCGwQmWQnui1YSDUfs/IXDt9rZO5os0MmblV7mcZYGtQBPIMLD9TRjNFn64wjNKevUs5Zpt+2gtP5Ipg+DZPuWtAJ23cjxVcGrlremo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098192; c=relaxed/simple;
	bh=3NT0asyN+4B7B4ZacJ/XxXEar9SWskpn/isqrECowN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0mMA4Qnh9MajTD5O1eCgONtTGl3/GO37l6Mk9uuQyEbc82xUjcXQLLblE2BBqwWMyGdF2cY0Fh3SdzWTaIuZXuNNM3nanAIP0ofggiVZUE0gtDMwQwC1ZRseWF0+KPFYW/iEuXKJt16nwbUpW2TZdXQifnQEPZJZiymc2wNT2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bmdqjios; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeW6fsoCIhTm4GcAjuNvHxsyysvoDx0K99cwRiN0Z/RcQnxpMgTBRNB8EPaVjGXv0B26/MF1UqWjxMHzQIyLLa3PfBy+N9KGNeUu4Hc9/uESOY87qfUVh0fRVxyitUOFcidWbcKx89wFEdM0/gfiKarI6o97Gs6eJ9n6UZ7OKnxNBP73kQk3jx4pT3Ok5qR3s6IQtSOT6k+vJ9r5YidVU9/Pve4XK2vCkOC6EK6yhvje/SgyMxipBbz8HvkXdeEIBnPc4QagvoEgkLdiTVlwUncmgCEP8OG8wfjijaJgUQ0wMkhWgqDAYXMzR5/vMiUTkkJCu/i4/UReiSPkZ6FYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTxgFfYexw/UXf4L1m47ZK0qpWUylLrTnUsGU87uf0U=;
 b=tZqzizk8La55gnT6hjTBz5YKA6PDrCf+Yw0rVU/mnPgQrdMLcfLxrExDnb0vOOvDn6BtV/PunIJSLvGI27SqdkYyKS4S9alfrAd0DFFielb2bYeLUMaipsgRRczVF5cgBQfNdpavPOolIEIbQT46uvCZnHGBq9KQNlPEUC0mOZeJNQpah4PuFNm1s9FLPCmHvItwcni9iyub0W5LzJAp/JZ2X5jpcMCCe2/h2M7ZvmGqxjQ+VM9cqpUWhEKYd/XEEAFKmFnXSZtOPsWJa/JG4ECG3icH9+d/eCbwwgS5OHkWBQwT9pw3a7cWO+7N9GmjUFi7Qt+J5IMQt0Idj9q/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTxgFfYexw/UXf4L1m47ZK0qpWUylLrTnUsGU87uf0U=;
 b=bmdqjiosw5IQyw6h+5x/eMJIH+ZsswYvNXYxzo2sZu1suShUOYZTDrkLJ13OOwZwTocndsDRnuF/7dmN6kMi69Cp9IJp9RyiMAPx+AGbaZim3/QBTEgU+1kxD+8YU/xSn8OfRCyQ3jroFbMxzkoij7IUPEBvQ0iPHISeOh+iRwZdWCV49stSuy37oSzhuo8S2j4+NaZrEUXXValBwp756AliMT2XG+hh8E6kJoJEfV8ySTFOAH8w26fzqn6nt8loT7rKSq8QcJi7RLr7b9PHNbOg3Io7damkXnm4zZiIpmogpnrZBh9ZUVBcQm0FpT5DamzoslxDXPY7hCEoDfZp0w==
Received: from SJ0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:2c2::6)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 08:36:24 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::f4) by SJ0PR13CA0031.outlook.office365.com
 (2603:10b6:a03:2c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.10 via Frontend Transport; Wed,
 17 Sep 2025 08:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.0 via Frontend Transport; Wed, 17 Sep 2025 08:36:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:36:02 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:36:01 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:35:57 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v7 2/4] i2c: tegra: Add HS mode support
Date: Wed, 17 Sep 2025 14:05:43 +0530
Message-ID: <20250917083545.594081-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917083545.594081-1-kkartik@nvidia.com>
References: <20250917083545.594081-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ec8f11-4920-4d13-d889-08ddf5c548f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yboSpd0OdflAMNk2FAwjbnFLkyLrVFi79ZxGJ/B/Z+BLnvLkZSEg9LTMf+p0?=
 =?us-ascii?Q?ViJzyN7sXgKm9WKabjB85pDQb8KXhPS0V738ldqxLaVX5nJsfKV57XDRuKEC?=
 =?us-ascii?Q?BsNUXHDfnoP40PBc7FwyNuzHvRiEvc+j44X6dpYzUCWmWdEM9ZnP1eDM6BX3?=
 =?us-ascii?Q?a10dp+ytzbmYWh/cqBEkdcRDmdE+OLf5CTWG2fGd8SVs4XhXNBkgHZk59hrc?=
 =?us-ascii?Q?TUEvX97gEuaFu7bLsxnWeiowkcPVO4O4lxwlZwM+eaQyVHYQ4QXz8B8Lmnuj?=
 =?us-ascii?Q?LfCX+8DXqE9XPYayMWpTuWwppyS+0sKZGgWE3FpZ36Lq0JD+EjKaKCTui4h3?=
 =?us-ascii?Q?69o5Vhmm8HD4rB3Va9NRUqbAz9LQ2xRd1jTqGXOuJB4egZeNxf4r5XvgzPc0?=
 =?us-ascii?Q?JJuOfQOdjllxiF7bLDwQmvj8hwF36E0v6+SqesUwJti6vaD+p9mqKydbpEQF?=
 =?us-ascii?Q?sLLJLUbrCnHD3i/6ml7jEQltfdF1cMjFwB5tpI2fYmrDKpbk3pHV8BnJlhfk?=
 =?us-ascii?Q?SyDl6Bt7ZURPTWEkhuvlVL6XhJeJmUL+DFw1y9Fxo+7ySA/hb5/69J861dcq?=
 =?us-ascii?Q?TbBOA1lWQVenoi95+Vf60jjBWhFWCtB8dCbAtxT86pZDS0uU5xsWV3kBcLmR?=
 =?us-ascii?Q?1JxttSGEjkehEu9T+39+wiBBp1M8WpN4x4sghJ737MAoglUlA9OFFDgS9h4V?=
 =?us-ascii?Q?4AtsrrmzuxpMa9xjm9FLLemsZU+i8Ne0CPPVHyxNrqHMMm15N55cBUsDOHmb?=
 =?us-ascii?Q?ImDLmEnvi5QqrlRIUU3eDrT35oAgkI1Lkhk0G5ikVq9SiEFOcZCme6xe9TVr?=
 =?us-ascii?Q?M7OsJS3+wbbCV3lxeKVlRqkIy+x7L/mEYrtjg04NCPhYMdp7Ou5/HGeOxknc?=
 =?us-ascii?Q?nu80uyBf784Nh5AnZlCcsYXrJCIwLaxzXUvvYVtPCUfaEWgYVmajiHPTMhk2?=
 =?us-ascii?Q?m/o2Zqdf+lpkP9TJbYLCasr52Q5US7STq2zElOLW9tvK9XyxXtcXwO+a/pc3?=
 =?us-ascii?Q?k7R3ys11BBpgZsVRgI7yZrbsGcBbxMgd6vF5kkrdxaw+HKlXuXg7m2j6pgn1?=
 =?us-ascii?Q?xwky0CZZQ4yDYaMjoykkaCYnjLr+hp8/ca36kdn2eJ7nNMHfPtbluIgKv6jl?=
 =?us-ascii?Q?TslHr2ZrXe+nsTD/L5xKS0W2bnGRndcF5A4c6v0O270/LyfawwX3UctHTR+t?=
 =?us-ascii?Q?yH8HaAd+YAo14M7xUjwcsmWc8JQUvgJWuEInEygjZQCyBCigAg0ieT2t30gO?=
 =?us-ascii?Q?WrQzB3T22iQORuJMI3kyuONmZOvtPJEcUft+YMjyS9arrs1cF4CZnbEfQQfJ?=
 =?us-ascii?Q?PGRRrWL2Ts89blygZjqOlUc8h2vy6+qvTw+IvDdN3sGmDQ+MsiTATrC5hwbH?=
 =?us-ascii?Q?PMYUbi44cPW3oYjbYMINStD14gkl+fVrq6vSrRjNjqMeq/7HGKjb/TJicrrh?=
 =?us-ascii?Q?MSA7oczAwK/dxLhBnDC3GDavVksBUYSbFmsjD3UWOijbwhqJfbCfPSnDFJYP?=
 =?us-ascii?Q?fMyzMKIzJ4FHBZIRqYpJAIBRGnbc6oz7Y5WnWtcCjvI9hUMz33JnFl4bjg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:36:23.6219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ec8f11-4920-4d13-d889-08ddf5c548f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode transfers, which is supported by
Tegra194 onwards.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v3 -> v5:
	* Set has_hs_mode_support to false for unsupported SoCs.
v2 -> v3:
	* Document tlow_hs_mode and thigh_hs_mode.
v1 -> v2:
	* Document has_hs_mode_support.
	* Add a check to set the frequency to fastmode+ if the device
	  does not support HS mode but the requested frequency is more
	  than fastmode+.
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d908e5e3f0af..6f816de8b3af 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -198,6 +199,8 @@ enum msg_end_type {
  * @thigh_std_mode: High period of the clock in standard mode.
  * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
  * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @tlow_hs_mode: Low period of the clock in HS mode.
+ * @thigh_hs_mode: High period of the clock in HS mode.
  * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
  *		in standard mode.
  * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
@@ -206,6 +209,7 @@ enum msg_end_type {
  *		in HS mode.
  * @has_interface_timing_reg: Has interface timing register to program the tuned
  *		timing settings.
+ * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_std_mode;
 	u32 tlow_fast_fastplus_mode;
 	u32 thigh_fast_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_hs_mode_support;
 };
 
 /**
@@ -717,6 +724,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
+	/* Write HS mode registers. These will get used only for HS mode*/
+	if (i2c_dev->hw->has_hs_mode_support) {
+		tlow = i2c_dev->hw->tlow_hs_mode;
+		thigh = i2c_dev->hw->thigh_hs_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
+
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
+			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+	} else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
+		t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1214,6 +1235,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1502,6 +1526,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1527,6 +1552,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1552,6 +1578,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = false,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1577,6 +1604,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0x0,
 	.setup_hold_time_hs_mode = 0x0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1602,6 +1630,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
@@ -1627,6 +1656,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.setup_hold_time_fast_fast_plus_mode = 0,
 	.setup_hold_time_hs_mode = 0,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1648,10 +1678,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_std_mode = 0x7,
 	.tlow_fast_fastplus_mode = 0x2,
 	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
-- 
2.43.0


