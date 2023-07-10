Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929B874CD0B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjGJGeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjGJGeM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:12 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA38186;
        Sun,  9 Jul 2023 23:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBwalNO8UEMWZRFsETEckb6WDxLzH1xJHHaP9JEW3txUtuVdyDOuLv29UBWCTZVD3bUndDN/2opKBxwRCWQYQ9o0nhKXXlUJI0pCCYez3gDVmLdH4mm8gLQ9uf/RgfiVBigxTTkVbxsAzBBQHHE4rk2ihRXjQGHU9e4tBFEHHcVQkKK+yY4UouxAwDChePZcngwKCkIDW4TGffvfuAvC9/tfCZmDzT2ll0x9JV6a1ChNvKAl4VQuXkFotoIFT/vCch3DuxcitdFCkjWkA4+HgrJrgPDLvLJmFjVxg0LCciZsUTLsDgBfCya0L6NW4YcXm9ryHD47pMCJLJWbCc0jHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JhT7tYU77z/kX/T4rfE0ji973y3A2PxXUt6jegiMds=;
 b=V/yIi4Cjz0NAESwdv1BvHT16wTn1mrGdZyG2Mmhbr6zOwe7l4alKc7WDwS4JKx7vfj8oGxaWxwTM70ENMI+n5tnlXluPLpfXPxhKkFhfOoMM82KOcTKQhU0HzWb3u3if0OLsj6i1LL2zTdfgP7CLKK9JnY+DGx5KmpvJJgImRo6Elf7uojgkzrtSXQMqMciAFvO6a+/JnxPKmZm6o+v9ZbtsgwgX7lilkTAafWh+Ryn8Oh1jTpj5rGuIYFmApjn3TSOiHbvQfl35noDtaqGa53mQ2tKPY4+50PlMZeS/SP/Ft/RfdMdQ/7xanhBDXz95lmUwbRTJTP0DeQDDZlGEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JhT7tYU77z/kX/T4rfE0ji973y3A2PxXUt6jegiMds=;
 b=XOKEnIz0TMc8wgSA28QhG2qCIu4yIy/Detdm31ZLuXQZr5ZhbuOgdyxnNrMOgPfR89iu8nIbwcKPicu1+DIc9Ro/I19a8E7hJaEIjWMwx/EJH8s6r/ZgANukouKN/BdvNUILaiJsyKGAu3E1nayZMvvx6rIrRDjMdPOwZa1VuUExFmN3K2mvfkWb5DadxIdwx5zzwEEl2jlJ1mpZFqsBwNe/7l840Ki8u/vQYWXja6VI2syxN2J+6/Oj8nAPnjdaYy/dfJiYyEQhCH4G0ClDyGDId7FrwVyErXVRfcLnh3Qi4apQrkLCgGNxKMBwSFatcbjeHUkQ6dfisYcR/Cgihw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:02 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:01 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] i2c: at91: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:40 +0800
