Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5833D35523B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242999AbhDFLdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:38 -0400
Received: from mail-db8eur05on2047.outbound.protection.outlook.com ([40.107.20.47]:31407
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242086AbhDFLdd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC+zUzr/Mka7cBptgl7w+v3bnGXeX3h0Bkc5IZQ05oQbYgzcL4eicgBXTo/jxnEigQM3Zx3XA6vtaaumYEZMlz14K3YmGIgl0Den+jVKyb7K7JY1P96LI4wlod2UFklW0rPnX0nTENs/HY4HNle0HV6mfWhJcAXADvdPFg1iXvuVUnITHaaWvYcQNFYU7Vvq1t6WuCtueUnevXwqlfKTXzJlh3q1IVsbTM3TM88I3mctfsGsDyFFzw/wtiR+tVXiUyJbCtjhbPrMRQqcDDihv6r+GDxt80fIjx8D7Oa5n6iwQuCS358GQ85+xAaiHWKO8h7WvzLB23i+HNS+/I6nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHBT619cLbGp748Vs3R6uZFcp3NsEE5WPSp4A6KS/3M=;
 b=JLlj0RmuKIqhprydSmIcxfJC9rHZymAIJnvknIVn8LXuZ6/NI2rUMIE9xJG3nThy+9k9QG2qewlM5PaTwGKN2KD8wTvvO16LnO3zuNXzWiJO5FAeieXZEKmU+6ueCLyFfQm3eZQr6Iz0jtUc2y5S9KRx26EtkKumrUvbuKluY3yFGzmommiJzJkeDtSdH+IGL3qIrq2tRHVWXWsnDaY8NA1FFxvAw5CaY3YzvZ8IRiBGRm4glcEcYyOX+OoiX949h1WJpKhGD7yHpQskRVU2FhOdu7QQl6bn1q/LTe6XX7omIT0Uh1xrYckSU1VfdqmJUp3pD6dEu2bnerReFCY/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHBT619cLbGp748Vs3R6uZFcp3NsEE5WPSp4A6KS/3M=;
 b=OoyKCB47ILuO8sbpnAJoaNPdywsI5CBcbxJ5YwQpQvSj3QQDhnVbES7Ab8qb4F7dnVxKp7ytH9uvNU555jlcA2QrAwBg6V1WcMprQu4lu/V3Bzm7J4UNtLhH92tS2DfPGpMyU108Sc0eBFtw+J4Ub5ekuraIWvQiVbuI/rUjiw0=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR0402MB3765.eurprd04.prod.outlook.com (2603:10a6:209:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:33:22 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:22 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 07/18] i2c: imx-lpi2c: manage irq resource request/release in runtime pm
Date:   Tue,  6 Apr 2021 19:32:55 +0800
Message-Id: <20210406113306.2633595-8-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdaa416-ab63-4c66-f5bb-08d8f8efc88e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB376557802BEFEC863B418083F3769@AM6PR0402MB3765.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PThFXg1mr/PR4O9L8Q8O4VuM3/MMezZwBlwZAPyqusqb91wwbe5GX658B5LILWb+Cn223tgk7Q4GjWxgj8D9zck9WsD1YqXXSeuUN9BnoK0ZU3tdVTViorigC1SrLR1ztLO2uYEHs/+83ttXRDbHbdaBJvJv9JLN5KU44/OXkOfVvr4Myglc9KQgcLGeEql8GQJQL8UIxYvyOwNceEIfSlMTvRNJ0UMMb/h6stjmTBiMyIe8KMtotWwnn6P/klMzSMw00e7F6H4VBS4O91p69GePvF1iBiGv/OFjkO+ctXgICrEvZHtSa0smLgr14vxCzGNvO3wZ/4FNHcUe9PcpRoX/81vZmb5e2oJN/TIPYKJRBu3JIyuI3kulo2jBTJTXGMAZcNSEnS1mPYZCq9fCpw9q1BDvriWXAcoe6Gb/El3Uq7rB31Z1Iq2k/3OJCSrZRRoEQ/AOnSanCFDcThJm6BWUU8NdfnMODy4xzXOMqWM467w0sL0fwcx71wt2jZmMIN/PHTVl/vaBa8zxwTD7BzADaMzpv8WGS/zFvLNBqVqO6HweGIvLwJuxBIs6WI8Ui/aWu4e46LjWtHtd6AUFWApOlaI7Ht+WJSRpjDs7x3dRy8EO1emXorbm/agBMlFzzuFGcEYaP6RelnOzsBRhWeM7ysTzVS5GZwFi6TrvszOkX4NnlMODucKW+Kaw68Y/MhMvK6ShsEWq4ZRFP+F8RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(69590400012)(66946007)(36756003)(6666004)(38350700001)(66476007)(66556008)(498600001)(83380400001)(52116002)(1076003)(26005)(38100700001)(4326008)(956004)(16526019)(2616005)(186003)(86362001)(6506007)(6512007)(2906002)(6486002)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NOpwklhSef2UK+HhJBDQY506v66cCV12O3OB02/Fk5pTz1P6Lenv67Tn2knY?=
 =?us-ascii?Q?yIUh5ViyQzfIRmCBPaq/GUS4y70VlEtOzyqzkdwocdvQD6KChqaBHIRonNYT?=
 =?us-ascii?Q?iQe6sr9ufSIjAe4yXiSm6nrI7sg+T/PLKbKO6RpXcx9HHAX68koHhycVfoyk?=
 =?us-ascii?Q?kWwuxcdF+PO7/EpEb4jTpOqT35lhHG/802yUcs8TDpjRBmivvP5S44C/yKrm?=
 =?us-ascii?Q?IYrCMWs4Y72eEDomrtAAZ0cW7mk3suLr2MavS6pHN1Rz7oPJj/4d+Ev+f8Jf?=
 =?us-ascii?Q?ss7zf9xTKEw0p14w8Hc6nHtG3Jr1YjSH2gj1Y0f3MHQDAj21N3wPKCiWqJOF?=
 =?us-ascii?Q?VLdCCw1stOuK6v2v2SghmSLJSuMIdIsSYn1YpAfbkYmWyFlvt0aaVppViFWB?=
 =?us-ascii?Q?YRfvWqsK4JlVa0VumYHHevCBfn+5rC7FpkEwQbeAZ4IFcZRRSda3YmmDVf/t?=
 =?us-ascii?Q?/RbBDViNTl4UB4kzPDvKmWRIutuj8mNu71NjVBLIhhX4/IX0GfZfFmlL4ZMd?=
 =?us-ascii?Q?XrwRprhIJa+t+husv+Qv7fnGVsWs+F5/LqHsd3uJoe4ze7c25pibvn1HIimV?=
 =?us-ascii?Q?6tNhvB8JR5QWifjUU52KlvhLwndE9uH3BgMIq9kcfXT12p0BQu6rRTIJGfK+?=
 =?us-ascii?Q?cGzdfbFFCU2PnmoAd24mT574U1i9euGkqHP+y29+UH0iqHqCjz2pl6kHxnXW?=
 =?us-ascii?Q?7K8uLqESl4ppoBK6gkZPyw2034SFavX+KfPqEBedtvqEJv7xt3Dg0WwFdD50?=
 =?us-ascii?Q?mCcSwK+RMU2C8C3WrtXJRghpVOI7zMcTvJ5W2chZNB1+HzI/cWVPpuCSCaTx?=
 =?us-ascii?Q?RmDDmkBkCbNWUdPSL4AtpcLfI41A/nAaw0xYFa8fuIB7K8jEo9neBj1uT4AE?=
 =?us-ascii?Q?8dp8iHu4f/Ip0O5slaQTJbTiRxZJgDBopAdfaYPsHtEqtQTMFkOShtGyE8vs?=
 =?us-ascii?Q?VNtUxzdFYHPxh+xZEDynYss0qCd6NLq6TcqSHqd1TP6APp+nVBYwA0Bs5Dsg?=
 =?us-ascii?Q?rGYknYfrRFrZBB02yEcsNJojpSqw0KSHJmcjP2OSpXFGgtvNQSRXziX85NXK?=
 =?us-ascii?Q?b7EZGN4mLC7NxOzpsfm+r4pk3Fautdl8fCDxYFXzeV+sSANpg4so8bAOK8en?=
 =?us-ascii?Q?/aPr/IfESliktYRVnXDudSAzMWdWjGUoY3YljlDxyxnVOQvRRuyikewsyf3w?=
 =?us-ascii?Q?/cIxCqrvgdGl1KHGkNrAzzEPMRXPBUdPdNhOcLxIXZV0LvO7mNhOUPbOLl1L?=
 =?us-ascii?Q?l6fz5ijwa5ooV7HW0xLhSTiMJzFF4OU8Luuco7skYkeHXVBNBe8A4Cpsn7lt?=
 =?us-ascii?Q?HA0h4ACsd7rFXfBlOR6P6F29?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdaa416-ab63-4c66-f5bb-08d8f8efc88e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:22.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gte1W12atBrLjXf7bDXJLV0B2Tv698YivWKh0qiplrPvtjjc6P+QsUQ/M/yHyaGIAqzLOyWonwzPwfQ82wKCDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3765
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Manage irq resource request/release in runtime pm to save irq domain's
power.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
V2 changes:
 - Change to use request_irq/free_irq.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 89b7b0795f51..333209ba81c1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -94,6 +94,7 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
+	int			irq;
 	struct clk		*clk_per;
 	struct clk		*clk_ipg;
 	void __iomem		*base;
@@ -571,7 +572,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
 	unsigned int temp;
-	int irq, ret;
+	int ret;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
@@ -581,9 +582,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	lpi2c_imx->irq = platform_get_irq(pdev, 0);
+	if (lpi2c_imx->irq < 0)
+		return lpi2c_imx->irq;
 
 	lpi2c_imx->adapter.owner	= THIS_MODULE;
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
@@ -609,13 +610,6 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
-			       pdev->name, lpi2c_imx);
-	if (ret) {
-		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-		return ret;
-	}
-
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
@@ -668,6 +662,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
+	free_irq(lpi2c_imx->irq, lpi2c_imx);
 	lpi2c_imx_clocks_unprepare(lpi2c_imx);
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -677,10 +672,21 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret = 0;
 
 	pinctrl_pm_select_default_state(dev);
+	ret = lpi2c_imx_clocks_prepare(lpi2c_imx);
+	if (ret)
+		return ret;
 
-	return lpi2c_imx_clocks_prepare(lpi2c_imx);
+	ret = request_irq(lpi2c_imx->irq, lpi2c_imx_isr, 0,
+			       dev_name(dev), lpi2c_imx);
+	if (ret) {
+		dev_err(dev, "can't claim irq %d\n", lpi2c_imx->irq);
+		return ret;
+	}
+
+	return ret;
 }
 
 static const struct dev_pm_ops lpi2c_pm_ops = {
-- 
2.25.1

