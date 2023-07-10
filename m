Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034BE74CD10
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjGJGeg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGJGeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:19 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2112.outbound.protection.outlook.com [40.107.215.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01231AB;
        Sun,  9 Jul 2023 23:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVCwCDLFbYy/UnHtcFFkp8Rj7Fo02/YrV3b0dYzXPFWG7whq+XC4/D9OOA1///ehpYNq0E9URwYiiiXjKBv21uVBIV2PUqtWPzlO3ROvFBU/0f6/fJJ4Nrg+pLYHQVFaF3ATrmBbtAwwYDHVucIrsvUmLvhl7q62s9eELcDySzTL/j6Suu7tcWOAAf9ihtvpUx4HyE09HMnn3lgakxYuw8flzfieXKnclq6iezKJXVsioTor73+PKFmWg8sm0uNarT4WGGMRCqEaemDBPPAjvQeoHItn0KJbD/B/WWAikP1eiDiaoZdOctQhnsaeQif4DRO2f39UCRk7Jmx/5IcZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+wD2OlQ9bWbKD7HJUG1jwJAxm3onlW79BpaaRcJxpY=;
 b=AczP2kkzwGpMoelA6CayRZDGkD1SleecE7aaJnhDmcBidtCq/GJsVR2XOUV5u+Ewwwp1AOmpSNtQwC33PTG0CFeLuVjSH6IYLj4ZG7rOsJ81Hg5VAfnWOZkRp37MCfxajOYhdjiXNG1BtPZaI88U8/1ff9S8l9Htt8+QYSMtYziFEjW+UgKEybryv+6nNpwkg5+q0nW8snPSRTO7mesW/vbomPFp/Pmm/q6W281NPL24IrqHpJcbewv5PwZdCd09uISHefEjjCXadjULQXm438V0PEMT/P8Ghp8dxx8zoJHqRyDt86sl92vN/jduUg87rw5OzieY6UT70vRwFaPvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+wD2OlQ9bWbKD7HJUG1jwJAxm3onlW79BpaaRcJxpY=;
 b=Vx2DBHst3y7dGyMTThX1WfLQABxQwVeMCZptj/xjOBitLVKZJ6AFVtysruewKeNyHsd+ILmkoPSSVt0jpKWiK9MNh81n14Jqi7CE5opguOcJTLnpSPIq93eKsRSBel43GDf8hjX7w6FUotE1J2BU2a8W5R5DgcWSBJR7rzUFYHgFS0jEPS7yPgC3E7D9uxbwsn8hQDs3XNHvZ3E1QZcaWf/1D8Z7Gj4mVizp0wnJC/+mNOaFbn3OiN6I3EAtIE1XVjAJZ4nBdvdfV6M28O5cDfkH1JCyefY+8vL+fAQgVTWfp3K7RYy1zgw46wL/6oM4CEQcghuiGhpLYU3mh5764Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5631.apcprd06.prod.outlook.com (2603:1096:820:c3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:08 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] i2c: brcmstb: Convert to devm_platform_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:42 +0800
Message-Id: <20230710063351.17490-3-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8ae2c8-c0b0-4cf8-d952-08db810faa06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmjjjf+gWpwssElq8O2LvZ3ZBLwhKZsXyQtDhobsBmpT+0/Dnq1GZvbjZQa/4j1jylYyfWEfezK3L+N+67LGOx6v98o/6bdRGI262QIxYQ81mv5WgUsuisYXjK5GLu6KbH+7/lFUsyLO+jSfkmr+colcZAUx/DdtmHYnS3aBRWlgA5dyZYKae4KqGQdtxq1xf8zP94BXgyOjpFIMFIgFV3BQYx4ELwjlhoECFUERE6sS62266DlN60ddYmQ/zaYCQc5VG/ZEn3/bqg3qrBDnZPXsHXGnRLGwHYhJKV0Wtox0gHYD1B8z5NyAH7cwl4D3kQu1o3v92C9BbmL+NUvP1QTjnXx3PbJl/EmkOmu3pfHAzIA7t3xpNKiUgW7iPbyv7we0FHBoWlpuaTui665cMmWfjwp4/+OJzJatH2++TYMzdcKJxiL/WGlpChk/EeXqYiROvpjTVIxQsLBviP2conOvtOVwNKrhmnc1MhSD2AWf1BL5wfBnRuLjqq7zILCCyBg+2uoyJUXD2f5bSMeXQ2shynFpu+MlweVn2z4KT3yMcq3BPjzfQKmuIQvZ4v1ka7wuwpwreoGU1mjgljlQBChKdjK8/Ht8YksTanCqDq2d740gZfQOWfCU7fStgB5I8AgOa1CGNJ5te9AjvDW2oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(66476007)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38350700002)(38100700002)(133343001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GGA00dV2vQxbnD5byvtFMw7nxmICjKvNSV74NLc/Ieg5rsEE7obUNSwegBtZ?=
 =?us-ascii?Q?D97CG2ymSVBfKN964DvFhjfUHfcBh6Uuu6lRXol8i6rsCqobqILNb/FjLYT6?=
 =?us-ascii?Q?u2c6MzKjiTkYgSteIQEcWpKygOEgW/bMoM8V/+x1cFc3CRA2KMrqT5OxSNC1?=
 =?us-ascii?Q?L+bsbki7EDVkViqpSS0IWzW4Qj2YGAtHcCOzAVN66jflGRFnHfBfvOgDNxAa?=
 =?us-ascii?Q?+MZRx7SzyRiGX9bdzJEoV3dDEQau+e/eIm9UoUSwQtDrSwngme7Njb7fpj8j?=
 =?us-ascii?Q?RWsC6SSrCganSXkturAaddro3VlDMB47m/ZyneiO7b7oNbC0a30jMBbLAc/Q?=
 =?us-ascii?Q?wZj3Tr4P2p3SeJg02x//XMgowCsAQBtxrH/rRK1r61kKF4/0j+WqJqpp0cz/?=
 =?us-ascii?Q?vSICmzTiy+zZTyjN3aFFsZ5lhJgN6UYm0HR2goGaoh6IZvazGF9/nE1zjVzQ?=
 =?us-ascii?Q?yuS4G1tP5Elohj95XQUQ1rvMrukvUNagJf05OboFpO9mRUEy8AM8MfLY6Q32?=
 =?us-ascii?Q?uwC096jytHAtbgcELiPmWeSONESP48PE+z1SbXCG00a3ZIpNon6xpKTjcKKn?=
 =?us-ascii?Q?17Kh5uhghrQVfeZtTQm/SL4hvA3z0kok2VlAkIeeOV4DOVYVIXF85/ZatFLt?=
 =?us-ascii?Q?O26WegoWnwKpJqnMmeatQvJ39awx6Siqu8NaoE+CAL0hZ6pOTrQaodpZmYtl?=
 =?us-ascii?Q?7q86lMHcrLOicgdV2dsTsaSgVG9znMSfjJ6akgbbHbJUaJtVLSKKZSGLiAZo?=
 =?us-ascii?Q?8dpIVLCkrIP/mGzVrNVrqUQL6UuPnOY9iBKREX4polAJWRB+HYusDUbXQ74/?=
 =?us-ascii?Q?gt12x+tDy5XNT99EGb/wSupXauUny7mvv+TFEw4nDhiBDDqkzM/odxTbHm3z?=
 =?us-ascii?Q?ODMLAuYDOpuE/miVq5/k5zwlcKRDzFSXGH0VK45nFAzne5QIy2GfiRylIN9o?=
 =?us-ascii?Q?Pe39xrA1DD8G89b0q3eXrBmkd/SsODYJ+NFNk99Q3RLl+psFMbzFhpgWgmkY?=
 =?us-ascii?Q?A5RjuFJpxYEzzy8JG/llIj6EM9SsOSRiox5ZF5cE0Xrdl5gov6vO7nVTS/gV?=
 =?us-ascii?Q?aQGal6YrjsZJj3etdSAf599dbRRk3TDTEjE7jsZWXRt1NS46wpTT8LOt0thG?=
 =?us-ascii?Q?iWc9IzOD0o2S0s5Q38IbW235Cdf6kahz1qrEHC4tRySPItXCVCJgBdXBStLN?=
 =?us-ascii?Q?t7g2hMQIZ0jFk+7qNRoqVpxYSVTYPoC153oEx3gR+FPZwQQbniGw3APwnNyi?=
 =?us-ascii?Q?4Vt8DF+APiuXiX/kCvKfCeJzc4K78sZYkYYrQ2aOvoAzzaf5NusSo+ECRxl/?=
 =?us-ascii?Q?7Ay73yc3qD8n2jmWZJ2hBpS22KUdzwx2jNzi6j68rE4ZZO9yl+soykDEUQ1w?=
 =?us-ascii?Q?e6ZG1XAFBz6IYvfRAL2OYmiGLuD9bOtZV3WNUsFgKinn0Ws1GFwb7EicCina?=
 =?us-ascii?Q?gbDyYU8UgSN95AF1i3nIAdxaIyFNirqQEn/iW1eVqQVnbxFGjMS0Hv23k+cp?=
 =?us-ascii?Q?nVG/Q+tIGSos30JhBnkQj0WlDLXOv8vwl8p16QlePeKd8wYYMwP4hDwQ0VI+?=
 =?us-ascii?Q?qY2sQUe2UlzgJ3CXpy87WQgDhYVLBbfUtvJNZYmY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8ae2c8-c0b0-4cf8-d952-08db810faa06
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:08.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTopqEJugnMaeQFNLrREGTERWrPjFhCJHoyPyqYfQFQHR+sZ56Q6oW97cwUpZMeJw45xDPOoUMouo2TZOlYBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5631
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

