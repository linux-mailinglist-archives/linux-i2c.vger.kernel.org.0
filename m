Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B2D496C0F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 12:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbiAVLY1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 06:24:27 -0500
Received: from mail-bn8nam11on2089.outbound.protection.outlook.com ([40.107.236.89]:25568
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229847AbiAVLY0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Jan 2022 06:24:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GECSz7wM9swIdgnKZXkMsN/u3bQ+NKJmRbd81tzN0zClHDljme87vFMP2ZrRqiu1OPmiLigb4IS/iBvtsxWLoNHSXi6z3GqdUpVM8rYxk6waIvOpmriU2Iollzi6nigxRDq8wnZ6Oh7VIFU422BArvwGdVLwXlStSOihFYph8iylZ2ZqMFsx3WHEhJnGqZ7aG6UBNRrZZ2IJcI/IdKirq+B8EGfJnwRAp5CD+WfB68tPRtl1+QN7k+u2n2Ql8pQk9hPw6lU0tX5IQuLZEJfhyoSy1L6kdWLrLFV/1oL0tU+M8VxX2VAGmYC2rxoapG8iSIWif9CAPPHqz5Cq/WQtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg6w8LYztz35t2VQryVFhIjPDsylp/UQrjrj01I3MZQ=;
 b=EzMuk/ekUFOgbzZ2ztTM8NLTvOQUCT5bhDp8db2sid/cqUBldPOBWs2+Da94DUo/VBhgfTfwnJcoYn4IG6SFSHahcfnliTsm4m3vN7Yeb7YtXtgFtU3fkS+OY2KAfEFegApN96QryjX81KVgJnTRd+mEpKRYF4Ar2YJ7AnP+h3t7Om8r9nDn32QJ5a5fFXtVJwfAVYFKp+4Vaw4aiYfM17UUCKKhqUnmfUj2u5NOFMVqYN0vU5/HPqbU0M53iCy8RftfcXz22EeRQ8Hub/6jLFYfm9uZ/bysgQwQ2H3gwEzixngfYSiW1X6gqtjhZ6oKP8xiGseoL52PiPJtCMUjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg6w8LYztz35t2VQryVFhIjPDsylp/UQrjrj01I3MZQ=;
 b=YTHPpumIxC0VcOQpwTwhWNWXkedFMh59KTdm7wj2ldKMt1KPd58xgRvtsHVrDXlopUdFbV+4hHYbVpoD1DEruhPftH/5OQ+xV0uDRl99FnTUuA4U8CSPDfIJKo9HRAJz0W+qyTn+EybXWrPmFL+JMQjuzwO+a73T8ZrLTIQ6lUavh0k998k9cmZlcGCQ9RghFscKGjqMinKPDFIakRLyoGOLJ5J9bv65Vk69C83cbeYfCrjoubLU0xQnW0CJPq5N2Yk0sDh0m9AS6jnz8d57HZz7QoDD0j94pdSNy+WOgZ/uQr9Yey7BOIvHHux5oWGbbZxVjPDxrJb4Kf1LZvyiZg==
Received: from MWHPR14CA0044.namprd14.prod.outlook.com (2603:10b6:300:12b::30)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Sat, 22 Jan
 2022 11:24:24 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:12b:cafe::be) by MWHPR14CA0044.outlook.office365.com
 (2603:10b6:300:12b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Sat, 22 Jan 2022 11:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Sat, 22 Jan 2022 11:24:23 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 22 Jan 2022 11:24:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9;
 Sat, 22 Jan 2022 03:24:22 -0800
Received: from kyarlagadda-linux.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Sat, 22 Jan 2022 03:24:19 -0800
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <devicetree@vger.kernel.org>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 1/4] dt-bindings: Add headers for Tegra234 I2C
Date:   Sat, 22 Jan 2022 16:53:24 +0530
Message-ID: <1642850607-20664-2-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f13cda8-c4d7-4149-3b62-08d9dd99be08
X-MS-TrafficTypeDiagnostic: BY5PR12MB4244:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB424421CE293ACB4AC1A156EBC05C9@BY5PR12MB4244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfL5c121iUji5f8obuBbdscSb987g8QAZ3RgAABNFXyippvMTSFlgYztOpO37oq4QX7PpOe8APokghUdEVAdu6iKLC1i1zqV/rqQPKq61UGnphYEYuUXcr0uTwAoDtH7RZChOa0p6Q8DJJ4oGF84LszHradvrNUcmeBPLaZTnj0PQc5X1CK4CGtniS7vlMIIlgWFOZesch0+9DotkaHrvMI3nvxp1kaISEPQsMIu3ufNZbRAbM4ir5CZxUPBG0Wz2mzczU3ysZZpTUtR5lcuCzrXqEfHpCH/3szP0EvorQsaIEOef7Y0HYL5QxI5Zpl/SCYal4KzeH0J7T7gUwxy6T0vYiDuv4UnV29Ipv3ir5BB1dNl0bFX43ZsQurH+Wrvw3Sr7u8CfTMY2drUok7+soPS3+3Evn+yvlGnczY65/Nd60TMs+x2rffEVv1my2vySOKfiW+x7kUNNjJDIll0gjLCg0OtP4MEY6D4rxJkgPKRsDb+yIEp0l95I4E9PpZVo+KEbMZGrnhded3f1X+VjxsNHVJzvcOUk2naqqyO6yW5TtI8IJMT2q8HIKgInZqbo5NBs3uKcJc/TZoklm3op1TYm3F6OWEard0m36CDEf53TFcuNUW0oD+Zyvnmq/ZnKHNR/n/DXnyTbDjiCvGlW688vg+SnfL8ct2iJdR6InI24x4lUgWB5lnzvkKXAHvCSQUfaKrYCciJTdA1rxUNVnCrYDHusdtOl0Pd3jjGAZWD/23NRhAkgaIJc4U5B2ONpAouGiqVJ61E/1w3a2BLQwpDuxHwomov+hQnb3YAAovCwJ1CTso2Qyb7IZSjsoEEzXAmqSHJqD4YznNfPJkpGCpaOEy+LbtmzxvhoHHCD58=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(107886003)(2906002)(5660300002)(86362001)(8936002)(40460700003)(921005)(508600001)(26005)(70586007)(186003)(316002)(70206006)(7696005)(426003)(36756003)(356005)(47076005)(83380400001)(8676002)(110136005)(4326008)(2616005)(81166007)(336012)(6666004)(82310400004)(36860700001)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 11:24:23.6487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f13cda8-c4d7-4149-3b62-08d9dd99be08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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

