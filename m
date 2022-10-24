Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CA9609B95
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiJXHmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiJXHmU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:20 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E6460EA1;
        Mon, 24 Oct 2022 00:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXt552mDWxAU7NCkMZyfwVTVFMC7WEIXYK1ImOkdw9u+OSsZdgb6RGek3x0iXn1j60HisMytygPcBQ7+wpL+QHoXwz2tbJbsU/FgNHpeV4xsiahxxHcKTmd5LCfRuxp499+fs+hIUcSJl6zA25WvPtNH0Yh3phb+otYwUzgebjr2Gpc4RAoW0ZiPwwICDysrncNULVp1e2+A3nTB5knfscIeSp0FqO8TOcr/44+Q2bg6CjJK27xif5lc5f2oiO1L0Rjb2DU/FZ96rRI6wDYXzSf1vxaNZ4T6MDUCt81AMNDP7Cu76+eIjeG+n2J9mIKqniSN8l5tVOanf+BonZgBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcBLF/mq2RZ/H9uP6zpacL5O9ahpQcoGYxQCfS4Y3W0=;
 b=DjtJ8w9+1Qn6VG/KaOsBYG47PTGxrs/HTJfLBKa+wgcGNH+AqU5/zA8p6nT5/QkVxYDeMLLmylfEzPgElTB75dTurDkNx2jfPAYFElAL5XaosrcR6dUaPInzfKY+A3M/mRVqcyT2oR4Vy7chcXGdSlhkF8b0Bgm5/xscbgVB6SwBPfi6+NYomE+i5wziAKf46YImYe5mFeQNTbHt7ZkyrQfbcgp4DGYi3A0P3jZJ+GkSNF0z8xAOQuG9vT8uR4wiQCbGzhoO/FYwfsh5jRi9PD8RTQnV8+uvJA1/FsIdVlO8AFuZ15NhZgsi5M3hN8GCih4ys2Fp7A1YN9iewNvKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcBLF/mq2RZ/H9uP6zpacL5O9ahpQcoGYxQCfS4Y3W0=;
 b=Vuy472l7svX9No3w1Hoj/mPjmwvmFPk994IfQ7cEr5lYr7lAmkfdXBdf2uqom1kUH4s01f0KtF7UB5BOPcLP9vNJyhGj6gw6nAsYRbxSAFA3cPbJF5s2bc/qmMY3T3L1ZI8H2NAdPp3yGG5QMIkxcnDhE1gkZEWXmZdxKdECxHToxVNezUN5ozuWsEXAt1lzFzG5ETXL/O7Eo5V7P/gsh2mIhTVDBmuA8BSp1Iaee6m2J+JM5jG+CqH817pgLvIMmXRlLU5/q3BjmzXp6pxUcK4KZBAisB9WovGg9UGxPiXA8wMICj7IX7If8f4SkcHWz/jaXd3hiRRXRStYghi8ng==
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 07:42:10 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::50) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:42:03 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:42:02 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:41:59 -0700
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
Subject: [PATCH 07/11] i2c: nvidia-gpu: Replace ccgx to well-known regex
Date:   Mon, 24 Oct 2022 15:41:24 +0800
Message-ID: <20221024074128.1113554-8-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 821a76a5-297f-4167-afd3-08dab593422d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awsvsxhX3GX0baoJMZfFpPwrQe0P3DTdUEESirzhPYV8PnxkUoSIVEWT6a+3eEYXQ7YU6KpWbOAcFI/Yog0mLJ2QmulK6GFjjXRdO6/YWkABf57DlnPC4rv7h0p0dxQF20y6tU4Clvyd3BPCQXRd5Tuyei+jY6iXyZuhoswwzpkvHaYQUdfrLrT/m3OnKA05/nwU5njEErPzkRfRIJhLvZBABUutkbbcYvLzbDt5H19NhXXUp14qkuemgWo2z9gzffjekMkBTsqEGUI2jovG480Mp5cHBOxnSHolyyFA+8QOZnRv1QcOjjnQ+pAJJhsg53gbqvGQc0K0lQnlHAeRygwHTP0ydNJWPxrbHqbSm10Gj0aq6TWDy3XpB1dj/nO2qTHiDswz/dN0hFreyGojRZQ9P1ttLuFsN6YAEgraEwKHZ92RmEisI6lUqb6UM9MxDEXoyfRj9TG3SLO+tgRSkXugjKlGDasPssuuFRs04oiHLpiKCLDjWbYJkTTUy/hKi/HCEqsj/33/+nnBod5UDwR0C59rcBEXPUNCNlWeWgW5olBoqpy7rN+B4xpI8hk1Ea0GtfFQZCZ8mKNaWoir3RRLzO2SIukWzQ+OJiMq3kDAD52VcCImVwwXrXHItwKq7xTzfqAFw7Os6riEKRXIs8tRMmSEFEKqSRNhmwTaGNKLyfyJ9qNYTt+LItHm15EpUTXzfMRLUA8usR1mxdI+lxQ/fnL3IaT10nLtJzMwaObOAeqJ+b9Kqe54VFyZ8PVfALpKhPPb0yUkhoslvfn8qYoQAbChKee+n9odnx1fTok=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(6666004)(2616005)(26005)(7696005)(1076003)(36860700001)(426003)(47076005)(336012)(186003)(83380400001)(4744005)(2906002)(7416002)(40480700001)(40460700003)(82310400005)(6636002)(54906003)(110136005)(316002)(478600001)(41300700001)(5660300002)(8936002)(70206006)(70586007)(4326008)(8676002)(86362001)(36756003)(82740400003)(921005)(7636003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:10.0050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 821a76a5-297f-4167-afd3-08dab593422d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ccgx is refer to the cypress cypd4226 typec controller.
Replace ccgx to well-known regex "cypress".

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..0934f8ad7f49 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
-	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_U16("cypress,firmware-build", ('n' << 8) | 'v'),
 	{ }
 };
 
-- 
2.25.1

