Return-Path: <linux-i2c+bounces-10814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD55AAC0A8
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0FEC7B06ED
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073AD26C381;
	Tue,  6 May 2025 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="egvIXXym"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945721B9CF;
	Tue,  6 May 2025 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525634; cv=fail; b=TkkKqDMz73FvJvw1cHbATq36XgyhpnjBPuJ+mmSTAzQDiDG40u43FYF6wp9IAIkR0kA7eUj0aRq39dzLBxeBr5kr/13yIn5DFkiJGyFdNnUF2j6Nxop0u1RAFNfoxhYIiwX3YVHXJvVwdwao0swf+YbqluVljq4xmzDE6+q+ulk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525634; c=relaxed/simple;
	bh=FYAkP4d6IpM07ib21UPkeK7dsQn3VzOzDwSACQ4e+CQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHzFAb3hGuOr+Jw5b/SME4lZntGf/pJOwp0Mn2IyldCXsKxYC/yJmHp3Z6YoKGsDirB0khm8vieRMtYUoPKOGWJEWRch5f0+DhVTSlPoGLTdeqOnvq9u5Tqg9McdpH+SLmDixy1vY0XWGyY9enCfxzwt5miA3de+mIiCkfeofNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=egvIXXym; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXajqu0EEIh0BGIUuSOUqbqcSPCxAM4JuEWoBcQz1ZB1hTCHa981pkd6s1fznY9UfetX2RXgVX2reGk9aP91vjlUQ8wGTGedRamqmA7p38KDDoAFHCxJy0jwoRq0iJUwipOOuq5bRy8423U8fxwxTosWpnHCN7p4xZ+IoMMx/aLZL4/lcLvh0ZU/J5VhKdmLxADzQuVAcKhIcakq5pc+6w43L7yJiIIOnINpCLtHhpAqT9pbYXbk9B5l6YLR0l+dFDZ/fWmit/1bSmqbKcrEw810zhGkOqVbileKVomVqQDJlDT0Tv+hfTmefYIPTc/O13KnrakaZ96p7inztbLh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqlaJloGDHnrK5HsfnhnPaNZ7hkNeyRiwiSAHKlyygg=;
 b=igY8EYl+mZBokaI7+8lFyJ/m/57Y319L7jFnwCRmwG9Y879ua2XYyvJ+LXZibmBm40O+1nHVdwwxEkwygMQ2kau15JsB4qp6f1YhVM3+iWbSU8yj147DgbKVsiuTx4cwVTIUWIZSdIg/qrGAW1JJFfKUKzX+Es3RIdYVpDdoLb3EfECpKITQw1lC4nJLxJOM5uuo+yBxHeyw70VbvGZRd4Zso8cxG8iTXU3nX2J92cK4hlX+iZJN2Z1ncy+BJ5Zj7cCLKY9DqGbuhi4q2H9S6hFAEFgFG0pd8UjLv5II7Q7vqBd18bOsEP13eKtzAuB1KAqukeFDrqw4HNSVEU/s0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqlaJloGDHnrK5HsfnhnPaNZ7hkNeyRiwiSAHKlyygg=;
 b=egvIXXymv+XGZEr7kc3k0PJyfTi9h0B1RFLaLfp1RiVAxBA7Js8KBH+zSUhwFNA7H3GNcwKobzD97d97QAR/MJb0zrZ0DqLX5JoTbf7Vgmy+/J6kVlFuBItV54aMwLnMntgwO+3uGwfqV6KU60GHW/Tz6AtINFJI3t7H+Oupv7FCR8fup9/ykSttBDlC+AyCYJcXMC41alqRMWXYhLcL3PoveGLJOldZSC+g883m+PoVBV74guoEZllwRs+N2dbVvXSM5/y2s6G6Miv+ZsSJMjjkJxOpCf6lwUnqk+M44bVrnA8W96jKJzENcmy0vSm03qzYriVhnxzDA5Id+43aXA==
Received: from CH5PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:1ed::13)
 by DS7PR12MB6143.namprd12.prod.outlook.com (2603:10b6:8:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 10:00:24 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::44) by CH5PR02CA0016.outlook.office365.com
 (2603:10b6:610:1ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Tue,
 6 May 2025 10:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:00:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 03:00:16 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 03:00:07 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 03:00:03 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 2/4] i2c: tegra: make reset an optional property
