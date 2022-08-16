Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C50595C71
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbiHPMzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 08:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbiHPMyt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 08:54:49 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D8379686;
        Tue, 16 Aug 2022 05:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O765fRT0zzLLzK45Cpn6GWnR8u8Ga/Jb7pO6ZBuyYvnnbfMY9utLfYeANyjMM8gALP6gIamIEgKy4RasNQje5fVennD4byw6or+iaO6hTeE21dPCK4jqpYSeU/5RxeWIyp1IVF6BqGgjUjtUmWgk0q/2F/mKi2GpB/kb714Zyypm/GWcafiidnlg6OAYRQBS5uHChxbTwHfhfRmMAA8nh9noQbp5GCXaSHOkvFrrOeMwGlX32/gla9AF8Z5fapBYTx6uuJlB0uFwFUeiIPusGKHv7M0vvrV3N33RvD7PkiFUWv96V4tHwbtZD5CRksgwnmDEUDVlSlZhGGN5ssPSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xC/FLAgjMG4RnHFo4wqFkUuoylu9YQ8xGdgGpvQCc=;
 b=XzqelBnAGnEksFiw/DQZuAPyJr/dupveA/zWD313PrjkJrgltxx4EQh9IVoMIfWQTz32h0b41ZUSF8UtgTXEhDpVd/jWmNgV7Dw/XshsJ9b7qJEsKQEdI3s0N1RYjofeyxFUFlC4vsEmDHES3AHv5q0M8DXYDb1DcKvBQp5fr7gGpLBL5dLg9Y5HVMHu0js/xbHctLVfeM8Y+J9ZYZKgnpA8WSNY6ZkJQKozEH0gLx/CCdiIxQ7pXZ7+77ip8hkJ09GeIVidqpeifW4Lhdb/9eHFmNiT6Q/SVxTWb95wL4I/8/ScdSt5poUP9/OGGyq1tlSatAHzjiNrZe6CSs6x3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xC/FLAgjMG4RnHFo4wqFkUuoylu9YQ8xGdgGpvQCc=;
 b=gTwW7QMl2A0zSdgut6PFGX/K2lXpO2VhH31Jy5h9dhzzvgp6c1PWBS+pbxCMkbB3spTl/dDwtjaxcv0cYK91bA2FWUOY9tre76f7kG/az1bSbUox2XgfwIUyiDMpISOEtJgRUvyyBN2hUF82H9kLN6wZbMcZt+W+Yex+2l1gKTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB7PR04MB4060.eurprd04.prod.outlook.com (2603:10a6:5:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 12:54:22 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 12:54:22 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 7/7] i2c: imx-lpi2c: use bulk clk API
