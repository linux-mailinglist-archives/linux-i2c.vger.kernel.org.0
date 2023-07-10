Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2895774CD14
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjGJGeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjGJGeg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:36 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F0919F;
        Sun,  9 Jul 2023 23:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys1SeFXAiJwZOe84TqCk4tmd2dLYuJVtuqaX7k3i9zjJeUbjRcp292LkYs2czRB6kEIk5xkG1mhNQJVF34fKysbjTW5zi/vulLipNmjrragAavOhlmT0w/cBIdw+PRNhyIJ4s1EM1xqRC4/++vm8Ox/m+47zSAml/6mbSyuJoH869Eekl0BAXwRwqqk+YhUMqkTkPTUEDZ22BYDU6qjl+IeGHfsIfjpPR7TmcZfWU51NXze54HGh66DxPpwCsDW28tK5Ltb6I+T5/pYJ/+nTANjJHrpBzcOTMpSu343FnBxomJWATDI7JBIXoPeJ0pFs6ZwmutOnMuydkpOdzDOXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f1vLbTi9fKLjup7MkbKDY5dDT1cFKNHL28OvmqBpRc=;
 b=g78MwlYIOI9X322aPe/elSWVleHteNWBrDmvTZiKK+H/jhoH99aSTAUJedh2ZPGDfgv+rDGDEdYML8peMIxhrvGlDz9ju0rbDwQdDT+AJ+BmFceIzXv5DHzGUwsZNOHWRiw8OOCzPOjbNrIAFa0KBiN7h1WQ4GPnOY1pB3ayYNJq6W6slRcnpd+mOilBDJeGeMBJ0G+wTcc7Q9ALuEvt13DvmFNFjIL1Qs4mHPfWD5NGduzzx8vH5hafNZHT7OF2CVmxxpddYDG/ALbHqK4236DTYl5L5qksgv/n7xcY+GSMX6cAS3k3P21RCiMc/OgkvkmpQDfYfkY/qEqxoARyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f1vLbTi9fKLjup7MkbKDY5dDT1cFKNHL28OvmqBpRc=;
 b=GVST9e7ZN4+iAfPMmSY2qXWLuRs9GPc0a4IMzZA1VF0u+KhMUOIyDJr00XdTX3TJXtRMBAmpU7hCh/UuBI/7QLk1g1nUGi6zbAln/ZgXD+z4IaZkfFcN4pY4ujZihZ3N2PNWpNpBaxYuKgXm/06DFfRHwIhfo0aHuR4NMfj2PXL0Mh9O1XzX86KvdirqYX/JWw/2sPHNMqJ+kShM4A//80jZnmhCW76/J11/8Y0WdohJZNSgNTjg/EY4WDL1Y7Z7BY8xgNdKExpsHcwWqvA20YcNisrl5qHSW15S1ogn/oGN7AJl7CBon+seh1RvYA4JB2gXXOUlWw4/GS79vt3pbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:13 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] i2c: stm32f4: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:44 +0800
