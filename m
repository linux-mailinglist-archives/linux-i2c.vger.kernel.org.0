Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB2F609BB0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiJXHnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiJXHmi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:38 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B31461700;
        Mon, 24 Oct 2022 00:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNAJBZifmR9BLnoCB8yyFLALe97mzzzvgeCR1ABCnJVbbDby64fpdVbiTJ83c8hYxkHSNQo/pb5Xwh0KWP9+xQe+9l2BBkrSedFSLnZVK3nmxWwwyV6jE/sC+8pTxdUICxt+TvazNj2lX4/PTL0G9kwi1PbnVrQ5wbOqM8kCnGHjXtpsl3g086D80IMFzRZ8KnCIHfxi+xYEC6D89wtkh7lJXymCsfxHeQpJkKkYuTKRLC6L9lWDVJrP9e5k1taAI9VB1uwdL+/ZpwIlxSYztUOHc05vroI6b+710CTceR1qtB4cnuTWJDK379hbNZb8AK5a5+Lbm+QdLW7LhbmCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmefAIhrteff9c3Bo+vulsVniD52WdYw8g7cuioIiWQ=;
 b=fOrhd3hAi8KRDt2JVBX8ZmS45B8N4q9oAhFo3cEjoWbGhr0m8p/jn/PIWZ2Lu/Rd1qNjsuwe0cQGNFFQyAA3MLVXrX3hDGvQ1r0ltiEn8sPi6wQsSUDGHjsz4PfJKkUvm3dKWHY9fDNvx9zqofxGn+ZvsBc5y3Q4rwBu1BJePm48mGvtuzAB6xgvP3BCQtSGbP1XtwsxVy6tedVDHvqjT3Qix5GRMqabhTCJs3ECMjMW0+DV0xyX825BkMP8im0cAysF4NKqpKjw5YExA2ZRm/CATP0BbWW3AcU0/3XCnzH+3zUDkv5g0W1E0nvFOQrMmpMe4RclYbBuwkeqLhMq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmefAIhrteff9c3Bo+vulsVniD52WdYw8g7cuioIiWQ=;
 b=C41rC9TBKfCSLvyhIuZiM2ci6vh8B/VH6jL9V6otefSyFVkMQv30XHzEstedNNWVkdyKt7WKjhdwl0gH/eZx32uapj9IiIlE6Me3Pxk1QmGBftm5JAbBPeWjpSxn+Swg4tfwRD3PgYL+S4U45jjaViu0FnnRznKq29dQvPsMJiHSp+wYWUpBE6VCSuHgsSjEIyMzC8LT9Pm4JW/GO69G0uOu07XVUxshsKZKpE0XBGjY5fMtJMdQOmNINK6vIOSuJhX1bkuAKTkRarK0VKFUvz1MTVktPuwOwLK/1r4acx66QpU/2kdQLryaxxcHCc/cSp7o828vTpy4M+R6+vqoXw==
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by BN9PR12MB5241.namprd12.prod.outlook.com (2603:10b6:408:11e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Mon, 24 Oct
 2022 07:42:24 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::3d) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:42:17 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:42:17 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:42:14 -0700
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <kishon@ti.com>, <vkoul@kernel.org>, <p.zabel@pengutronix.de>,
        <balbi@kernel.org>, <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 11/11] usb: gadget: tegra-xudc: Add Tegra234 support
Date:   Mon, 24 Oct 2022 15:41:28 +0800
Message-ID: <20221024074128.1113554-12-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|BN9PR12MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 233c5e8a-88cf-4bd0-8d27-08dab5934a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8quLJfurdqFxvamYy9X7bgGY3AHcUf3BuiXSIJjVCdTrVvFZuEGz3LfwAkeG1FiOf4d8w/mVU6h7rl1NOaa0NrkjCXRqKmxa7eOCit4niQzjO/c/pZFTiXF6/6KKL/xTtHVRbF0mJUJkgborAZ4yiIQeRmoXs90NwbP25ISABRjTE/gwbkpC500VuLRALXXG3qzV8RN0ZCLdOoL0zHHeWiFGSHVQVcQjweWIIPEpkBeljvHtlytL+7m9PSfZFLIcRS6r8/NRoJja/jyB1M/zOnLMKSDFCkCz1ae52Trp6RWaF2vyB9W4v/YWvz3QmToAw/CmKXQlsR0MXhtztlbhkmgd44gdj25L5W5bP3+lgQ+M0XPf+ewaoWMrzaUv9/4aR/ruwCoNvh9rTvIwrhPfL8K+FnsUxjRQIDb0yJ6uo/iH5j9WpCZ0oFO9wqEVloXQO0ZOmz6Ii4o9rnHnl/vTClxVcv4EqTuwssS+hA8l+lBqJq8jLo6Y6lk/bAkB+czpGrAQM/DkXfJ+Z//ui3/2tTUgeaI0e4vdWZb1ADcVfi8dLslD/JB8OG13lrPMdVkVKzqjeeVq1klY846MoKY9FC6si15o/6CeQ7vjVzWwtrtbHUQRFTn1zhQYIwZ0rOafJ97tJDlmqPVbfnmEDN4u3tSNGEu96hNCAfqDjVZ3xKO2hWuOP4YU/VWjGtss3xqrClVi2UUXogZwzR0cey+lrLJrHLeRWZsW5m/6hea4o/9wqsWJYxEqKdpxW5gI2AwIdys8jUnk5byLAH46fh4NIM9ORmTNol4uDBrQB8ION4=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2616005)(40480700001)(2906002)(36756003)(6636002)(1076003)(54906003)(36860700001)(110136005)(336012)(316002)(41300700001)(8936002)(7416002)(70206006)(70586007)(6666004)(921005)(82740400003)(5660300002)(8676002)(86362001)(4326008)(26005)(426003)(478600001)(40460700003)(82310400005)(7696005)(7636003)(186003)(47076005)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:24.0354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233c5e8a-88cf-4bd0-8d27-08dab5934a8a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5241
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

This commit adds support for XUSB device mode controller support on
Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 76919d7570d2..ff697190469b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3660,6 +3660,19 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra234_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3673,6 +3686,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra194-xudc",
 		.data = &tegra194_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra234-xudc",
+		.data = &tegra234_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
-- 
2.25.1

