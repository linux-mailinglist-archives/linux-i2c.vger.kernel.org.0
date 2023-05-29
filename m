Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA271459F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 09:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjE2HkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 May 2023 03:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjE2HkI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 May 2023 03:40:08 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2080.outbound.protection.outlook.com [40.107.8.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F1DA7;
        Mon, 29 May 2023 00:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4XbQrdQUWjQqrov1H5IkMZnSUkGizgZIy3IDIOIascFNDbyNNSTRN1BI0zDvLLdh84LeQGx06/529Tsq6mlpN8Tib3LsnImsxpZ3mymHHlgaU+pgDfmaMzRJHM7Ro8DmgES5j273Gp7rAFJpHq7VgqnfQn58fnsJYQq2RS35NVqtDa+fZ/6HckRKkjbYSOAht3lEwJzYWZRzJtNq+BknYffLsOinx35WKVAL4RGPau9qzMcCFRRwxpcF5xSsBS43vOEXVmwvWH8LgH6VrMYUJIP1u0ADuRHHFdZx5vCBSgZ/eixYrTXxdX7jMeZlTij8IATGQoDk0LbV/KUqSt+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55GmvbtwEJIV5MfwsMxAt2EkDxjDZF2R3rDlxcBtDYY=;
 b=OtkmdLGey6/hThcF9T2MhDH/qIiMLGYuFF5vZFjZ1Bq6eSU61l/fXXIaNWDjJ3OP9btKz3N05PEXRceiMTd0yIuzhbpH7DQAiQSSspVHETJy/kNznmYErhDZGNQswXAA5HfACpp6SikVgUhtpzjXCcRPIS8ObFkzxHOk4xt6oaFgjxymkSPhHX2/45FiQ91G6k1a2i/P285/0DXVQ/eFCqk/SiKWl6yi53o+/EtD/om/zWQAHPOd0EXbVkwx7bKFG35zQl4zelIxk6npt+ZDIIfltMvhTWxGXUKO66juBJinfs9WqFUSZGu42GFbPEwLO5mkoA+6V2EmIO0GcMbyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55GmvbtwEJIV5MfwsMxAt2EkDxjDZF2R3rDlxcBtDYY=;
 b=lhAwlY+bS3FcKkvEFbsDvMaN31NdLlhKc+dPMnBIW0cWTxvy9jutzUkx+TEVxyCxK4FaALTEiSMubxduRa+KAI/ujimaDQCbC7BWmCl/SLIt7CaV/p+cR4UiQmNsMbc+ltjTilpwjjforIBfDuB0lM4vdMFdNimik4CGq5pVtSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 07:40:02 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 07:40:02 +0000
From:   carlos.song@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Anson.Huang@nxp.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i2c: imx-lpi2c: add bus recovery feature
Date:   Mon, 29 May 2023 15:43:01 +0800
Message-Id: <20230529074302.3612294-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:3:18::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ea5f16-4a88-46a8-18cd-08db6017e955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jdx8j+Rs1H5Ptl1/0SIgX3/zc1+8oZEuj3RdOsHoJDgoWy0JGadldMvkOX2j0Cvj2nmB5xs7hWzH3IexQz+LyxXcVKeTGb79WIu30clYI9ZzNuOGR9SMBu6LoVZL5uBNvCBcFp48W7fT2TgOikIO6wxcXeESE1YlZqvlqBfHrnT2PY886tgAvsA2CMhP2XJscP+dT8B17ZDHv+7ZxWSPU3WG1Gc7roPBUnAU0HeNEEgemMo/rSzaeptf64xexZ82SYTG+vj++1UJDoJ3/8notVGNNGLQYDOWi2MZWWlVM7S7jHa4XksbjCzwp6er1Vkf56ipI+bqWjnindHyjgQLXfEiDg2g7EO1Hem8Qdhyh25A+ptHS6yqVRnaT2Bi2m3amGT+qTVPSTYIFeBLmleJXj5CWu/1jASZp7mZzt6lCRXofJQz82rcLWjyYk1SDZ9SP4L+WZrqHdpkNvJdKPi1WVcymkbSxCvg60n5Urni8YGUE8CPzq5aDTFueHN87FyF9WiG5JyXgetED+dz3TWHuMjgImlW+vRCFmg4aAuQXZM+UU0P230/ca+ZckhpcKNoTaEbEW+h6WiXZ7A3ZoAvkL+0sYR28KNi+YVSYEI57nOFqBvKgimu6sAsj1NtghwC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(186003)(1076003)(6506007)(6512007)(26005)(9686003)(38350700002)(38100700002)(41300700001)(2616005)(6486002)(52116002)(478600001)(66946007)(66476007)(66556008)(4326008)(316002)(7416002)(5660300002)(2906002)(86362001)(8676002)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bgXYLthuaqxEdB79rIxZ4bCpk2cCbxepq4mUpbRIE2VhQ7sX8qvW4TUcSFl6?=
 =?us-ascii?Q?QVjM4tyy7xxvF72Kzo7jaLcRySgw0vB+Vz3ZMcp4LUYEkvUGZLAyRWwDJbOu?=
 =?us-ascii?Q?MjSaa/+tlz5e0XybWa3X2cB2SBnFIOhEQyJvL/QVTF93KX73ar4OFl6MhH6u?=
 =?us-ascii?Q?FL3S67REVhYO1mI9O9jt6gfj/n3xK8MP59Yr6A68LB+zlW1ugEQO9b+FeJt2?=
 =?us-ascii?Q?MeCepUXFc+By51rXRIzxuQpWKlaDYgItQHyxguNYObvy9Y0Pt3XhXgnPJ6h8?=
 =?us-ascii?Q?h9OLpcnQb30qo5O3ow7anH+RhBr2OkUqtjEheK+kWeh7YId1iTKlP6oGGtUw?=
 =?us-ascii?Q?EurdaPDHy2jenSCBe/+gxaIaACjxfDnHMLfLo0NadO4oa+8xKyxyMIdUVMxL?=
 =?us-ascii?Q?t6heWOUNB++YhFZziPLPqwmn2DkHkpWm+pY5Xi0+jipPijKCx1vCaM373uFi?=
 =?us-ascii?Q?pA4XMgSpfqv2cYrE/Irf9t8rN/CW+0RE6zTUINfSIVWAucnYeAu9UE4r2f/h?=
 =?us-ascii?Q?yLwDyPRhajeL23bbqUzMhIFS75yXC8kfHHgqoxg6PJvUTX0XYy33IdZwIjFL?=
 =?us-ascii?Q?XLLtNj1PwzPmTkVl7KjgkQ69fz3cgIRZkVi3uUREdM/kLrcJ6qVuheyTQtCg?=
 =?us-ascii?Q?vIziR2t4GqqDiiatey3Y2o9zjsAL5AZIVica8V0VNQTp/m7Hd1lX2Dn6awpK?=
 =?us-ascii?Q?cNp2Eg7TJDk/PU/Gy5KxAywwU52cKKG2XXlLx5Au5efhvo9ArDgoV7RaY/p+?=
 =?us-ascii?Q?HPUbML98cyQdFB3kCvaDVVwbm94Eu0KFPevBFQLL+TxIM1XEuQcqkZ+TssBz?=
 =?us-ascii?Q?Klsaj+e3cv/i8LvmBgT8yjOit3GDe5N4mKbRrFVm3BHYKhH0nEPSuOf5rmHh?=
 =?us-ascii?Q?htp4L0vrYJYsd69Nf6dwYg+UdlOggfsGHVA1qCDWrHSpODNLavXRGVyADCVg?=
 =?us-ascii?Q?P8hQFzgnjzExf/k2QYAVobEb6V4LVzzepJKvD58TdXv6SU1DTmjRuJvJjrTj?=
 =?us-ascii?Q?xslHX9p5X0VioxaFYVcVcyqJYTVPzUnXW3ByPY4ngWe6GbABq0ztBfc10ZVI?=
 =?us-ascii?Q?RIbjsBfF+vaAX9MPQn12KgifJm2i+Q05VIUZhNZ/yjcwqfAA6QPuWO12ptE+?=
 =?us-ascii?Q?RakfphUVtrZwKgA6b8u3m6Hln0FOePinwbMA+0vHqpj1t0AlPSaPq95xMuWP?=
 =?us-ascii?Q?9mF07Dgzm8GmZ9lGjY8VjuyV0hAUO8cx+eMt1gC0Nyb0X8Z/N/A2GN1WfRQu?=
 =?us-ascii?Q?U9WApsCQLEg1CdS5qlDGq2eBfRproSFDZKTrPHBNp2rHs9d7/xhkHoCzFDFs?=
 =?us-ascii?Q?eE1rA7rVkUPOS40FQ2LKEIAE9pBPdaeAEkvd4KKgOgqPCky2ajOr4zJ4cnjC?=
 =?us-ascii?Q?RlFCx2VkhmhhtSEq6sQ3n2d/KRkaZwicMW25DmW/fpa1LNje12/uDT6uBNzB?=
 =?us-ascii?Q?kKQoT0/6eP6HzM44rAmg+aQ1WvV5DpQD25VFJlu2ocl3GLniGJg3XeNuBDdi?=
 =?us-ascii?Q?ckGUZFB/IxTalDU4qAj5W/Cbe1uaAOSxiimHhNEKi2T5C+WOs3t1Iu26j0Ul?=
 =?us-ascii?Q?JM4JG3EWtttySgR/AlT3jq7jaObHwiykddXmpk5Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ea5f16-4a88-46a8-18cd-08db6017e955
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 07:40:02.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sN51A7Kpc1tCeUe3rM3vzFB3N8BW0tje2M1LrB58FMN5eS/3ORe5DnzFGojEV9MBpXS+JJxOgYaI/Ik5WYpbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Clark Wang <xiaoning.wang@nxp.com>

Add bus recovery feature for LPI2C.
Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 62111fe9f207..40a4420d4c12 100644
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
@@ -107,6 +108,11 @@ struct lpi2c_imx_struct {
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
@@ -134,6 +140,8 @@ static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -191,6 +199,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			break;
 		}
 		schedule();
@@ -328,6 +338,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -533,6 +545,71 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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
@@ -611,6 +688,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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
2.34.1

