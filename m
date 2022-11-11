Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623136257E1
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbiKKKRH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiKKKQq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:46 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2085.outbound.protection.outlook.com [40.107.96.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793FB862DF;
        Fri, 11 Nov 2022 02:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WugFNU1muLn7Qj5LtfBKyTxfPkocgxHLw6jU/IbnBdLK5evyQ0BTbi+5Ft2W9LKgPdKqz8514sWwoiPUeUx/qyQ/SPP2HtoUuIutq4fP6Tw+yBzi/XG8iWXYt1ZweaD2SDqshjV+7c4rXUq35HN6ZRbEwNGXzqy3pjwNry45PStUdRdgE2JUA/17RKn5+SbMPTU1kl/cYpIuj81rRRm1HueGAPDx69dT3pI+Ivzss3J/XsxmZssCOErGZrYk2qgzNjDi2LMKSR2b4GE8GVmCpJSRpAEBcipIinJhSB9w06BORyRyt2/v+Y1ZKRej6I7a8fV5uR0IXHCDetTZOY7y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVUquMvFCJAcgb8SUkNRtqEUj4zJ27FyVryF/sm5yPk=;
 b=bC6xTeFqSiyyuYiwayMlh+pT9uPlfDtVBZKEuc31mgg5+Nce3WV4QLwSYJ55qrXKjkPDu12h+zZbcyhCGcYmtpf0Lj9aKH57weV/bDJZflbbYEiCquveTNm6rVnP9yWqD/wNJ/rU/fKQlZIR0xyETf3572pp67oISg9Oj2fQDzD4SuCkOI6DHN5rfmFdzMzEaTr1jkOKm6YSGYyBZCVmpUcXp02O0gxs756W1AIkLs6mq8DgoE5lJeysQu6ohoFsUW4rxt3+kWfJJGam+51H4mfDrKZY/8IlNvP1Pb+DGMupDm6jGvdLGjrhOlNAC1f9b1MisPwKg7MGkYBZpcmlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVUquMvFCJAcgb8SUkNRtqEUj4zJ27FyVryF/sm5yPk=;
 b=QeuHHhZ/hgA1G/XjLvMF8AJvsn1wfGbhTo733z45BeWTMcjn4QuahTHaMmSMIKc0n6Cx9DRThvN/chT9Lc9iBboZ10OQYEKZhE+dpUhJUzpO+Dx/YLAxCUikej9iIXHf/kVRnxRYiyv4E8WUaxE4UP2cZzjkkhXFSvQ8dON9K+a3ZDNUsIi2Bnx/oFaReWulQnFkBOaauKHIVE8R0NYTZaqectGwjLeHADv23aGyQqheq8Klw91a0X3cIca89Zb10zG0RgtX5jnIOWHpaYjthIUMOe7OQyejMQ/o5RwJznJZhdMP2MQWlm1ORXyoCu6ucAbTWxQNaMnRSEO0SXL9aA==
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by DM6PR12MB4561.namprd12.prod.outlook.com (2603:10b6:5:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:34 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::79) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:24 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:24 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:20 -0800
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
Subject: [PATCH v2 10/13] phy: tegra: xusb: Disable trk clk when not in use
Date:   Fri, 11 Nov 2022 18:15:06 +0800
Message-ID: <20221111101509.999589-11-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|DM6PR12MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f6c85a-10b9-469f-6a59-08dac3cdcfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32IBemloahe/BFF10UhKuCJuhT8ZWtgKaGzmuGw1JdxyBIGMGcCo4PrSBDbJuA/SY/G38rK8HC9PvkpfoBkDhFHo4IbP4qaljnYI3iAF3Wn08oCSQmXTwTaZO379C8tomtR/hC+o6n114LuzyXiJZEnmvKsitB1ru/rVKNxFq8YzfoRZp8m+VIYPHMKpWxVJeriYO6+YxJcWysvF/u2Fsj6oDgDfhJUALpTogZlO1/B/DyFAC6RiKPkaTVTHr8KrN+mbyEqQKMvWaP5EukTdG7c3TfWZuFRQeT0Xl8gvIlO2kxMYD0fPfZxgluQRJqWuj1ltvbnCTqECDM0hqtCOGN5fxUXqO60F3ChvClEXaQE4ismB5N5lZJdjq2Vs2sNtOqCioXTzOLVPs831vGRestcgSeACNjwMtydRAMtrMVo2YapGZHhlMmkq/kxo9RmqqRTwITqakOGpelC79C/ofQ4siinSpnRiV9p6k0JwosmYmWXJgwOsC60xjmhnITbSxi9QBX4vqX5q3u/ziGrUeV5bZ6A14TQbOylbFc0BXJ15qXJZpO6yHAwqqf4i7NrwfDhHC0cN/nex0/MPBhC/BFKb+kClRcQAC1Z6dWuIQcUHyfeDyOyqYf1uqDF/9e4S+qJJUZ5v9A0wXG4A06fixbblSjZSEBUMnmXSOJIcjtcH3HwxwSbGJc6yLFQbhwcfMhIeSn2jwjGQ+MpAjLgc9BsX6fI7lPMIBzLoCSr5u3ZT8os144nH4PtIVNQQMZIzfKXI04SsZNbYule7dGFP8lq6X8aqdnzlAF9zb+F8wbQ=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(426003)(2616005)(26005)(4326008)(47076005)(40460700003)(8676002)(70586007)(70206006)(2906002)(6666004)(8936002)(36756003)(86362001)(5660300002)(41300700001)(316002)(7416002)(336012)(356005)(1076003)(186003)(7696005)(478600001)(7636003)(40480700001)(82310400005)(921005)(82740400003)(6636002)(54906003)(83380400001)(110136005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:34.5989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f6c85a-10b9-469f-6a59-08dac3cdcfc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4561
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Pad tracking is a one-time calibration for Tegra186 and Tegra194.
Clk should be disabled after calibration.

Disable clk after calibration.
While at it add 100us delay for HW recording the calibration value.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: update the commit message.
 drivers/phy/tegra/xusb-tegra186.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 0996ede63387..f121b4ffbbfd 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -609,6 +609,10 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	value &= ~USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
+	udelay(100);
+
+	clk_disable_unprepare(priv->usb2_trk_clk);
+
 	mutex_unlock(&padctl->lock);
 }
 
@@ -633,8 +637,6 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	value |= USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
-	clk_disable_unprepare(priv->usb2_trk_clk);
-
 	mutex_unlock(&padctl->lock);
 }
 
-- 
2.25.1

