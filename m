Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90312627E1B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbiKNMmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237251AbiKNMmG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:06 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489A024972;
        Mon, 14 Nov 2022 04:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDPOHgKvb+wZRNKqN43SVvlrqvPR1JJLT6hf8NcJJVaV+SqfxBDwuRBPWQEK8Fzh4iBVkTm3lM1yLqUSh21ZYEDw2H7RKehlyUfmBPF7qy1om/bGvweCxGg2C2HRedlg0I4U7cTTxrdRx4f8wkM62i0Kkz64Otp76PXTnmaFSWhAXrIlMb5Xzz63xvZvXlOxzbtBDh71BlkdCf9HIBR7UguYEM8Z+UbntQzVjmsrXFTEadO54wWd8s+t6J81BaTuWfUoybmEKNF+E+c7boC8FmyHk4jvCASV7IRVH+M7RsCM0WshoedraFLCaEOQz6hIhKQ+db+iZO5/1vjlA1l2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxyILnYsxSrvc4JMWMISHSXMJhOzUx5t+QeDFOk1jvc=;
 b=PAQMCPQr/GKan9/5XmiqE101NgkyqKiyr4ajnS7FfSKwz+oA6IyvvUr8qoYwZuvDPkYay+xeb6gOrbqzXmvUZeRx7SV4ovTu5H1JGXfGXtkLMTwzmbxzVcaLFJrNgpkfx4H/qN6C2l27AzzQ3r53GKFZCfv7rhlM0eo2z5UcoeMrrGEqwl9IJn0/jwhxJseW9xcSeCwb5oROmjasOoVr+aTpDr0dlQdjrbAAwbnxCBZDlEzvHRm3G9KAtzxmbXhIfz3Pg2BMZc1C2B1LIZ/RaonJu1T8VmU1yaLJjPYqf2khHeyUO0tOUH85hjNmcNb1iq5kqDoXsFQk1+E8Vnm71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxyILnYsxSrvc4JMWMISHSXMJhOzUx5t+QeDFOk1jvc=;
 b=on6CoHd2r53BNR3kGIQK34ncrqgEpHT4zRWnYvuxnC7UcI7J1HvID6ZqmJ4RMT5DFPScO3nSVTc0J4FQkRSzbrJEPUkXZCvtsJnRNgXWDXmVtYCVlkE8y+GJTdxnwLo0kcJIsNgF/+pgupAL4m8EAfrLRm1KwRzCb4oa6MHex4gS4du6nff6Rl2kp9s6yP/rmAhXThXT7E5m+97mP0cUgplZOsj65nGR+kxRnmnZsSAKx22YoFJWeWFZjsG39YJOYuewp9XtLOpv7BqbqK2tI58WWGwAAD29AkSG86MqmO8iaDHm8ccyH2W0yl/BMZYXvf47X2PC2F+YoSy5fI+JYw==
Received: from MN2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:208:23b::22)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:44 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::33) by MN2PR11CA0017.outlook.office365.com
 (2603:10b6:208:23b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:27 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:24 -0800
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
Subject: [PATCH v3 07/13] i2c: nvidia-gpu: Add cypress,firmware-build as a well-known regex
Date:   Mon, 14 Nov 2022 20:40:47 +0800
Message-ID: <20221114124053.1873316-8-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b31956d-f942-481a-e02c-08dac63d9615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: re7hmNyyxm0JN1+LIeHNKGjyBESl0nXr+hh3B+HULFsJjd4/u52OLCeseoG4HVynmLps5bWZKEjY+rLI2nhpMR07M1tX5zm4R9YNSDa1466ZvD4KiZXO9wkG9tnG1q7noP5XxFGNi9Ul1WdP3g1GU+twJggrpR1WMhI+veMP0ad8QeCeXMt4ldfxvgoXdu0UEk8HeRsxYpQhu7TZLdypRwhfni/Zw/tnE01HTOXsQ9L3zYzuEYvnyTVYRHKZnha1idGKlkYVSjLgpVbiJHWEc9urXQF66Fsc5MYACW6CyoeSF1ZhyugASFKBEScw0gHjn7q4bI9afBeAocYrCFXapaHxQkZm5K7XXfCH5gRkq1rXrWYnogC1A619qAOqb8FiOfEVplnhbeRbE5FxtnOTl0QnDnqCZd3B4mlVFtzxKKAoQtQ9uiKBfA0w1pco58b3LjGaFxaSXO50/gR5O7W1fsNdKysl8o0W6GWD4u5ynswRAX8T1yptXFqa3qlN01Pz2frGaznw4fpvwikm7kfTbuR+egXSnpO0fP633wC4SDkhd33zYwq3sc2M+0jI0YIdmei9c5BJE2CzHaMHhszd2uPBCj/9v2KwaCqvur7KDsMLWknBxxS5B3qmc6RCRX//7zDwjIGJw8sVly8veWMtGJyhfxVtmqFCeboofMb8lC0zJY1m+KEpxEU1VKhPJpfOQmYSdbe2Y8E9AHoy2LKwlCWAjnLcXyvhvEX5bcB/WMopfa7sprwdy9n5N9f9lgaMHBDzp8BCRE55e5bhul2UTVbtWpVHdBWB6dVHmT2DNFg=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(921005)(478600001)(54906003)(6636002)(7696005)(110136005)(316002)(70206006)(70586007)(336012)(8676002)(7416002)(1076003)(5660300002)(186003)(4326008)(26005)(41300700001)(36756003)(8936002)(40480700001)(2616005)(4744005)(40460700003)(82310400005)(356005)(7636003)(2906002)(426003)(47076005)(36860700001)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:43.7636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b31956d-f942-481a-e02c-08dac63d9615
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ccgx is refer to the cypress cypd4226 typec controller.
add cypress,firmware-build as a well-known regex.

16-bit value is not sufficient for descriptiva names.
Using string instead of u16 to make it more descriptive.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3:nothing has changed
V1 -> V2:New change for adding cypress,firmware-build
 drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..9b2e13bd44db 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
 	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),
 	{ }
 };
 
-- 
2.25.1

