Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF4B748569
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjGENwO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjGENwN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:13 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B003010F;
        Wed,  5 Jul 2023 06:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfuaWCOafVDxyi6Rm+2E/mD+UPhSKyifuXuTX8zXyiFoD9RCDidgV3Vyiv6CJqaifjykkuw/B86pH/pATBW7JRaPUmofdyIm3RpLMXvAfBTzsACy/QidgzDAjgPycl7/yV4Jq4k2iyeqMKl9R/VPBwQvulPcIknLQCtyZWNzPSnyHgH3ib/mvm3ezSW5vCmxZF0hfa8r/odevkNfm6mRBWb/jZVwCr7j5juEHrZ9iwO1fLmmLCsDCLG9bErRr9aSKy3bl6TTpV+di/PUX/Oei8hItIKNk+RnOvz46ZM5xzUfVHTutxYgj5aJ7niJQ9nktVTjBXAgkM6g1ZvqFYpQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JhT7tYU77z/kX/T4rfE0ji973y3A2PxXUt6jegiMds=;
 b=iyFtLUQIF7jl8YxkF3TDo+drTpsoRXxKTAchQfXcNzdbc9MhggecYdqyBNB7ZQmrcqeQW+nUqLKmdvL65Yq3SgN5qNTv+reXRpy1W4uastyAJ6ji1SoTSYmwhAF1JkAAxALJgUjYGcix2/xf/ts5KkoPjk/xcDTEXuBvOLopjlhtnYYl0FvUEzjdQ2hU/3AsYUcYgZl8A9/t0+dnmYeFvdYUEG6F561mBbPMn/xoZdKzi09Njmnr8veUwVAyHjH8WewgWSxOHfpvgwVC0Zx2YcHPqZk/zrdt/z8Z1ZeEDRfFToHAv3h4QkpD11EYihZEr4rMSmid6Jd4oA5aJodZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JhT7tYU77z/kX/T4rfE0ji973y3A2PxXUt6jegiMds=;
 b=W1rXeErzY0fxNBHQwzSL3aR/1aZPSN3ylK8jCMdZovBzMds3kMRzGs+R8k8S5mkY1a9JRZYVhmMU4D7lGdJZkM3p4sVQhJQ4Uj2pVZsuW1eBavasGez6NOZrnaIY8S/nGdm6p/aBXlhDaT6x32GyEFHZ4Zv1qcU+pPu/TI9MDHPFU5G+sJS/vCFuY1MSK5SuYwYyrxiKKL8eFHOUMV3nmzSgM5iD8RJEQaShDyXTTGL3+gZaz1fTBWJliNP9GskWKibUzbUX486SH6mchVUaujBUzS7BFaOuUL3a+cizmFP4rtRaP+DUo3h2yxZlixWqzKwDqa0LUq80Hz/+h/nUow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:09 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:08 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] i2c: at91: Use devm_platform_get_and_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:48 +0800
