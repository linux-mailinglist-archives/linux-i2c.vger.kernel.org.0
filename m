Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB0933EA2C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhCQGy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:26 -0400
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:43805
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230245AbhCQGyT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaoBmy5g63CmP+i6aX/7izB6XmlkVtW+WvXEbjPS6IF2Bxy0HV5TvvZiteimyv0Yr2aw6glBTGLg4LlxIartvU47hy7adOQu5SBIH9xvgCvtshWqN10VJ5s3HMLfFYWUcj59zAhnMQbZUhzwOCw9qJJ+F9y6iwICoeExhFZUctgz2b/phdOHcZ06Ar3VL6Qd5mLhfIOvz9MfbhZhViTKvgVa5FMyq/F7CnVyhDkfi85CQz4dL5HH20MTCiheE5LInF9ESmoqQNXuqNnoaiaW/c+7wEhYyssgYLnPDuUtFRuFsU3zGZcRAG4ng/ctiyqFdiSwGih+lgVkWfFZweS1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi8vKhwzzve8KiE8O9KrABudw21qglOjFgR+Ra9uaYw=;
 b=et3koRrdTh7liDZy0IBt5RTttAGuHWcovK2CM2ArK/ezpOCS/nq2oPbFZZ5/vk2DQ+qTqlhbtV/V0cws8LicEZ1dbi+YrXFdrxIm7Kcpsv04kH3lkVhSXZlrJnpGsbU+gIz/BbbAe+95VGm40o+hCptB2yktWZGIJYYitLZrgnaIly0I9w4yLvv0qp8KSlRl2IgfB6ACpGW94JPpNzUwWrnUv4gPEPg7i1mfShL9kKAV5UyAJULCjBsSd0dTTczWDjq8uymgjeV12QVWIKHIa6zVGnocckNmDmNMMMYlS/fxIdKjowaICxz5TaiBB4kI+DJiT+EWAF2Sb4hOdrRrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi8vKhwzzve8KiE8O9KrABudw21qglOjFgR+Ra9uaYw=;
 b=TfGIM37duGD5gnNFTeb+CZF6Ba/UfxKH9hZlAwhs8f3jgVw74vrcKe+HqrzHG+MIdyoC1LcL86YqD1zAKA2hJsTH/C0wYDIIFejnzk5oF1hgM/T4eQzrsmIXWcRthsKKslGUgrlVuVryy8W/GidIB9dn47UeFKUZINVqm7f8KU0=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:17 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:17 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] i2c: imx-lpi2c: add bus recovery feature
