Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263F7590B3A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 06:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237071AbiHLEdp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 00:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237065AbiHLEdb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 00:33:31 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338B5A2871;
        Thu, 11 Aug 2022 21:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzkIfnof+ZM5tUQhlc/Lu3r1cp/6N7jUIN0jKtcK++BRTob8Yp+aM2QzXqN6MVDRUIpEAlThL9H9tM/Mz/Q5GTafH60yMe/E9D0bw6+RaSrjfWqMZcw4iH+f9cr1Cf0d+LirHrZ0Sr3cRH07+e5U0Lo1vgQRporM6J5sL6bUVw6Xj5ltgb6rxv4LzoxZ38V9Hjf6ZGplhnKneg/+zgo4B7+vBYj0Bh85UvTQGfRFzBTUZrJN8UdVviH2mF3pxnl2BU/GHh1mG6XnXVIf2EjsFcyUcMO6hFWjRzYJ4x/EYorhL5idG8DCVOaIWKGAi2wcSf1h2iotLMftLvzIET6KmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NL3F2pwfKdpu8rKDnLmLcR8vUOc9Hl0GL+ZVmalzps=;
 b=htQf7ma3a3/XmqvfPkbiZhy+GksVkgy7w4rjj7V6DuE1mStsmoqk+kA8ixgk6ptWskrY/JOKz8ahPChJCYgKN/79SEoI4Qs/VGThcwxe9Y5ZY8WXEZeaKeujFlM70fcQkcpmO/O6F2RXkn3QAWd89pbHJrT/ddWPEPpIoZL2J5DDiRYeO3p7fdFOJEDt0AIk99uJxLIQsRQTgktDKV0kecA6Anr69ZW+kWNCCuqKx795hlmkUWOdcyJMdnrnm4D1kegpzJeuPEsT16ysu9nh0C6OxV63UW8v0Hgm+dC80FROZCJXpoonPsTUhsGBfuHOZhNaDvEGjyuQl77BZ7LVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NL3F2pwfKdpu8rKDnLmLcR8vUOc9Hl0GL+ZVmalzps=;
 b=cdH+q2OkC14BDDpFn3bX++baxCPM1Wf2VqgwpvHb0rkPDltiWnSolNqZbmO/qAPEeOdk06j1ctUNioXH75Hhqj0cOWrDSqEzwJ/iKtwY20SeNQZykNf6mNQJaHAVHRlcCCaMSLpH2P9KLziPphJAY6dSAGTZ5nPYSrdUHyh5pK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6243.eurprd04.prod.outlook.com (2603:10a6:208:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 04:33:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 04:33:13 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 6/6] i2c: imx-lpi2c: handle IPG clock
