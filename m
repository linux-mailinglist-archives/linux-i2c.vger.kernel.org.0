Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C8259CEFF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 05:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239818AbiHWDCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 23:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbiHWDB4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 23:01:56 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F4F5C96C;
        Mon, 22 Aug 2022 20:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTktVvVq3FpxZso7vzyoyM0NkdNuvUkpMxjdGuSe57/13kB2Ea82DlLgB7lm5hrzsmgyl9jm+mZI1BzhptH+9REN0SfcOsm2i2WQck160KkreAtT2REUVQ3Wvc2yQ/1QGbaZ+wmgheFJRotG3JJ3VjPT1a0TmS5sU01cmlZgExDJFfSPDqrFX4byHE/sljHBBL+j3QOyHKqXBb3cxfuBK2yk6VTFG6o7TCIjMmFpA5Xondahfd8tqOeTe1XwsyzDJxJKW4oAvyjpYhAv0yr+Q1yRl9cbJfnzvR3PVqdPmh6wTtlVNYuOMnTjJ3FLLMFnw/32BajkWGyUCyLaoWN6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0VjgKPKfTWwpo07WBTL1LvzeeJqa1eCpQgZ13h3sTk=;
 b=hX9sefA9mVa6T9frU+CH0M2+K8gCIhw3NULaO+NLWIKWPH989r7uMbAYSEFkow4WVEqdiQ2IZImcTXlN7vkSDQ+okfhIcCdP22n1nzzDmgvsCACuCEotuEnrv28iCRZ4MoVumaisb9/b+UrQDYhcMyxAWMTHHfPKI2HlB95C2jPkDHO6mJFNcvJNye9YgyAeMetG4yTymLwtUpyh2iNMBEYzkIXBhUlM6IVYT6a+Yed1EwK2O/3pdj9WGUqaSg4/FOJpCYndWm/1fUCLhOJd+O85/ASJyZQ/JsODm8/m3RStj/R+eToOk8FyeQRbH0bfjcd5E1eLHPQUt3gUY/jAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0VjgKPKfTWwpo07WBTL1LvzeeJqa1eCpQgZ13h3sTk=;
 b=ZdURIi+vumQv+s2RXELRn3gQkn3z4y0mN5AWss7wHXarWtWwNCDe4sxAehGg9XEYF/OReoRwjU9TDPOOI8TR4xb26uCy2+Yf3tjfOLFVjCdviitg0yc8STAwwDnGW014TFp4a07CxiISUiOkDeH4okJIKfM2CGLpjJx4iStfrPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 23 Aug
 2022 03:01:18 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 03:01:18 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     wsa@kernel.org, aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
