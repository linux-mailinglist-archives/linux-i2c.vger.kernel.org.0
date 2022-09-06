Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE51D5AEF10
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 17:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbiIFPlc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 11:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbiIFPiW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 11:38:22 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7779E6A8;
        Tue,  6 Sep 2022 07:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2UNm51OfsJ5JIfnsohsyqHpC2VoW+OB507l2KW61ORh+2MqjHkd7Uv0CvsPX1pxAim3tJq75JXGQ5uUJ+zydqXKtbOL21j4wxHpo6g7Mi/UatsBOTEMI7gMbkvKDWzeIvN/Tz2GdQd/nw5s/jGwnnuYj97Xzsy8DJUQE5iEYzyQQEIULpiG6KwTLVJzceesbCyRF1R/aaxUevRs6zUa6LKtVB2JmziJo/TDTD5OAfyCwdYU/b6pGB4otZ1TgUuIrgS6hsT3znC4Dt9R8drRb8YH1cBEkMbkm+CsBY1kl6jO6iwLU9HyOOAenAzb31Y7mJDVIb9dyoS7Ae0PwO5xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWnB6bvTdBYdYGKQjaxlze0xDzkAT+61v+RneGMDg44=;
 b=ASINchYTuxhywZCK8Dr/6KQ0m67MU5YV8NiaLHjdsQqprl2LRI8zKrVNODBoRV01HtrsbYMnFAFXTGyGNbcA8wFNF/57acTZ+ROgOY3yQe8gXDByggTmVKDGGU0dBWR5gNZE9q0+x4KKKZTmX99TNR8xYf42qLZQxXNwJwbw3nnuVjZlPCr0sw66lEeziMFho8tYOultQHxeuUKu9p1IGgv6dViWnyiQ8044ptQGY+IJ9ekWVoLYU+XDH4KHz01tAl5i2E66cLsRzdhZYW+uM+JI58A6Zgm2d+vL8mXZEOJjqRB2gYtQr5OOxrj/RdChQOfPb86D+qYVsVsSRPWeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWnB6bvTdBYdYGKQjaxlze0xDzkAT+61v+RneGMDg44=;
 b=iIrwrlmTAXWLloR6rVOQJWPAYgO5DdEZLKAF4oZfqQgqI1tClZJ4vhnMukOJbvC7bqjyZuYrlSE0DbSMsFA8iNSDyuAmcUHI1TnUJzlpdWy3wPPGSZ2ryyUJHK3X6car9dEqV3/VqsgjOXMkk1ZMpUKXqxNXOenxxpEOwRSvxs5yCzDTvzYDOcoptGhas2ImliOLmJSWu67hWge+Q5cfW1XlL1iriopzckg/I5DxUTbKhwccnARpsnsT4fbxDR7GuV6+AmdBm3Yo/h3Xsia/dLisLs6eZ29F9Or1+3xDPo0HTLIQBk/kfGwH1mSI269c0hYeTNpFAootlJchL/Q+6A==
Received: from DS7PR03CA0249.namprd03.prod.outlook.com (2603:10b6:5:3b3::14)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 14:47:46 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::d8) by DS7PR03CA0249.outlook.office365.com
 (2603:10b6:5:3b3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 14:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:47:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 6 Sep
 2022 14:47:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 6 Sep 2022
 07:47:44 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Tue, 6 Sep 2022 07:47:41 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <devicetree@vger.kernel.org>,
        <digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <robh+dt@kernel.org>,
        <sumit.semwal@linaro.org>, <thierry.reding@gmail.com>,
        <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v2 1/3] i2c: tegra: Add GPCDMA support
Date:   Tue, 6 Sep 2022 20:17:14 +0530
Message-ID: <20220906144716.16274-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220906144716.16274-1-akhilrajeev@nvidia.com>
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c557ecef-edec-4996-300d-08da9016c2fb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPasQerm/6Amo+Y9CskKy5CTdQnLcEBl8mFB0mnZpDZRH5Qc75buCYgEFKCybVbvxuruL9csF2KiwV0+hW3xQqU4++L/ck6tWQprBZiwmn1Dsp7XdkAjaESjWApHh2HK21Yjr9OIzst99A7Jf33n85o9OA08Rfa/wiRQVd8qV9mu73h7TBeXHa0FBP8nGuh9uKCsMjLI0ENpiqKkZx3Qoyh6rFU5ggWKnb6LnbU4q1E0BhTz13e7yLMzIbV7lleBMkUsaN8dlD0JjWESSiOt/iebVBZt0Vaj8raejMZdHffcQEN1/lw36NgEqUXlZggXjha6G7EOsTl3LqCkI4Q0vnlgTIMflVXsvN4EQUHFWPdJEQDlUP/QMFAsvLT+dJCGWfPqqt/ffO9UZsHCAqBF8/cPTY0QsekWed/4ZUyZVA8QAbq31uSRZJgLBRXWrckQ/W33onbs7GFaRZT6+/t+hSFLxCO5KUUtEnCnCvGq8HwCfv6sxKYmfZ1J0oREB34PuHBaNND5MQO0YmBI5NtiZ0bu2iERgaCwy1OwcqFznVgzeQ0WklTyaIlDUCmbmkacvp0TE9ZO0QoVRqrljHN3UPrSG5if3e00Sle5vGuxcvrotPHLDPc9gigAa2jZ3F/eaRBWoki1pk5qeYUvow78b4mMhXJgM6bsVD9s1GGvmdF8DWXmtXxYYtg0xX2wMsuAqbE1QWQLb9O2kJx5t8K78WG5Sz9kAC5AzwJyicVS+c3wZtSLnlUmgEf6BuBz/pSJ7JyLw7jrzosX9YI+W69XzcbUuHIFFxclrdm7LqcDW1P9Ktos/4inesHOdaqovEogS4kd/bMDBM8rnSUFlh6M6OBfsJfFJWJNVFk8apehsUM=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(426003)(82310400005)(47076005)(336012)(316002)(40460700003)(82740400003)(36756003)(110136005)(186003)(1076003)(86362001)(2616005)(83380400001)(4326008)(40480700001)(70586007)(70206006)(8676002)(7696005)(81166007)(26005)(6666004)(8936002)(5660300002)(7416002)(2906002)(36860700001)(478600001)(41300700001)(356005)(107886003)(921005)(83996005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:47:46.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c557ecef-edec-4996-300d-08da9016c2fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable support for GPCDMA, which is used in I2C controllers
in Tegra 186 and above. The chips before that used APB DMA.
This change works under the presumption that all chips apart from
those supporting APB DMA is using GPCDMA.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 031c78ac42e6..954022c04cc4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -443,11 +443,16 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
+	if (i2c_dev->is_vi)
 		return 0;
 
-	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
+	if (!i2c_dev->hw->has_apb_dma) {
+		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
+			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
+			return 0;
+		}
+	} else if (!IS_ENABLED(CONFIG_TEGRA186_GPC_DMA)) {
+		dev_dbg(i2c_dev->dev, "GPC DMA support not enabled\n");
 		return 0;
 	}
 
-- 
2.17.1

