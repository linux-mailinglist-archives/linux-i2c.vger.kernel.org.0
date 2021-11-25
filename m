Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0FB45DED6
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 17:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356655AbhKYQ7W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 11:59:22 -0500
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:53185
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237194AbhKYQ5W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 11:57:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0xrvJbtTPc7vxgzg442sSmjYt+gLIiLmRwEZx55Hw8ZT+A2ZwxZCD9H0kxYQgDi1qHMEG7kls55h+oiWSLMsYqOtkCvz6oZsdEu9nPJAjT/V92k5+F0YN8cooANLgpOaDhq1CEMqoLAOyKW08F7kjJomygSb0NNiAJxJPGReFn3xxbHUneOBXHGg5W+fT+BmeyxyWzat9eimUCtKr7P8YRANiumfRmzd0zuGoHfORlOhQE06XGX/df/jLvt5Qo7q6Q45RkfHY/ly2dhFMRKHbpFamJJaikZuggjCzRWgYqwBTkCwjveaAkucGSObxULWahqIIyfzcdeUU+dkLIUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8xjsc6bwUpXvmbqm3GpIOkiJF2wmizzGK6pcxyhIRk=;
 b=VdHztvhGF538ZNHVRBsEl6ycgq57UzTM3PH5GqTn+WKX4y6UjHYZtxVVfJKoJmE7lf77Mbob/5B4A2YJ67xmvsKdYjKjHID0bxKGxzjWHjX6PNTYE+BKYvYdMkxyKDtn6/2HOD7Sd0nbPwCxWkMnlG9QkmWuyHLU0HKIslE6wXvnIO3zNSw2bpd/d0Efu1AI22s7Ofsfc5z8BnaN7mGzXgzS10xhCo9vuWJ2IgRSPoJnyrDsDmw5bukxFOENswq63uDnvEng8z0miLwWS8sGH85AKhrRjDWDN5YwjPfqSz/BjxvbWcGbohhQ6/QcxM4hXoGnPf2OWPj/5qd1sUorBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8xjsc6bwUpXvmbqm3GpIOkiJF2wmizzGK6pcxyhIRk=;
 b=SHdFg43/LmHUogEO06H+k/IkVQUsT/8U5QyVSLI9P0Rz6IY3FdQyF8J3V5SkGy+Dkjvg6egrMGYFvyfJrjRPAofO7yBkZ49UBzMk6EUxQxuQ5Lj0tIXHu34NAmOWCyU1VhS1GKitxoSdASiZacWa/UfnQA5UEQNzRqtMnohiPibHVWOu/3BGpPUWFVGsWnUV2gpEjXL8UqTPwFB37F+cKhEBAeO1RcikSWU9a+WArXzTO+zff7WMKWI2BtO58FozyuGhS6C84z5bfnVc+ZqXFLHGYK5fqV/PB7bOOr8GqWtPexJVXJiUgcRTn3ltUVbxYKbToFKUBG6qTdc4mpUX/A==
Received: from DS7PR03CA0070.namprd03.prod.outlook.com (2603:10b6:5:3bb::15)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 16:53:59 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::ba) by DS7PR03CA0070.outlook.office365.com
 (2603:10b6:5:3bb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 25 Nov 2021 16:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 16:53:59 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 25 Nov
 2021 16:53:58 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 25 Nov
 2021 16:53:58 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 25 Nov 2021 16:53:54 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <akhilrajeev@nvidia.com>
CC:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>
Subject: [PATCH v4] i2c: tegra: Add the ACPI support
Date:   Thu, 25 Nov 2021 22:23:44 +0530
Message-ID: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e0fd72c-66ed-40cf-831d-08d9b0342d37
X-MS-TrafficTypeDiagnostic: DM6PR12MB4500:
X-Microsoft-Antispam-PRVS: <DM6PR12MB45001EEA65341B25E202C943C0629@DM6PR12MB4500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bD5XVvHvKu+8ttCLcaQvOUqY0fHMRpCQZ/RQBnqi4k+KYIClLWzI91U6bcojo6HaZ1ByNWxXtFrnyT7RoZW4eUdlpsdV6ZMDU63MZTk2Fqwj8KMe8Jb0rDMOpSuZxmCmZ5Y2eNrzgFdbrQt7rwQfOT9/fwVun1ImLNnjwu+jT9Q8diMgkDRIcYREuSge5jAdPwwJLiDaFGG+VeCjs8QBWnjgw4WW/ogQgANFuzj0J0Ht/s/uoNXKd2Nqr4BadB4sVD5IaTtn8651dSOEuXCclc6Il5wNVrcHrYLUo9CEJmKHjsw2XrdC23S47s4QGjw65eIvxAPErvWoDtevWIkUqDPsoAgc1JhDAhCkFBG5sv7bBXqKs85lOcxDiUKGRlEiPo+Z7d+nIC0/VY3bNVDwz/z2hEEQO5qJyIu8x/ykr9I+u7196pNA6jUwHGSEXn672wpUuq9RztN5ZxxT8Q5ZxI5u3DezLhM5Xj7DGMyJNxIrvtoEceXUCDHDEaX4dP3hJ+jW6ww8lmrTq+QH6xgxzgLlLQYdV9MtR4J2ACZU8+5hWqY8NtqgN+mFY4F9AuN3RqS6DrajQAQhQl3bD4HlngY9AZuA929B4lelpkv5tm7LgCLbePd28SJT959mmFynFtxBdZbbcC0zYeXqIwjDGBmg5D3B1+XjsdyYAbUC8HnW2qsz47dv5PgLoOftxyZ6FgbP+euIDBKZGIAasOAuqWnnhB7bwg6wTucPkyLGoB3rj2kiQUqajHaM+L0OjkGRqBVhAYciisdKMNIVcENeWAzl7qP7is9zFOS4eri8aWR/E8cUb9TjkAKfq/aXIyxtoSTDl15s2714j83fokzWWA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(356005)(70586007)(7049001)(37006003)(966005)(8936002)(83380400001)(6200100001)(4326008)(7696005)(8676002)(5660300002)(70206006)(54906003)(7416002)(316002)(336012)(426003)(508600001)(86362001)(36860700001)(2616005)(26005)(2906002)(6862004)(7636003)(82310400004)(36756003)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 16:53:59.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0fd72c-66ed-40cf-831d-08d9b0342d37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
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

v4 changes:
  * changed has_acpi_companion to ACPI_HANDLE for consistency across 
    all functions
v3 - https://lkml.org/lkml/2021/11/25/173
v2 - https://lkml.org/lkml/2021/11/23/82
v1 - https://lkml.org/lkml/2021/11/19/393

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044..6986eb9 100644
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
+	if (ACPI_HANDLE(i2c_dev->dev))
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
 
+	if (ACPI_HANDLE(i2c_dev->dev))
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