Message-Id: <20230710063351.17490-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d686045-ab26-46e6-4bb9-08db810fa61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3+MPNp9eSdvVWwno9NN5vLGLWTAlVlMBB2Pr3DRDWOeazPO32nu444Em3EqGa5q3XwqqT/lHGT0vkcPU/xXrPVgNDjqLhaq8tYENvnx+2R1QrAMDki/sStmOMpDV6qmdvmyA1y+/Jl56tJV80KYhdFITQKjRJI23j2Xg7g7BipLC3pjq3uy7Pgfe0KnM4LqXPc8+kdrISc0Urm8EnjtKEI2E+dCZXADrUtkOsuEiO9D2A/cYlvtXt9VrNdvw7aQDFhYGhfbi1rVwL+hRReHy4ApdKJGY2xMQbs/IOBkhpCO4cOGfPDRBqNrNiOPvjFVMS8PK4zBeG/IKVcSnre/3Gw3+3lFxgNSV1VWVO5kwixh8MZrAiVrlTITeOhPLhRGt7eaABu03UQ+rInRxQLCQHjTWKmcbT6u50S4kiHLu5AnhGSnC90TxsluxfyU+nIluH90Qv+B9D2vWABw6jA21cdr/nHoYVmqoqRRwAcyOPe4EScCKjCLj04Fd5KEYH1gk1vz5bNjZEx8xrv1H4ysaw9/oVOpltJ2lJqsy0G7fsB4Kjwi+cezpVZMCRvjs+lMxUTqwusvlr/4GrezBasGC+DckA4onSrqIv8N0vkV8jUo/j8A+aXKbpL0kmCC9GJc+DMIe0cc2AE9ax9SjeC+LGgJhgxp0Zc0fqe/eDEOZnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbrzDYhMfQA8X60ojhuaCFe7d8QnwPq+RJ4UQL94z77GL244bdQF0W/b5f8J?=
 =?us-ascii?Q?po09f76ZWLLPpxOdSzYcWN75u5J3FgCJK78AO+dMpM+gXJNqGuWKWh8NDqJr?=
 =?us-ascii?Q?ck+AtMIGCpq+fLYZs0ypz1lQeF6inJjKcr+HvVCLtv/lOmnKzmIgFupDKIJH?=
 =?us-ascii?Q?zzaZKz7ZDgGw4F0uZpHPWGQSlwojZR/FNFXo+x7HYcBRcSIDZFyJ2rHrGKru?=
 =?us-ascii?Q?MnliakSY4tSjlrk5b6AJhCyXCdQQRsB9TfQuFR/y0+i1XDfs/fvp4kQsU6JJ?=
 =?us-ascii?Q?IIqUuP99s/RBW5QK7Vr0inRU8hphNiZ9biWOOxkOZK/V2kFOq8YVZ1p1ewwG?=
 =?us-ascii?Q?9ii8vsi++EJcskRpUo55i9JCIfuFZMd79VQfnG9UoUHuerqDGdEuLmwQP77r?=
 =?us-ascii?Q?eU2DAQuiLuUobrl5b7+R63jDw/oL6X1LKcrvyaCksYYflGE4vb6P/e7DWlZ7?=
 =?us-ascii?Q?MBMMSELU4y/hKzhPOK/wvsbV6zMhbfWJEW8pEaMZjG0KcYRJoX1NxL2m16dR?=
 =?us-ascii?Q?rhX7gke2UbO+oPdMzy9sDJq9T3fXV7XxA/gY1R3DCtC9gjpOV0NEQszNZ1as?=
 =?us-ascii?Q?sWMukQRghe+Jp6cwwcn84bLKaGoPYObM0po9sMbMXFNsP7xCZXh948NEUAi9?=
 =?us-ascii?Q?dlqwKpcLSKKGEOdU5VoCb6xkp0AoGiWuAlKyARfnqrDLk8/1q+fnPNkZkvZn?=
 =?us-ascii?Q?h0fT8GFHUuTNODd+0JFTVlRQaYz90R8wx62d1LOEORnoM6EzpI/dJLXj1XtW?=
 =?us-ascii?Q?57F48kaXwRO4Ou0qq/Tw+Fuul5k1o/uShE1wJAdehqeYMYB0B3FXVS/q8Bas?=
 =?us-ascii?Q?wbzMNOPIZmNyELYbKVlh11ueTyXtDtfIx+eDQYIpK2aKOpRLZnQQ8eJqlcEv?=
 =?us-ascii?Q?tGj0SZkDri5encrUs/za2471NT7EbhXPnJnSJfrqgzzCrPdA6wD6iPaqSwgX?=
 =?us-ascii?Q?FX094HfFcLmh9JTUMq6pP7V/gHfOz9JrsW+r3oxxt88ckz4QV5wIIpl8x6OW?=
 =?us-ascii?Q?AYUasIqRGiQQjx4ANs+1UvQSXIT5QCpRLBVlQN6q5w3OaUU18HHDB5aOKFCc?=
 =?us-ascii?Q?E4x9ugVc7wkPe0b2OlfTqySpM6YvbZYmZAhDkrEFS4e/QpIJImVZABsnDgxa?=
 =?us-ascii?Q?NCmN3WD1PAMTHjOaKGlQqwvkfyR38TpcmljgKM35Vcpxvz0cggZCOycPuI/l?=
 =?us-ascii?Q?QemjB7c1NRe9GQJdJGINKT6HO3Oco1HXzPBojp6UwSJXfVBsldiRKNtcmiq4?=
 =?us-ascii?Q?V5lSf4VYNG+z3dLFpc8uat+Wgmt+96BaGFYDrm68ngHpE2jo0BLg/ZAwSnj/?=
 =?us-ascii?Q?UGZL44LiMDT25q3tucLjVHBCtWOQW4ij81j1uCIyPi+egUtSfdGubFV7mbT+?=
 =?us-ascii?Q?xla3rCQ1XpzGI9yLU8B6k7KUFqJ2IH1vvIV/A62gVtV3jr4gW2RYJJVaQ/GD?=
 =?us-ascii?Q?4yTCJi4FWSBHlBttjYf0tfDNUyB0PgkKik+Z2g5Di01qJ9Cv0T8+ee74G50O?=
 =?us-ascii?Q?3Asmeo3wGiIPNG/8ZK+2YY5+8LSO8tYe93b5CQtN1ukJLWMNqI3ZeyWgHfhc?=
 =?us-ascii?Q?3frssm1OQMmkORyEZRI36fGuXFKlgq6jkKj57GUi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d686045-ab26-46e6-4bb9-08db810fa61b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:01.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnsB5Y3IdgUWq6/4zvsumvNOmfXslMMBNkf0kInwUdhCeHTx/edM086UOvbG6NWsS46vtaQYYy0hu9i7FDAzlg==
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

