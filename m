Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5547074856D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjGENwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 09:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjGENwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 09:52:16 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2118.outbound.protection.outlook.com [40.107.215.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F99FC;
        Wed,  5 Jul 2023 06:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMO0A/Hf5EMMftm/1PYK9uiWsa0i8rcCtm5LcBxgZvPVI3G9d3bUAdPocpfiuU4VujUbyk13UTxBj4wmicjDvjtLGQCFpi+cjdVKF0HrOeA0IZDs6jPOPYNmiLzEeoTh82ls1/v9uAgJ3zo2cQZVXVsDajFdml4zamZ6LeWODHsDYHXFXpc3lE6Gx8+dcaI1r25RSP8pEIPCXkMsGj0JEHsnPvjJEzgzCp4Ixx58j82gvIPQkRIrDWloVot6doHHYHrjFU09adYzaaV5o4W7xlMaVL++vW4IIF/AmO/QaTeZdTkyOWgRkCqDj83xVguOh8Ms8VQErzu4p5Y7oyPVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+wD2OlQ9bWbKD7HJUG1jwJAxm3onlW79BpaaRcJxpY=;
 b=WmXR8Cx2TyumgWZzPzIyDlGM3xomlDuaYqsSZONjjuaRldDw5OPa83wi/XGgNuD/8sMNS35WT+pBFCAH68mmg4UIxHsTAeJl9tu5ickJs+/2oB5ty+4Aa98vsCJKedu/n8zXJMHREVclf7+BnrqorOdRGmio9naOdme/vZWL/Qkh2/Q9ZNAAk5NG/FWADuvaxHDFhdvpAqQOdM9vEc1AoEBL27+oDU85l4rX0q3J7A0WR3VsQmzvZy/1SkqhrWDYMTfU7FkGUEly9Rkz778p0gfzLFlshvusyf+qRNBGM+t3ND2MkI3kpgMZTT+C+HMBRhY1kMGI+vu8ldFOc5eEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+wD2OlQ9bWbKD7HJUG1jwJAxm3onlW79BpaaRcJxpY=;
 b=LudEnmR288QU9MeC9KFbOvzdBVjUI9wNqqVg+LHbQrW16rOvgvMcZoFF8cn2hZyF2marJbKnqbh4AQZJIyY7Uwy0KB9UugEJn9VnkiepqNTazZjLzKLy5rqawoamwH0UC/ngkGXvoX1kxpdQuZZSvjE/cs7KwOM67jFun9trd2qRvyCsTlvT+qM2BDsKL2M4wckR22xd+qtoeRNULWneQQQjW/umyPJmrEGkfUcKZrFX4Z4hozGpxVV6K0IXMswdc+TZe8Yi9XUJ8zzBdkkJT3HduB/pa7lj7irgBmbB8fiapihddggB8pZAQMe+uv4cubtb4FQOudK7/KbMhZErIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:11 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] i2c: brcmstb: Convert to devm_platform_ioremap_resource()
