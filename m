Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E35627E22
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbiKNMmZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237284AbiKNMmJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC2D24BCF;
        Mon, 14 Nov 2022 04:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSkp8C+ZMnhaep94sSCS3iQzoFQdaE5IodFc1yYkqprYDVUx1l0imjtnX/M5XAfwi2xgAz9cWtNaX5fVkZUy7B9K8iN9BuvQ8qj0eGdaq6fPCwK9DJEOqrMyDbGy6026lxvDbtE/Y+iefN+dDjc3V6H6f9J6Ko84APhdETVphz8GlmGzNd9TSf+3LpLlXuNWU+qmRWOCLjz54/XWUzSuzAwIeyxZ5kFCXSBMHCbxeWAe8O7Z2XDCdQ1M+z+JPydF5Bwl7Bi81e/82/zvEIhYpeMLTL3Yx6MFC9uvOihS/kQo+1GIJ1vew1tN4mE20wrWqa5qtOadWOML64ylHdyvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsWrOSe/SMOlTl6vvAtIpgAN/lbrhrVEDUZ18tNcblw=;
 b=HL0/rXXPpXXsn0K2W/FVQzCsFSXcWOo1vWfyubMf/QX6FCiTe2u/eN54I3ocdbV3Ftf55C80jrr7BCU2/dt0CMFkLIqazGgtvU4OdpaSFtPzNQieHnWGfQOLIbqb/VHCUU7Pe9eLac1q9GrKPuxqqFLW29v6BGqRt1MRIEho9Uu662KTCfB4Pk7S85cyKXl68/53d0MXPc39H1pZ+p9VRIQMS3dpXUdgQf05uhtFtU0Ayc9OpZCX5CbqY/Siida0GxKKKrLX05Tcmj8b1UkB+BW7Qkq3R46VSNm9dJsnLXHhYNVGhE/VPTuPRZBI0btqbcUY2ugrdfx5a0YNX0vn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsWrOSe/SMOlTl6vvAtIpgAN/lbrhrVEDUZ18tNcblw=;
 b=eY3kzhTJgY4IJai55PfG3nQA1oBLcfYuNFXK8UF37/ln3ktY/3gAcyaem5kpnz7HsyUSW9tnx0Z/jomk8EHGxvhqubDaCJ1jpqStkx3CqxfwFdGK4xAq0ukakulcC3sFox3A3VZeCXdOMg/I83ZmrYfSeaCjirrZeIBfXFuH06ScJwRmJ2TpH85VWXGZ6bTpBA6HBKtRMBBrwYNsEywRRmP/nHQrKjLfynR1Apa7X0O3lGlbsPGNrq+u5XO8e3fjeB/3TH8ZfHeKWhqRxKMzHvb4/gDL3uRhlFP06OIvQXR7vRGxjTYJ0B7+0iJyPUO+lgVxuJ2rH5neogPVL9alKQ==
Received: from MN2PR11CA0016.namprd11.prod.outlook.com (2603:10b6:208:23b::21)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:50 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::32) by MN2PR11CA0016.outlook.office365.com
 (2603:10b6:208:23b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:36 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:35 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:32 -0800
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
Subject: [PATCH v3 09/13] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Mon, 14 Nov 2022 20:40:49 +0800
Message-ID: <20221114124053.1873316-10-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|SA0PR12MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 600bf050-b26b-42d6-18c5-08dac63d99f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3N8muepydJfeiIMnNQLlQGJiTtXNIQQx3v0/F3DfzSGqNSDFUZnqp62iXeXYyZkYDeWDDIoYizWbWuYhH4wqdrRVHLG4YpdZ7Xp015VzqeDf2fm/kuCggh93eR5RHz+IAYpHB7hphLERjNkyAEJvCCZI/1PDwIj+1AoeZDiYTalHLs2KY1MDaRlruGL6MxFy1x1KapSHeFKDNSv0C+Z26xz2ysohYloe7daL/BfZBWCk8wd0h2LiQnYf/8gjKYLOEnHbnpkLv5kuYObFIbXqGtU/8OlpyTK1i6UbuNWyJ7hmCIsZ+ZYE9NEehRUFKIsoTIkVFNzBkbD6XURNWEyeNmoXkzMO9oe2BUH/Opjg+mtNIexGK8xpLAeK01kVdfDZB4+nEkRe5GKBx4cG4pXol1xsXlrEyZmjwPv0r4t05qbdJzuPtg0bQueOp2aLthqUgEj8qYXbe/R/JXoM8jcRsM9ECK84dPICCKFCBDxHZ4UktyF40yOvemzqHRdKf7KP1yGRuxaU44LbhU5HiEqpd13G1wbVgi6ZlvbXfKkAkiCybN6QCgDOv4xItSJ46Hiieg6O+AS0wWQYe3LgHU3By9dwE+mSYE3db5W3b2tpWLKZD6UMGJCy/RB/nhQKLudMnrZnpi2N7C4YN2g0GU+uuMuMD5HJFvhsbsuPd5sPPnF+3otLQkyKGDXX9k7qnelsyMfST97VahaTV3ppAr4lRNZVae/7U8YZ6+G/g95mFqHkhjNEYC/0r3wdXLFIBYNInpM/lTvqQaDOGyKW853+sddMZDYYMO96Xat72ow7wsg=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(7696005)(2616005)(316002)(6636002)(54906003)(70206006)(4326008)(8676002)(41300700001)(83380400001)(40460700003)(36756003)(70586007)(336012)(26005)(5660300002)(7416002)(1076003)(426003)(8936002)(47076005)(186003)(82310400005)(4744005)(356005)(110136005)(82740400003)(86362001)(478600001)(36860700001)(6666004)(921005)(40480700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:50.2793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 600bf050-b26b-42d6-18c5-08dac63d99f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
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
V2 -> V3:nothing has changed
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

