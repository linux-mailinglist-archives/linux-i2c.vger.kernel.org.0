Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BE75AEF14
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 17:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbiIFPla (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 11:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiIFPiN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 11:38:13 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85747C6E82;
        Tue,  6 Sep 2022 07:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amrRh4ZPtsTEYKAWOBU1ABMQl3k1FLLm/OK/TnZ4Tb19KyoNTLaxNIzXSI1m70yRrCEtwSKs4mfGinIHB2Vo++mmCw3rudsarl9A6JIWumkhVpLjp+JfK/LpF4sG6NipV3I7RQimYPD14IE2T1ZRqN8XONfxKEn5C9FQA2dWFb1csjAALFCQy6XNHYFKXTr6PKYywRyUap1yohPl0OVZVpDtt8BEQdh7LeYDah9V7m8dc1KjGNFW9kK4JmwwKRvTiW/2TisCoLytqF/QsaMu24ONhyHaUcEcKMCqpbxfoMbnUrpxTmtDwrSlpIWct5Rvj/H531zenpcy/J5prul+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u07Q4Bkd6p1xDOkKVsrYKVkm5d9bpT1o3fUxl8xQ7Lo=;
 b=G0PVM/6hgdIiNQieOgKm/0l32/dbF28SgaTXcjHfzJ0oeaIBIaXh85xxwjAEZdchQbiMJC+pFi+yXMSudt+odFuWKUPznZIBLg6IDsTZhp9yHNAq5T92+Iwy8TJOSE9Ux90D4BvKN/EsIJMT/vcxYtiyReL/hDGQUeJuubMQ6ZAHFRrOr9+z62h1JS1TmKrzCcQxR0KfbOQZmAoDqKAdUPPBoYY1FYnVjeOBuEdrO4kCWw2GJ24MI6BvyA0n6s4fK07gcZD4tgNn9St3bSlTUyNmfsoWxIzBH7rsiZRi0AuaeNjAZva3L/qX0a7dtACi5VysLpvy9SfM7jR/0NdLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u07Q4Bkd6p1xDOkKVsrYKVkm5d9bpT1o3fUxl8xQ7Lo=;
 b=dnQ8J4LwUDRY6MSCB0N7W1Y2t1xx2VmfgAcSytPd6rDY0aDPNbpwKx/s5CG/4FN1B45fhTv1yVEYuf+kHx/7hLq6lDVZ0U7NhEwT/xUAiP+UT2Zx+w6wLhgPB+Ig5sykU7b25YSWnxNa5Um12woTps1S0TZGN2KMWK92X+EoNX4iZrCva3Q9AOl9ozZL0QrlGPNWYC61eEq5rBDNR5WXtiIgTK7qhXUvc2HC5AV/l+Hte0Zh3HHOnRzD8DZ2dYlkjtQfkugb9K8sb+weaREZuU4OJNWZAL/70V+UCZ1cHUPLPJd3ieefIP/QIJABuKHPeQZychtCEYLuEPTuEpZ3VQ==
Received: from DM6PR14CA0060.namprd14.prod.outlook.com (2603:10b6:5:18f::37)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 14:47:36 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::d2) by DM6PR14CA0060.outlook.office365.com
 (2603:10b6:5:18f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 14:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:47:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 6 Sep
 2022 14:47:35 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 6 Sep 2022
 07:47:34 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 6 Sep 2022 07:47:31 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <devicetree@vger.kernel.org>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh+dt@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 0/3] Add GPCDMA support to Tegra I2C
Date:   Tue, 6 Sep 2022 20:17:13 +0530
Message-ID: <20220906144716.16274-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af3c93ce-288e-43dd-d1ae-08da9016bd13
X-MS-TrafficTypeDiagnostic: MN2PR12MB4079:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRyuyvZIrdDFNqyvZ2SAUQirhatroLXj4TrwN7iTwzOStB73l7LgbXB2KOiijdywiK+sY8eAZz8fxyGbqOxtiaoH5+XPCK8MVhFg/v2AHdpS9tZoYG/WmZx5AHuZ6RcyQHjo8nMj+z19xwqqJpZE7TsTTCQPe/pcbg/QZYYGlQ4+6M/XWM8w97izNtrpH8I5iAyBT+FolOtLWxxhjMFnSHpcF9nXjjcvURrDNFDTG/18Cq/k+KkQB1WEWvviiRTZ1yg7OXuZVXjfQZNSwXrvqsKtkkB5fgXbBYeAFMzXbJuCpptMTnNwLOOJItb2rdapA4sMmIuRSzO/5Q8hSbtjMbw+BKqGlf3dZEKfPdpt+hbhzFk13qobGFeon+qnwRYN3ugrQACjgdAAA2ftSaxzzqjsy4TqUPhFeYFxqf3wb5EqACuzd74YBgqCGKVLSMCBsZVE/K3lWasya31JtnaYvuHcmjwbLcBErYWQuI7I/nWFtkNG9flze1GkgL1cT608IFcTmQbGecI2V1Luu0OfHUoWaitRzKK5xdA31+J3c8sDUgU1wFkeRVsB8x07JHxYbZAcxUPMgkE06y8und5Nxe5q3MMUYr4FzT68CHkBFhQ4NdEvhHPlqgqTCNW/hBcuJmWO1v3zQRb8/eTHDYHBvUbYieQzd6UWkXdHSvesUBJLGj81dhdypekazQFsCdiTMBw+5zMrBMGxm7bVlTmp1lE06JTwBmGJ9g2X9jTc5ZheSaC2dU6VvCsg5zAxszUi2oTSoRdrKHiCMpOGqIRkvz6Ef1EhG14edkl1ke5zEFE6HiBEErJI27F3tqLTfIcaDz6mvtp2TbFtMNLo4jXgoxCahZoiMN237SD2FIhl1+FovgL4jj3Q7uphzYWA5TRa
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(82740400003)(356005)(8676002)(921005)(4326008)(40460700003)(186003)(70586007)(81166007)(336012)(82310400005)(2616005)(8936002)(478600001)(83380400001)(70206006)(36756003)(1076003)(107886003)(7416002)(5660300002)(36860700001)(4744005)(41300700001)(6666004)(40480700001)(26005)(86362001)(7696005)(316002)(426003)(2906002)(110136005)(47076005)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:47:36.1125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af3c93ce-288e-43dd-d1ae-08da9016bd13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Updates in Tegra I2C driver, device tree and defconfig to support
GPCDMA for I2C in Tegra 186 and later chips.


Akhil R (3):
  i2c: tegra: Add GPCDMA support
  arm64: tegra: Add GPCDMA support for Tegra I2C
  arm64: defconfig: Make TEGRA186_GPC_DMA built-in

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 ++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 ++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
 arch/arm64/configs/defconfig             |  2 +-
 drivers/i2c/busses/i2c-tegra.c           | 11 +++++---
 5 files changed, 105 insertions(+), 4 deletions(-)

-- 
2.17.1

