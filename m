Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06432627E2A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237379AbiKNMm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237145AbiKNMmM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:12 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24650252B5;
        Mon, 14 Nov 2022 04:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Copy/L1/+uzgZQ0OY7EQFcCobfDY5iwL7SfKa2P+DtEEdhn1A8AIW22sX99s8KcLkhwJHRrcGc+x7rYAIsdt9stQo6C3A086uljYzuC5zYcFPEqmZlnod0GdRVpUHkcab8d78zfbELc0PKAbyxUVghdHsyhgoE/T7BmH1dNqQc237BkCqyaeWHm5/zWbIpgms11y98hKGPPTvtDShygWPE9gLYccLryIiqJXo2mfz083blSslVr0M3sgOQkHYf08kDy2jlELLTP1AgDZhW725bmDbBsKPXVqtdFGpbKGk4uRhVHKFjSG12JRBHPLmVvvzhDvM/FvhLFzXsgmLmFJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROCVdifGaQFd2ky2Z1uEdzRwoK7/v6Qh9sUb1kBotLw=;
 b=I7T8pe/M6yt4SN3trofR9dmELuKAqt4LEmkxj9AcfGP6ERGglBXTWV6fwm2AOgb3CgfjmVAN+/wy6isycrbm/tJQbR0yJ6eYIBSMxFL3GuKjrRQp7XLM7r0J2KHgV5TBnSYZLFdLA6iou/gVSHkXLFlmCBVDMn4tzsKoCz+NgFTTojLW4J4btPOd1mYHSDIzrfIrFEAObPcFd8qVLmYxTZEMPCgbBzj94Kl1JZWflQG4TBVX/I7lT1rEY+6NpBDbX6L7OPtvLPxbvJEmVchAfrlhE1Bw+aPHJ1vnX+3M+YkN9qGMXFfFICee/JxrlvcJSTh/KDMqY5Sib9ZA2cizpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROCVdifGaQFd2ky2Z1uEdzRwoK7/v6Qh9sUb1kBotLw=;
 b=uBOvnGV7NT04SP/wrYoRPFCmfT7trKMMU4Ua+E2cNBT76x06RyOayMGgsHGqjl89wCYK7m+tIYlrTMUZNogOZY3KczXhDnz4ukvqUO1gEAMHRGEd56j2BYILRkiK5td5iyLb80M9e7whRrsI2XWnxauTw3Z5y6S5nmK6qHN0tV3rjHHT02lawfVh0kfQRKYd9C4RoLWdAwur86CFM8GrtrSCrsgKfguMjCUVN27u8j0XM5gmIP7E0uoAb9LgSxgHu6TfPNhhwzq2sfq3iYv08/GcI29g7sR4vNVCO+LkUv/5XrcAYuT1xkq4zLQlXKvBZqvItBAqnHPPa2LWp4x49Q==
Received: from MN2PR11CA0007.namprd11.prod.outlook.com (2603:10b6:208:23b::12)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:54 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::e7) by MN2PR11CA0007.outlook.office365.com
 (2603:10b6:208:23b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:40 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:39 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:36 -0800
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
Subject: [PATCH v3 10/13] phy: tegra: xusb: Disable trk clk when not in use
Date:   Mon, 14 Nov 2022 20:40:50 +0800
Message-ID: <20221114124053.1873316-11-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 66033cac-1e55-43a9-75b1-08dac63d9c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BTWMIzI1lHJ3B1URJBm+6yHu6gjetw2tYjBJfITcVcO8aiKfRJcou9W+DKx2vCh1qxgqXBkFeuPy4ywUbPi7bBORB4LnjugB+xInCOUivB5+VMHEfQbH9A3uL7khOgU4741pAdk0euLcBj6IFRjnA9CAFW6yClxbhd4BLKvfSIqj2XXunF6wB7o4zzVS1XRcNG266wp/1Gxvfzp9MFZX1wiseO1OYwmDq4zO53GJJuGfveHr6kS/NOPk4lKY2pGcj0Xkjt+04HVX09RV0MuW0PJrCGTELtlfbo0LgL6T5PAUFZg5XJFCgW8VJL5G1fjI+46yiL8M1Gc3eU0goAytnEnEwp46ZHfEaJyyOfa0qhLeZvNiunB3V3nDiH0sC8FfTzTk0lXv57cH6yRn2jZpCI/tGEWuX0mY5FSQNAg39YQJLGNcWl6j58IUoDHkMHGoMTMNucRQFezje6NtpVDA5wiVETFiigBVb4Q6jBtM4QBbbKyxzW4uxajRnTWHlSrQAfm//74bONQjez+wLq4uiScp3m5H1acMUoBo8ipHzC05WEQGfbljsLSIPwCPc/6XiXQlW40sdsEv0iBLHNq1DiRMp5Dwl84Ti9aJM25hXOYH6z/DGO3C2p7eLyy71WhlizHj/zQAAiMn+haUF/KIN1RivVMZyVEtTkzR5NyO6Ga/fhOWCiZ4MPRppHrI2PZ2GTFMYqk0XEGK5sUV6r2lVWakaw3TWgec8EXplq5COiifopTd17kSequaHm+y2HYY0Z35CXdfK1KcUZQZLageYh6jR/vR61TEk/G3oNU9DE=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(1076003)(426003)(336012)(2616005)(47076005)(186003)(82740400003)(356005)(7636003)(36860700001)(2906002)(7416002)(8936002)(921005)(40460700003)(40480700001)(82310400005)(478600001)(26005)(6666004)(7696005)(5660300002)(8676002)(41300700001)(70586007)(70206006)(4326008)(316002)(6636002)(54906003)(110136005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:54.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66033cac-1e55-43a9-75b1-08dac63d9c5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
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
V2 -> V3:nothing has changed
V1 -> V2:update the commit message.
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

