Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB4035522B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241875AbhDFLdP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:15 -0400
Received: from mail-db8eur05on2048.outbound.protection.outlook.com ([40.107.20.48]:33152
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241603AbhDFLdO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJABIOAvBFq+ns8K5X7TtuZ+gtiO87+NHrVHwFeLFRxfh4vwbWtAitZcAu272FK7erZOyRbPkNaZ5tGB7lHxEGki3TyHtv09DgxqS97v4lqWDySAhBL/Tl0QSMWURsQM+Re3SVxFDALTAMkk5QTwHsliFeo99/evWy67/kuRC+Ss/p1esOObK2fUNtyDglaB7cqT0DWWSTIUz/OV3VpO/eVaS3qz7ytgPFxNaS2qlvN9yyW9zeEUzgyEMVo2OxAF6U+jncm1hDgqfUBIwxLZ0wAIq+2yrQVWHk43OdrRTwnsDMcp768gmjTjpi9KBrQaHP7VXw1N0Q65QOLUXunt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34WXF855dTFrymUPQKjP/yMf8DblmnD46nRKBTpqtlY=;
 b=oVcNWs/cUHNszFnYVRAsUfKXCS2GkOm/czyaSbFd5L04zWvpJroMqOup8sNSObtEODrnPleI0YogttAR76yBZvlk+q8rRTdl2dXRBHRlr3GInQpT5SASn1aoUjs1jpUTLfQHNI6Ri7ySlsyfa8HVJeI1WuZ3zARdimYuKtlZ5jIQ1+mFZk0M787X94auuRM4OIvOj556DAfNaHftc1BHwnFOn27cXqONFYg2Q2chNTpiRnUzD2XF+g2mILw4MRuIAbL7VJuSkX82IizxrH1WSyVxAzOIDDub+ETRxwlOydbTbZoMHZT1PHjD4pg3QtL6VRM/0/sVFPRI128gwjl0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34WXF855dTFrymUPQKjP/yMf8DblmnD46nRKBTpqtlY=;
 b=EqOuVp/1Q96aFvdNx3+g/CNH7d6v/A6545AQpVnJi0tN+H/rl2O8IOOIyJL+sbIa1HFNFQDmMuf0Pmi9jSLlZYsdF5Tj1Y9iK19Hvscf54jgLcFfU1S0yW3+eOE3qZlP3iNqPp5AoLyufLuPF2UBujCpoqPsaZ1/vnBwUKuPRrY=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:03 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:03 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 02/18] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Date:   Tue,  6 Apr 2021 19:32:50 +0800