Date:   Tue, 16 Aug 2022 20:55:26 +0800
Message-Id: <20220816125526.2978895-8-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527366ed-cb97-47cf-5c62-08da7f86710f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yhsIcccT+sSNZ5k24PAAyjX3Jovx30AxA1ejZzX8uoscYkx9dDvFTyKyR6rEo9Aed92JgudAHXfFxbdFvs2MGrlS9fQuqAM0kfWje7XHwhCHy5gvKeJ2f+fL0iprFMkcnPZBFOAXBZnD6fG/w/K9GaNIgbsIZ/YKwIg/RCg7Z4AxNXbKGjv9J8Kii0NMp3qpAAumAG7RKMEdE9At9L59nRJNheRJ5TBpsVoEQbURwHtL0cvJVlBayNQS59AR6HhxpyyFm3W09n81kXqFN1G2beIeiVtCf0Dj4P30HgzvrYrdTMB49wDD6pGdIpCF6XLb+f/JyQzJi39LLHHazxnZoXxUdmjKGke5xzFftlllgYLlkoMDTjLYXmTkV5A6GNNpCRnY0lNlceZoMk4ShHkTyTg0fgIME5YSS+R0+zm2a44l59KnRpXwuVLzEUjrqomZU1TTkOS0ctu8kSecXVDiwHIDw76OnhDtKvjp9N8RT5qh25WPkrWZEDj6RvRRGHkRlkqAnu3qxFEmZ8DTmKl8El6CLczBY+N3o5KvpQYHHpy7sPyIySnNhx2YD+4VQOwSNmVljeycZ0PzKK0L1QkzlnFDSKuYHzw2TNAOh4Ow0wp2CYhnsuHXnv+vGK2xK9BKhRDvi7peWfBKNth3n7dxKRkC2UVbXaYRZ+eJmPKWTTbkAd6SVI5YPeNc9q3HuuG5+F4BUdcsCOc3QA/WLH/h3HFjZ7JJ2ypeFpuek63MyUjQ7UuD/NEHF9h2dI+NQqUzc8Tlk8wEIJf0xFrkm3MGCRgl43pY8+/wGGPSXeHZdRZ5L35srE6hz+niQQp84xlB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(52116002)(186003)(1076003)(2616005)(5660300002)(7416002)(8936002)(6506007)(6512007)(41300700001)(6486002)(478600001)(86362001)(83380400001)(316002)(2906002)(38100700002)(38350700002)(66476007)(4326008)(66556008)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jd88vxQKZ8lqgdgOToGetHqwNReerEJ8KVWhs83Qv5CZ1PxXhUsDBj7vGEOh?=
 =?us-ascii?Q?xbfShfI34E8qZ8WdGKjtP/tqWeQ/rXX8BgDlfwyvFH1kYFuShDcKv9JFnFuH?=
 =?us-ascii?Q?BVYqkxJGbo5HaoEST3z4Yxkg2Vp5djWDq6NxpIg4oj9Lf5cib5m52CqqAJhb?=
 =?us-ascii?Q?/07zJsvyb2FnAOXb1Pg/ekgnI71kp+3U5RYSfS6bw7GcAeF2wPRofpHSH8GP?=
 =?us-ascii?Q?TBr1Ivf4u/0TvxOujgGQuInLZGeU+Z1vdAQiwooG1O36/Nk+FnJykbtc1RM9?=
 =?us-ascii?Q?dsbliOY0BqC6JBL3irufQDFCz6t4GN9x6xsXRMhnWVLmfds3zNuW6lpaTLk0?=
 =?us-ascii?Q?10SWBhACUuinmUdprfb9BkgwaR/pLrYWDc4RNoyUwn1nWkWwfNWLHhgFxLUh?=
 =?us-ascii?Q?F4T7FgS8/1JHh9AjMMjrZEqHk7jL6hFI4OjbCiReWYpZLUGDAJv4/yW0/N0T?=
 =?us-ascii?Q?8mRXl18VzStcKNEG82BU02MdE2b/QVO9wlUM3MrrQr/4tpTxilomntIEg9+i?=
 =?us-ascii?Q?9w7IXbmyW2WE0lrlxwKDgjKauLRv/Izxg1Puh6DsYP7kyhfL2et21hJ5SVqX?=
 =?us-ascii?Q?1zHv0I1/tekhV5zx9S2ztWrfa1QRQEDrEEAXNYiWRwly5uhXbAU6lZRfIYs7?=
 =?us-ascii?Q?ibXHgoujgy9AuqOqD57+aZUfe45FEu+adFyhhRrxcwkwYxBUaUBF/OxlhBx1?=
 =?us-ascii?Q?vS9fCfrscYBgI2oyVQMdTqZnHEj5z1Df8oN6ARjKHNBjENn3FVGfPSOrgyOw?=
 =?us-ascii?Q?s2cy2LSY2RqsuEAtzZFlMhrqMKfJTlz6J0BO/MXUATOXaK6wM1ToIBfJ3ouM?=
 =?us-ascii?Q?YKRQq6QcLDqx4s0zO37L8T7lL8ILZXpdtZ6kZWnKdIpFAWi/xCRsqvNuTfxg?=
 =?us-ascii?Q?NQuD4ikUBd9JfjWCbsFZdQ+y7GmNNly0JBZg2IRGOADztN7XHW1HT1eI0p9F?=
 =?us-ascii?Q?idAXfuUSNRZ3LXgJPGzsOUp1fkCiFBn1n53+R0kz2av21sQ5EhF2qOo99hqt?=
 =?us-ascii?Q?nF1ZAZbmrIsRKdQaRzMvrdbwzyjuO6SocCkNSpwu7eHbXiGJ5E/rGQ7cRySb?=
 =?us-ascii?Q?QDTk6t3TDLV3FBR4LA1yqWN446ZNPTrBinWVCfGcb03HI85MEL+IO/nVZwE9?=
 =?us-ascii?Q?KWVW5bKWnubARipEodt0E8aNNCnw5bLE8e4dt+BWHF+I+ONg7QEORdZjlPhG?=
 =?us-ascii?Q?XBqpR1K3jJPU1IJZhm6sTfjKKQYV64p9qI72Ve20r8QIvHSrL2Fe9Jw6ONUm?=
 =?us-ascii?Q?4wjoJIkXMQn9qDblZ4X504d6uj43jXoZQLN3tyQ5zpvfnSeoqwjvx3xSXXIR?=
 =?us-ascii?Q?C3l+zmNuEHOgHn15CX1MeETILePKQIEeADr+Xi0iA7oT/Tsw1h9MiSKOQknz?=
 =?us-ascii?Q?OPTVT2bs4OVw7UxPUe8NtfRAyY+RiaczhC+hDls+P/Cu0eIudi9IpsRyi5x5?=
 =?us-ascii?Q?PbqBvLOV9wNw+5z4JRDRQpqmaL5MMMMBcGCGpPV2tqhl59F/M4mv5Tp+rtI9?=
 =?us-ascii?Q?kDMVfZvOXkkx+Kg+RsluzHMNsmNz24eSw35LOyEcDUA3D2WlVMtH0QzPsS7T?=
 =?us-ascii?Q?hLMVwSzm3YAGI/a1V9D+sSMcE9UvhUhaaDLwmXbb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527366ed-cb97-47cf-5c62-08da7f86710f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:54:22.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnWSAwdOvwQdonEPOqX9D0GluO5H96Mq0MkIdQw74aIo4YBV17lOoXkJz3hWy23T2UK7yHGchBKkMGQP9EfxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
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

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index b51ab3cad2b1..159c2dc792b1 100644
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
+	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
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

