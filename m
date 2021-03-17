Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD433EA24
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhCQGyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:23 -0400
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:7720
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230227AbhCQGyG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1QOq91E+Hyj4arFROUnMfi5mi1MTbDWD+xsTdwqzOWhUDTQ1iybsLAafEn0yCj5U15FYLebSR3RaJdft3AlEDh8vjKRHDVWi1p+UESiRNgVAvcBM1+FyoN4xKQ0VaQ001vJaKSmhFOICqpjfe034DGTG9+5wG+HfiJLb8CB0SRRxb/Uevc9CD5HIKZoLtV4rqm1kXvhnaE3VQfdRTr23LXEczXJCd5OIiuoVLfuk8sCAHfByt6suBrOZv9K85s9yMjsxO0GUP8irBNIfRwKpNfvsDWOLcUjJaL5OOKdWbl+GPsdy8ryAI73GIVbKINg/SUZtrYihCuINZse7lt1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nomvi37GOQXre/v0V/gsm69Yx3x51YjooFfhnsICFqg=;
 b=UfTuKe5fJ36AcHBRMSXpDlJTGxAKVG1gV8jbOnAmQFW3S06rcIVBedZfEcNVqstQzJG9cMIgCbszyl53scZdPI4jCubP7a0AyG6qIKJKGq3+IVTCVwS2wUEUtyA77q/+WMwlS/2iTmEQ+sg0DDla+jZgQAPBtlJUso01rxMaT6phq0QCqRraf8X/RhnVIPHk6RKmJ6/6jlJ/7HRnJNOy+I6J6x1I8CESs40pR5OOR7eAHKwQEHuaQw2btbokaI6q/JLA9LiZlW3gH7mjSB1nqpWJD84++qr+HNBeEwr3RzTtnl9w+Iy+wbsI+ZI2WFDMZX4jLX4RVRKjJsdAyLiU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nomvi37GOQXre/v0V/gsm69Yx3x51YjooFfhnsICFqg=;
 b=PnvKPZLMJH7im9Ul8PQNa/D1L6877h7F2dKCuEBuNdiCRCINY/aTcRD3OtTmcWCaTftw2u7a95IiUIuSZNdvLImRh8QjfaGu5KI011dUFkxsjicgFH3tsYkm0VtabI7ohHqAxHH7F9PUEgwI4613Lopps2DSstMyirr+vJK8i3g=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:02 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:02 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource request/release in runtime pm