Date:   Wed,  5 Jul 2023 21:51:50 +0800
Message-Id: <20230705135159.33327-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230705135159.33327-1-frank.li@vivo.com>
References: <20230705135159.33327-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4eba2d-e317-4e3e-7f62-08db7d5f07e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HoRGqvEHuGLEv8OCfrKM34pIJj7maZgFkI6Z69T3J4yEZvxVpkZn2LYsqF8NL7vJFKph6Gd6DslQV6YBo+G8NjCEe1PdxBQFSJ1iGHkZ4CF8SXlm7fK6cJhzV2vj3TPsZRPbFVfngfV+cqh/ZNoq1RduB2HvnzRP7s4YI06F+mSMk+t9J3u2X4Pm4K/Ymhd5HT5Ih+BeGCAYVxVeKr3XIWVqKkyjg32tEem52W1sEXpbEVWWTt5hhr5rrx/FB6IP0oVWyQ+5HM+8x0wLuPEey4dN2PEfUTlpCfq0JeAHwf6Twulesbh/sHl6TCbMLhpaQ/4sPbUFMfzlaCJ4g+ujfGaBkb3BaN5Ig3w7g7apyUoptlgXfRH3MFzFrKVkULPzG5cwM8og6plM9zLc66X74XAajJJU3+dlGzSgodu/IAbnTdHzFOfEheD44dY0jUnhS1YtbpkzgcUtaOUiu++clOUqTwiCB2XTTIsd8X28bkiZ3uf72dUp0qBIYZu8LqY+S4axR7HsIgsyxkeBPvTmz6MYLPYKEe8qCs3vDhSAGOH+xoyo03rXFKqrq8bWz1LGN9Q/RAqvmci95BUUGcDxjhXI4Eh9jasJ66Ji99BGrZ/6TeqVgujDkA7leqSJLH09MId7f8jnaLyGaJuTPJe3CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(83380400001)(133343001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkHVNqjfRNKkpdeC6QRJXJ7ZWgJHdKZThQG3jgpHsPjGImh+Vky051T0X/Sx?=
 =?us-ascii?Q?auzI89jCM+jrlR+MPkWfGjzIjkb8oeeR4ts1ivKM5aykk9JYI5WINoN/eSfl?=
 =?us-ascii?Q?eSHdDoeFLCoiR6X+GoeGPbPcjKWSK8fkjFWPXgN7HI2CWpUnMIwoxl+b1nhH?=
 =?us-ascii?Q?YSGMx5x2o56fp8pDuHO3jaYmA305/IFDmYxjKHSNgiiYyiAW1mXBn7+GLHSM?=
 =?us-ascii?Q?BdxBYsgIMnRbqCgLckAQPD9MnJ1sPTVnyqD2hSo6LgyzEYOkYne5mGAnHE4T?=
 =?us-ascii?Q?kwEa58+ddsvceDBZhfABi8An0lSyS5nPgHfj20UsBpVpm5gV7Ya4gOGaOmBW?=
 =?us-ascii?Q?Spy9/3eZhxvfhDS7fCqhhk0UF9qMcmIop0V5cM565UMst+qcVVIJMk9x2bvy?=
 =?us-ascii?Q?oGK90OpqEtvZZpakve4esxZzm2Ev1oVVu+ZEPdHujP+L88ZjNOxkZsKS+M8S?=
 =?us-ascii?Q?IQfw2B3F+Y3/TeryQ9lXUJpXIw8rADi5A0FUd8zhumu0rK6lZ6E/0aydeogV?=
 =?us-ascii?Q?CluHk7lXMVSntoMpP9Y+lRQBlBT6bYCSa3LhF4mbKNERG0cjZCMWLCJr+nLR?=
 =?us-ascii?Q?eMCoC9WNceoGsoGpSTfxOwjuuWXkZ+f9VYWJetuxLPw5gjD8wlQ3J16CbTzX?=
 =?us-ascii?Q?0hd4w7KEAZFumntlWdAsvpdnm99aV0HTx5ah/LK1OPcWiwyZbES6XKkWoKor?=
 =?us-ascii?Q?Znr+btYyI0uygQZA6Jp7M9ViwspEaiU14+RXhXqGDAwt6ZYBSVDA3W7p9jUq?=
 =?us-ascii?Q?vrd4VoAIIIoXstKdzwzKgtqrn0jx9BwBxDTdYssLUA4b369wE7sxDDZyKwFR?=
 =?us-ascii?Q?sRVmSc/p5c/HU8gbUdrFzeAJkh52i3gKKj10Nj04wFZnEq7+mqiT6uBi5x+c?=
 =?us-ascii?Q?ZMDWULWMEu6/+9y6JAm6RqHUnlzVRBAti7kfPxCFyCt1WSpUrN7Pjxp0dr1P?=
 =?us-ascii?Q?EVLEOOj5WvqioaenKavTyL7YQvP5w6FGQ2BJ/v92rx0cUbuGXOossUr6qCTH?=
 =?us-ascii?Q?HMpws7r4+pUXZDSXHDxyUAcfGkr+D8PvhAaGAUGvyAgVFH0HiDEx2yWyPVWu?=
 =?us-ascii?Q?TPnJ0BwS1j2Ut4RHmSkDLhmy+953h7pAaX+2HXFKdsY9i/CTCIE9Rs/dHFoJ?=
 =?us-ascii?Q?Dnr6SfeZUwgwFxXg5WTTDJ83bPkRXm+eldY5ffa3x7XqsAN41IWGopU4AOPF?=
 =?us-ascii?Q?jt06hLAMSMLSB3cJUwZ+rOebBdEgbNIAPQe9VYR0EbPuVqlv8UJzxN6J2Ti0?=
 =?us-ascii?Q?MIFPd2L0s4FMG66nDgjNcUo3atPqEh46bjLxwsBbce+yCuBR5gcxrFW93OMD?=
 =?us-ascii?Q?tA9tiCHYiAFM41cS4cWQ+8S9n16dzxbZFoV5vduJl/R4niPayoPFaW7yzpzv?=
 =?us-ascii?Q?x/QIncC84404yF6vKjpIZZYgJH/KMi1JV1Iudx0vmp8q2HjW9QAurufzrYxb?=
 =?us-ascii?Q?pfGN5I98KOCJnuKAuqjGELELzl7eB4mlCyWTkLjDM0uvP72nsxBvuhOd50AW?=
 =?us-ascii?Q?Pr4wXbEbMcYWcs4d7vcXWBxe7jU2yfzHqgjeQdQSzic5vK8l0MrfOP3c9sFy?=
 =?us-ascii?Q?1JL2rKCGt3LnnvCiCZo4LSMp0BaFhEZJQRSgKQZY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4eba2d-e317-4e3e-7f62-08db7d5f07e0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:11.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeNOJUHduFqIChA+otRU02FimWXDSqnYL+zGrwpKI1Tzxeo7WkK0myGE+JAhexLL4Hdw6EIBFn0CPssSmsEoBw==
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index cf92cbcb8c86..0d422487161a 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -594,11 +594,10 @@ static int bcm2711_release_bsc(struct brcmstb_i2c_dev *dev)
 
 static int brcmstb_i2c_probe(struct platform_device *pdev)
 {
-	int rc = 0;
 	struct brcmstb_i2c_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *iomem;
 	const char *int_name;
+	int rc;
 
 	/* Allocate memory for private data structure */
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -614,18 +613,15 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	init_completion(&dev->done);
 
 	/* Map hardware registers */
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(dev->device, iomem);
-	if (IS_ERR(dev->base)) {
-		rc = -ENOMEM;
-		goto probe_errorout;
-	}
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
 
 	if (of_device_is_compatible(dev->device->of_node,
 				    "brcm,bcm2711-hdmi-i2c")) {
 		rc = bcm2711_release_bsc(dev);
 		if (rc)
-			goto probe_errorout;
+			return rc;
 	}
 
 	rc = of_property_read_string(dev->device->of_node, "interrupt-names",
@@ -678,16 +674,13 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	adap->dev.of_node = pdev->dev.of_node;
 	rc = i2c_add_adapter(adap);
 	if (rc)
-		goto probe_errorout;
+		return rc;
 
 	dev_info(dev->device, "%s@%dhz registered in %s mode\n",
 		 int_name ? int_name : " ", dev->clk_freq_hz,
 		 (dev->irq >= 0) ? "interrupt" : "polling");
 
 	return 0;
-
-probe_errorout:
-	return rc;
 }
 
 static void brcmstb_i2c_remove(struct platform_device *pdev)
-- 
2.39.0