Date:   Tue, 23 Aug 2022 11:02:15 +0800
Message-Id: <20220823030215.870414-8-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823030215.870414-1-peng.fan@oss.nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa0e6e7b-36f4-4e8f-34d7-08da84b3c015
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAosWXJivaVhcQP3XUmGMibsHj+wBqtX97lL2SJuKCr05dgfDEnioaItqKtcnw/rtjX3jwaA3tNZGGJa1EfsILS4vALyx3fw+bydq7ElwF5tBxw3vbD8C3oVuhPImL2TzL4+cZWj+SA7BRZR49a/3qsK7JAG+x14zR1weDQ37DXtxM5brPuUzJbiXE0dAV4ArmWGwkikdcz6ZMb89UKlVNu9BrCcVxtrLrGjYLwBBDroZfz6OZvBMC8R/xR3MOGxl5w+QxkyKObEN9fyjXcyZ4HBXfHzGFEjFd6XVPBEkkzXcQm0pTrP3CYDPkPB8uKcr8NJflCUuVqSSUt4Kxyrl6QiMz/8zbNJ/fWRfJHlJB7cuSOAx3Fyw2ljTq+sb+eVEa4h5kC4uio2uMvdzLephLCFh1jxKUmBx7CCcjL98nDrGCzfgxK2F3ac6yXFgat8sOJKpHvZ9eDUsTfrIsD+W+2lJjIPJr/YLMVuZZlr6D3VucmqDI7j3/ZjVWXXzdJRk5LyZYIJkgo+NJDiMaqR4tVW5PPlh5N1aevGTSThiaosztL+TU28K0FgpIUlVrRjoYKmCWjd7+ow+UHIkpXhDlSqCOTMPKmeU8g6ZQTOgsBnepCq/1LgKfkzCPfkE8BDVhjXjhGZ+8BJMG1QmNMEO24zz3RW+u6J2217HLh97OP39Laud5vJx6VvuxDA6+Vz/8VSR0EIZcT9Yd21kv/n0XIYx71yaVdVMjpx3Pf+KN+p6CDT/XFuqvvYqLGFhGrZDHy2QjJSeiYNz9Lkk17Umw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38350700002)(8676002)(38100700002)(5660300002)(4326008)(66556008)(66476007)(66946007)(186003)(52116002)(8936002)(6486002)(478600001)(7416002)(316002)(26005)(6512007)(6666004)(41300700001)(1076003)(2616005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q9XRFm3l6i0E/I+QOLnQSTEHNYgRI8QWRTOWq0VVOW/7q+LlAggjQ3ynjDgo?=
 =?us-ascii?Q?hXKH/Dho8sOlASKn/0wkqDjkaYQ4em7NEbz7zEVTAimBwhzI20pfHVeyUtgj?=
 =?us-ascii?Q?KNAv/9yTI1FuVDZ0ZSN/b2+WNuEdryufeU8yn05k5BIvoU6yjDHZQerPWkK7?=
 =?us-ascii?Q?/q4Bl4sXpDkzyBRZ3k4W9lJ09qLgVf3jxpXIAT7uriJ8QcO57KoQLQ9bv74o?=
 =?us-ascii?Q?677nYzcb+r6IXaGBPXmOksKxz4w8ttxRs8z2OAz0u7I2Bxdy8LwfGjA63ngw?=
 =?us-ascii?Q?r3lIzLLW3yoJ0z/EO0DXyi6rNjvG0eiXuL8/pLDWEozYyl9HX42ADfyPGhTI?=
 =?us-ascii?Q?nTxefvS+mb75e49XssSCXPJP1sjtaC4Ei4Sn0h2QupUz2/YWjKbLBeG9KS+C?=
 =?us-ascii?Q?QdSB5cm9/27Cwrn981hAo6QuPLAxz9+JKOshwCvAdzdTEKGsdYHfguLgssEg?=
 =?us-ascii?Q?wjOJziAnubZiK2ja+euisiy3fid4j0pT5pids17HRv8FYQ7mjCFexmivYkT7?=
 =?us-ascii?Q?HK8ouiJfm3U9G40/csxVIwP7sgZgxoWTtUPcmmTfNe2F9NjA+jKI0qBwrfXS?=
 =?us-ascii?Q?W//5vMvt4ONEnp9/7JJMTHJ+ul8PRos/0Nn/LZJ0wLFAwQ0pXhPGVgHc+/ff?=
 =?us-ascii?Q?DrwsYugNVp4v1d3J2zg30mVRywQj/1Xts6PcN4jafVhCZ/bmSeSOn03yO97M?=
 =?us-ascii?Q?nZL9JE9B/3FUmUudukP3iIjisftv19xJxizoetVv1su0dBm2zk1PRRkaHpVn?=
 =?us-ascii?Q?BZI1E/rTCOMueFi5orl8chRMQmVvU0b/uRpn2LgLXWJDxPryL87cpq2ylVcX?=
 =?us-ascii?Q?R3XJK4vVyVb4QrmFecRWIbFe4PeqThGoltTl3hXHirqYuJonyVOF9h3efDco?=
 =?us-ascii?Q?3ZLFJ+MwDh9g52Uct9itgaO/4Ic8EPMVeLX7LP6Avvz7j9faz8y8h5KI5oA5?=
 =?us-ascii?Q?M+NIHGnPS9foJ9++7sigAAJ4UZk13fYawsGRTMf3Ywy3jciZSpBg6E/jd9rq?=
 =?us-ascii?Q?PaxzYEX6GnS2YmmwHM3QOgpjSO6byHlRHGKnyRkXNTMc1k3BDJs5w7DqjURE?=
 =?us-ascii?Q?daiRU/mDwp7MTh+ZKqgYw6tZB/4z6msLN3OQFKy0nT4tffbxcor2ezdWRDGn?=
 =?us-ascii?Q?YmJZQOQ38r54bccIQ7d0Q533cRKgbPHIT//iNnrZHbReoglHVrhqPLPJv0Aq?=
 =?us-ascii?Q?lA3VJNQjThnnTQ+EG8TgYmKZAFNTV2SQKwTpt+zt9cqholDeLasZ5VYXhqOY?=
 =?us-ascii?Q?wecjh6nWGGW/tuLtHwiVyQc3Uk1fJ11lSFpyK0HCwom6l5H44cJ9Q1ZPDg4d?=
 =?us-ascii?Q?x/UFm5FlEmHN694hAMl271Eg1MrBEPC+e2MJ+jOujhL6ti7+Z29Mck3WuEIg?=
 =?us-ascii?Q?BlJtEhqPLwnV0FnyC9WVrYMlKTMYDiK+PdNoILSfDfY7fCWcrxvrhbnzld1F?=
 =?us-ascii?Q?SZcrgzZBvhlVnb7tXEKrNR/Meyjykf373bklUlFeFnDa6Ay2YQYlwxh+47Xy?=
 =?us-ascii?Q?g+o9qKTYbBhOKEWXc2gKPBuZXsZaQFVe71TtH948F9f+Cu4/XbGPcd37SkiU?=
 =?us-ascii?Q?AcIJJnnaym8nJliBn5480RgwdBfeeepLi3p82Gfw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0e6e7b-36f4-4e8f-34d7-08da84b3c015
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 03:01:18.5005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q3yJZxJQqAVQCYQ2FBM+Fdiihmj84wgOlvGCA0uyf6V5PA36u5kKxMaZ/Jrc1m5V/KcmM5sdGGwX4rVlW/lAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The current driver only support one clock, however LPI2C requires
two clocks: PER and IPG.

To make sure old dts could work with newer kernel, use bulk clk
API.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index b51ab3cad2b1..188f2a36d2fd 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -94,7 +94,8 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
-	struct clk		*clk;
+	int			num_clks;
+	struct clk_bulk_data	*clks;
 	void __iomem		*base;
 	__u8			*rx_buf;
 	__u8			*tx_buf;
@@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clk);
+	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
@@ -561,11 +562,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
 
-	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lpi2c_imx->clk)) {
-		dev_err(&pdev->dev, "can't get I2C peripheral clock\n");
-		return PTR_ERR(lpi2c_imx->clk);
+	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
+		return ret;
 	}
+	lpi2c_imx->num_clks = ret;
 
 	ret = of_property_read_u32(pdev->dev.of_node,
 				   "clock-frequency", &lpi2c_imx->bitrate);
@@ -582,11 +584,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
-	ret = clk_prepare_enable(lpi2c_imx->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
+	ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -633,7 +633,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(lpi2c_imx->clk);
+	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -645,7 +645,7 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_prepare_enable(lpi2c_imx->clk);
+	ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
 	if (ret) {
 		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
 		return ret;
-- 
2.37.1

