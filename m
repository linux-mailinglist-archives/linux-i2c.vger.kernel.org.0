Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE03496C18
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbiAVLYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:24:45 -0500
Received: from mail-mw2nam10on2088.outbound.protection.outlook.com ([40.107.94.88]:8352
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234338AbiAVLYo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:24:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ/ssGFMTtARzE3mt2EmXoKI/IOyNp1KFLTkAktauESynN9exbTQmXon1kHL66cnoBn9QX6NL7mX6EBEBJJId8bsZzGA0rWTOa6QJEn6E1m/bAgyCsWS9jf4fthC9ICMVUuVPMTwn4C3s1b1uKQWNTdKRVkj5B8ew8troGIGzgvHkoNKVQ2rJ2HQF0jX4RYlBD8S/p7sPxkX+f0go23uyzIQ6jfpbH59LyL8xBwMyO7IM1nUAE4H+wqMFcQAS6Sa/z6x+B3ateexYLEcXrdJfxJg49INxgnSLQQw3efbH9V5tRe1n/6iUGGGMQfo8YeJxPKCt6385yIPLbCzLKLkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTRY+N+h6jPeGVVjsR0hgOA4Kl+WMDk9jw/j4L/LoLk=;
 b=lXmq1NowPOuE1fd7NJY/eybl3ijKsrUQzL0DnAuKyYKQVJT8Bg52hnZDy6cDxLRqyrWV3awVSH0I0IqTaGfDy+EBSEUyAVssYZ0IH/F0hUx5yLkYLXBsuH937GKwljvVAHm6R+4BpQudmH1uVJhmxAtogTA2ei4TSa0ca9fn9Jv3W7XM23qrbvZ+LHerrqKOEpcqFzhcqvMSNQaI9Lk2s25LCai1Nh5EHHimpuHXoDVckwbKB4yguqVMBSysikCsmAuCp08/oPonmTzJxTOZyYwGBIfmhXz2hHo9bAhWhpScLi+U51B1aUyx8edrb/Kfjuy1+BshW0rkdpWYWU6meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTRY+N+h6jPeGVVjsR0hgOA4Kl+WMDk9jw/j4L/LoLk=;
 b=E+ojHJ82cKgFDUkLMnjBo19NMki5q5KEpXJAWVw8gnQ5/5D+S7hgcahk4UIfvouMZ2fWl6NAxSxMetRBc9RU1EhaaJDfoPcFdaLd7rZo4oNNWPWcv45yp3CSKMsgNfrWPpt8O/dIkSyemdZJZt8yI2e5SOBNYPuV8ho5GBQRVXFrx6XPXPZ+R228Pp3ymIAeqV/Vat6y5n3cL2+BGjnLBp4UoXmEO/4eXsrNiPMOgLMd3egXA61VlybWcd+sP+vw35fNvyQ+h0YvWGbFloDzTJMoWF90yJU2qzYSXpRCXlUPkMtzFdBzcR8kEXX5NRWh8IuG3RfPEdEp9MAB1qnYOg==
Received: from MWHPR01CA0025.prod.exchangelabs.com (2603:10b6:300:101::11) by
 MN2PR12MB3246.namprd12.prod.outlook.com (2603:10b6:208:af::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.13; Sat, 22 Jan 2022 11:24:42 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::d2) by MWHPR01CA0025.outlook.office365.com
 (2603:10b6:300:101::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Sat, 22 Jan 2022 11:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:24:41 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:24:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:24:40 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:24:37 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 3/4] dt-bindings: Add headers for Tegra234 PWM
Date:   Sat, 22 Jan 2022 16:53:26 +0530
Message-ID: <1642850607-20664-4-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78f82fc8-45fa-46cd-522c-08d9dd99c88a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3246:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB32460ED707E1B81324658D1BC05C9@MN2PR12MB3246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtZLbekLkiiV7GewUAC3t+88Ig7KznTTk+kMBJ7ErOsREq+e0xfC/ZgZPQNkOGAx0m5wKWTCvW5OIa3ar6A1R5EMgxmt5HjlGFHf29t1/+HRjawZLIfO3A0v0YPSBGgOjYTZ+4GKLIfxSdIVJilWXsfq43sC8dizBKe1pXCOmY/V3Semi7LfPrrJH45qYCDjrEJB7NbcsquP5xrwp5Y7y/JSMytt8bniUqUFgQPhcHMLw+CZXlzoJfiQ4kyreOgCBcsiBssD7UovhSvz4DAwUHJNgWpTIv48j6mj96woPUBeepBz9/H26exSeaIY2pvwfsV3QY9GOoCYMv3l47NrbHuUlIksZDl6CsrPIq0dip/CupwTDlvSWHwe7Muf6XNCzbQSNZ0vEVVnOUht6Cpp6SVxhcppvRDvi2IIxfi45X3+YBfHld86p9L+mPfPd84ljb6vqbRI3udz+h6sX+eInZhMxquG9kQxF9Iw1wOFBU9gMFOISlU5OLbPLo12pIypUOgpb6TlugVg9YcxKZE6C++HfrfmK4BnLHm2rfjkXjcb+FrOg2wIQHCcjxB2NlbK2DaB7lu71lR2p5kBfpK+PfzblsFWx3fPtoMM7AHFA+yKYDJ2eMOPzWKhKnmzyFVbMm15LnsilaMHzNnDjO0wY67PF1m32qXyFl0mOa3c7qvwNrQDL3F3owYyYhaRDxC+f4yRDSAkwPQ19NGUi1MiBCFPBkdPT1ygV9qg1bpwMd0+ZKh9EDxlz1B37Jwo99JwUa9ZCxLIflvXEMHfi5tY4yaQF+T3JClhxMgggTRLv6uocc+tqHBIGEbehy5A3fQKbha2WQwN52gROziEqV6kC9+7bqizkvhbVDkU0ktQrJ0=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(40470700004)(46966006)(36840700001)(40460700003)(336012)(36860700001)(70206006)(4326008)(70586007)(8936002)(508600001)(107886003)(36756003)(8676002)(86362001)(186003)(81166007)(5660300002)(26005)(83380400001)(2906002)(2616005)(356005)(921005)(47076005)(82310400004)(6666004)(7696005)(110136005)(426003)(316002)(36900700001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:24:41.2628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f82fc8-45fa-46cd-522c-08d9dd99c88a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3246
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

