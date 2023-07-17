Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19679756744
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 17:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjGQPNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 11:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjGQPNd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 11:13:33 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E48210E;
        Mon, 17 Jul 2023 08:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNUOdXAagIFsTi3Q3EHslYqW8i/X7ocsvUFpOpdD1Hq/LldgHagB3FcPDS7JzR34LlEwq9Ty6HwiXC+7Vq+S4yUFOw3A6g3MnAEsi7K4HjWa1VwxDL4SO2LYyJxtiyFMuF9ibqHRXkV/VBUyRgwKEPoPRtGSzvt/Ti/aGPd0rFSF6f/C4CIaWFBq1eu5Q2GOU3AW3W1B2duVOgTgWkNIIlyo3ZAQwi4PxkDl7o8uh5hO41mIgZgkPk9nXR1hzZiGYvEDa2U/IZnt0VFcN6V3KS/oooIht4dr3nn2vvmt6k6KvOH0HNe1nQO6AZRGMQy9vRFtvHYa3YGYEw/PxmyGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE3ItHd2RqM/u3+b2+WmYxyDcPWaLi+ZrdGSjX8kngQ=;
 b=k3ef7KqKmZSSAp+blrrNsioWZZWkZZJIsLzaNHpBihTBbdME3EQ1eXrDFto91fvffPSBxhj7wuPv3mdJEd2cLuk8cT5XaigYYXRCVzictt2Zc4idf8chjmI/3wtFPqkJxUM2JUxbulMpE/u9Fv3BmYpH3voph911wmMRWV5jzdDUXmTuXpmS4M0CTkoXBtuzA6o+HOEB8UNho96o12WVO4InTTDr2vZiPZkfp9g/KpbX7vYUCw9euLB8t5hPRIz5Kq1DwwI9h3IWzy8NGWEWFo9bQybHfTL8x4MG6vYJMNGELJPCkh80F1pxPc4mx31SQvX0mx5fuceF15Rxriy+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE3ItHd2RqM/u3+b2+WmYxyDcPWaLi+ZrdGSjX8kngQ=;
 b=MSGCizktF/zfywZgCVH7jDa8MjDwshu4eypNY5aefhTuyFRABic2O3GaVBMQZRe1+0NPV6+g487NczE6K6ozxkyTcjiQjBXgBFF6VtuJcOUYxvqkKvhxMu5T6CiDxeskE/SP0j1FmR5V+gneIpWKhRVEoJNIRZVs0mbKNxC5fJNlR3tREPisBQMEhgN1UHgPhKbbFucH/p/1rFXdEZLjnYI/bX+5YopkpXuGqVRJA5E4KypUslIpLoJp/R0CoSj049W1T1eikHxCMHDoVK73ONXpt/Refg8t8KpCrzJKSd/ep8UdWNjGFpqNMD2RDFwRul07dxltaBpyM876gEpHNA==
Received: from MW4PR03CA0098.namprd03.prod.outlook.com (2603:10b6:303:b7::13)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:13:30 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::cd) by MW4PR03CA0098.outlook.office365.com
 (2603:10b6:303:b7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Mon, 17 Jul 2023 15:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32 via Frontend Transport; Mon, 17 Jul 2023 15:13:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 17 Jul 2023
 08:13:15 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 17 Jul
 2023 08:13:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Mon, 17 Jul 2023 08:13:11 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Fix the check during DMA channel release
Date:   Mon, 17 Jul 2023 20:42:40 +0530
Message-ID: <20230717151240.68899-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc5f98e-c7ff-4224-4684-08db86d860ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fp3VETfKp/tKlzBC7icBVygnR4ySQRIQ/TIH7uD2QxZ2OHngFy6ciTNiVk1ToAFzsEWbYqZ7J2XZtIBLf3opANflgbI5OBEG7T2tSCdbN8yyeZ8rKn+rSYFW/TsmEv/sRXfGSjJHHyO77lKIatp79jSf1HZKv4lgZaMNbeSQPBDSvgmC076urxNRsGoiDr7pXYdUrkdvTD/0JGn3nCW0mVB9OZyJJ2q/SQkpSpS9v8GnJiS1/eAlXYZjyBDRu6c5BjR2tTwCNuZxmTNfuVWuEqw7pBd3wX+pMqh5dhmHI65l1X3gdFNL6pooFBPjyJ/ghh5WqHPEMVAG57eh1IdjVKOk/l+evjh/YTBerzTPnamvQyZOyDg2MnoTo4zSBa82hZNgnmDHwPi9ppYJ2QaN2/SCtJZJugyYesPvC3MpvUqJvHFJAda7Lm7LfoY0xsMMdCmbu+zxHekR6ma9MuJrbNEgd8amveA/G/enseHiGMh/UFFfqm/7ETE5OCbuTu5rWiEAsFXivulegZ5m3tiGODiEkOPQC94rbadiqLMyjhp6F3s2m1pYwIUG6I+TkITYiOtE6FByJ+jzqMze9TPg/Ic6UGpnc8Z8SF7cHnKb16FPpvnbNekfozn+YloK9U6WPmXcMVcQ1srqPlguEY1XyF6ozS2iHYdO5ICsW8z+ZNk83os+CKnxnv6WKbYQDdiYsdOVSDnw7lstx3Arzuua+VUzAL4ux7d5UHMc0nHRTU7mCrRZUluGSbtH0u4VraRq2mLWd7TyHzC/HY/KycbhWvgaal1o0AMCyWxU9djAjEU=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(2906002)(921005)(356005)(82740400003)(426003)(47076005)(336012)(83380400001)(2616005)(186003)(26005)(107886003)(1076003)(36860700001)(40480700001)(5660300002)(86362001)(40460700003)(7636003)(8676002)(4744005)(36756003)(4326008)(478600001)(110136005)(7696005)(6666004)(316002)(41300700001)(8936002)(70206006)(70586007)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:13:29.9405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc5f98e-c7ff-4224-4684-08db86d860ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Check for error and NULL before attempting to release DMA channel.

This, otherwise, was causing panic and crash in kernel when the
dma_chan has an invalid value. The condition occurs during init_dma()
when the dma_request_chan() function returns an error.

Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bcbbf23aa530..636bf340e707 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -427,7 +427,7 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->dma_buf = NULL;
 	}
 
-	if (i2c_dev->dma_chan) {
+	if (!IS_ERR_OR_NULL(i2c_dev->dma_chan)) {
 		dma_release_channel(i2c_dev->dma_chan);
 		i2c_dev->dma_chan = NULL;
 	}
-- 
2.17.1

