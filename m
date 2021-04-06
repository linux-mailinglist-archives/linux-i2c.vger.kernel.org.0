Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB7F355244
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245603AbhDFLdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:33:50 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242950AbhDFLds (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crdwivKDBjAa3HpXm+4UEUVRJLB4F4OpcOv6+LXVqPLbui6XKuHJ3bn+wyzrK7EWHZq2cT7GLWvGa5YZT8IqOxdu9ISdXT2NQ4wZH5HMGfRF4yR1TiCuBgrBHot6TwrskYPqEQ1FcvkhdIwFKGCtf7qop5iGrvR2ZyBNR/vRvziwc5p48WBiYBUmgspSn+vFK1h/rNLZwMNXb2C7exW37ENAs9wYwt475ReiZ4Znkta7Vh/EvCn/R4m3DRzttzGS145SZk/ua1VKGhB2/mv7Pge6/DhIan6KPgSHjUDcI0roncx8orTqWwimifcfk8V20lx19M4oR2O2hdFzRYbCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ItK860xtb6WtGa2MT62um1Y1RoXjtqAHsk19jyRhWI=;
 b=Z9McqcO0ldoqog3JtUTXVV+vEkkp7mH3U/CJmyTLGtykhAwZM0RVEMjEjuG2YySKedejUO1GvQDQfDLtFdM48uMGzdYyjlIU/bSOm/wl/dUQAt+P49psdfY+yRNGgCwbkMQiBTOgQLVosHIbWd3mgHHchQv+2BKUh31Uld1egi29PXHu+eiaxEDCSUEz+ipbAE+mnhBqJpE3oVgxgOc4vIlKKS/b8KxGtv0gZhhTWMOKEzRHOX+9Ef5ERR+cvP2prRmfTzcVxy3+EzJnLfUL40us7l7R/do/6p6iWvBtg5w2brNOBT6PZ2LKSFhICVdMKyrgJ9m7sR9qnvnjKWRszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ItK860xtb6WtGa2MT62um1Y1RoXjtqAHsk19jyRhWI=;
 b=m4/T+dri4oXliMtdjTgad8CSa54Jfb6xbwLhWmIE+ETZcjoaqO/O8ZFS27THEnnQWVRzLWOCzOcYWU0pjxa27/5HNLJLuCn9XFtECROR1vI527p2JOlNXNEcxwPWkxJv7pvzurLVOtr77R4cJA0c+Lba/0HC6Yg0n3JhQdEj2WI=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:33 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:33 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/18] i2c: imx-lpi2c: add bus recovery feature
