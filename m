Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B4C33EA21
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCQGyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:22 -0400
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:15521
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230202AbhCQGx6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:53:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR9nT/nl2RNm3XfmD6GzqnRYU6pTdzT2X14d1G/hmfcGy/COL4IOfXwqLpjCDsfashESh5ErZb7edSuKp0G7Dlw1jRRGQWVXHKnlODyyAOIFxXkHLatRk3xcokIzoS0mRjiQDonExK2x/Lc683DcMjrQHLAeSU9BKKOEGSvqRbD79zVGFP7dzK8qej9UmMmrs1LkJgmQxIK0A5GLXwja14XIZofCzXBV7Cv7bOlqVVC45bD5BKjXN2/LaerWZsqv0PmmNCWJ+CFY1Ni1UNs+YGH+xdqFaSIuTPmem8F1QP292kaIlLyUYkv8VJkChSngDY7QigTVc74apdu3o1ptNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BscTcRRIafJnpRdk1Tqz0bqx2h7fMG6bMGtJERgWefY=;
 b=doLSGLi2TM/MoU+Sg5iAE4ULYjN/xEtZGZG4mVPsDmtYj3DIaEAd4U7BFo90bzvMz5mJNR0JZriP0gujS4LPh8gAKRkT+d+ZgvumrcSRetC2Ea39vjDKRbs9cMj/lBXlWfr+Jvb6FVUyAw5YSrSuRHvTvgnYsxvQDhjdg1pZ8ZLn3LzNq4J3BKwASiyx1dhGNNb3hcTbeguJjEfUJd+6PEWg0YVJ3r1qwwypiRwdQ7iLHd5ffRxSkkE4wekFOio91+qm5F/3/yg183yR71t0Jrkta2NLUGiEpQg1t/gClAeKP+tOIkzOvM8BZo6Z2AzrrxkHMAqOhfsnLOxruFBQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BscTcRRIafJnpRdk1Tqz0bqx2h7fMG6bMGtJERgWefY=;
 b=hBmCMKigyFp65ycrpgZz8S1Uhp/sY7xdlmCSVbP7Jdy1Z8VHmjRFZNtCv6kozI9aSJFAw+rKYxId9o7uU7ZjvBZOtvSX9R8G93Y8tBtO4Q2ubnl07ltGRTzA4vVr5uynQbO/5xYeGZWDNmwMR/bH0JL/c8uFs9VR/b4J3oPEpzU=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:53:55 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:53:55 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] i2c: imx-lpi2c: add runtime pm support