Date:   Wed, 17 Mar 2021 14:53:52 +0800
Message-Id: <20210317065359.3109394-5-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:53:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9bc4d20a-fa46-4171-dc9f-08d8e9117310
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091B00309C967DF7E93A9C1F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9Voj86+LFYuVtI8q7sdILA1UrXJXEtrfxo3mtEMcXTt4zMIwb57kJpI2vIRYFUtZtJLiaNI91luWd9t5qc1GSPd117v00FYtbx/Kn9MB40qvZp5t/H3F8heqrhLL1s+d6eFPC3M+Fg6g9+wB6gnhTPO8rImXJ9hgcSr9OgTqpaXZ/HWcFUIwir+wjYa9gRxxu6y7cXeS0FaYeJqsUhRS5nFQEHhQ+kx3bOmvz0PCFN5WjU+EfXFcOk2BcjC9GvG463D/zwB49lqlQVlmcrWQPZMPwRwgaLaV43C+P+4alKBf4by7otJ7aNs1lT4Lu7T/V/yNdZM5p0JEctoH0Tm6CBXC2sBcasAj2/+N22qCrCWqZb+fz0tk3QLgBaj258ua3FZarDO2I+UFj/59ucZpNSMmjjBV1yEnOp3MUS8aaukysMPMzD9SS8Iv1hJqk3rZh9BUpQl1ZCSN6xGp9EHpNZ3/gfl/NDm6YyOSbrQ7RFkAj3GLE93Fj+/HlkHTg72+DtOmNwNpoOYkdhj+YlZOPnF+DPjH/AO79G9iz2hEQXJUE2fAzLY2CqxAKLsTuKbbj4UfXawiPzWoNbinzsBDEZ0iL10jx3XMS5MrpkFvrzeb+YSPCgYvoxMszyOSgnN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R79hcwmQQEGgqm4sOrCzouOihvEGFUTpInUqokUeVdRddEAoZeDqC8fGYJBZ?=
 =?us-ascii?Q?Tho5llgLYjdV71wtH7Ak1A6iUEpSWuWRVTgeWuh0BpWmTd0lRFY8n5+6CNx7?=
 =?us-ascii?Q?9wRuQoJZRgTT0ofzOOCXesfRpNlcrfNxhzdl3LqxTZ+zLZyri6ucU39D2HDO?=
 =?us-ascii?Q?lfDh2njrZPUS/REkunRH7Ik3k9lYi9BAYQ6OLfUlkxZhqe8ObNZyxe0kfNkZ?=
 =?us-ascii?Q?3BbcSOLL7hjXeglkMxZ5LmM7EKFNv8ynDhxh9IKQBkHW5mItBpduPUP2o05u?=
 =?us-ascii?Q?koTN698zxmSf6phzre8XMLAjEHBDUlVOBIp6vnvnmgOyyn+rNkZugDHjdW+r?=
 =?us-ascii?Q?6qTX4Szlp16C3hYMVhGDfIX2y3h+JWKP6RD8PTMd6I8oqChwv8hk+UzfVRYd?=
 =?us-ascii?Q?Opdv7pjxaxwgDqdjaOdhKRi9c8Y2R/Xv2VKieN0RsyXjDQGM++OUqXHWUY7n?=
 =?us-ascii?Q?EqIfhNpcpImx5JI4eg4T1w9kkADjM7bLXsj7tFKgde372vFseDpUJik+uUKI?=
 =?us-ascii?Q?FTERbxk52lbMtTYjp2gnV+a6SFm0SvCtvkYH3Z+z1CseERVrMUkLVtn1uniP?=
 =?us-ascii?Q?kJivcs5fGfKPyDnxJJq+O95z/5FihzY5yybTDnY0YhqxNXQaHjMl5etMyMZC?=
 =?us-ascii?Q?m/NT0l9ccFMm2sTBBfpGJWg+Xg/gF4emPCkYMFp9rhWgzkVNSkcg7diGlgIb?=
 =?us-ascii?Q?72g8C7EHzJaUvmlhNzdp77MqRhwwtZzKVM6T4oDxiZjut6FHWAgG0jfqHWNg?=
 =?us-ascii?Q?xlBTaSpp3oqG7t59/GmS/aifPoY//GNSrxf3kpVSyGNVxP+XsEOOWd0uei+b?=
 =?us-ascii?Q?muCeUg24i38PXkM4dYcmzsbokGfP5gBrW1o8G0CUZ/IhcesgaHTM5rSjDD2K?=
 =?us-ascii?Q?+IS+gBMsH5Wgkb0jU1RHMK+f71m+H4Uef0YGZFseh6Gn3LPiT0i3jebFIC3x?=
 =?us-ascii?Q?qm4VPpY+W4SLumbIYNEeGy38f+Xe+v6PlEBkAv/9oOerLMAg+9wx8A4GcBFf?=
 =?us-ascii?Q?nW6wpvg/6aSERJEKT4WD5DsLh6GVZyV65ExeTQvqUc9g0THCdJavrWBRQIUR?=
 =?us-ascii?Q?dOxK4qcTPNk7V+fHZtzwY7lHKwLbkcNHkiA2L/jE7/TCw+GRrXY9R7OBDV49?=
 =?us-ascii?Q?FAj6CPQEN/zuhOuXdw3dIzw6r8V0QG2oledbh+1IE+/+sRaOKA8OWeoy+i4O?=
 =?us-ascii?Q?RsLHnl6BUPK7oqsRfHRxO8V4rCrUubMUU7p86/H0HsHaHssMNBxr63aLdO6I?=
 =?us-ascii?Q?aF7v/Zoqa2YE2etVsvNK1wLuBESRCnSpp96SF+yAQF8PI3OJzBVwvjRAnaGV?=
 =?us-ascii?Q?te+jFch5sI7vot10MHbQMnAq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc4d20a-fa46-4171-dc9f-08d8e9117310
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:02.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/iJD6JUz0gGmQivJKbucKEjQFBJuMbUVQr9WKuzRiy9Ks4kESbPL6+BtIJtCOZEd6ORfygf6LdBdiM/iVK4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Manage irq resource request/release in runtime pm to save irq domain's
power.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 664fcc0dba51..e718bb6b2387 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -94,6 +94,7 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
+	int			irq;
 	struct clk		*clk_per;
 	struct clk		*clk_ipg;
 	void __iomem		*base;
@@ -543,7 +544,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
 	unsigned int temp;
-	int irq, ret;
+	int ret;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
@@ -553,9 +554,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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
@@ -581,14 +582,6 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
-			       IRQF_NO_SUSPEND,
-			       pdev->name, lpi2c_imx);
-	if (ret) {
-		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
-		return ret;
-	}
-
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
@@ -640,6 +633,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
+	devm_free_irq(dev, lpi2c_imx->irq, lpi2c_imx);
 	clk_disable_unprepare(lpi2c_imx->clk_ipg);
 	clk_disable_unprepare(lpi2c_imx->clk_per);
 	pinctrl_pm_select_idle_state(dev);
@@ -665,6 +659,14 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 		dev_err(dev, "can't enable I2C ipg clock, ret=%d\n", ret);
 	}
 
+	ret = devm_request_irq(dev, lpi2c_imx->irq, lpi2c_imx_isr,
+			       IRQF_NO_SUSPEND,
+			       dev_name(dev), lpi2c_imx);
+	if (ret) {
+		dev_err(dev, "can't claim irq %d\n", lpi2c_imx->irq);
+		return ret;
+	}
+
 	return ret;
 }
 
-- 
2.25.1