Date: Tue, 6 May 2025 15:29:34 +0530
Message-ID: <20250506095936.10687-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 4258dc2f-b406-4966-9cf0-08dd8c84d251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?edCQBQp850zFvJD0lHhfAQgccH1i4oNM7mRi7qeehQqCU8uV137zOIMhPYKI?=
 =?us-ascii?Q?7BAAaelv+KsymBEYXplu0vBLQR+rwD8zSDORZVhZgsafyIhO/mXJoxcXxRQB?=
 =?us-ascii?Q?Ya4EPdsQ27rd/HgADGwL6oaztYWO4BoXWtkKfkICwN/FNzflSTrpWINIYZXP?=
 =?us-ascii?Q?HKutkWGNBmYKCIdA1a3k16G/ssKMzJ/NNYsyLfnfCsMHKnCMyGriUE28HDTF?=
 =?us-ascii?Q?/SitcLP/fyX4AWaolG27YZaBFIm3Ib30qkkQPMW22c3Qx31mrECg+7ObryFV?=
 =?us-ascii?Q?eW0iwRG66fBbpoj0w+mz6MiDPzWOZIjyORvhiBwAOA42DmuVtp/zZIqavX/1?=
 =?us-ascii?Q?Gtsd9hG06SD2tEAQA0F8LMO4kLvdpY1KD041WSDi4hv17PnIWRqOKOxU1QNW?=
 =?us-ascii?Q?0l8BAQZrER7g3HbnqLFgNlYohElqAdMyQCyEiNm5jXS+JSQ6ayVE2AbZXY3U?=
 =?us-ascii?Q?r+45SuSTKF9ZeKK1LoFTr4ZAGRwzWI2HyB3hJ08l5jdmMVJcEtXzxF9daazx?=
 =?us-ascii?Q?fdq+2fQb2C4a6yOSaShAM6gzozdmUZEkJCHydH8TEruiYSLyIC6VKqke8aUT?=
 =?us-ascii?Q?r4EyTXqE9777Iy5xIJq6C6jabhUbi2CaMqzBg1LifE3Gi49UTkaJm7vCAvUS?=
 =?us-ascii?Q?IFq0y98gHEAagV0U+Bx7JCMa1LctsvFKScAdrc24v8T/V9h6I2swUVAEDN7k?=
 =?us-ascii?Q?JkV+cZK7et6ej7JODPpqok0pK/ZQ6UEMgyxO6KPBAVWaVDsFWq6wk8HOddK9?=
 =?us-ascii?Q?z+sSuJ23czhh2G6X/7Tmo9thQhb/PF5+VV3EpjymCsnZXeTgM+XxH92TVcAO?=
 =?us-ascii?Q?Puwm59B1J8yl0RNfBv8YWnb87jQxySWpIC2RifMM2d3BlENvbNXOKzuf9puS?=
 =?us-ascii?Q?3RYWwFUeKcmWQ+G3lpwIbBGaHT4lZBJ6mIjOkCK3pH8O/OZMYxFd3i9uipLW?=
 =?us-ascii?Q?9z27CXKlyF6b0ukVBeKHaV0zl3kjRDN7VyYH4hSCv4UtgmKp2F50CdThnuTx?=
 =?us-ascii?Q?2thN+6jqNtxLNqA4y7KubDfliBfplJ38kBfsYjAGixhRU7cw5svRQDJZIzNR?=
 =?us-ascii?Q?I3HLmAef4lXbKS84yCYhB6tZksvpyCnp7GXLldZGKm1HzES5xU3q7PeV2hmX?=
 =?us-ascii?Q?YyQfk1vvDBZFCMLavZ2MOjvNP5FLcEjiYbqjUrJovI78SMf15uLCMass/A4M?=
 =?us-ascii?Q?LDvfoYhpXFDYflACjGULYQMkeKG0nLzLlPmdNavIqWMeDHqePcIhXZR3eDWH?=
 =?us-ascii?Q?ktGWcjgOncuxI1EhTDt6EcpmDf5HHQ7BI6V7FOeH+0KZ6m383KnYR4BhOJcS?=
 =?us-ascii?Q?KtClviYYqqtAAkx04FNBm/dzO1VByaK9BS3KE8ttFqHjXYD+fZYCyJvUfMgi?=
 =?us-ascii?Q?8FgyXD5wOv/JNyd+/gjvn0F6/gpp2r5DYKLXnkf8H/hJTJfBufXneMT8ArNo?=
 =?us-ascii?Q?MpzKqF/OsvVHMG1t7sV0PaJG0sdeTSiQjxgk2r7peqjYN0x+uxYhaN9VeADk?=
 =?us-ascii?Q?pnbCo+QuvoffOftn/l5x5SiiENP1LoDpeaCUSWCUF3YFTM99KBa29xa1Vg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:00:24.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4258dc2f-b406-4966-9cf0-08dd8c84d251
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6143

For controllers that has an internal software reset, make the reset
property optional. This is useful in systems that choose to restrict
reset control from Linux.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..49b77dcef184 100644
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
@@ -604,6 +610,18 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	udelay(1);
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
@@ -621,8 +639,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (handle)
 		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
+	else if (i2c_dev->rst)
 		err = reset_control_reset(i2c_dev->rst);
+	else
+		err = tegra_i2c_master_reset(i2c_dev);
 
 	WARN_ON_ONCE(err);
 
@@ -1467,6 +1487,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1491,6 +1512,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1515,6 +1537,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1539,6 +1562,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1563,6 +1587,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1587,6 +1612,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1611,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1666,7 +1693,11 @@ static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
 	if (ACPI_HANDLE(i2c_dev->dev))
 		return 0;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	if (i2c_dev->hw->has_mst_reset)
+		i2c_dev->rst = devm_reset_control_get_optional_exclusive(i2c_dev->dev, "i2c");
+	else
+		i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+
 	if (IS_ERR(i2c_dev->rst))
 		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 				      "failed to get reset control\n");
-- 
2.43.2


