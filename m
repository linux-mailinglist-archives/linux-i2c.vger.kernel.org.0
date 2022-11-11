Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2806257E7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbiKKKRJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbiKKKQq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:46 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E174862F7;
        Fri, 11 Nov 2022 02:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aod0ZopEarpsx0LXvAML7hu9nb/vIooFNEBwXP9hRKdVyzDuqZFbHQTWmonWMvRk+cIzfhKtu5sSoXTQNWYJwBKMiFvCQ3vxgFMPCTi6UGTw1v9njg842hwf/2n9v849tapvXYYsCc65F4l5ybqNBpgkayON7SW89e3jfznqFY59zzgSF5aKt7beezSx/kWLQ9SMqqVkSbthvpPvSj31vkg/2LBu6UcDMWWaC2S7HfsOqf+DfclPQLNf/3btqheLFqF3by2qebSHQ+zJbTat31+9YgJohP0lgyOkNufso4IfhscH32q9ywhaoUXHWEVL4D03mDqnoYddPd5RIfSppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dq4DR6bfOpMwbvWEHPF6B2z8xaLv7LRMxg0PuSwa04=;
 b=Q6vDWPcEPO2mVg6GsQpfEI9kDIDrq0OKWiw4DeYI5Ius/nREwom0fYvR5ibpsl1jsPleUx9A0UmpPKPnjyj/yc0qt6AVx9FOei/2/p8SxH8lGGev1W3C/uWJT1+HUvDqxxHkvCAyD0W0FT3cNZD4J0oVCU2T/uc/ZfEd+nf8dqAuO6pAktp/HMTD0dDsvzX0xdkq3btdYjsW7Bu7pIy2hnj3uhLwCP15+G37T/nRgk9qhJ7/E4k8VND3BX5p2bvpIph091FB6jAx1IMcpeXeQkpYuGjLhiE8Ax4MWKUQ/b6CywL4/J+oOVR1o0azxbxuQ07L1QQPTZP6o6iCiOiqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dq4DR6bfOpMwbvWEHPF6B2z8xaLv7LRMxg0PuSwa04=;
 b=gG+PtxwrRdcNHLHLXrK6o0tUMEqkgbTJABVLwViLTTl2H2PoyHv2VdmFNmw51GmE/LITGQc9Dr1WuSeTbPuN9oobyNcSvb+aU/vu8/h+qO7s6suHq5BYx8Is53XUg3K2yevrrij2xf45NnSlshug39TnqxANhM1GiZSpM0y8Ee2h97bfZMMEhySuvqQ1k+i9KTHqslFg4tH2e/lYmaJpkrPW2b4soalFfR0TDtXx7iba8eHMoRMl3oCzqQmLFd5zokhoJMTxhr0cSCuKUVUzOSdv+EVK1ic5QZ6J8BUbL4658F+fgDdKCEHhrIfZHTz/yhrwxaH84mP516J3Pj6t1A==
Received: from MN2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:208:23e::9)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:35 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::11) by MN2PR14CA0004.outlook.office365.com
 (2603:10b6:208:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:35 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:16:20 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:16:19 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:16:16 -0800
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
Subject: [PATCH v2 09/13] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Fri, 11 Nov 2022 18:15:05 +0800
Message-ID: <20221111101509.999589-10-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4e0a94-9151-4f2e-4e34-08dac3cdd058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgZ0llBjlhOVUwc4swIorlHy75X+6Q5y2vE7g4tKqcdJOY2lhjnx4ZYXdaiqbqkJLMaKvJAxQiC86bWYzA8uj5rVd/kaHxpwq+MphQXbADThmCXziSrNNiJJTZK8pLNhQ5xR0z2u0AqE08VQSFEeyKkbQok52hBBB02VsF97/bRYlw64w1KXObP/+P95dN9Kva6jcbrpNr2gY/ifLwxnnT88ANux30q+BnMoVFsjyeQYQtgWvAvq7x8nM1G4wIenugXYyIbNcKMSa5WXpz5du97f0THv1L66Nri/DVH5hNAVliOL14ecyZFBgh67i2vpaB9XAPEUx5XA1IAgDa4+w42ZxrsEe9HPaehaPZEZ87DOeMbm6Oql8oRlpblDvBWXYPeuQDraa8zoDEpQGUjiXwXGRK34BTNz2xWjNoYY8vd9TXVGD9VMQdTX4pXFddQWTDEzAEE85mupb4mKjX/NzaGWE00wkDkTnZ3DY3sbak7vlp+jpSHujj8iSHtqdzxoYUo6HgDdSfcAEmWmyq4Vl1OMUMr/pkIYgofaUbbUMqRs17AqHjpFZXNS3d4tsPeSMVYq8tKmD5tbSBrUboeHkgkBYwTMgw3PDHTjQVxQ6y424eaj8MNrnI9PIJiZQvQzMru0A27GCmh1TFaYoMWJJ2+ciEmjjju3DA9inv4rzZh+JctUVJjwFwtgN2jlRAWlnPxhvEV2WGpnYItN+xUbyjs5K7k/gVdbdDMHjnQxNgczv+LJReivzEKpcNjLgO3egsOc5FKsvbcKryT/h/opcgLDDvegcu2KuazeUkuX7HQ=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(316002)(110136005)(54906003)(6636002)(2616005)(1076003)(41300700001)(47076005)(36860700001)(7416002)(186003)(26005)(5660300002)(40480700001)(40460700003)(426003)(86362001)(2906002)(4744005)(4326008)(7696005)(336012)(36756003)(70206006)(70586007)(8676002)(8936002)(921005)(478600001)(356005)(7636003)(82740400003)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:35.5631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4e0a94-9151-4f2e-4e34-08dac3cdd058
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the property ccgx,firmware-build as we have added well-known
regex cypress,firmware-build.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2:New added for bisectablility
 drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 9b2e13bd44db..092d4d52098c 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
 static const struct property_entry ccgx_props[] = {
-	/* Use FW built for NVIDIA (nv) only */
-	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	/* Use FW built for NVIDIA GPU only */
 	PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),
 	{ }
 };
-- 
2.25.1

