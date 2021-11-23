Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2469459CA3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 08:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbhKWHTR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 02:19:17 -0500
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:14366
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233677AbhKWHTQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 02:19:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0GS3+hm3Hm5giGTbCsxoklRXBD+WavrLiKLe3JS/7bAx6HaccTN956NoT8PTsddRL22YeMBcclaAPwePaDYZtfHGRGA+jq+lk+lhDVx/ucbgtWUUQnxzpd/EDOIAPZ7TL+cmGy69/uTFdsdTX9JujvCGi1S8uCO1yl9u5DVGxJs3xWetqAPdzqGk9nBrAzDpjq2LipfQQiOfeZdqLINGs2Eche1WgzhryVLe04qcBNyK8zBFXGmjJt9kuDV5aBNy9GjOhBhplJHoh2st4Y0DwV75V+MOYzC3aDIt+W17+uI8rre7h+72wZ9KII9sKqlA+wDG/u1V7VVcw8LGhXHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7FxpBiZfxjKUeF4Iwjzk85TmvKO+Kvd3CqKWKZdGuA=;
 b=ntHViu02SEPn92+szjCEqYYmBaE4CIJPt8Ls4rFm9kROTriW0Js0r0sedX++AEdm/i/H9TRmiha43M+N5Nz5lH1d2J+IqnK0nZudn0lYVPGyISXf1n/aX1GPc7KeT36+/IjfQl9NgtyBN/ugxD+g5hkF3XQOqjmtLTKGaJc4u9ft01w3MucBfya/QLx9QyDMtwuyn1ex9k0sC4pyksapuL+svs6seycR2+b0WTVH2y1uWLRJgeiYAtGbyoC9qz8AZdeyjzjyT62pLmiFtp5mw38ET2ci8D1aqNl4BisXvHxDBT4n1ZQb3XDQpB8A15t8kTVp3TMskVNvD4hzugY9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7FxpBiZfxjKUeF4Iwjzk85TmvKO+Kvd3CqKWKZdGuA=;
 b=AYS3+pbDTx1K6rqIsbUf2/9NQsL0f2393lpkzo5tn6/i74YaN96ZOqOIGhh0Jl4Ct0Eh1PQixmfigy1IRJGT0AF1HH30KyZ/Cq1x3bmzAxN2WQCZRQnoXXu0C1E6+iJBNySmU0kFyP+rsqU/dZB91iWeY8EXQBc+kA4N9zZAQtoVtzFINS2naqPsCGdTmLJDrPEHd9LocBpIVjTRW5LZ01KYkBYlXYL3+8mB9L1Hx9dh3CETzS+T8dtjkO6dT2koJ/ij7CfPVXQa74xd+6KfxuBPyNyubRGSgPTZwdJSa8JZtaKCBb5qwaSlTPT0/VAX4/sYqnjR2LT2ciJzFU9BhQ==
Received: from DS7PR03CA0338.namprd03.prod.outlook.com (2603:10b6:8:55::31) by
 BY5PR12MB3971.namprd12.prod.outlook.com (2603:10b6:a03:1a5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 07:16:07 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::42) by DS7PR03CA0338.outlook.office365.com
 (2603:10b6:8:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 07:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 07:16:06 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 22 Nov
 2021 23:16:05 -0800
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 07:16:01 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>, <christian.koenig@amd.com>,
        <digetx@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linaro-mm-sig@lists.linaro.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>
CC:     Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2] i2c: tegra: Add ACPI support
Date:   Tue, 23 Nov 2021 12:45:53 +0530
Message-ID: <1637651753-5067-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8749d9-026c-47e4-ceb0-08d9ae511dd4
X-MS-TrafficTypeDiagnostic: BY5PR12MB3971:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3971A3D616E7266AB517DD50C0609@BY5PR12MB3971.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FEhVqa0tESEnoda24xz6KNpPEeFIv6EaDY5NZIosFx97qitKhno3cqLiLpXvE+tr2FgYmHqE0nMqSk3IZpRFGcITCrZAopjaL5qTGTVnhHyFAyafiA4ZyrhWjX1zWZMSJPx2Ky2DmhfEn1/MUx2mlnYok9O3U31RS0UbD/u96HaR3kPR597mf/aLklGxQC3/6YP7mENV3IJwux/s62qMVPBqseroL6cHv59RLJ/JBV5oaSH8heCuvHh7nYw7q4d49el1Spr+ztM1QneWffw8jy5UT0QcKTlhuOP2xpyKnjus3+VKevRWe/56NFN8MglwAGbx0jzHPaDTXQAWQOEYauFGkQzfNCi9hOA7C+UvYR07GwwkK13wG0T+562sdntyJbMNMCVRtLkCmvZxBRwzH+7lgWpsrT1JUXLqTLn0elfkZ0rbkXGM9+o5d8HYbj/DY/YWxxl5UccK3iPtWkLOPTeYNr8H4HZ5laCk1MF6zH54/73gpbdg3qOJ1NT01T1WO+XPe5AbePaYHisnpY3opa/zthX2JWv8AFL9BCrYshsaqLEOCNlCQK3mNFGuEWL/jZhPnwu/+aHIy5bmKhROGPm4clNCOq5+xYsCArJPKmqPeRBusufLc55JGnOvZRC56v8mbtXRyki70k1heFKiDRLU86I3GjeQGbT2kMybWVpEBgub2WBbb98Vu7l3bympR/snv5EINz/Yc+NJ2znQfL0OzCFzOSXDFsINAuqVrfEfiOO2/tKWjJmjqo33TAXrWpiUbbQNV95tUcZce+eiA==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(107886003)(70206006)(2906002)(921005)(2616005)(36860700001)(110136005)(8936002)(26005)(7636003)(356005)(47076005)(6666004)(336012)(5660300002)(7696005)(70586007)(316002)(4326008)(7416002)(36756003)(83380400001)(86362001)(186003)(426003)(508600001)(8676002)(82310400004)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 07:16:06.4176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8749d9-026c-47e4-ceb0-08d9ae511dd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3971
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for ACPI based device registration so that the driver
can be also enabled through ACPI table.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044..8e47889 100644
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
+	if (handle && acpi_has_method(handle, "_RST"))
+		err = (acpi_evaluate_object(handle, "_RST", NULL, NULL));
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
@@ -1642,10 +1648,25 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->is_vi = true;
 }
 
+static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (has_acpi_companion(i2c_dev->dev))
+		return 0;
+
+	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	if (IS_ERR(i2c_dev->rst))
+		return PTR_ERR(i2c_dev->rst);
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
@@ -1720,7 +1741,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	i2c_dev->hw = device_get_match_data(&pdev->dev);
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
@@ -1746,15 +1767,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
+		return dev_err_probe(i2c_dev->dev, err,
+				      "failed to get reset control\n");
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

