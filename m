Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4BCE609BAA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiJXHnG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiJXHmi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:38 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094746110D;
        Mon, 24 Oct 2022 00:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP3KAewv2aAKy6JXcPGctyR/gTuxq39jWwCnOV7RO8jlCS4nPvbybT9yUraDKhcowAQPyE7IJAyp8lfpSCeARwFYxrR4UcTBK7p2HxSj0AJBFt4GZP8M6Ry6ZODxbrbz99fvNlUgR93Z+q+PaXUslUVWgui7FmkXZ8ZTFhKLOEDQp+syPzfIvxYjrIF0vKyl61zR15nyVE7N6DISn31fzvnKwyGcl4o87uoFE+Y9unF6ABl65gfUOCP+XsxTxI0TNs/w0sCAM6mUgOTwQ8stC6lL4eTTsjBVDRLzlNCj05uRuCOR1IqNNs+7daG3s1vcvmxIFV1D5PYzscUcoD0CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UD6OlE4UhvJktg5lu6zNVkPtW2S5bf69ggfnIUC33Zs=;
 b=I1MZThcAlTU9SUzIT2SFIcuGbadhNzK2istOc8E4GBZG+4RlymbB7qAy3KOV/K8zVimJTytxCkxWFeofHm89O3CUdTN7t7jGkkn40wxCSXsbbWk/zv7of0yuU/CW5mXgEQA8UY4hEirVEc5XFfeu9jWX9wWqilUIyZQWgTpnuWWr70RGcYpBLM2NvkQ8WLrBOg/nLCixJ8tDu5f9kLqn/s9UZm5XL3ZQ5LVMg4S0igx+4QM90mxmi85amvCgRHvQX38qSMe5u8uu+/xei8U3sQv5B+drH0G1IWUNe2ueVk1uK2s7DrtHMVE4TXve9SfE0ilf3rjMIBCMIETAHzHowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD6OlE4UhvJktg5lu6zNVkPtW2S5bf69ggfnIUC33Zs=;
 b=YELKBu+Kj+BhcDqRM8UhiYsrcMT1I688Xi9zeps5D/+A2p3L5ZX2rshmUHxQnQbOmtAqi6vcbgUYtDS+1D7fRyO5H4/wbUaLXoeZ16qUIKpCd6m/hRCO5bu7k5wu2xCguFubW/TY9Pz2KmehG9vkYdT2EzToc0d4e2ya01TtSuwtd41yd+0VGnA1C3DrTwNmoB9k9j0OzEq4eOD7RcTIWnNuryAjrLmD+uJCPz4HdmzyVZo4957E1m9e1jG4BpPQqAVzslb8FvLuaPDYQuf8q1BMxoD5kHeXw0iYPKd8+zTTfcfzKwMfmuVeMl8vMvPWJE80b2ZZFagwAaimbn/f0Q==
Received: from BN0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:408:141::33)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 07:42:21 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::5e) by BN0PR07CA0024.outlook.office365.com
 (2603:10b6:408:141::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:42:06 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:42:06 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:42:03 -0700
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
Subject: [PATCH 08/11] phy: tegra: xusb: Disable trk clk when not using
Date:   Mon, 24 Oct 2022 15:41:25 +0800
Message-ID: <20221024074128.1113554-9-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT072:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: 855dc428-fa93-43d2-dc96-08dab5934897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASfFp+QFYC7IKUX6CfH+Ge6bN7obcRYYg11RmgdFsOTJrtV2HjTBELvV9hKK5z1yMltFFFZkgZG9SpBAcAEIUNQlgRs/jcG3flo3Nz7ZXmQ0vYF/2ifz9WeEmv+7ubA+MXKcyDqmI1RAi7uBgxJGlBZ2Oq7lxrcb8sNgOwu9fGWorN4Gl/qKEdjhA+JMJF10zstEc13ZaoEzZAbQ22KQicOBIOUIpKirbMV1HGXWaT0Eoyzl5g+/wMKy7ps5I1x+4J1767P7YE17tUEj1Li9rfz0IKvvAADTUZoQj38Pv069+dRHnVl80X3BDOC4D0ILSZiyzBmIGIQTo7Hu7hurbQX54rNO76W8wSYDLpyWMFGWAXVvIoF0qc51ZLJg8nhTF4svUub54TAroCz7LuxYvJR3agL0DsKXKtxViVaDDoyfFIt+R4xShZ16kH7zewW/Mtuy+DLo+yzhnQQ4Rgh6Edy8j2WnKm3ipkKW9T3LZRPiC03AphRXh/Q6RlvG0R19hhRZfNb5V9T0QBK/UCdOf2isRnRxGe7n7lBmv8Ln0iB0U2TUUH3EReqbwmhUdxevk4aAXg3Nl9GSJ0do3XbBv4EE3wT6MrNn5t7GSgZzE+IMEBlGa7UbRu6p/X552I4aaMtdjs7kyplvsTt1OeOC1cEsTqbzrTdGIDxtUCBRx03i3X391gKbIqdjmVO3OMd+x4zjNtv2G0tTx/FdwaNwnDEzX3JoWxcLXIlLZvxHqWPlpb+chLMMxFno1I74j3vnkwRdEBDWz4rFwqH4UlSZmy/kURFvgyZ2GxY3Tq2Twxs=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(40480700001)(2906002)(8936002)(82740400003)(47076005)(426003)(5660300002)(6636002)(7636003)(356005)(921005)(2616005)(7416002)(41300700001)(110136005)(54906003)(26005)(316002)(6666004)(36756003)(186003)(1076003)(36860700001)(86362001)(336012)(83380400001)(7696005)(478600001)(70206006)(70586007)(8676002)(4326008)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:20.7203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 855dc428-fa93-43d2-dc96-08dab5934897
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The change fixes an issue that the pad tracking is a one-time calibration
for Tegra186 and Tegra194. We should disable the clk when it is done.
The 100us delay is for HW recording the calibration value.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
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