Date:   Fri, 12 Aug 2022 12:34:24 +0800
Message-Id: <20220812043424.4078034-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e08faad9-f9ec-41cb-ee26-08da7c1bc48d
X-MS-TrafficTypeDiagnostic: AM0PR04MB6243:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CcZ+Z5AO+qnybkAlWgzsGsGPnmB5sHyVj/FDz54C7h823aBcKzESA7AFwwuGOMDT/WuyoIoH0XWcErwQoEzMIZFTgi6c6IC1cfBNq1pbxiDQluCJXjQJGKyTmzPWCjmH4xMO/6+WoxDT0NUR2W41aMyg26wJC3iPQsl8fucxdHIrqdTtdZuTB1QKVITJmnk4IiTO+U+CgHt9F6/ZoN8QxARqjRqdT/B1joGht+F9cy81gB3cF8XVZe1uD9xhzbleDG10vpnoLmq130O8nTm5y/GTjI4mgZl9Z60KV3JrCPhp2NTURtVY1imT1Z5p26orBSIjsE5gPPneXfmqzM5ao+/aT+v3L9GPLe5r59IpcJm6TInEX2N/R9QipoW6pc00xsAdeHB5Tl9eQN/xnThrxyIKkP8d7EVjrFFzLd3uQoa5zN4N15qgLAvnofLnoKQmKJVUsB4ZXjVYUqZJ7lUuq32Bt3dQAu3lW3Oavqd30zpEGcO32r8TQofFWmMNVtvHcmEKbLUMXY1jXrqkIQwb17dfD+eZUjzT/rYgCrxoIra+ndTqCPM1BKpsQGb0YrixvzLqokGBy9CIS0MVVyGxfDgrQzG6QhkStauywVxwN5UfS13uD40Xns/zg5qXqhjPKvi7n57vr+vKUznMuKyu7h2nG48Cq9/RzAdsylmDIma1h+yZfbWLw/FvZ+4qcOLfCVrsZ5Bf5SstK6DZ5RsZwfrURMozK8iLByzryMcjmOv7YZa6Q64QtSmK07ijwbskPSITkiT5kHaZEAf+pMkQr/0HBeJDdO1QK026GOs1zfqxLXtJFz5CcNcW0dZeNksm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(86362001)(52116002)(6666004)(83380400001)(6512007)(1076003)(186003)(2616005)(6506007)(26005)(478600001)(38350700002)(316002)(41300700001)(6486002)(66946007)(66556008)(38100700002)(8676002)(8936002)(5660300002)(7416002)(66476007)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xAwyyvB137CKe8bFAZqLU0ywlXvF/Ej3QMVUGgZ/Rl7UEKzkTo/uwJm4/F4g?=
 =?us-ascii?Q?Goz/psov1+xtb0BzaPyJ/9Zs1qmH5BU7VhmvlktbhI/wOv1iXiQfy2YpFYWp?=
 =?us-ascii?Q?944jQc8UHNsal9O7fCdHv+s72aq2nJbfcmoNhytBC+lAunfMbRYQDInxro/t?=
 =?us-ascii?Q?X6xE6qZYkOF7WNypUkht0kIuBaEbHucASZL2x6VGEnO4KZJKeTZPVX7MsMPV?=
 =?us-ascii?Q?XtwujcNlS7aTHMNlEvv5sdScLSxrkGiDSX8bfOSxK47yO8NuURSYgXN38r0V?=
 =?us-ascii?Q?Sb/2cTKPt1gsIvMP/Xl9VliFIZlZ05ljLKS5gqfLXEoQuYlLpP++r2kAoA3s?=
 =?us-ascii?Q?KdSDSK6WqIPmGco+Jdg2Z/Mre1qOosxRwgDezcKobL3M3H0I7lFbNlEXDPd4?=
 =?us-ascii?Q?y9bCEgX1OCTER1q8xovN9q1KxsLgaZYqbktJaedKyao18SSLXsfespfvGbtQ?=
 =?us-ascii?Q?/dNHJPcRItSyP42WmjXLfc2H5ajKENSRMs7ixF65qrZCfrDDPQr0O0cLTdCq?=
 =?us-ascii?Q?Dd1xrI509lwHUP/YXF0W616yt7MGjPPilmvkcPUoxpG1mGhP5Ii3Yu1KVRJL?=
 =?us-ascii?Q?/DCXSn6e/1BYKPVL1wHI6z8EtfMtV+Sx4W2wpMtnk+LYF7g0tjBH8KuIKBKk?=
 =?us-ascii?Q?A6X6L5SIfouPFxyP8bVUuB7zHP4p2C7iZ5au6ws9pHEakNgje7G1YyheZM4/?=
 =?us-ascii?Q?TY868HGT9v6CEUwHj53kyiI/E3XaboqFjmSyA7QPU1zrlSzjDfyvSx5Z0BJr?=
 =?us-ascii?Q?AHWW0DijZgMr6XBWE5y6zg5IfFv8P8MFRegdjChs3fMD10caBRcSZ3I9zb5O?=
 =?us-ascii?Q?lALNzFGF+d905/2FNVnS+S3YhnfUUcofHDv57Jrlrqt0WLboDI/tV/xDYLeq?=
 =?us-ascii?Q?2QHdaDx592+W0HM94HAC0ZSTO0O5ScuO1PhT1cvF0WPhcuU8W/l2ZCKS2p0a?=
 =?us-ascii?Q?rSMcNaNLML8YjiVV2J4CNf/knWcRXQ9UGx1SKtCpVSfg0RqYOAcYTCgWyHGZ?=
 =?us-ascii?Q?GID+4vaBPftdl9N1tctb5XR4jk3tt0rANi+ABHfT55fKCwOS+LorIjOIa5DZ?=
 =?us-ascii?Q?8WaHFZ2y6ssqTQhdIPy9oS2aD8RgOFz4sDFwHv1GPNmg1AmS0j6LBHRoQZnO?=
 =?us-ascii?Q?pRwHIezjqv8/wVE4vDDLO8mr+13+925NwyoqMuVdM3HE15Ounf6EY2SJD/Mx?=
 =?us-ascii?Q?vdqo+BrDtSyJpZB2Y4VbQGfVU3VVGeVHC1HQCIWZ0RDRl6347TYiw7QT///R?=
 =?us-ascii?Q?0Ct55Y9OUO1lczYUoh23ojcUUvQLj0B9oNK+nznWiO+wNyeD4MWVU17vVfKw?=
 =?us-ascii?Q?Vi2qVxxpHKAqDZktwTeprwWSGe4dxdVuU3aGQ5mZZtqmbF/IxuJ1IvACkAx/?=
 =?us-ascii?Q?ZSULQv7JYJTP0jGHHGwteFLqU0J7O2FPnNSPsFvLnSaOm2DqjkC0f4XZMO5u?=
 =?us-ascii?Q?+WezxcNWnz9My/um/IL2W0XdORLBjS1vA5AAdOJvfK+PuAYU5xGeChfBOcoq?=
 =?us-ascii?Q?NQNcL1x2qmxKQUac7vSSj4y4DyADmYr1o9R+SFbonJu2YvtkM46xZtAsMXI7?=
 =?us-ascii?Q?LTMslfsR+4sE6+rQihdKN8Nur680gqLse2Quexp5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08faad9-f9ec-41cb-ee26-08da7c1bc48d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 04:33:13.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir0HwSUkAad5aMjWdw3UQb1dgHGBwgojBclM7UIBqavjJJF/6MsYH+dAP1O1WgSP/9oR5bGVJqJqwPHEY35Ugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6243
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The LPI2C controller needs both PER and IPG clock to work, but current
driver only supports PER clock. This patch add IPG clock.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 41 ++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 8b9ba055c418..f43ad1ae8627 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -94,7 +94,8 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
-	struct clk		*clk;
+	struct clk		*clk_per;
+	struct clk		*clk_ipg;
 	void __iomem		*base;
 	__u8			*rx_buf;
 	__u8			*tx_buf;