Message-Id: <20210406113306.2633595-3-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6443bbe-48c0-4800-66a8-08d8f8efbdb4
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3765874BC600F3C4CD180FACF3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/kINHKZ9TJ9eyc44l9TQ3H+5KQ6Y1HP3QhDqG+FBgGsC97jQcJaJPvYFpMvZoMo179a6qJaJvWqcyyDpOhbTHI+7wEbvmQqrWyYMCoGvbpgGzr5n3LqFBwqZEiV8NnSJHkJw1SGMLNKEy9KwLDDGfm2DRgzVrgGWKZJU+KxP/PrM5s3too2YJ/n6uFSypZWQ/YgYGn4kqNDRNDOLsSBhB5No4QXZ2Llnbq0u70bdYkSGFyVsn40TKwzQengcyaSXXE4D/rYpB9rY+yzU6dTrRc7O3nmn171l2dG9iBHidnXdjcIOY2of6y99BbvIrBQ+WBXFC1qiV0AMoekRfa/yBltyBz+KFv7zD69Iw32HXbDVGgNXZZwG4sG+dMUKODf1L+l6X21cgoFu4wT0ieya5My8b3HSvmeP+XToqgNg+8oS6kxwaZXNTrVITmAfI0VgMpCBRzpp1+f+4V4GhzA0Ml5A9z/fDcu+7zsR3LT5ukkUMv0amkRoXRBgqezwAHRKcZn7HIBjt6g9ubL/mCDHxIkWWbTBS63hKgpmW+t0udHSi8oJpXr2ljx9A2N3LpjJ4JzQQ0DHzFJKwUKo3w9I4rjaWsxODqXff1wubAGXNY3NZygki1wQfDc0OCJfeuGh4o0OciRS3u46UwhWEMnHGv2qr9SeLJUrTs9eTRVxF6el/PDh0QGhvikncIxRnpcJ7ZEmIJZDPOaDR42a5YlMi18SdtS9Nauv9689cTVQ4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XRmco9Tt6vSQ23hDeZBveT09XkWhOGVpUN+A7Fw0KdjQsqqoqpMFlBt4fJ4o?=
 =?us-ascii?Q?v/PZhBPxXadim6wXMVzccxprt1MdmWzuT/ePutsM7Ehq8wIRUbsjIMNUMS0p?=
 =?us-ascii?Q?JJcD7xhIOwRKobphVCLArl5D5dPnuClcKJ4zcsHsNz4SSueHIFwPJC6l0X9m?=
 =?us-ascii?Q?zOcajneG5sSh3vVRpo9K8VYREwyTS2goGcltiIGWbQ+yoiltfWE1KxO+TdeL?=
 =?us-ascii?Q?r20aCD1lxxmjtvqwLZbYeXvZwj6E7CtVKOxXZ7xuqnLQ9RW8yVJVFKN7R+m2?=
 =?us-ascii?Q?KyMwGLEK3m5JhmaRPglIdOHSMzFJjVDbFE06lKYvkJpGHxHm9MC0IrTEBRBb?=
 =?us-ascii?Q?VrNLGBbnIjtsuVMeRXeU/XbUwPWzzCwicWq5x3tpfEN6xcz9EtNQRzKW7lez?=
 =?us-ascii?Q?qrlCiD9mYk0RCSdVaVa9QQBWUF4476um+TJfDnb1tJy+IVJ00ds9Bc62+6sS?=
 =?us-ascii?Q?aXOHHSLjf/wVz4Rt+Yak0rVyw7VCKFpxsE5ZZmsbVrfInmULhlxMhR9MnqsP?=
 =?us-ascii?Q?ijBq0POKXMuh7Nd6IYmeqwYhhDp+/4tQbfK1oqXgppkqAwfwsBX8UUuMrZ2k?=
 =?us-ascii?Q?UKqFAAI2TdCIOZe6sGBURWhMN4OQd6rd8bHazqFls8Cz61Q7y6fYZlOPqo5y?=
 =?us-ascii?Q?+rvLg84+WLRRR3gCtXbl1u5nA6c17OVQRhQFzF6DCRuQo7l5bng2dgD/ytNt?=
 =?us-ascii?Q?EeS8Ud81QfDzuT1zNLMFzdbSnIlV7ADXy6lJ2fNyHcreMqfR8ieHqieWKRLM?=
 =?us-ascii?Q?dDKu2aYMOdcWas1EU7nNmZt1saiFxYP20a0enMz8cp306m+b5AUslSMtSOhv?=
 =?us-ascii?Q?ilrQZrV/6egPzNKYdTO9bu39eQ8JDgqEUjBatrv2X6GFoEUgK+dUdkiLGsVB?=
 =?us-ascii?Q?zEl9Muk3hGc4H5pp7D34MXlCSqjxaCgPjAZV6xuLo5TA4TK6NY/U6jX0Ww0i?=
 =?us-ascii?Q?0lwkFw6s6dw39Mv/EWC+lPE7uIZNPmf9ZZQIcZk/tfB+pP6CJNTVlBB4xdwQ?=
 =?us-ascii?Q?/GTGPd5BbF+ehTYlThBq5FDXVPvnko2vsqwnHrEr+NNd97gpZd4/pa97nraq?=
 =?us-ascii?Q?Wg2WNgIiDYaHqJvkEz+4mYA1UK1dTqvogKI1boykhPXPLe8kpdW+7ZzAe5Wh?=
 =?us-ascii?Q?qMibDFEYqsm5brPnG3E/yErW8VWVpU5yWHA2U75oeomC875QDM3y7gVZOmxS?=
 =?us-ascii?Q?NYkfIy10OfDBnLcWFQ7LH2ncg/vyQBFhZgaBqAfdEwqSW5s9D5TUAQkFtYHw?=
 =?us-ascii?Q?kMFgF51DUSRQXr7lqE1czxU9I3fNAlNolp7HC1/Sam0Xg0JhzWeDXipUxSZ/?=
 =?us-ascii?Q?4Y7QAPmEgORGKkCBmFaggkER?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6443bbe-48c0-4800-66a8-08d8f8efbdb4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:03.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqBypiL+r5IWKzyKfyegXLQ3SB1N43ncTOW35taSy/4HUnCtpmCAGct+j1vpQI6p15wd930eQdBPfLf3XIcR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The lpi2c IP needs two clks: ipg clk and per clk. The old lpi2c
driver missed ipg clk. This patch adds ipg clk for lpi2c driver.

Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Fugang Duan <fugang.duan@nxp.com>
---
V2 changes:
 - Merge two clocks' prepare funtions to lpi2c_imx_clocks_prepare().
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 61 +++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index bbf44ac95021..89b7b0795f51 100644
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
@@ -538,6 +539,34 @@ static const struct of_device_id lpi2c_imx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 
+static int lpi2c_imx_clocks_prepare(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret = 0;
+
+	ret = clk_prepare_enable(lpi2c_imx->clk_per);
+	if (ret) {
+		dev_err(lpi2c_imx->adapter.dev.parent,
+				"can't enable I2C per clock, ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
+	if (ret) {
+		clk_disable_unprepare(lpi2c_imx->clk_per);
+		dev_err(lpi2c_imx->adapter.dev.parent,
+				"can't enable I2C ipg clock, ret=%d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void lpi2c_imx_clocks_unprepare(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	clk_disable_unprepare(lpi2c_imx->clk_ipg);
+	clk_disable_unprepare(lpi2c_imx->clk_per);
+}
+
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
@@ -563,10 +592,16 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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
@@ -584,11 +619,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
-	ret = clk_prepare_enable(lpi2c_imx->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
+	ret = lpi2c_imx_clocks_prepare(lpi2c_imx);
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -635,7 +668,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(lpi2c_imx->clk);
+	lpi2c_imx_clocks_unprepare(lpi2c_imx);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -644,16 +677,10 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
-	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	ret = clk_prepare_enable(lpi2c_imx->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return lpi2c_imx_clocks_prepare(lpi2c_imx);
 }
 
 static const struct dev_pm_ops lpi2c_pm_ops = {
-- 
2.25.1