Date:   Wed, 17 Mar 2021 14:53:56 +0800
Message-Id: <20210317065359.3109394-9-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d7be10c-1d2b-4fa2-eee7-08d8e9117bd2
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB709139C0405FA16633642552F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UH5KjoP6MO09vrqlQwjyKMAxY42PaKX+UBunvq/7vmkBCwwcw/DiTpj9wg4eatmfXbDoQyjjQghVMu+vz9ZX+QzLMcVzZnjm3k58W5gvAWG5UAsN0/nCwrhPe1MModuyN03JyggH7pesz4Uq9VJYlI4EBs+kojT2ytPkS09rTMcwPOCKo4cbkrdMy/qK238iFxfJN+u3F6umPDulAl6iBoao5ju5RsGoQX39MxU0ds+ZlX56NGdcu+LIRvvasOZ9zfF+iW3rIo2g0+BTap3TWS6CO45UeiyEZ1zX+HbZX4Ybg2O3z9/s147rQ2tqc9EGkB3rlxmMbZ7gVzBi/NGY2t66zi2vXzDCPuHbGyAWGQu6leJ+iJeM5rDK30LplbBujMIcscK0//IaMC3llZPysbRchuu/wqUBED90OvNxj9QHBpm72c/ZDAnRDhubwa2mTK86FFTv1t5a3mBToy9tbE+YPII6EVvYzu5KeQMnOU0mH1xrwF8y63Yyd7cZ47xkbmlPY8ubrEVk3qMb6kvhfv9xwCYihd7gfJjN7wEMkA928Voj0JWGGYa0fjVzdW0WrTFamM2PfVOeH+lVfX8xvJBLsh1XxGjiS2cvON6JWNolmLH2oQD70HjEDtznZpJ9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ttG5xb/8aNWiy+XS4eusQVi0M6ukSWNbriLX3eF9cZae1Y9XeUNH3rjbJ55H?=
 =?us-ascii?Q?SgSmL5hc/8JxzFvzsdOge8O3BbRZxfgWAHKJhvMI83Qw3yT1SQ8UXqeb3dqv?=
 =?us-ascii?Q?v8QHWA4u/rFHPghZ7Ojd0PCVsntIe4E9BhZJIvDNWamQmDrWPsdkySCdDtm3?=
 =?us-ascii?Q?PNNmvwnomG6NT3U039BmuBrLkDj8sebwJELzZurLwvJNPlPCQ+Mo3/oJbKLz?=
 =?us-ascii?Q?aSwOyReybqvpBmOcDQ447G5DqC/Cpp9wy7oQ7LXYbvqLCD7eI2UVYLfnGocE?=
 =?us-ascii?Q?Mn66fM1fpduUIb+jpyRDbsrhRHlMMnIB9+2r3zYDK61Bp+KbdwGLC8LwvGY4?=
 =?us-ascii?Q?FpfMkYerZKrGTwML7P6bULdfPEMAZgUqDq3Pl81cJZF0zjBYq635oj97cPLJ?=
 =?us-ascii?Q?GyMCDvySx0BJ4iUmnFDl+nvFO8gYDcBeDLmONmHZfR1xqR+v3NoxZtsji3sK?=
 =?us-ascii?Q?o4vN23A0/oY96ZpMdNYXXkK6AfKmNNNQjpXWlisKNBejjCNqKUXQcSskxWTi?=
 =?us-ascii?Q?A4uOnPzS+2OJic4yam0F+uB3KSLOh2sCUMg5tVjI5+czHhAoVuSnJMfNJU0F?=
 =?us-ascii?Q?iimQFRvVpxdraWo3zbBxFEjCaQ28WoEYrQXmb5p/4VpJNqHqkDsPAJLJuHJx?=
 =?us-ascii?Q?Jzif7LyJcEgSXdMJGGKUbCd/ZS4jvrQ52JzU/Uv7p2C9uHoCQMvmT7waCmJ1?=
 =?us-ascii?Q?vqoevA+LXOqzdcywte1sQMGGZOuhxiclLFr6YhTg485c1WpGy0D3gYb4L5TZ?=
 =?us-ascii?Q?IEgh85Bqjra7EqRQrwEdogSy0Yndd46OAlDwBRFSQdCpUKf9VSkCmU+UxMhF?=
 =?us-ascii?Q?Uzu8j4R1WHssPvPxs0EdvSpg0ddtyieTFGv6PS6Xg4LG0bQSco/RWNNLYqP8?=
 =?us-ascii?Q?s3zIkL+ZBrhtFqMd+qq3bAwEvzwqPC3mOb9DTzPWKx2jSENzgUH46tJIC48w?=
 =?us-ascii?Q?ykcfBh9DdnKROq1+Nvk5OL6A9fZJAsbUQR66RaNiLUnw69qUJnAhTMGtbzkd?=
 =?us-ascii?Q?CXA3mic5iZiUtv1kFk6KqDqZWpZ4HVEi3AKFyGuX0OeLR50NlE9Hg9HMUxBb?=
 =?us-ascii?Q?9+afA8LWfe92n0/fY1kUYKLAFVhjuIdjZRoHpOVD326ZyOr9iZQwoB9CFqXO?=
 =?us-ascii?Q?/rlC5k6ptYJF/JUOAkd6RZIwARjMjn1zRKMXEPgx/3vtE5+nDI8K2U9y25cB?=
 =?us-ascii?Q?p1rIowBqprSfDrzWsh+rgBtP6vh7rD+1gtcRMWR3ed3yj1vdsmGPOW7rzW+X?=
 =?us-ascii?Q?pDYuwz04/ycsyvE5KP4pTzOYsdJZtCcTJKSGmPmIfUDyMIFw/NAHHmaCfu7w?=
 =?us-ascii?Q?fs/WOXEhTgqS18rg1swRgYA6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7be10c-1d2b-4fa2-eee7-08d8e9117bd2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:17.6390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrnrBRRbl/0mjFxgV6SEhtlI4YLQ/pCgGm0TxKGRl5HOkS/qrJpQnOpJnIObipA0EkfspsaCzZHBSVUHsRUyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bus recovery feature for LPI2C.
Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c0cb77c66090..7216a393095d 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -108,6 +109,11 @@ struct lpi2c_imx_struct {
 	unsigned int		txfifosize;
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
+
+	struct i2c_bus_recovery_info rinfo;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_pins_default;
+	struct pinctrl_state *pinctrl_pins_gpio;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -135,6 +141,8 @@ static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -192,6 +200,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			break;
 		}
 		schedule();
