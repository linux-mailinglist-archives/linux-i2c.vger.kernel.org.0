Return-Path: <linux-i2c+bounces-11763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EAAF59A9
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87CE34E136C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BED28504E;
	Wed,  2 Jul 2025 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ei4lgXAz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDCA283FDE;
	Wed,  2 Jul 2025 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463359; cv=fail; b=FmZkqP0BN3Fg++iVjq+j3M0xxL4nXRLjGHjwndJmAJdD6sl8uMlE4neFJCTYojYoRY4+YfYao0bIxgXLYb+h8h24vNTkNwGndkpEpUEk16eccbzzFTKxCqnWzoAEAxytNZgjTcE4d8Kb5XpA7PFhoUhlTT9QkHaHbabHrahSEGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463359; c=relaxed/simple;
	bh=yN/5oe/+cJvMiysfVYTrks/7lUNb7dX2RwuWuc4ZCZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErguKVWxNWeYYhEA1xTFfjqEkaKiGDvb4UTuCx+BTWv4b9GxfowiPSOiXMGigjr6lmMAU7ooCRGz5hHT99SV+qjkmkvnSjl5mAbxtbsgBg8xJYGUhnGwgzf1dZuwypVJbGs6GHGvs/EuoWilS5ZsflYzLstFDpAtMSjYGyiDRoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ei4lgXAz; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjcqSqfOXy4AmMJyiQoEjANzhk/wFbak6Z26VSXsQIvY/NpfwgMHPoLqFoP5elJvjnLCFDsE1TcphpGdFW27qO03uynCzqUZNjhrkp5W0a2CseRqQ6LEJMiOLR+ZEVb73yr7Cm55ey5jKx/yBYtV2xpzcofs7AnsyPcRk9GPa3XdDXoBM2vHp7WoV1shFzqo9AKG+2ZiYeWXcxY8tUyjV2ZiQ4W2+uEv/AFhsc+6DaUETWVJVo1tRBoFiMm0cUG8loFj9nfZQIgM476PL1OyMpN7Fdb+XjCQ6d88ezF64hYHfu89RIVZOYE6EaCWIJiyEkcFugDmxNrGGgu4353ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3UX0EwLjTKBmc9gkHHOaKQOtgKrgjVu5UhyViSe1FU=;
 b=MSsfWzKw3NslcvbL6hZJ8lkFFd0i278bcTzmrJJg07cEzSlyCrxvdT2JiWHl01q8OGn3zTiD5v4ZoiB/0oso0sngjDpNT6BdeLvxDI3VacVLtcuzZN7/2r4dSH6+emfAzxWPF2Lm2dJeoQzQQ//oKfgZ9qCYWZlPWxnnCGPRcIZTGt6KNDjGpjta/wCBAgb/oNwEVt8EEWo8HqFJkGoMluzdkmcqhP72Zd3hLSp1o880Dkn7q0BuZa4FNGn2CJHcH96SELhCtOlfq0bO5UppWwE68jw+/mRayutBMVk414qniepCHfbwTxUZ3o9x3UdcHlh/inJBCP0R/tBTG0+RuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3UX0EwLjTKBmc9gkHHOaKQOtgKrgjVu5UhyViSe1FU=;
 b=ei4lgXAzjDqpivvLGGBfOFV0pwHrZ/PUarVIpfn3jBZztQo/Ue58OIgLqRkxlXvn+lg7bvpRaVMrpMHlckeLmdYJBu3UbbcmmeuoLMlpjNK7X/UqXOI9oea+exmXNeHiQZQAXZB8kluZ97SyPOR7rIm7dgkr4IwR2v3xVCJsIuqs9DTC297/zpoUppQzaw5gKiSh+W7etmwvOEHZwqEdVwXATWiQwboIEn+OV1WDpg0CYlINtc8OoWGXj4hiWx/IaREFFolBST6RXGSGSJltaBFvxUJtsHWSKfYEUk0dt4ZoOW92inCtYipsvp2Hyj7HJXpUmCWCye+aYuAn0HM0yw==
