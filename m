Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718396257F5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbiKKKRT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbiKKKQ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:59 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0850D742F5;
        Fri, 11 Nov 2022 02:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6OCI14v7wX6IcdhfiqBvevRc0vDEpe7C8UhS4Qqhcwd2Jun5xm5l/AKaZifVz+YcIvaSN23OVL86Z1678ttYA4ZrGmCpBafPquzzkpbrZwUeOTXiebYUV/MH+ncjmHAZnbOMdL+jB5B69fP0aOJjOS9PRcGL+q6bj0VWxETWseAv4AF6MgAQ9rtsFBJFXyYRLEtKUNyGFl5EvmlNMgX/lOkaeCCCbpQAN71gZdOb9S24p978A6ykqTlyOsHbR+CpICxyAwQDa07dr/WMeqPmwUj1lkZZSPf3DhQmbszLxB7AJDDnPVAcrmOKo7REUt9W3fkEHOebMqiV8hrL54R0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJargNSXfW7QRE1/1dEp9jA9DYhmUchTKoXMao3tsQU=;
 b=VK+ZVTmYbXL7ay3aJQeAiUFSTFR/l1JP6/QD0VVpqN9zKnPZpwa0v2PtY5YMfIXHN1nkBt4Y3t8huLSfLKl00+fKmnze6B2zguEhMviwYb4F4eqUZJaIrgSdp7wDYMWBiOxMmxI6drjOq5dUuZ1vcahuMjiQ3aJjbUS8iNkIcGd3xc8Z+7iHohnJ3HpEi5tEL8Vs9yp8JXI3hoswkSNby2Nt/H1f9YYQC0PFbIaUtoJx+d8mzvKo4Yv4twnkjKoMx6BIo+1rH6X5udzY5jZeklWg2EjrO5SGCa0k3tZ0yE/WqMbgJd3euy/nDwHmIbm+Xd13GUZPrlQlS7BTdGbR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJargNSXfW7QRE1/1dEp9jA9DYhmUchTKoXMao3tsQU=;
 b=MeRo+KZqOHgUbMPVYjzf2oZp0FtbhzcK5SMM2Q+5k1TsveputBGI5ZjbLUp1GlZJZmzd4R+CTmFJ6oZHXAwRb2Y0ZZHAt333Kaa+9T5NlF/F7RNbuERDz4xvRgG0YLRx7rppbFT6IMxmUSPXjtk02+EWzXlr96z9ypHUUZ7Efm/6tckgVYqkykpHxoB3Ry4TZGWF7GgFupA1PqEDVjmiHB6VTXWmD/8EJsBeBP+tsDcFmiiSnOWU5A+VrwNz9wA9iOcxkMDfDONLoKuobbHc5bZnpw0fDvfjt9GpJ+tbRj1+QKCZhXbLSOr6j+Q6gOFwHZ9XgBYTqEJBPxC8xbW9Wg==
Received: from MN2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:208:a8::24)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:52 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::a7) by MN2PR12CA0011.outlook.office365.com
 (2603:10b6:208:a8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:37 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:37 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:33 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 13/13] usb: gadget: tegra-xudc: Add Tegra234 support
Date:   Fri, 11 Nov 2022 18:15:09 +0800
Message-ID: <20221111101509.999589-14-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|BL1PR12MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: c8527019-35b7-4fd4-4b2f-08dac3cdda0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2aO9h5yqQF6bx/8L1lHqDc7OMlcJmtF8ffPsFwNjovHToZ55qKlHRFx/2UjniZB5ny4HvOJ4zkwT9E9nURPdHL+SpclwY3LIWlDlPqdwxq2u6WRi307cb/Xkl26O8DRSaUykSbMAplNP1xHsgr7hZ4dhbJ+gADIr9wKVp32k+PwBsgn8fVWoJ2kmnxU7yM5H4wW7xYt424kXiw7lXFD8o/X/SkFy8xzGlolFQjXo/3USiwnUNK62+UNBER1xCgiXjLCILiWJJ5rjebtOgKm816erOvP10Ua0uD4fdxoRW2g8VsDYEKWVlxALQNIg9Y9UO4jEvO1hh+kNMbBoXpOKj/kmpMwBcFOtZfravtQ7BSEBjP/0I+e7V6wbp6bxRJ1LW4XozHMamNwTgaN1Cffg1xu9R97JLiPySel5hPbDRqZs0qGG//2cp+D/kAVzfz7fyoSk4kxlcj6VaMQS+qMoUAn0RCBT0BGCIRb+t7dPhmUvLbBvjNSGo9B1h9uZozSPRtacvIJTYBI+Uy1KLKesbMfUirNdcLCcQ6t5mGhJUBdoPyiKCGI6F9v7O3wiyI/QCZMigOaxPSHl/iq55y4oPd5MWQDUH+QkKnnZJUM5wM2JDQE8UoFcnS5PFWapaMmCnhdLccTBEs1iwsWJKcYGze/PAECZxsM15r7TZmMc564FvkIieJUSVyG/pb69FVubcypV7Zyy2ZB1QbOinBrePRUyk84Wxf/1qIMRwOa8gVKN6njIxdnyALaTZNtsf5I+gat4HKXsfQ7hpv2p8WyH1uKJLTAjmBzGVW36zEk7bU=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(26005)(7696005)(2616005)(82310400005)(478600001)(6666004)(40480700001)(921005)(40460700003)(82740400003)(356005)(7636003)(86362001)(83380400001)(336012)(186003)(1076003)(47076005)(426003)(36756003)(36860700001)(8936002)(5660300002)(41300700001)(2906002)(7416002)(316002)(6636002)(54906003)(110136005)(4326008)(70586007)(70206006)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:51.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8527019-35b7-4fd4-4b2f-08dac3cdda0c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
V1 -> V2:Nothing has changed
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