@@ -329,6 +339,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -528,6 +540,71 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void lpi2c_imx_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct lpi2c_imx_struct *lpi2c_imx;
+
+	lpi2c_imx = container_of(adap, struct lpi2c_imx_struct, adapter);
+
+	pinctrl_select_state(lpi2c_imx->pinctrl, lpi2c_imx->pinctrl_pins_gpio);
+}
+
+static void lpi2c_imx_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct lpi2c_imx_struct *lpi2c_imx;
+
+	lpi2c_imx = container_of(adap, struct lpi2c_imx_struct, adapter);
+
+	pinctrl_select_state(lpi2c_imx->pinctrl, lpi2c_imx->pinctrl_pins_default);
+}
+
+/*
+ * We switch SCL and SDA to their GPIO function and do some bitbanging
+ * for bus recovery. These alternative pinmux settings can be
+ * described in the device tree by a separate pinctrl state "gpio". If
+ * this is missing this is not a big problem, the only implication is
+ * that we can't do bus recovery.
+ */
+static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
+		struct platform_device *pdev)
+{
+	struct i2c_bus_recovery_info *rinfo = &lpi2c_imx->rinfo;
+
+	lpi2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (!lpi2c_imx->pinctrl || IS_ERR(lpi2c_imx->pinctrl)) {
+		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(lpi2c_imx->pinctrl);
+	}
+
+	lpi2c_imx->pinctrl_pins_default = pinctrl_lookup_state(lpi2c_imx->pinctrl,
+			PINCTRL_STATE_DEFAULT);
+	lpi2c_imx->pinctrl_pins_gpio = pinctrl_lookup_state(lpi2c_imx->pinctrl,
+			"gpio");
+	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
+	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+
+	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
+	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(rinfo->sda_gpiod) ||
+		   IS_ERR(rinfo->scl_gpiod) ||
+		   IS_ERR(lpi2c_imx->pinctrl_pins_default) ||
+		   IS_ERR(lpi2c_imx->pinctrl_pins_gpio)) {
+		dev_dbg(&pdev->dev, "recovery information incomplete\n");
+		return 0;
+	}
+
+	dev_info(&pdev->dev, "using scl%s for recovery\n",
+		 rinfo->sda_gpiod ? ",sda" : "");
+
+	rinfo->prepare_recovery = lpi2c_imx_prepare_recovery;
+	rinfo->unprepare_recovery = lpi2c_imx_unprepare_recovery;
+	rinfo->recover_bus = i2c_generic_scl_recovery;
+	lpi2c_imx->adapter.bus_recovery_info = rinfo;
+
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -607,6 +684,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
+	/* Init optional bus recovery function */
+	ret = lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
+	/* Give it another chance if pinctrl used is not ready yet */
+	if (ret == -EPROBE_DEFER)
+		goto rpm_disable;
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.25.1