Date:   Tue,  6 Apr 2021 19:32:58 +0800
Message-Id: <20210406113306.2633595-11-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 980d1739-2dfc-4deb-f904-08d8f8efcf1f
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142B92696C79FB37958216DF3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXyWfQpGTValco6Y2Wm7n547wewAceIbnkeVxKPhvSTCU5xgXb0WoSo3PGqK49ErFHvzKvV6pnkOYzoJQewRk+gypMZEm+Pgi3v0BkeiMelFNYcRAPdZf9BfhiwmhKDSk0uhWcAd4rB79lPT29fzQidXjib4kF+nkUpWsZ+Ldmm/JYf8LbW2zuwYDe5R5AY7MHrUj8IhNgTnGiNMZJhJzuD4XQ+WCsZP/RL85jytuNj7F4ixOEmWkpa6VMMEXismWACsvgd4oijjn4vp7FEXn2vD4QNfkygbLh39Bnf0snxDvSFd4T62Xfk1x+bej2SFU2LxHgENMHSRhyeJcxUoxzEvQnTSX4HytP/Ew7c8RaE3OGPl6tlJAltm9pVWm9dAIpUcdwXMmUXbqtdnBSA162/FEi6CwNfgxBLt1UEDoZT/i+55cUfTmT5a39LS+Z7ANeIIXzkqavbjhgUBCYBOdxJyU870/rB+PmsEzfZaHREpY39WgforI8ma0DOu75GHYu+D3s3sm5FX1CFDzhnslVXHWenZh4lTmxP/jRmHJxmICU80DjLAPZQTBmu9QpyPhekwIh6VKIOAODKFg+g9R4ghY9SH4VQ1BBsa4ixXnfGMSV5zoCgPn8Na0f0pE0wVnsPXJ4mgMEFu2mxl7qYNhielYaZI2B66ms8Y6Ab8kKI8bzev7iBJZB1vrrgj3J034gR7glJjPQDkmmZqVG01XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(956004)(6666004)(5660300002)(1076003)(4326008)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gcs+n5YPz6ncZvqyWKKApCeuZY9AnolRLT0WhAa+TkeO6YmEOJP0bKPv3P7y?=
 =?us-ascii?Q?unX8EUicr2VlIaywLgjqToO3/zTIxb8upkf9YaclDoZpnIb8/VXChlcmXwxz?=
 =?us-ascii?Q?KG6iU+SVy6wNZReyW99EI+WszV9GfIyCd/n3TGHjzygt+eEoKaeKjmwLF/Ug?=
 =?us-ascii?Q?PfMVh3ntZBiUWnm3YzNoqY8mh1gBbIb36/X9NeUGwL17so5LNVeVUgsJBA0Z?=
 =?us-ascii?Q?2eAqxJ8x3VgXXqDHl/VKh2704v6sHXtuN+pHX7JKbPGzUdFyrj4JePz5mT9L?=
 =?us-ascii?Q?IzF7ScV8Pfb+d4cAwXFmG6tyQrSEw5DKDA3q13cFORGFQ097e4/mDaMCQIPs?=
 =?us-ascii?Q?72OlVypbTkO3O5w153LdYZgu19O/B/ICSgGlMP13GnhgxurwEA44j7oWIExR?=
 =?us-ascii?Q?foAiQRE+Wf2avqTIK3/2EjiwKO/lUzArIz2XDOxOc+RR/JiXoBtUhl/ZnBG+?=
 =?us-ascii?Q?A35VwybQbqGN28Ksqz/T4Uxmf3ukfoAX7gioUB5qcCP0NPJKuHpqw0Oz7/oO?=
 =?us-ascii?Q?DPGvDKsKbIB+uCB5Aw3DnD+VRp/s/VNqlf49xVfxkAysgHYGeBZXxzIdc64V?=
 =?us-ascii?Q?x6wbWEBvaYXfl7dpXd+zKj6TeKyrEBTspuJ3IO/4zAB+UaD5ZsXMVUsFdXR9?=
 =?us-ascii?Q?2gu4V0O09Yn4GIwgnt04mHwGZpdIk5gf3v3L7cewVtPvjwJR3cDxcS7hDnTB?=
 =?us-ascii?Q?IMK8IgaagtY4/YnBCh/T+12KkIygI7jBluuvy6vG7+ZXxL+167w7fCaWOOr/?=
 =?us-ascii?Q?Sjj3yKgCHD2cujmQWq0cBmWUqBOL33PWr4Ll8e7NMMLznLl3QSS92G8vta4H?=
 =?us-ascii?Q?cCajmimJyzqN6eJ6MiAICZXimIhf8wekwUmR3u5SikGqY5C48EYeCrF17pxw?=
 =?us-ascii?Q?fAEscyFnzkpFCuYvZtEBKiF3bLrIbhofqGmGQISuHoXs5CPrHOqLH0dhgsFO?=
 =?us-ascii?Q?gNx7G3NsT33DGKld4hrhPgKa3sVIAOdhF0/+U3m0vB684niFxdLTLDMzXgbW?=
 =?us-ascii?Q?s09XFFIZ54FboLnVCVcuPUytEh6VJl+CDaVYskH5d19qc0dKep0mRLiaA+4U?=
 =?us-ascii?Q?hC2bdk3hEimgkT+RpnO0E6/d7e2sQ0SnmTnPws5yjJ8yJhzxhTXrnEi71V8Z?=
 =?us-ascii?Q?LvCOqfT4h6/lPXqBfDcj7CILkNUtIAIBOyfY6lIHr7KZhUB+JbvJasY7Tzov?=
 =?us-ascii?Q?yu3Tf2qfYynJDjVUOQ6fs8BBBTTP69L6d5o0FHBijh8JfCuxkxy7gKxJBAET?=
 =?us-ascii?Q?ZzEegZf4vX//+jZ2nI+AxhO0uq35R3g41wcfaAtcMvKPnykXa4K3LOUAqxVt?=
 =?us-ascii?Q?qjxoLGcji3FKTTSdpM06nQKO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980d1739-2dfc-4deb-f904-08d8f8efcf1f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:33.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf7VQH3frCHQeW99z4I3uYlBJoGh5Jy8/QUlrRfLb5wgrL6RPxYjZrYfoXTmWh79IQAx8jlBu3OL7+LjuWc8xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bus recovery feature for LPI2C.
Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - No change. Add dt-bindings in the next patch.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 77ceb743b282..77dd6ee5a4a8 100644
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
@@ -632,6 +709,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
 	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 
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