Received: from CH0PR03CA0394.namprd03.prod.outlook.com (2603:10b6:610:11b::28)
 by CH3PR12MB8904.namprd12.prod.outlook.com (2603:10b6:610:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 13:35:49 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::b1) by CH0PR03CA0394.outlook.office365.com
 (2603:10b6:610:11b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 13:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 13:35:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 06:35:35 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 06:35:34 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 2 Jul 2025 06:35:30 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <ldewangan@nvidia.com>,
	<robh@kernel.org>
Subject: [PATCH v5 2/3] i2c: tegra: make reset an optional property
Date: Wed, 2 Jul 2025 19:04:48 +0530
Message-ID: <20250702133450.64257-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702133450.64257-1-akhilrajeev@nvidia.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CH3PR12MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: feccf5eb-d800-4354-6962-08ddb96d5b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wF/NQratFncouEzc+KTzm4c1fJ0Pz9XqV6ttYKcpNKyFb8RhHIGaLywN7DV9?=
 =?us-ascii?Q?7/Za15nBtj/BPYh0LYMqO23hi1BXAi2cD5MEaZ+I92bxDSfI2KnH73nLvFph?=
 =?us-ascii?Q?b5j6A9S6b0UV5s39IJBUFnt10K+uzyG76cWm+JzP7cxG7n2SkZnkLadbNVCy?=
 =?us-ascii?Q?KSgahNRBOOsQvdSZ8mfnXyBX5Dy4yb3q0syrUpK+hS9kIK3vivcpkhKYdo85?=
 =?us-ascii?Q?B8HRRo3cmNsDGmNIPm5CQjPd1wNspnnaf99L3sZZ2BD6At9rm9Ptw4kSjLll?=
 =?us-ascii?Q?firxmDQVm/E5OE/S7N4ofyOn/jaQMkJNNb7TShj5hA6lOZefgVZdICeRJDl9?=
 =?us-ascii?Q?nOeA4+Fa30nRbM1AqjAii8TQeLXCAPMg7MzESGabkr1m/2MBdQmkAHsRdG0N?=
 =?us-ascii?Q?9VLKvOG9EFQmJ+DCHTWsZL46acNOhIQzxjcH7lIXBKLxHivVrwg76Y71Ad3P?=
 =?us-ascii?Q?+uDdXFP2J2nupLf6Ovionjk76qiFOvHF7q5qftgMxuUYA7HSB74XaTpdFod9?=
 =?us-ascii?Q?SdQskaivppnlAzz19yUavZ4krlB986/9EgKBgVpMosqUAabEfYekituG3yXu?=
 =?us-ascii?Q?rlyrPj5kvJFyX5opY0nuuMJ0KNVAg/lYR/iTeO+lR7yyFj6rJoQ0fmjR+qPH?=
 =?us-ascii?Q?CYedJwP+JHSFs1S97wkpM2EMzMKT/xP3g5dZSf1koeQSpgxXZ8tWBzBKtt93?=
 =?us-ascii?Q?h03sTgtmMgyj3+dei4BaUwoxPg7QaNMJKx6CXyQACaumd179XGK1Sxy0I0s0?=
 =?us-ascii?Q?7OZtmLiEKR8hq0aVRcOejtQFl1Vl/4NTc9796BmZSMSa94yGtWIT8A7KqdKC?=
 =?us-ascii?Q?SBunoSnCzrHkCQumTaJXQU/lGvDzSNNj3R1dh/dqWBpgtY3ZMZPxUfpuQCa9?=
 =?us-ascii?Q?tV98Z/Xrdh5tmjCGkNVtmzykhMvsXLAlKaj4wPSD9Mun4RMD++sEg7JqIytq?=
 =?us-ascii?Q?0JdrlHchlXsiC8YRsKm6A2AlvuUkR/44baTPwr4CM/ltj4X6+KSKoZlDAOXc?=
 =?us-ascii?Q?OJ318RJsxpAU+jsZ4/YNo0tRnekjGIZJOfGK65lxHWmDQaQqidaWeVB2Hls0?=
 =?us-ascii?Q?thXOEWuOnDgxL/Jjs78kJeQWEgzs7cnHzt126Vo27VA2CEyB2cnihrNAE4ZC?=
 =?us-ascii?Q?IIxfPY2IFnrwu7mVp+G2t6cWgeDHHANeJnIMHSbW6IuSYZZ7Djyt8eOppdvM?=
 =?us-ascii?Q?E4KQyE3rWfj4tHQU8/H/Q2wT8dIhEvhFHelIiSVkGSzJTzqKWKs3GCodSgcI?=
 =?us-ascii?Q?J4JpOf8/8dcP+v/6HektW0gfGUDjLGOmmtCT0LsTnwgDgJRtX9TpPFeULSON?=
 =?us-ascii?Q?CONKzz8/l2v7GObspenHuRs64OIsvFu3HJ6p1Pxkkx9E0RE1uaFWz5Hae+/2?=
 =?us-ascii?Q?bnZSYBb3AjABqm8pxBxn71X+b0DQV92zslPTDqd2XPsG8pJwmbaz9xF43Wa5?=
 =?us-ascii?Q?V/tymK41XyY0rOht8rJa+9pVgz/1s/VIvVebmnDUUgRdTwhBbX22JKcuEP+9?=
 =?us-ascii?Q?qTWn83YJ2QfTuajHBrzCeQCcSFNk1J5MfQ5m?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:35:48.7837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feccf5eb-d800-4354-6962-08ddb96d5b33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8904

For controllers that has an internal software reset, make the reset
property optional. This provides an option to use Tegra I2C in systems
that choose to restrict reset control from Linux or not to implement
the ACPI _RST method.

Internal reset was not required when the reset control was mandatory.
But on platforms where the resets are outside the control of Linux,
this had to be implemented by just returning success from BPMP or with
an empty _RST method in the ACPI table, basically ignoring the reset.

While the internal reset is not identical to the hard reset of the
controller, this will reset all the internal state of the controller
including FIFOs. This may slightly alter the behaviour in systems
which were ignoring the reset but it should not cause any functional
difference since all the required I2C registers are configured after
this reset, just as in boot. Considering that this sequence is hit
during the boot or during the I2C recovery path from an error, the
internal reset provides a better alternative than just ignoring the
reset.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v4->v5:
  * Added check for ACPI _RST method.
  * Updated commit message.
v2->v4: No change
v1->v2:
  * Call devm_reset_control_get_optional_exclusive() unconditionally.

 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f3d770c5a67..b24882b76c6d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -134,6 +134,8 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_MASTER_RESET_CNTRL			0x0a8
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -184,6 +186,9 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
+ *		provides an alternative to controller reset when configured as
+ *		I2C master
  * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
@@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool has_mst_reset;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
@@ -603,13 +609,27 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 
 	return 0;
 }
+
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	return 0;
+}
 
 static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
 {
 	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
 	int err;
 
-	if (handle) {
+	if (handle && acpi_has_method(handle, "_RST")) {
 		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
 		if (ACPI_FAILURE(err))
 			return -EIO;
@@ -617,7 +637,10 @@ static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 	}
 
-	return reset_control_reset(i2c_dev->rst);
+	if (i2c_dev->rst)
+		return reset_control_reset(i2c_dev->rst);
+
+	return tegra_i2c_master_reset(i2c_dev);
 }
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
@@ -1483,6 +1506,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1507,6 +1531,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1531,6 +1556,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1555,6 +1581,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1579,6 +1606,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1603,6 +1631,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1627,6 +1656,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1682,7 +1712,7 @@ static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
 	if (ACPI_HANDLE(i2c_dev->dev))
 		return 0;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_optional_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst))
 		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 				      "failed to get reset control\n");
-- 
2.49.0


