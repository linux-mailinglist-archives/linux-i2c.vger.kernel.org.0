Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8AD45D6DC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 10:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348392AbhKYJN4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 04:13:56 -0500
Received: from mail-dm6nam11on2050.outbound.protection.outlook.com ([40.107.223.50]:46113
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349010AbhKYJLz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 04:11:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+GOITdbI+8ViLOtiPbFoTsjiAQKjz/PzeVHSSRV/pIWW/vZYxj8cNK26nJvpV53SFJrQ68XSVRUEUrMuaeRaN/a6eRtUq9Syb8VidT5wVQqNRqSa3qKNtkRJJQefeqfeHL8CnWSepFssSpyzwZQ89UIIbWXZVibRDT//QHBDd5yNq6dWO5Dk2fzZAVRoow0cqZPbzIcd9MI6uchxpA4UCQkuQTIuzRLe85oiYzY/UGTyJqILgsHiwNGcctSXyhcpIl15dvFEJ0NTo0FP1yXcKKJMfaaWY5U39wR0MVIKbtvirzbgRxE8wczYsDVHiCGgHpJddq2h0RCyeEfwAgInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlK5auJetvT6z8Mm/9BY/R+1whtWidbqK15tvN3v1zI=;
 b=hR3Au2i7+8iHmQBhozKv+15OpcDnt8hjkBVmjV9olJMMInb8ZN62vJXCNJAqvVkTNQokgTD1zbZawgDm6PKdI67C7LOD9yn5NANHP8PEbHW492Kq96RD79FBIzRauO7LUXQIicoWiBb7ESYAo9nf2vzAFpr+GSi4YHiMuXnJ6HRGNgnQ/0CI/XtGgjlHE2wmxN/0w5V2LxgmgWZGgodKY/tmSyjWZnFl2uiT0Pb6wn8oEfk8M3f016Pa5HimOlRkoSPF71s9eBqxD9fPErCxaMr2RB8dm6YFEdeOeYmBPoxPQGgD1+btKv6aUDGwNN2lX+Pj+CLLCPIvTX9+jn3cqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlK5auJetvT6z8Mm/9BY/R+1whtWidbqK15tvN3v1zI=;
 b=if5HG/kowMcnHwPjHbS2vg+qkzAlI84YctsNp9+ukFFIiAa+lyrPsQc37UANfma0z0NcYKGgYDmSwpItMLaaxOw9SxBDQE7crRP8MT3sfywKWv19UUKigu0aS5ZcXRWUXGTbwF9RDvVNFsUHk3v7tmvU3a4GNexo+zGAKAyc7AF4dZkwhygX18c56GkjTEyTn75Wgqqe1gdY1E6PduA3/8h1NMJbGs89fyHdl4ILjJrudN2RWBPGVDSwewtpALlDNmuGapq3WBJJXqsw9rZkT3SMqp3opTUWgc64OjQh8MlG8loPD85A2cKdXDecpSbwy1mDi9JNLHNIe4FzWK0Z4Q==
Received: from DM5PR20CA0041.namprd20.prod.outlook.com (2603:10b6:3:13d::27)
 by SJ0PR12MB5472.namprd12.prod.outlook.com (2603:10b6:a03:3bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 25 Nov
 2021 09:08:42 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::5e) by DM5PR20CA0041.outlook.office365.com
 (2603:10b6:3:13d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 25 Nov 2021 09:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 09:08:42 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 25 Nov
 2021 09:08:42 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 25 Nov 2021 01:08:37 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <akhilrajeev@nvidia.com>
CC:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>
Subject: [PATCH v3] i2c: tegra: Add the ACPI support
Date:   Thu, 25 Nov 2021 14:37:17 +0530
Message-ID: <1637831237-30652-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bdd17d3-faee-4552-7d79-08d9aff32da4
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5472:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5472253540CB3E9E57ADC753C0629@SJ0PR12MB5472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BlMfgaPxL081FPyizZ1rWmeeYdJxj211xyUX/L+P82hpis3tGPsD2JgKgmLGvIIupFyIp9S+EzboyJigA9ARwXO+HZI1I6d3sS6qQtS8iEZRcsk6Aj4LAXW0e596YjoiZo7YvTxqOQH+foimqJizaDImAOWDscMDtnvZZa2w6Up8tTK8nEnQVrCOWOMR2Vmzd/pIfsll2VG4zFqpmoFD/VoGgHajQHkMMsMD6jwmS5cQRZR2eaBgVbm7MMrYGLtJIjx7zKb5cPumCHpS9PWagycG9UIzxEtWpKn6MjW7zQXB5kLr77F0rvuUuO5Sp/Cu543z+NzuI84q6IzkAumUXV480sIM+sMAfGgmEanFxMopIrPAJ2hrhB6rWBxjx5L9OJdPvuHB4IIAiSKF77zlndgpLWhSSP2LXLT6O16rnBlVhJZugn8EBJHVToUlasnbE1ImfLflPVfkXM/uCUew751ffnahSvb23Av9gOZ2M/Ppw0CJbQxTKnt3Di9Mt+Ad+2FoAq1cLouuTvtT68LxkImmm8RcainmwTlVis1fBV1KPMGrugdYqYXhh7MpcuvoxIfXv+RuE9fcfSfO5DUsLx7x16NSRuFrq4XpJId7nrlYJFID3g0xsGQnmTytCQnKVOXXEesmPQY49+Mb6axVemaLKAkGcIgA72FQHaBnPw4VoU2Jkl6WH4qH4GJYRx9t1rteeQfzqdF2DI4JQ7epnX1Twib2aA5cZOgOjVr75eh/uMFD/heTsHSJ6BcJwkxXDcCcK+xAlErhZDXcn2m8qC42fut9k8EQooV6q/0bCE=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(426003)(8936002)(2616005)(316002)(7636003)(36756003)(86362001)(82310400004)(6200100001)(36860700001)(26005)(8676002)(6862004)(2906002)(7696005)(7416002)(6666004)(508600001)(186003)(4326008)(966005)(37006003)(336012)(5660300002)(70586007)(7049001)(70206006)(83380400001)(47076005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 09:08:42.5895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdd17d3-faee-4552-7d79-08d9aff32da4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5472
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the ACPI based device registration so that the driver
can be also enabled through ACPI table.

This does not include the ACPI support for Tegra VI and DVC I2C.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

v3 changes
  * removed acpi_has_method check.
  * moved dev_err_probe to init_reset function to make it consistent with
	init_clocks.
  * Updates in commit message as suggested.

v2 - https://lkml.org/lkml/2021/11/23/82
v1 - https://lkml.org/lkml/2021/11/19/393

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044..b889eb3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -6,6 +6,7 @@
  * Author: Colin Cross <ccross@android.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -608,6 +609,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
+	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
 	int err;
 
 	/*
@@ -618,7 +620,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * emit a noisy warning on error, which won't stay unnoticed and
 	 * won't hose machine entirely.
 	 */
-	err = reset_control_reset(i2c_dev->rst);
+	if (handle)
+		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
+	else
+		err = reset_control_reset(i2c_dev->rst);
+
 	WARN_ON_ONCE(err);
 
 	if (i2c_dev->is_dvc)
@@ -1627,12 +1633,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	bool multi_mode;
 	int err;
 
-	err = of_property_read_u32(np, "clock-frequency",
-				   &i2c_dev->bus_clk_rate);
+	err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
+				       &i2c_dev->bus_clk_rate);
 	if (err)
 		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	multi_mode = of_property_read_bool(np, "multi-master");
+	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
 	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
@@ -1642,10 +1648,26 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->is_vi = true;
 }
 
+static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (has_acpi_companion(i2c_dev->dev))
+		return 0;
+
+	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	if (IS_ERR(i2c_dev->rst))
+		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
+				      "failed to get reset control\n");
+
+	return 0;
+}
+
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 {
 	int err;
 
+	if (has_acpi_companion(i2c_dev->dev))
+		return 0;
+
 	i2c_dev->clocks[i2c_dev->nclocks++].id = "div-clk";
 
 	if (i2c_dev->hw == &tegra20_i2c_hw || i2c_dev->hw == &tegra30_i2c_hw)
@@ -1720,7 +1742,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	i2c_dev->hw = device_get_match_data(&pdev->dev);
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
@@ -1746,15 +1768,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
-	if (IS_ERR(i2c_dev->rst)) {
-		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
-			      "failed to get reset control\n");
-		return PTR_ERR(i2c_dev->rst);
-	}
-
 	tegra_i2c_parse_dt(i2c_dev);
 
+	err = tegra_i2c_init_reset(i2c_dev);
+	if (err)
+		return err;
+
 	err = tegra_i2c_init_clocks(i2c_dev);
 	if (err)
 		return err;
@@ -1923,12 +1942,21 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 			   NULL)
 };
 
+static const struct acpi_device_id tegra_i2c_acpi_match[] = {
+	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
+	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
+	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
+
 static struct platform_driver tegra_i2c_driver = {
 	.probe = tegra_i2c_probe,
 	.remove = tegra_i2c_remove,
 	.driver = {
 		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
+		.acpi_match_table = tegra_i2c_acpi_match,
 		.pm = &tegra_i2c_pm,
 	},
 };
-- 
2.7.4