Date:   Wed, 17 Mar 2021 14:53:50 +0800
Message-Id: <20210317065359.3109394-3-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:53:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ae51b97-5cee-4423-d43e-08d8e9116ee3
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091A2CC8E15DA229251C604F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCszqoyiTMboUM65c8RsZ9VOiOY/W3mMzYBEvEZp+RqmZyEn+/tgfIo0nDiLtBDPa/P1W8QmRTFoGA36gzRA3svECYnyOxxl086zmU5ICheiXRaEU2YoQnipV9cZ5CxExd8b3Jg6gZH+hGtWpxpAxrxmZ3hUTBEyEEueYbqSLv6NR04N76PO+63Nuzd1hFR19OcX6bYXG/PpdTZVYs9TbpuOL98HzPsEDyqs8OLIUmB5sSIumz8s9iJ9pysq+wfeu5f0yHQqjAQXOhV+SdGfo8LHeQ55cRYWEEuakT6qP8kokv8+S/N6RaMG9Qifn3PwcAUPG5XdurOejfJ8Djp8CnXPvCinuFaapdLwG3J78kjCzN7HPi71YVFm8MG+LTfYPiAjgvCvGtHajO2a+oyxbxDJFCWGgx+/EPDfTCfiiYBDm8PZQ8WuCxCGdpT3YrImwQiV3C6667m3QsGLBKZQzS+HWDyPUiWGI/t98ht3ajlcQ1j4CT6ekS4VENX7Uhv75oGDQZZU+s8EkdjtOEaSLpvOKcfmQP9AAbMSssd3qKp1e5HYUKW16t+O0YzpkSCsYG9y/JSsnGU8a3Kqh5fagwYk32JCO/YCh8HD6xLrMmlsCWiN2+jvgt79gjmBYjK3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?53DVdtPLAkgBwKcODnAFhJeqpkxkaT7vc6RTVwuA7euhO1rslLAYJYkpugVd?=
 =?us-ascii?Q?wLaGgHa/ZkFrWE68H0KJCUIYuR17c0QzuaoaY+ZxwUexnnDxPF4kjLncHypR?=
 =?us-ascii?Q?xzNCTYUavCTifWvo9RSv0xQVbKCITENUdpVUcdijFilzDu3sDVok4aUhdlyO?=
 =?us-ascii?Q?i7/iEXmajNivwyTJWm0STJAT9S5BOcys+/GZ4xxQ7LjgK5hIsuHDTWufrhfq?=
 =?us-ascii?Q?B0XS5rR6cQ8H7wZ1z8Ig6YAZ0v/0BxEW4AHX8Z1qGUBTd1baIrhuhjuW5Flo?=
 =?us-ascii?Q?5rC/mHjk5xnt+LcUQGsjZJEtXP++2eGMmxE4EmxqxJubtV5/CdogsT5/KVal?=
 =?us-ascii?Q?p5v9QivDgOlbrAnF1WNpnQJxw/bGUWRax9KEmMZ/2SY0iTbelHhx8acFpKtR?=
 =?us-ascii?Q?ahONeU7xQlNJffd5bP7cj77eWq4MH0mwM0yXeFVnpSqU6tI+VLA5q0HQbj7h?=
 =?us-ascii?Q?bfSzGVAw6Hzbrf1KMUugdWdvV9gvwzBmA6yjRYTjGJ3fImy/02lGfrAmP8Ce?=
 =?us-ascii?Q?E7Z7kvGye80BTmYGdY6ENvTJ+6hdD5/cRb4yAYt257Fn6AYy8Hr+su3QASNS?=
 =?us-ascii?Q?RTDuwOh2UETBXDKLQZwQDaC9yfIW2R1zTkqmimsfe4dGCRf10uoHS1SxL4a2?=
 =?us-ascii?Q?TrzTa7Yr1IcvKG/PAvkR0y0loYrG8Z3jmgAR73vDUEAeEaYCy15SBzve/J8y?=
 =?us-ascii?Q?Hy0CiOsacelhV1vTJLDE+We2/xdEWMSMNdhK922MTDd8PrN7VTELfQAsvCSY?=
 =?us-ascii?Q?ic3YG5ZJEpjcAidWGgYUDWuzJfG66mBWnOtAO4smhxn1c3GHPLWd7qmRa47+?=
 =?us-ascii?Q?RQlHIJ1y9/P3TEmtnxqw9w5wPK/Zn3T86td8ahCO5sIpDx84TeP2eWvZ1rzJ?=
 =?us-ascii?Q?62EqHjQihu9UfiJr3/i/7uKCJQ3ZJUOiKDSJQsBQ/WDrHM186AaVRQXxBUiI?=
 =?us-ascii?Q?B7hpuyAIgnZMf7rBlL0rcd2mKq6HgM1aRaHeUYD2iP/GPTe+l6mHwZ+945V4?=
 =?us-ascii?Q?lHCYc9Vr3/nn067n/g7EzHzbjOdhuwMsPI3pyFN67R/ozFDeo9+nCY7lp12Q?=
 =?us-ascii?Q?RxBMHyIUJpR2sw3gD3WUeBYbaQQVgUSwNhYFw8FPvO3vlUdesY2e5QpZL3rR?=
 =?us-ascii?Q?Y33MIJfwddIMot7qkSf90/6HROujqO2oEPbgEgFOaJ2TsIiOh+MqoTcgkHfZ?=
 =?us-ascii?Q?i+06r8Wp7kEx3MexJZ/ekcQXurhIlyUDA/19aXMGQ+zjOmmp/aL0F+zwsrRM?=
 =?us-ascii?Q?H5akPjXLNxZYd1Q91MhntvS0lkCrsGgawI/9rnSIyVbEVbweVjfqqL5ZWhYW?=
 =?us-ascii?Q?OJIEO5ylkouA15fwVyB+2Clz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae51b97-5cee-4423-d43e-08d8e9116ee3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:53:55.8315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPqxLMQUNk3k3m/NQ/0YWLEwWLVIC3e8zUPoco78lZDH9l1EgHkw3+KEpHY56hAny4jsYmZiEHNMIgBbqUGmKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

- Add runtime pm support to dynamicly manage the clock.
- Put the suspend to suspend_noirq.
- Call .pm_runtime_force_suspend() to force runtime pm suspended
  in .suspend_noirq().

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Gao Pan <pandy.gao@nxp.com>
Reviewed-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 50 ++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index bbf44ac95021..1e920e7ac7c1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -574,7 +574,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 
-	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
+	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr,
+			       IRQF_NO_SUSPEND,
 			       pdev->name, lpi2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
@@ -584,35 +585,32 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
 	platform_set_drvdata(pdev, lpi2c_imx);
 
-	ret = clk_prepare_enable(lpi2c_imx->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		dev_err(&pdev->dev, "failed to enable clock\n");
+		return ret;
+	}
+
 	temp = readl(lpi2c_imx->base + LPI2C_PARAM);
 	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
 	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 
+	pm_runtime_put(&pdev->dev);
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-
 	dev_info(&lpi2c_imx->adapter.dev, "LPI2C adapter registered\n");
 
 	return 0;
 
 rpm_disable:
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
@@ -636,7 +634,7 @@ static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
 	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(lpi2c_imx->clk);
-	pinctrl_pm_select_sleep_state(dev);
+	pinctrl_pm_select_idle_state(dev);
 
 	return 0;
 }
@@ -649,16 +647,34 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	pinctrl_pm_select_default_state(dev);
 	ret = clk_prepare_enable(lpi2c_imx->clk);
 	if (ret) {
-		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
+		dev_err(dev, "can't enable I2C clock, ret=%d\n", ret);
 		return ret;
 	}
 
+	return ret;
+}
+
+static int lpi2c_suspend_noirq(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
 	return 0;
 }
 
+static int lpi2c_resume_noirq(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
 static const struct dev_pm_ops lpi2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
+				     lpi2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
 			   lpi2c_runtime_resume, NULL)
 };
-- 
2.25.1

