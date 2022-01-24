Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8266E497DC6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 12:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237315AbiAXLTo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 06:19:44 -0500
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com ([40.107.237.72]:23607
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237292AbiAXLTf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 06:19:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeckRxTP6C8i1GSocBfEGxIjtA5IFYdZ5LYVqy42tDjHgbywcopAOfNUdW60wBxVY/lVY5nECnsrOru10YhIFd/vtAAq4bLUWIrCPfSuEH6Bglm34g+YZVubGe42Utn2QSqFmNKhm8IwIaEkTV23V0sTmIJwLCSsnZUb+fX2933O41k3MeHSXlMEaYXFZ7B52UpiHvfyXq+rStVYMrGIS9QfpITRfXZtJ68tmoGFrn9psraQGiNb8bIVbQew6C0zNREV/tiKG0PYLgaydBzmk9v3qhZ1+Zsw3nuOQGUR9XkIaHQ5Js7swigbYvGEsiC5VvOs0Qp6NXNJ7cUQcReiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9otDzfIZn0jaAmsx0x/XX5WOkCKM5484cFIGSiBWmY=;
 b=Gsfm8w2MqnhGvH/Fnrs5sgVLB/dLs9OUToFPRt+pHnZZP1al1F9HaZ/t6ZD72W32TVuwlahK9MnWZQiypGMMiAky68x3BOXkhJ8tbQ5uEiCrKVOqVG/3MEpsdlTllvUbO9vgT1A2ZmMhTXvDcMHFjZk0LAr4InzL4uFAKUjCv9KWCBRsq90+Ln6C3otIy9ZA2e/PgQtj9DsJAb5D5S4fNM2R1IKNlTkdRdnrb5mS+J+v/2gsHGvd919u6TXeJnHVu8irtd+SU9SuAd9EzF6YswSf6B3vfNTjCLiDBmoTJTlFBV23UBTpqKHCTEW8dsYPOiQsOF/FFsVLU38BZVVgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9otDzfIZn0jaAmsx0x/XX5WOkCKM5484cFIGSiBWmY=;
 b=gR08YH9VuFkM3GfIeuCx7aCMWhL8VudhX/v0pCCRsdl7zy1WALcgt03zpjBBw7feIpQpEXZahgsSoYVg9aG4t18FLEPJJu/D7V9W/rDz7Unj/WgUtJgj+xpY30nptQ7+PqQFXt1KtElRPLWW9mqNet/jsej6sf67DVopR/HnwDwnufeTs3DKNIiAkAGplT7Ugk2nz+Mn0LIbvI7mP9G1/YWjKYOTH2KIyyzJuOJyGYeTh+92LB/h2pfgGmGPbdmimixfS08JKH2M/s7fH2ag2hJfSx9eFI0DDoYYQW1ol5/W+OYnZMhbqk1VXTjVDY4B/4pNumpmYU/oGkHMloe2uQ==
Received: from BN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:e4::8)
 by MWHPR12MB1503.namprd12.prod.outlook.com (2603:10b6:301:b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 11:19:32 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::f0) by BN0PR02CA0003.outlook.office365.com
 (2603:10b6:408:e4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Mon, 24 Jan 2022 11:19:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:19:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 24 Jan 2022 11:18:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:18:38 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Mon, 24 Jan 2022 03:18:35 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 1/4] dt-bindings: Add headers for Tegra234 I2C
Date:   Mon, 24 Jan 2022 16:48:14 +0530
Message-ID: <1643023097-5221-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6266a1fd-e0fd-4e7e-7620-08d9df2b6453
X-MS-TrafficTypeDiagnostic: MWHPR12MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB150323BF8511730F87433FF3C05E9@MWHPR12MB1503.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 869Qu0Bdv4hiAIGfoB/C4HvuRm/2u7ljn7y2/F6acn4wr5GgMH/whI0JsyX13vLhCyYGEztMySNPx/cN7nGkoyT5qohIE22RnJZ1s1XCg4vga2OnfU5xglbj+zoI3AODim96cSB/E1iXNATlpL5SC+VmwKRYBh+fvfOEg3pRbe5dNwft5U8y9mVJZOVyhNQ7GmcC0zx7Y9T8ji/6apgdhz0MgupXJ1TM/6M0EI+i5lxy72Hu08Mp+Fe8+RQ3YarEbbsg3QRyEIg5Pa6BYFZZePDqMe93bgxjJPJ85L5H1qoVSrmq0BkX8eZ4isQ+0K6tSU88J5GKQIWdCIOj+NFl6J27KE4rbjIOJq0MDGbrVmBEPlSoV5w8+7xM8tDXRCk14BK2Cop3oDKEqcm9BpO2qeu//rje9JJyJhc5bISNS/BvMcfYDYW9zFEbLWqofYxvZVF+HGEF5tUF6YDEDbFw5W+BB/QxAmCDRzsB4modyzbuZNvmjeYPKwg9/wwDX0MHOYQ5x4678wjByB9tx7ZdvhzPLQ/8wOrK5C0d5E6IhfxcTqDpQNaOrL9zJtS0SSHOwn6htk+uwA3N7KCI+MSbC8Vh2sTaor1CSnzOueIG8g2CsRfb9+g1BRByWSvyiu3Hm9xPImEUyU4SMfqTDiXWLOd5vyfVFxNJqs0EaJ8GiTvdqJhWv+3oiDLr7CLsvLF/P/T832xIXe28AsuYMw2lUTZbRTIcN/FA0WLcdJyN3DarHIR65Ph45jbnTwORz+7kI4ge6gQZ4HsgHiiy7acQBc08/k9mBq3FvvGcF5bKd8QAHyFyfKm4RTi9txWTRroSjaw+SUd/Ogm8lxACFyOcYg7HaisCgkKQajxRk9ZQh3E=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(6666004)(186003)(8676002)(356005)(316002)(508600001)(26005)(107886003)(921005)(81166007)(36860700001)(110136005)(8936002)(5660300002)(86362001)(2906002)(82310400004)(4326008)(70206006)(426003)(2616005)(47076005)(36756003)(70586007)(7696005)(40460700003)(336012)(83380400001)(2101003)(36900700001)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:19:30.7696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6266a1fd-e0fd-4e7e-7620-08d9df2b6453
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1503
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dt-bindings header files for I2C controllers for Tegra234

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 19 ++++++++++++++++++-
 include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 8d7e66e..dc524e6 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -20,6 +20,24 @@
 #define TEGRA234_CLK_EMC			31U
 /** @brief output of gate CLK_ENB_FUSE */
 #define TEGRA234_CLK_FUSE			40U
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
+/** @brief PLLP clk output */
+#define TEGRA234_CLK_PLLP_OUT0			102U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
 #define TEGRA234_CLK_SDMMC4			123U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
@@ -30,5 +48,4 @@
 #define TEGRA234_CLK_PLLC4			237U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
-
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 50e13bc..2963259 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -10,6 +10,14 @@
  * @brief Identifiers for Resets controllable by firmware
  * @{
  */
+#define TEGRA234_RESET_I2C1			24U
+#define TEGRA234_RESET_I2C2			29U
+#define TEGRA234_RESET_I2C3			30U
+#define TEGRA234_RESET_I2C4			31U
+#define TEGRA234_RESET_I2C6			32U
+#define TEGRA234_RESET_I2C7			33U
+#define TEGRA234_RESET_I2C8			34U
+#define TEGRA234_RESET_I2C9			35U
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
 
-- 
2.7.4