Message-Id: <20230710063351.17490-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b9bb47-3ec7-4b28-33be-08db810faccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NK2s5UfW4DkJmSLwi22dBGboh+d43WG6k/44NwpmRMy30AAjCzTdAGiAw+W+QdWrZ7/zHnQGNIk2sWpVG7VGt03hr4yrNAAe6llIdSHR54HVa6l5fmmsx7llyns5I8W0AJ7SwdRgIHM2FxQqiQd4lJQ/maVm9Kx/+xjofsAgaX/UmYliZqcLOwbGlvKDSq4tkLnx0WThAA9EuI9BH3sZRPskw3tl2yTGjdf9eYY6DflsCsX4z+F2rC7I9VRlAzT7Z9SINE3CgRCptV2Y/WA8RTrJ0dVC1hJ56KHHhcYp2NJ/KvURepecWT8fbVxcbxdYX6/hfkF4Zlie6E22Me1GjhZsleMJns/bZxRCMySJOXP4GkErbHj9dXgcOSu6696szVZ5ZdsbUmyHUBuNfbCybDtKqnvCywz7q18ewieUCvnk9JRIsPNN3Wztrptq/vuOpH1amzgoA9psRbI5AAIaFPJaFav8plieM0mTNQWRxcxKGdVus2dADlxn8A/AeDqNNb5Zx9SRWyR3ZyTWRRz/bjvy/2RZyynF/CeOgph1s9su4P7j+dcdBpj9pNLPDz2Xd9gRITWwI4oOnZM2oAUlYZ6z7FsxtmWPMcB7oH5dvR9N61cRLicD2rCCnJpDgIiAkrSdfDDe45kTg3Ka00lizKT+1DpHMhJx23e5DYUCSCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/cxawpr5qTScAAQ5ti5ksHqIPz25jOE+zsGPosZeRy0AZI1P7dYxJiSVvjAT?=
 =?us-ascii?Q?2WQs7SNAW3096Adekm9srCb2E0CTgVITEUoXwEja2GjY6Lsb6lIK73iXnFwu?=
 =?us-ascii?Q?TDKma5xPAsoCBScefbCWxOKHnjRCehha35v1Jv+YOOGvWrue+i7Sq1QRRqHm?=
 =?us-ascii?Q?jdXFnVvMw6hu76UbmECtyB4DnORYfR+8NQLSBxX0VjHXYGBhVvRKoWXklEdX?=
 =?us-ascii?Q?eTiiDIKCBqHCWDzn4wE05bXl+IpdrfcbdcDlX/JZVB/K5zSJNWIndUrxyyMd?=
 =?us-ascii?Q?rW3kaSmtcZklpd4c9iQb6/zmhAk55lmMs5vBFJ5CaSpwi0mu9dnJt5+9t2G5?=
 =?us-ascii?Q?BJPpVHRkeOfToY152hVNlA/62j1LTMaTFj+sCcoqK6Keiise7tgTCF3doctv?=
 =?us-ascii?Q?sj8hxC7NFenpLPaZb+FihrGCF+DiuhW7BDsK9J7ycyo864oLoYzk72snQKsI?=
 =?us-ascii?Q?lgb07J/InlHFQ9ytfBVShYaG23SR+ryVs98BszI/03QGUu+7aYYnbhtTdifM?=
 =?us-ascii?Q?RjjbAggZ/cOq7ry58UwVVZchyYU+ibUeF1sW32OwIOfwwuesNbcMbckzmJ5L?=
 =?us-ascii?Q?UKg3B2gkILkHAB0EUTwTt3EY/KvPr44dVUdy3bxOwUeFmnM2O55lOCw7jHjX?=
 =?us-ascii?Q?XovapfTX+D1E/f5rzmvgZPUjSaWVlKxshwzP2LMKkXR4Tc7LU8mtffOJ3az9?=
 =?us-ascii?Q?XhoVsFjP5jukTG9Zlvuor4c+OyF6+oT2jiv7jWZdOHsZcLyQDt2kX/ngHnCR?=
 =?us-ascii?Q?hVe6kXIdNEX0588dtJDX8+Xe6n4CTpBPA5gLdwkQ4dgHmxJasbRJOHqklqQR?=
 =?us-ascii?Q?X/nqGXqMQzwthjJyEHQXF+vPg/TuVR1yWqxCp1YM6Om5bxpJT13rxGfMYq1/?=
 =?us-ascii?Q?EI2lr5irrU8GOyrHq9vIivA+o+HRd0A4UiwXDZHu7FH6sHvdnw1En91D8Mw9?=
 =?us-ascii?Q?UQmDBUThqeCaG2TpUSJmC9KfUbTDbypdWa0EU+MElxmIa2dHoywbmzK8CuOe?=
 =?us-ascii?Q?jtk8yYEXTwrdDIMJidXXtb+n078HP7yQfQRiA89hnHNd2sCenFartENCSdP/?=
 =?us-ascii?Q?aTARnYpzRu5rNM21SZi0BHEopgLm28d6oR9whsbPG+KoIberKbf3a6izIt1s?=
 =?us-ascii?Q?Hm5hsIOFDWqE3ueDjnUg9NHykdUgkT4cuCxkt6OVqUGyOTejhg4/Ao4qs2K8?=
 =?us-ascii?Q?Uml1AMk9hyIhBva02MRSCP5iu9NySe5Arb2b90dWy9iZOdqXVMc+kdwbwYEb?=
 =?us-ascii?Q?GogJFlnD0CK/o3iNr6DTKIpZ57P5P7MC6Vz/WI7ylmUD4XSll1OzaKn8P6fw?=
 =?us-ascii?Q?loeHaTv7oTNilMs9lbNz/nZ14LuN+AhaQ+3aW4M6aw/esmyQr1DsP7db4Qv+?=
 =?us-ascii?Q?vnFzBD3bh0vIgS+6AG/qa4zZvSxwogx3w/j1FFgIdXZAaz4ZEA9Ihn8plozl?=
 =?us-ascii?Q?qUmOSINt8DpE11mKL/eHskZoPii7mKU5k05NeJ6b1FyC39WlTbBWIle/tGR8?=
 =?us-ascii?Q?kPk2nhTWzAyY1K70gZOLcAuUzqo1cWQvndBlH2fewcKhiteazvnKoalUDVDe?=
 =?us-ascii?Q?sUYfWbli5h7EDFegAM1eXsi22EE/ehogzKcgDllc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b9bb47-3ec7-4b28-33be-08db810faccd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:12.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T91d5wrbTEGd3hdgwXP7VRonc5O6YjfB1hIJEgYpY8WHeleScogdUHwIY+tIuFO6W8VZ+OTQ+TQ8zoJ0+p2pvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 6ad06a5a22b4..ecc54792a66f 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -767,8 +767,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.39.0

