Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B127497DC1
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 12:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbiAXLS7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 06:18:59 -0500
Received: from mail-bn8nam11on2074.outbound.protection.outlook.com ([40.107.236.74]:31329
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237227AbiAXLS6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Jan 2022 06:18:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1FbQxhFREhVNnls6W1Lf5hiqmJMsVb4kqgVG5l8kIBu9fUqj1wOTg+oR222gMpXeaJ1IHfcPrz7CNCsrZ7nCT+mMnIFA4hNYWfQGmHaBpstFs8gHOrG2JgZy/287K7KFrf2RrnyalhzKN3k2GvM/Vx8eI4Q1tHLywv0FBuMpjVA2VG2kzcl2BMYBNFGTkckNeqNUcLQSn/QQjriC9RDJfmAoR4W3R8tEpbV0Affo+6c8AdjZSIYDqnOueQmwnjbJ2XhlhmGF+ZZafte40QMMgmPCdWn9o55XRkIdyPx17IurX0N9qfMeXM0+Lqxb5aLUzHQdYvvVR9TONNFw4nJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56aoCOKSJqFkN3jl2cFmUspsOzHKqeq42hwal3JyLso=;
 b=j87TXEoLsfL0vDmHXzD+fXmtpHBpwqTQ635NWGTrf7h5+Ws0HOFCzRIo/cH3A48bt59P38EbrrvXmea1elziN3JmYveiixphn5/7TV1apmiXy8/gDcxYNcsxknuUzkkg2PL2uym8HywopQIw8CXwqXnVXGGOO1m6gUF5SlaYrKXB737h9oH6UJ9/wnGiexyVqJ1n12X5M31CVVnrKwotOE18PMwiciO8vH0Vj3vTH3FJxOHqppOj/dNLVBufVX4tkinTHecijWan+lmZDGaurBoCOk89Wzh6BRhQ4ZWfpIZvaVGFYWle1BKeFoyImqBbe1P6oCem7UpqfA3JazE71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56aoCOKSJqFkN3jl2cFmUspsOzHKqeq42hwal3JyLso=;
 b=Tc5pKKCTIjV/kMstQiiCLYZQCZzse7VvOHzzuH2uYcicIQiQnAo19NbzruvZb3iEizOckLIhsO9KK/UKBtQb+tDY8k7/Zx7Jl5yb6hKuLjV+o7rA01MT8YKm+FZrg+YBXb++7nVl3rECUtGHeVbv1e9iCb2rFLuxgc4v/SyolFInvUKX/LIMLVwzJEM8Wz9mhM9j1DlGw9DvhBF91H7nN4E2Nkp2orgysZCLE+w5dH8J94pQwIeeGGlkFyGXkCucJe0I2Kr+TX31T/xJwWyW/AWcTxeTu3Xz6JOSqegSr09f0cYYikZ40wicV857YRm6zWVATOjP4qsBsg9G4ia2lw==
Received: from BN9P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::26)
 by DM4PR12MB5341.namprd12.prod.outlook.com (2603:10b6:5:39e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Mon, 24 Jan
 2022 11:18:56 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::f) by BN9P223CA0021.outlook.office365.com
 (2603:10b6:408:10b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Mon, 24 Jan 2022 11:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 11:18:55 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 24 Jan 2022 11:18:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Mon, 24 Jan 2022 03:18:54 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Mon, 24 Jan 2022 03:18:51 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v3 3/4] dt-bindings: Add headers for Tegra234 PWM
Date:   Mon, 24 Jan 2022 16:48:16 +0530
Message-ID: <1643023097-5221-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f05855-f5d2-4958-9470-08d9df2b4f75
X-MS-TrafficTypeDiagnostic: DM4PR12MB5341:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB53415C9759457F4CF9477B47C05E9@DM4PR12MB5341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GloJBXbCf6/8MkEMloNt5FkRJsSl+8JX8WMeNCwcJMp+dWVSRel0P6RwVf8o1SeMGFnOTBUWIaFEy6ewkwXFV9vA0yaNA+U6sHZre7Zcj2pOjB928tiLRUuF7jviOcBb7QR+TRPiAumb8qtU+veK8iGklBVgVkPl/nJYfaBP+B2f2Q3vaPBzI1+O+xwv/U2UNfJiPep7DcXXed+Tvcut+cOoR8eA6XwwJbk1VsRDqetpwZ76TsOv2sJNKAewWcoYIYT3ZwxVWQJoHf6NzXw2uSInOMJBByowW6TOO4frExNj+rWbmOykEjvSbUjTYLa5YZITW1+k497wyLEJ5fQqOXt6tp7HeNSIxiW1gSIuK4gu8ng1noQpM5XqqTWFF4E2sNwx0waEezYcissFpQc/VtXGhblJNN5ZGcb/AkBf0VKrw0mOHTOnkTvfUVNPFxGk5FZZJ/hbeU+IHNio1VCIN5s57pK87clTmDpv/h9mBccXAi4yrxveiXhhfkM6wBEOKZSzleIEC35V9NC+sAaG9p5FH6Fvzex0zvJ6/CTZuHdGbzlP40e/5MGAH2NaOYVcIlG+RmBgV71xUZORZSHYsgFyYpZRXvFtZ7wKVqDxu0uyvggRPWDJrAjWRoExG9vppipJ/G3yz8+lc+MHR8F9TAMLXU48qAXB/urSmBavLRdeps9kbaGTlPPvvOPq8kRGezOtNVnYu4T6nSBOLifcxxwKNm2Q9XkIHHkhNfff8ldli9uo6fSLyaiSONnQmvla99F9yrj6dsAzxQ9XPYqavyf13gRtjByKWK62XUebt+5Nh22FZON3PdR6ZHL0R9ewmJqvV5gqAQYdqGaEuoK/yROSdjpzrCGWDvqygKU+D3g=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(47076005)(508600001)(86362001)(36756003)(356005)(83380400001)(4326008)(426003)(5660300002)(107886003)(26005)(921005)(186003)(316002)(36860700001)(70206006)(81166007)(82310400004)(2616005)(6666004)(110136005)(8936002)(2906002)(336012)(8676002)(70586007)(7696005)(40460700003)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 11:18:55.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f05855-f5d2-4958-9470-08d9df2b4f75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5341
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add dt-bindings header files for PWM of Tegra234

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 16 ++++++++++++++++
 include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index dc524e6..2529e7e 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -38,6 +38,22 @@
 #define TEGRA234_CLK_I2C9			55U
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
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
 #define TEGRA234_CLK_SDMMC4			123U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 2963259..ba390b8 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -18,6 +18,14 @@
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
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
 
-- 
2.7.4