@@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clk);
+	clk_rate = clk_get_rate(lpi2c_imx->clk_per);
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
@@ -561,10 +562,16 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	strlcpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
 
-	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lpi2c_imx->clk)) {
+	lpi2c_imx->clk_per = devm_clk_get(&pdev->dev, "per");
+	if (IS_ERR(lpi2c_imx->clk_per)) {
 		dev_err(&pdev->dev, "can't get I2C peripheral clock\n");
-		return PTR_ERR(lpi2c_imx->clk);
+		return PTR_ERR(lpi2c_imx->clk_per);
+	}
+
+	lpi2c_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+	if (IS_ERR(lpi2c_imx->clk_ipg)) {
+		dev_err(&pdev->dev, "can't get I2C ipg clock\n");
+		return PTR_ERR(lpi2c_imx->clk_ipg);
 	}
 
 	ret = of_property_read_u32(pdev->dev.of_node,
@@ -582,9 +589,15 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
-	ret = clk_prepare_enable(lpi2c_imx->clk);
+	ret = clk_prepare_enable(lpi2c_imx->clk_per);
+	if (ret) {
+		dev_err(&pdev->dev, "per clk enable failed %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
 	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
+		dev_err(&pdev->dev, "ipg clk enable failed %d\n", ret);
 		return ret;
 	}
 
@@ -633,7 +646,8 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(lpi2c_imx->clk);
+	clk_disable_unprepare(lpi2c_imx->clk_ipg);
+	clk_disable_unprepare(lpi2c_imx->clk_per);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -645,12 +659,19 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_prepare_enable(lpi2c_imx->clk);
+	ret = clk_prepare_enable(lpi2c_imx->clk_per);
 	if (ret) {
-		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
+		dev_err(dev, "failed to enable I2C per clock, ret=%d\n", ret);
 		return ret;
 	}
 
+	ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
+	if (ret) {
+		clk_disable_unprepare(lpi2c_imx->clk_per);
+		dev_err(dev, "failed to enable I2C ipg clock, ret=%d\n", ret);
+	}
+
+
 	return 0;
 }
 
-- 
2.37.1

