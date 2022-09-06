Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654565AEF05
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 17:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbiIFPjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 11:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbiIFPia (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 11:38:30 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60D39F0F0;
        Tue,  6 Sep 2022 07:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy3HkFbapgh5PCUM0i9i3aaWTMevPcOFaiZZt8G504YHJ8HLc/8kDoIfDW/Z0Wgd7KBzmyoJnaOyo7oeccTv1RMNuApJnBevWbdrFRI38Rrp1rucL7ZrEL2H/Pk3Iy3sYBdRj0KgDKYi/hmrPfQBnRgBYxQWvcVOHzFmJDZSCf9qH18sKQODOlEnRdzErKFazx92IsfXSuRq9963JrMZ8EqwkGDdrukBal1RoLCNJhmQDxijlTQaAZfVbzDAolwi8odIEIuonSce2/iwtKhQoiWGWsYx3x3gqR3A1VzgvrBCL8NLaG0T9sNyjxtrOxJxRo1Qbgl3YTsZRl8oVZlPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfEO4/kFE0F0M6sCTXtMgwtjswlBRIgzmCZ/2LwrnHc=;
 b=Hn795eVKwPNLhTWrJwTRSGSnK1IeMQ1D+m3jUkunm39sAbOIMYeQ9EDbxnalU+AY+zZdTb+98CI4Pg+CFDZFeTEa8RqlNLklhjaGlUqXZcnkWK1pLw5xi4DZDX/V+haq+Z90ZDjh5jeJq8wyV9I8JXequqiWgjMRKh2L0tAv8xD66Xt3LcjgXdygKjh45vRKQ2I19cM6cRYW2ihTYLC8VeI0t0e02XIxVBsqIvSwiOxJfivJO4b0lkF6OjgpZWbocpaaEdrqn4YUHqpmfOn+YeOn2rtCkgmkDpdCb4+Sq1UwK9Nu11/U5fg+ByCkScsd5lWhKdk9E0a3+Z0xgsVv1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfEO4/kFE0F0M6sCTXtMgwtjswlBRIgzmCZ/2LwrnHc=;
 b=lr9SmEL30+jyzBZepGrNUXpRSan1WxB+yEhC9eg9cZ+KQyFFpxdP3B9BnaL6CEknFs4B00az/dPMKDnv1oGWrwYbacQiLw68a/pyc+WO3Qd/SRcyHg1hbPaLyZVFFrgZa+A6FPTLf1EwdylooV7aDtdebMJBdRfkMaS6enlacUUF/mCsmHiGJoP9jL73vtM9nHQcf/3FvReaRH7XpEFFsn6bI4Y4UUOLrHT0FqOsqKPSdyK6OuYtED4MCQBdMGt4ncytTWztu6lw2I+O894gaUP3ueTkos72WuQV+N/kpAMw6RkGzx6sDEv/7gTURXbfVUPep87+2B55AUfNHsEEpg==
Received: from CY5PR20CA0003.namprd20.prod.outlook.com (2603:10b6:930:3::27)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 14:48:01 +0000
Received: from CY4PEPF0000B8E9.namprd05.prod.outlook.com
 (2603:10b6:930:3:cafe::34) by CY5PR20CA0003.outlook.office365.com
 (2603:10b6:930:3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 14:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CY4PEPF0000B8E9.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.10 via Frontend Transport; Tue, 6 Sep 2022 14:48:00 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 6 Sep
 2022 14:47:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 6 Sep 2022
 07:47:59 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 6 Sep 2022 07:47:55 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <devicetree@vger.kernel.org>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh+dt@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 3/3] arm64: defconfig: Make TEGRA186_GPC_DMA built-in
Date:   Tue, 6 Sep 2022 20:17:16 +0530
Message-ID: <20220906144716.16274-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220906144716.16274-1-akhilrajeev@nvidia.com>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E9:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc3d427-3a60-4f1b-4a7e-08da9016cb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ii07FCIp9L8NLEPpJeoN2ICHYHUV3VtELXFQqFZaQciCxXPF2r3NtOp6Ss1Txltsfe08y0QeERrtaJ/bm4k/ypLH4OhvOtkBKEz09YfaOQAEknguGzf59Q1i54wqxnZuqxqkHurM/WK0V069TYEICiY8+OZtNknp+qg3Ux0MpbOwt22pFpvicVuU6bye9L4IoSA5G/YhOKMtRlC/qUBUecKabymSuV0+M4tNGAH8VtKuUDfuFZqd3fooy7XWC32p5z97qiKZ3jXyJ1hWJpMkE6MHBdyk9CTX58oNZtzopFXUIqicIHNBcf7oXtSP+AUxNx/TgkiQn33tpJSI0iweUqU9okFh5q+Zp1rwk8OPVi0R5u4EP4xTwVwE6skc14p4htr16Y0zAUdPgjcVwkC7QX80Rz/ImUDefqwU/9TZVsYu+bE8N3G0oQYYTs0WZCD8SvvS84ur2BbyBuvkqP/9J4sdUBgkCz31oso6NnRitRmHHqLCdXmGcKVTfYU4O5XWx6U+KP5gUVyOwtUrgb9dHQVdmrur3kNtvpy14wOs3cm96FvOqBdIgERVEPmabr+AW0WSJYhzWszYnHimJ3VP6QZmYgyvvAM7deK6PjmGZSu1NND8Y/2qr7zjAcoWon70g3bJZO+1z5orvAPt7YX907BrDk+SsElIwWtKtuN7cw+HPJp/CxBqgOlwbREzUz80lGv/NhvnKBn6iO1ygl3yp/ecy8ZYXXvsgoIJ67D+EXRmPHgp8RN5cSbEa/rZSSB95BufBrmBqk5B3YA2jjfYuZHCxUyPaoZN8k4fOEwJFyeqil0b3Ho/KX14JSD6uFds0px/dC7sPEulyUpW5pWIXv3agwjTF/vLwyOqLZvPpSh54SqzvDuC2EmdNdA8Gdc
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(40470700004)(36840700001)(4744005)(8676002)(83380400001)(70586007)(70206006)(4326008)(478600001)(7696005)(6666004)(107886003)(2906002)(5660300002)(40460700003)(26005)(336012)(8936002)(426003)(186003)(1076003)(47076005)(86362001)(7416002)(2616005)(41300700001)(82310400005)(36756003)(81166007)(316002)(82740400003)(40480700001)(36860700001)(110136005)(356005)(921005)(2101003)(83996005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:48:00.4138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc3d427-3a60-4f1b-4a7e-08da9016cb92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make TEGRA186_GPC_DMA driver as built-in since the clients using the
DMA (like I2C_TEGRA etc) are built-in. This would avoid the potential
long delay probe deferral can cause.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd4904..9e8c532126aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -995,7 +995,7 @@ CONFIG_MV_XOR=y
 CONFIG_MV_XOR_V2=y
 CONFIG_OWL_DMA=y
 CONFIG_PL330_DMA=y
-CONFIG_TEGRA186_GPC_DMA=m
+CONFIG_TEGRA186_GPC_DMA=y
 CONFIG_TEGRA20_APB_DMA=y
 CONFIG_TEGRA210_ADMA=m
 CONFIG_QCOM_BAM_DMA=y
-- 
2.17.1

