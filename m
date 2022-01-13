Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7457C48D8EE
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbiAMNbS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:18 -0500
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com ([40.107.244.41]:11745
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235190AbiAMNbS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp1e9DupeAkVn7jVlj0935x93CaeqZVUoYADygP9iPdP+K/NCqbgfqGQhClV/N6FDwuO9MhmeI3nVXjiJiONfoPoTrUfoUG3rQI/CvHw0cL1PMy4NuRRSPEPwW9LqVgr3VWItVG/NsVekUM31+HYn0TGW/U651dtnfX4EfHRAmnpu65UMH1sHxvPv4zrSEfweZEPszdhXm2QMP/PqNRrT8+859tr8++Zp1nyvXOc/xGpcoc7s6iy+IHfkLwl17+hoW9i9wIyliRycXAcBuIZeby+WCrsALCxbBlfrxYHmw7Mf0zKHn663XRK4sRV8/I+kddZuUYc3AVRr+6oQl1jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg6w8LYztz35t2VQryVFhIjPDsylp/UQrjrj01I3MZQ=;
 b=PUwdfzGkOFRF824UxXv5MJKq8QXfUoqv9673ZiIrCaG2D7TJFR2q2qBjjgLY6hd+8ITZmMVuKXB//TCVZ/z9YYTrmjRbP/puUd/z1gE+omvCooXNx6UKmBov2cZmsyCmPHcyVwIlr6/Xao6br3SVHeDzB/L2y8LdYSgrCRQzMlNBaSOlicIv+eUKx6S94mhB5MHIgmUXeqGb0IC33ZQIuSNeyKOhLoAWtxZBlnbQ0rMebAZtkUnlOgHEk5Mq4c22vz401hWtYnQSvimowEh6tzMECYr8RYKC78pmRaYNxD4w5yHeNxPmTL5RudFUwfAvfrZzX1jB2LFLG/mL20KBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg6w8LYztz35t2VQryVFhIjPDsylp/UQrjrj01I3MZQ=;
 b=qcW6uTPrgBPNJs3ILoUOaB0vZX5Gz3tqbhGwep/fkuEG9FLfkbZeoMVpDVCdas+CgckgGCIKGXZ2yOTsV7cDOOthB5pNW4VGEnXVAUtEn2i3HsKXOHxUbOZe18JzXE8nciHvcsg9r1hrVZ7ASWFEqIq/XR5xExRcY5eLOdCnGi5tmdZRrtm9IAhL1a0AsTlr2UYAnMrAG28rPca+FsKiC1hgATJb/KweJq5osGMd2+o2H7fX0A4ipDs+yx9hetr9jO2fNhqRR50+EY2z6YdDB87e4cfrPpCJoc/sJpy8BBozp64y7w6k4RV1DWBOsGSZLMMspD+kGTnzxeICFDj78w==
Received: from BN7PR06CA0070.namprd06.prod.outlook.com (2603:10b6:408:34::47)
 by BN8PR12MB4594.namprd12.prod.outlook.com (2603:10b6:408:a2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:31:16 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::1e) by BN7PR06CA0070.outlook.office365.com
 (2603:10b6:408:34::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:16 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:14 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:14 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:11 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 3/6] dt-bindings: Add headers for Tegra234 I2C
Date:   Thu, 13 Jan 2022 19:00:20 +0530
Message-ID: <1642080623-15980-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72283cc4-5b8d-445e-4426-08d9d698f9ae
X-MS-TrafficTypeDiagnostic: BN8PR12MB4594:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB45946A6799D990B3632334FAC0539@BN8PR12MB4594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omCGQ5TxdsfxqAW69y4KqTyBrEPl2F62r7DwIm/LdMSJARe7IefipgyBp9rbhN+eZsb5DsAXaW3GKh84SwGMqZiic40eUwvMkactaCIhZO74YToshrC3Rz2g4cgkExF8pWscC4oTkw/BT4oT3dqfNUlncaN2JzhtDAbhQas2NwNaPPnhErV5n8HQY1XQ85jO+c7Gciu90vENm3hddLonoixHbdR6tCx3JJrW2i/ZegUhEjSoqrn1xKgtYM0uts0tlDxy5mrFE4FVKeTe/NwWJ8DMAIaX9jNWp3egGXxJuaNem8ap2sS00WMASu/c9Jb7h69mMZfQoIopGF6rFA9yueK+1vhU6nSciyzj9GQOLjmyS3mv/TJiA5OWoSCM0PIEeVGXmcpL1Jf6VeAHuQZ4cTcDZCVHq/6rolIlkRmQWVOwCgiwRLMSVwp5gS88FimRBeBEot4TV61u4xR76WCOBjFpaWRpMB2tcXgFeAwcmFjqtYhOx9MQXfby/HYiTYu0f+8HoR/XOFbgfRLXv+6VzdRcyqZfsx5u9TdRplvGBi5JBXPZH9MXOb/PXXrHrlWJlBRCjF8/O3aGseLnLi3COknGB1lL3LYwjDD8+PHVLLO/dGF5Dpm5h6s/0l6ij19aTwzIY/gRc/7c2RAjKcjFZCGtLUW0w5DMQdBtRDT5DA5gyV01uj7tX3SFayOXSWJy5L3UStEwb1hW5mPiCZ69wCyLwea7kyaGIfeQ70UiRuPRs3SJrwlWZG42FKrduI+b22RNoLBYjLBDgfhJiXwI/MS0OyzmMVER68IVTFdm5DZDamvPQIOM8lAoU1dUE8zS
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(40460700001)(5660300002)(70206006)(2616005)(36756003)(426003)(86362001)(82310400004)(7696005)(36860700001)(6666004)(47076005)(2906002)(921005)(8676002)(107886003)(83380400001)(336012)(316002)(4326008)(70586007)(186003)(26005)(110136005)(508600001)(356005)(81166007)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:16.0237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72283cc4-5b8d-445e-4426-08d9d698f9ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4594
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dt-bindings header files for I2C controllers for Tegra234

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 19 +++++++++++++++++++
 include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 8d7e66e..5d05c19 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -30,5 +30,24 @@
 #define TEGRA234_CLK_PLLC4			237U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
+#define TEGRA234_CLK_I2C1			48U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C2 */
+#define TEGRA234_CLK_I2C2			49U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C3 */
+#define TEGRA234_CLK_I2C3			50U
+/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C4 */
+#define TEGRA234_CLK_I2C4			51U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C6 */
+#define TEGRA234_CLK_I2C6			52U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C7 */
+#define TEGRA234_CLK_I2C7			53U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C8 */
+#define TEGRA234_CLK_I2C8			54U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C9 */
+#define TEGRA234_CLK_I2C9			55U
+
+/** @brief PLLP clk output */
+#define TEGRA234_CLK_PLLP_OUT0			102U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 50e13bc..e07e898 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -12,6 +12,14 @@
  */
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
+#define TEGRA234_RESET_I2C1			24U
+#define TEGRA234_RESET_I2C2			29U
+#define TEGRA234_RESET_I2C3			30U
+#define TEGRA234_RESET_I2C4			31U
+#define TEGRA234_RESET_I2C6			32U
+#define TEGRA234_RESET_I2C7			33U
+#define TEGRA234_RESET_I2C8			34U
+#define TEGRA234_RESET_I2C9			35U
 
 /** @} */
 
-- 
2.7.4