Message-Id: <20230705135159.33327-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c1df3f-ba78-460e-09ee-08db7d5f0631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnYmh15NcTIckIxKAWj+RRYXsYAwk6sQfU7ojQRX3lmZ8d7m0lgZk7wA5JadvPIF/fTXzfk7thJO3PDIH3Mlwxh/mIS8ESOHrTbXRus73iFCHRczSoYYB+4JspppV+Wu4HimO2YGE7pxW5amYw9g0CoR3ZNcyt8HzRH1HSOSEz4MIYpYwlTPfYG7kGVL4p4+jYlNcwUJ03EQ+sfY18mBuXxHPijm7eHD2/2jhadY2l38wxPfjFN5IDpx1CTOxZ6bBcFqGfIqxnFnHQAMhVJv9avgZcpOgfyhTyn4ZAf1qqFH9DhL0AlZAFaORF64yy8LqGSSgxI4NyxaIguNjW/MYrp9ZBaJmpOwk2kWJfVLWi6Q+hr+llH1u6RBNufePwpmvngpcLz+eikjojyu+EEThbwzhWFT+65zJGAg2GHnXXLXtmUzO4r05U//xuuHy7R8IBvA7aK2yFgzRDRCqOqVEVCGTC99/L9MNGptJwWxXXEaoSXaqINX55m/czNxR3mEzSbPzZItseuzRB7NJ18sVgOLK7zdv2dCL29rrxMoaP8rC/KGI7qMhJx07dGP+b67i1WVKnox1mR/8Jhu/wqbbG8Vq2TGGfNbSIk4oGU9N5CsaniKuyXqKROr8jwkgHyJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cPkFrbYlNQKjCQ3MJhypN7dM/p8Lr0zgrg3zd+44+Alc8GqdLsnjNVHcpxz2?=
 =?us-ascii?Q?ZUCiEJ038AFxz6XNGXBYtPu3wFBCTJTD5acdNI77y6ms06T2YvuzQKmeGopg?=
 =?us-ascii?Q?xuKeODhnAT/3jphjo8Fx7QoyW4pVMZ8Uk6QzgLx9NEUpYBStnzz5tfY0e68T?=
 =?us-ascii?Q?PhZBlY3fhXU5bnydn4hs7eGzrMWXRJpmnAuwVrV8EIfVTCRvs6OQozT36H16?=
 =?us-ascii?Q?KSFRBb0zjg/PGtTvKIW2MfbhJ/cIw+SUdFUPTwk8FOyfqu9RiEsbXtFHUJw2?=
 =?us-ascii?Q?F6BRAt3IXLSMT3krPQUcu/tfoNRivuHYCQIPHhKAFcfmWozd2woKpx4FmlYb?=
 =?us-ascii?Q?ag+CmKQ+p26vr7rgwOMocgYE5Pp8/mEx9MrN4i/HDNY3eObTmDoBqF2uQY8L?=
 =?us-ascii?Q?wiccByuTzWezFx6jXB7mFNQf2mQAkNr9EMlsQWVBdXPhQPsInvZQkvJImAZh?=
 =?us-ascii?Q?Zc8OMf0fZHtC/qvcAHy2KDn5DSkdtcBVOBRFWTWQNC8ojFc2k4vMKONPOz/X?=
 =?us-ascii?Q?qFb9yAf5jCBco5kTW6osKG6zyPIi0CYDYYYXPURtoO0bTOKt44arns2BejHK?=
 =?us-ascii?Q?tIWgHZDtNsFVOXSwlM+RGC/ok3mkxkcDmuoaJIVL7NsH3H5+ba550tuHjQUn?=
 =?us-ascii?Q?MLt3A1QDwDZKs4MNwS6p+IRKmJAYV0dJivEdpy3SOBBGtEak16trVBO4YFTS?=
 =?us-ascii?Q?5p65HVZSW0EaHL3FCNvzeaLEJcFrMILl0+NVKdyzXTSUdb+vGWIxzRHL0Agp?=
 =?us-ascii?Q?JLeIUpKTZg/UB+OYoTOcDvsoCP3tmjuZpHeoNA4GDYBbBFvKOX7G0Twzqb/F?=
 =?us-ascii?Q?/CXS3g3INRLjOEv0DZiiHBQjY1n1vUQnVdfs7fiZ7DqdgL0awFk7XIqrveCU?=
 =?us-ascii?Q?c/MWGAfZLqCC6hEr1B7NsZQdsNRiKTW/i6BUo+ehmhdPypkbTyhCq+wj8dos?=
 =?us-ascii?Q?JBifU4N7mbBPs4R5h0JDLBq3Dgi1AI3MJfhpbdOfcTir/2GlGZdoNxcFhI5g?=
 =?us-ascii?Q?OLhM+7xT2QojFxHkmf5ZyeIPs+o7cg3L4/auXTXo2EMN+HDpfa59rjE6YXla?=
 =?us-ascii?Q?vwy+vXFh/MHB90XGd84MzgibiuDrHGOX4hrumzheHz8jYlwGgJMW3cTeNjcL?=
 =?us-ascii?Q?6hpFQAgYlncOcR6pGtOj8374xMgeFapP+kdlL50w7l4YXPDPyiurE9VM0Up6?=
 =?us-ascii?Q?zGCPMjOLgZMSyOzNvchzltx6bOHGJWhjzczU8eIGvP1CdluGsDuAbSNgdIfj?=
 =?us-ascii?Q?7nzqF8D0bxHx/Xjuya6cO7w4Z2DkUTxTOmvMmpTCFSavqiEkxTbr4BqYWz9b?=
 =?us-ascii?Q?X+VNqvY4sFaVwXwqhoKkqRQLaN8YDGAQdmsgsSyLYNTnkiCG7ill0xlWLeVS?=
 =?us-ascii?Q?t8vxm9d4VXBSWthvz7+qXP4rVhy0TCweMdxnJ+aS0uEbIeUqP87O4Pr5O2TY?=
 =?us-ascii?Q?CDs04eNmZ+3Xnud/q9Tjjei+ytuw9+s4jTAiT4KmlAbd19hSppJqNNbuzbsn?=
 =?us-ascii?Q?gBEHbpT8N1RiHHdoyPtSXJMAmBTGb8wme/JGJLvEYHDa4575DOjzfow8e3ts?=
 =?us-ascii?Q?yfNlL7wOntWmNRZNBIqrPzuuDmOciBS2cD0WYY9W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c1df3f-ba78-460e-09ee-08db7d5f0631
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:08.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF9zwR12hLYaVoRyuYeZzMxedtI6xFQQU1gLy72LL+OiTJLqc0ZMiLnCdDIt5KiSmO998zLbFk5vbDZyaipc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3991
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-at91-core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 05ad3bc3578a..de3b8f1053e7 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -207,19 +207,15 @@ static int at91_twi_probe(struct platform_device *pdev)
 
 	dev->dev = &pdev->dev;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -ENODEV;
+	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
 	phy_addr = mem->start;
 
 	dev->pdata = at91_twi_get_driver_data(pdev);
 	if (!dev->pdata)
 		return -ENODEV;
 
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(dev->base))
-		return PTR_ERR(dev->base);
-
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0)
 		return dev->irq;
-- 
2.39.0

