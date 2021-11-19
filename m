Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECCA456FC3
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 14:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhKSNkQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 08:40:16 -0500
Received: from mail-bn1nam07on2089.outbound.protection.outlook.com ([40.107.212.89]:5767
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229457AbhKSNkQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Nov 2021 08:40:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4y9B6TOfB0qeBjG40n9xWV50s0la78aQFMpXjPKM38uBaAf9TFAbwJr9q360yaAMznt31A196puQR8F48XETatqhBEAjBrQcAj/RFVsIvzxGhcwnbYx/qLEgLXtnDynpe9Im94Y3rNcn1pGlhdOzVtVtzaipDryLkeHl4m7HSmGktpwOYDyEYZWcZ0fg+ghbdAbRyKiL6deItvZwqPi6J6felZnWUyZHO1QyDJYpoYwPSdad+qnwOwZwny+Tt7Mog3uS6eA2YkbInIDttHNpmHRAhdQTzy3VkPCx+A6lHEE4eQtEbNuvIzer5OxBowSzEYujz7LMGDCWYYykLlw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bTBbNSYXMXGjBeGzgrikYZ/KBT0nXEOl712hOEqqyE=;
 b=fVEyfWNh5FyhO3BCd/tRYpY4F1TH1HO+cYV+BqTPEbwGgglHlW6IjvJItO3OXVV3Nm2GppAPKd9Di16TopjMUl9md1rdVSqJjs4YT7szxAFlv3K73THYo4OI6v5hWwDvuzT5cwbwtXHNP+tN8wPLArhA9EM8fZG9cJuSYQTn5IPWbM4FU/6IpUHKaiu7YXrEKk1z7+vxVItzcsZHTli2U3yS8wLRfSBsXyB37Uq6CYmuEC+zC9MGeXrcbIdy5ZNIeiE11OtojriOTqMrVaw26UGNcJ//O5QK/jTJSc+GFfaODjfxA831qudYI9SbFNnsdGY0+/w341Jg6LfHbdKPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bTBbNSYXMXGjBeGzgrikYZ/KBT0nXEOl712hOEqqyE=;
 b=F9J11RIuqjdGeT0G0JV0rem/X1Y5JXVMDUnHtg8YawKn00e4V38eBnrS3HdR97F/Z/hkT00tjdw05My5Vcqf1DjYIndo9Mo6OWV0exdjIRSdF3QNG3RAwMUfSpwA4V4b+ZOyiJg8g8/kdJf3KimWK+RuBWgNAgaN6A7A81jSW6CpSMxyYRv4K3/BJcaPHbfoGR7o8AffSsuGASm+TEGqSOVHxGtF2/mh0nqzOF/a3UsZrBzLrygu8lfuIUSL8N4EI5DOQdSx9XgmPUnWYsuwIGIv1O6KMlkNn5ycDV2GiDMf9SGPjn/VmeEVvtYPQgKOIfZOf5c8rromqug4D5T0DQ==
Received: from MWHPR18CA0030.namprd18.prod.outlook.com (2603:10b6:320:31::16)
 by MWHPR12MB1662.namprd12.prod.outlook.com (2603:10b6:301:11::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 13:37:11 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::5f) by MWHPR18CA0030.outlook.office365.com
 (2603:10b6:320:31::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 13:37:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 13:37:10 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 19 Nov
 2021 13:37:10 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 19 Nov 2021 05:37:05 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <p.zabel@pengutronix.de>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <andy.shevchenko@gmail.com>
CC:     Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Add ACPI support
Date:   Fri, 19 Nov 2021 19:02:14 +0530
Message-ID: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6de2455-54c5-4343-2dde-08d9ab61b088
X-MS-TrafficTypeDiagnostic: MWHPR12MB1662:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1662E7CE3483996D2518E341C09C9@MWHPR12MB1662.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bMW3QPcECLxCsU0WN+fkb5+FUzOv+xaq1huQZnbl6b/TaLMZ3i7lcIt3K/24LkrjR4qu4zCxl9DpNNn+3wPI2pFRNCVq/QzMV8q/GLEAhfU8T+zFkADH7Dl4njSYeRJUr/7LYtXhFuCY9oe8UQgYdIfy4ppkCU7oPHVDYLj+yxYr59jKTZxMgUCjhY5EvtYjEiuhxnOMlfZQKdyo3b+3rNOP5WnJPCc/tSl4gsZsx2bbgl6rZ/pxOiHR0LaUrJgtoLL57GpCeUS6qGN3w17Y/CGCA/iIyfMz9DPVRlJFc0Pe+scn/FUxnFuFylfOUv850wzJbLjT8qs9wcqbZ47eXOKyq5WZYF+NRo8vZF3lo5BkV8v2h4JuV8X8KZU8MWIKNU/njFaH+v6okne3nZsT3zxHy2H73BAAFpe64J0VLLt+fReTDpLwtBi7QFV5RUmqQYf0dvGlbFUb0j4vX9BXI08kauv7DUrikAGIe2qQaN3tIt5sTHx11IRjYZ9IKMbKe/qFSYOubHdtnH2+F9yMwnCcp7ItIWcgRRbeA2/rbfR13DfK/zMzxn8jTS6tXVeW2ndB0Y9rSFDK8BxmkTxwBEAdkSIs+9GQ1HDBhDwXU4iZlBIfnVkmOG1nJC02mgj9uyO9hebpp39phxNyHu7v/INlfs7ysmQsRY2F7uDBOMkWXTEjcUQj1pt1qaqFamBR3SLT47LL3Uk/hyQ1EQSFGa03/lYXXjQhd/JkVItYkZU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7636003)(7416002)(4326008)(2616005)(508600001)(70206006)(186003)(70586007)(47076005)(426003)(921005)(6666004)(107886003)(82310400003)(36756003)(26005)(316002)(5660300002)(83380400001)(8676002)(36860700001)(356005)(86362001)(336012)(2906002)(110136005)(8936002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:37:10.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de2455-54c5-4343-2dde-08d9ab61b088
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1662
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for ACPI based device registration so that the driver
can be also enabled through ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 52 +++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044..781f747 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -6,6 +6,7 @@
  * Author: Colin Cross <ccross@android.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -618,8 +619,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * emit a noisy warning on error, which won't stay unnoticed and
 	 * won't hose machine entirely.
 	 */
-	err = reset_control_reset(i2c_dev->rst);
-	WARN_ON_ONCE(err);
+	if (has_acpi_companion(i2c_dev->dev)) {
+		acpi_evaluate_object(ACPI_HANDLE(i2c_dev->dev), "_RST",
+				     NULL, NULL);
+	} else {
+		err = reset_control_reset(i2c_dev->rst);
+		WARN_ON_ONCE(err);
+	}
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
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
@@ -1684,6 +1690,9 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 {
+	if (i2c_dev->nclocks == 0)
+		return;
+
 	if (i2c_dev->multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
@@ -1720,7 +1729,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	i2c_dev->hw = device_get_match_data(&pdev->dev);
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
@@ -1746,18 +1755,20 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
 
-	err = tegra_i2c_init_clocks(i2c_dev);
-	if (err)
-		return err;
+	if (!has_acpi_companion(&pdev->dev)) {
+		i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+		if (IS_ERR(i2c_dev->rst)) {
+			dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
+				      "failed to get reset control\n");
+			return PTR_ERR(i2c_dev->rst);
+		}
+
+		err = tegra_i2c_init_clocks(i2c_dev);
+		if (err)
+			return err;
+	}
 
 	err = tegra_i2c_init_dma(i2c_dev);
 	if (err)
@@ -1923,12 +1934,21 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 			   NULL)
 };
 
+static const struct acpi_device_id tegra_i2c_acpi_match[] = {
+	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
+	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
+	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{ },
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

