Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D5648D8FD
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 14:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbiAMNbg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 08:31:36 -0500
Received: from mail-bn8nam11on2086.outbound.protection.outlook.com ([40.107.236.86]:13409
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235255AbiAMNbb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jan 2022 08:31:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPw8JuiMsqssOcZhJWQai3L5Xys9z5vNEhtj25pPhpYbV5WJLLIGO+XQdKF7l8/6Jn9nmdFaYAHrHBmjtkvt1+elQpLi5v2z2mOl8FK/qKvjTiC8qpQOXFF6clzl6gNn0+tEjaR7fl5+MqMM2jGpg2nt7CXy7kghzlWSTwBxpHQb+U45RuHQae5Btm7OJdBjGKBd5ulZ95lLFTziTJ9kJx9iAQJq2pDKsu5NtvZGleSZ6pYmi4UmU9OPla8PGYOsdTUayfYElurJOtGq6hWDmdJlqSnoSkoo1UCEz+Iu0KYmw9kQ7YHowB0dQvIqlaJLGTnwpAKMCdI0sjytgCt4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTRY+N+h6jPeGVVjsR0hgOA4Kl+WMDk9jw/j4L/LoLk=;
 b=RlF1anmjBG3HpLaCtvLEK5wl3L7nLh2IR3PtOvm1wHc3oMwrGApiY8r8rw4GmFVmPJotnLttbXgodZTuY/0bsCZE7+3U9HcVqoXrbBluQ6lGOPxPU5dkLq6C8MxZn8n/Ufvfe3AZXHd4Dc963uXInGRhYkJzGPuHEnneICCiLQxVKR3oBtA663e8S5otFbXFC4Y8DJKub2eS5Ky1ufSVbYCSYe/xhUJRhERu4KqLApmtu0F1/hLvFScjul63Fwg8fg5LFyXo3GVzBVjvb6HoSDiYyODxtZOeKQ+zhaxT6M4HoOmmMiDLnsiIDNSxJSOHky1rO7NrnQBOfxKUdBSYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTRY+N+h6jPeGVVjsR0hgOA4Kl+WMDk9jw/j4L/LoLk=;
 b=HuAZUbfQ2BADfQ4YqgY1DoMDh/iwuIYnhETQ8+XQTSWsCqm1hBirSXieVVZtXRU71kXEh7o0oK3ffr1AVeVp7a5p5tfzmExIyNg++bIZDMV2u+5eo7SBh/we41Fv1KuFquosvD81hFaU7WzcJXbF5iwkuBzhgTzRpF9raJvN/zyLJEfhslLCuKRT2t880Jg4uuc5eyXd/LVI3ofo4dx3Do/TWsVdsZflzK1Y6KTzzBHbarcwShZx2NXplAcB2WdN+KfuLbDxm7Ss6QgjK3d/M/GmgD9KJEx/OvQkGYAewjg+QUdNsg+hNcz98xA6SikfntSdOk7uXTqjGzvqOAFrAQ==
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by MN2PR12MB3263.namprd12.prod.outlook.com (2603:10b6:208:ab::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:31:28 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::4e) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 13:31:28 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:26 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 13:31:26 +0000
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 13:31:23 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>,
        <ldewangan@nvidia.com>, <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH 5/6] dt-bindings: Add headers for Tegra234 PWM
Date:   Thu, 13 Jan 2022 19:00:22 +0530
Message-ID: <1642080623-15980-6-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 580043cd-26b2-4672-f4ee-08d9d699012e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3263:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3263647506AF9059188260BCC0539@MN2PR12MB3263.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5WDpv0/Y7obn8+XGcZg/ndTH1VxXUAQD0LUTqsQfLTfjb/+mitYT04z+cMu+BLeaqni/+parWxAgspZYKHDlTzMh8XfeA/mMNa8kaCgplc1OzYqlmUuxBqDqoPiOiK35fz6l0FbNbxZIA6B6b0qxv1ucXPYmiGAMvYjwCKxL5oORti3sCJag7XLSW+56fUK7b9n12LRYLZf3n/ZUTekjlE55dunT5cKenASV2Ne3yg5SmGbNgq/fDxcMeM3SOfzLQto6mckQvtLFsIoX0WNiOZvgJ+GDpJVc1k9UpIYtsFlNJxjxlhERgT+l6HI5aoZ///Fqm4ApDCvdIoIqnTQ6/0/MnWxBSqadG2ls8klpb18xjUY50+EiSQ2cbTs6/Gl2sgWSeCxZO5hsH4ZVL5Iac2MCfINbeJQ21I+Gwp85LG2BpX44mHNwyFpIw0MtSVsrDDpPACk1R/lsIjPctn6hgdTySjzOKAyVQDMU4IElJdx4cODgFyCys1iZjsVy7akjNXjP9LIPjnPvaLtGTvQJcMyhO3yIdOOxfERM5MOOAT9W786XsfKpQmOKlYmmp4E+Tr5m8xesCsSH86amBpuZEwTeNGf+jp2X06xuIbcBbAmVaNg23FKKViMCnguwQGMeEAl2rciVusANhbk0MSV8fGMhncdbNI7UvCsk5v18zpwmmLoXR8SwgcLhO3x6dMlHz3Lysy28KswjS3EMa9fBZNHwg/yCftVEmrXpFEPt74R3Hc8BPY9FH19qY7QnMbpinaOPDiYjCekscv0qPDlrqKVZ+hJlDIe8XBe+Tnk5cNL21DE/sV9w5JI6KiVdEaF
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(47076005)(426003)(186003)(81166007)(356005)(83380400001)(921005)(2616005)(508600001)(8676002)(7696005)(5660300002)(26005)(70586007)(70206006)(316002)(110136005)(8936002)(336012)(36756003)(36860700001)(40460700001)(82310400004)(2906002)(107886003)(86362001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:31:28.6112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 580043cd-26b2-4672-f4ee-08d9d699012e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3263
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dt-bindings header files for PWM of Tegra234

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 17 +++++++++++++++++
 include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 5d05c19..9d17309 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -50,4 +50,21 @@
 /** @brief PLLP clk output */
 #define TEGRA234_CLK_PLLP_OUT0			102U
 
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM1 */
+#define TEGRA234_CLK_PWM1			105U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM2 */
+#define TEGRA234_CLK_PWM2			106U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM3 */
+#define TEGRA234_CLK_PWM3			107U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM4 */
+#define TEGRA234_CLK_PWM4			108U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM5 */
+#define TEGRA234_CLK_PWM5			109U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM6 */
+#define TEGRA234_CLK_PWM6			110U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM7 */
+#define TEGRA234_CLK_PWM7			111U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM8 */
+#define TEGRA234_CLK_PWM8			112U
+
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index e07e898..288524f 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -20,6 +20,14 @@
 #define TEGRA234_RESET_I2C7			33U
 #define TEGRA234_RESET_I2C8			34U
 #define TEGRA234_RESET_I2C9			35U
+#define TEGRA234_RESET_PWM1			68U
+#define TEGRA234_RESET_PWM2			69U
+#define TEGRA234_RESET_PWM3			70U
+#define TEGRA234_RESET_PWM4			71U
+#define TEGRA234_RESET_PWM5			72U
+#define TEGRA234_RESET_PWM6			73U
+#define TEGRA234_RESET_PWM7			74U
+#define TEGRA234_RESET_PWM8			75U
 
 /** @} */
 
-- 
2.7.4

