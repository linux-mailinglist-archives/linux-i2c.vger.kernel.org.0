Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC93A75F3DB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjGXKwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbjGXKwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:52:34 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC1312E;
        Mon, 24 Jul 2023 03:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSY+Y+kPvG7/U6zDfvuD9mLuLTTlpuQiR7y8UxaOE1T5klSRIOYSlt1VVHxOJDpaG8PJh5SYhLPfuHLcOeHb++/gaFHUuWQV3NCui8lBY/5cCWGR8uk5hobhjl43odiJwT/hdbTGS4QiRMd4x4K5TITwj8c1ZVu9D8v/Yy3aGlSWq1H8MXqI3C6Rdrj/8xJspcUwvrdMT5Cxa2DOu+iQ+UDuDQ1iTuaxUfNvlCDl97ZLF1FGREKj67hAvPym5vRZOLCHukOTsaFx4L7o4gpI4KSTUjEdIg/h0pruDNSc1pWYqhJmFg9AK/laBjXINSQKn6SR5Bka0+zLKK6OiKU03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wntYVC5Q7KVWl/KgJZBaPOWfuvVclZdV1Z0J8n0AwcI=;
 b=aIAoVq/bgnOLaL9L06Ed2L0UfwpcsOQ5Qx+PkwFNemNAXkk6HkUyaGBOyJlUa6UkSoWUeQeoHeztJaliVS8s2VA1fQdOy3uQD6R1VjVUNUxRYkaQjOi86mbaU86kODBULCGOqQDP9fON6r9GGC5GevllkvFMfBr7OfeVA5JRfedqThBrqmi/SFXECljnhPF81v9SipeirEKwknos4EPFtXsnZ355yYQEYa9h+J2dcmZvg+HtGoCgsYqWKNErqHpjCjNrn6cik7awtK5rIVdPii/x85PSO8S6rs4QGw+Xi+tIGhH4BthOU/gUdwP2IAtV+X+ZbphQry1JV+vzU5/bbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wntYVC5Q7KVWl/KgJZBaPOWfuvVclZdV1Z0J8n0AwcI=;
 b=RMZyih0iBd2+JbTseddKNo4I2O8egxwrEP6PTenpA9XwewiaAeq+DEQAX16ksL0o5oWLnnSFL+MaGoX5rcXiLOw8/1C53vdYalc7Yvkp9Hf8Hxv5g0kaTisjCs6jzxkbsbxK1cO7SL2X12jfIbVxT6KPiku3FMWR4GpKmQC/Its=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBAPR04MB7288.eurprd04.prod.outlook.com (2603:10a6:10:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:52:22 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::7f26:a98a:b8c5:f620%4]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 10:52:22 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] i2c: imx-lpi2c: add bus recovery feature
Date:   Mon, 24 Jul 2023 18:55:45 +0800
Message-Id: <20230724105546.1964059-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724105546.1964059-1-carlos.song@nxp.com>
References: <20230724105546.1964059-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DBAPR04MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: aa24b017-e4fb-4a9f-4d8b-08db8c340f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCPTj7SAQvnaHFAjBwjotsWoTYhEhojcv5xmCi6FH2ZgXbvunjq+Q7n3kTDS0AKvI71fcQOoiIWqLIsJWxud0d0nP1lCK5hFULcVTTWfiHz3z5RpvNqO9XjzC9tZQqrzbTVfVbgN/Q7phTYQVU1TLpFGwbDQNJRZfxroy50+7FJvz5VG8IRB/6zex9aPZRUakTzn4zrVydrAm5Sp9cKsRTbhuLThDuywMj5nycLyukdGqQvrRzZah9J//ZoXpMIimIjDi522/ln+wmqI3fDMgzeHfsH6ntijO3o2ubvz1e1n3e2pbO2egaNs93jqHWPbhJhC1jxkebgKwJCQc7IQ8q88Y0L4BxHiZ2XmPHVjxE2FrPCSRme3FPWArI8gtVNFcFFQRvPwzfMCOzrYJKWjEI4UIqU64m7FkpT3/p2uGrvpusPC+VPfA6xHLe027FUiQLwBcGTaDlVuaPkmPicjnTshpHv23zR4/ytSf/VglS0sz87XkLU6uy0bjfQrPqZKvMg6VPQ70X4phykBc1fm5cYIH9D3bAVIp5Hh35bGwP2UCZCFigKSawzkd179lZpl8VI9KyNZyC0/ITysmMBnub0V4BOB3aL/YTUVQB0ENYf03Y5I/adVpSFJdY9Rj9Gt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(41300700001)(8936002)(8676002)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(478600001)(86362001)(5660300002)(2616005)(6666004)(9686003)(6512007)(6486002)(52116002)(38350700002)(38100700002)(36756003)(26005)(186003)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SCP2LAwzqgykFTGrdjnkFv1J60EaBu7Mjlo7igNCZYU5seC0ItwQQlbMoFIx?=
 =?us-ascii?Q?IOCtHfL8CyM0gHMzRiNXP8NAwY8/7+WhtzG4DaUco0PMsgP2VP8a+VlUhfN1?=
 =?us-ascii?Q?sW/irXXENDQG5dtck9vARObjTiw1ocylVj7hd/FTNxaW1WFrAbSGkyy+dFqV?=
 =?us-ascii?Q?zFShGdH+VTAYn4SeVUvgnWOFFUclHa3mKX8qEIASJW8cOrVUM5IOmDVnFtez?=
 =?us-ascii?Q?LcR7/CBRrhvPhL/Y9e6PV9LfX44p0Jx1goX+rM1kPNMGdsIiId2LnbO3GA0d?=
 =?us-ascii?Q?xDP0ec/5PBvPnG2fUzoSCfR0iXrV9AX3dGzAMC1+AVMMi1tSC9vCSPvjX6R7?=
 =?us-ascii?Q?/FYF9RUqHIjfDsFlHjGdFnY99g3mGNtoSet0ViJN4eklKnK6o0ufCP/WNEnd?=
 =?us-ascii?Q?EdutFJwNSSCFEZfx33oCmH0Io/uUHZGbEa+nJh4xPh7bQx9Kwp+zSpUfIBX3?=
 =?us-ascii?Q?g8tiOayXyTIxtkE1CoYbTS1RDKxcy0BC774TSaUXiRADxtQbrWZtSrdlegbl?=
 =?us-ascii?Q?S6l0+vHa2K+bi7KTYspWexFKNCvGmCoXT7Gnu4OWQjbicMUUkDJgXtiBzisB?=
 =?us-ascii?Q?GQwa6RVvyvWH+mqqs9E5ZZFJm1Obz5ooQ8P1gCtsEXh6H2IxXq79K3zcqIch?=
 =?us-ascii?Q?CJ2LHYBh8rom+1lg0ulCm76y7ifG8v2nUH7Kbl5mXl6hFlZR7HUbvWe0vZVU?=
 =?us-ascii?Q?inDSLkF9UGVvEEd6Wm7M8J2E2SNTk+sVRQjibfeLSPWIzVrN5qyckOrRbY1e?=
 =?us-ascii?Q?cT/XYLOrWLivKe/rAZOVq+cZ9mPhhu4bID7Nw5UW5NCPv24+WQ+X+5e8p+MR?=
 =?us-ascii?Q?1K0XIzVzkDDlwG2IoN4BVLSPQSB30IIDt8MbiBkuwNjOiYGHBoPmkv1EZGYl?=
 =?us-ascii?Q?eOuqg3lgKlWD+FUbLEjg0SK6j5wVgZkjfT1eysxGeb7Skr+tDe5OzFidoG48?=
 =?us-ascii?Q?OX7N5F+T/RikjescR9zafpEK/u8E+iD8a+++nRHJ7n7P/mi3bG7kwDv9mn6f?=
 =?us-ascii?Q?godgS2PJAiZQlclnxbGj1Ms4bdkCsQT+YrKZFl/n1kgzIE7Dft7+sg7uldKa?=
 =?us-ascii?Q?rvS3JNaGl8T8lRniX6Nuo/Df1PSdjnrUcUF1vNl1VS1o0a3ZlY9Bi/+KBCMn?=
 =?us-ascii?Q?CXhh8x/K4rG2VTZoi/1L4fxvFQvHCDz6TmzM/xPzsZBQM4b5EGQhsuQ6VdfE?=
 =?us-ascii?Q?jIaDY4DJRv/rFeyzKF6TilqBV13jB1Wcjl6TuEhYgTHYxlkq7GqslnFnHilx?=
 =?us-ascii?Q?RNoCO5SUx07seeFO0WO41ATLMv5zvpxQnornTD0y3vlM5jUMRjIAycchLjX4?=
 =?us-ascii?Q?yubOXc93cwwiTPCTb69RkBcJS5ht3g5rgBzsLOyofTWBw9bBqIipz195AcvX?=
 =?us-ascii?Q?P1Am3NR2VwL0AU6ggYsoVbxhow9BKQxLQ2kshhL6c/XMYpA/hOLwvLumimRX?=
 =?us-ascii?Q?Xk9ZABYH2eil3UihuvQjz2xWguLQyzoB14YqM5z2haKOl6qPQrCHzqkrGcBn?=
 =?us-ascii?Q?eLZ0+upDVtQ8D9wcg7bV9o6lWjrQNA13jXQw2OMfFCQwJN7cOo8tDkkRysqk?=
 =?us-ascii?Q?45/k4geibBMaXfhMkBmy25z6Bl+zbB5HMUuSbUkh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa24b017-e4fb-4a9f-4d8b-08db8c340f4d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:52:22.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKKuvaK9TP5H5cYISlEw/nQRLkpYiLHDQc9BmxA5DyV9KcKwXF/y6WwyEFPhuYeemgRT9aXruS66KSDV9l/Zmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7288
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

Add bus recovery feature for LPI2C.
Need add gpio pinctrl, scl-gpios and sda-gpios configuration in dts.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 158de0b7f030..e93ff3b5373c 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -107,6 +107,7 @@ struct lpi2c_imx_struct {
 	unsigned int		txfifosize;
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
+	struct i2c_bus_recovery_info rinfo;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -134,6 +135,8 @@ static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -191,6 +194,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			break;
 		}
 		schedule();
@@ -323,6 +328,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -525,6 +532,44 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * We switch SCL and SDA to their GPIO function and do some bitbanging
+ * for bus recovery. These alternative pinmux settings can be
+ * described in the device tree by a separate pinctrl state "gpio". If
+ * this is missing this is not a big problem, the only implication is
+ * that we can't do bus recovery.
+ */
+static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
+				  struct platform_device *pdev)
+{
+	struct i2c_bus_recovery_info *rinfo = &lpi2c_imx->rinfo;
+
+	/*
+	 * When there is no pinctrl state "gpio" in device tree, it means i2c
+	 * recovery function is not needed, so it is not a problem even if
+	 * pinctrl state "gpio" is missing. Just do not initialize the I2C bus
+	 * recovery information.
+	 */
+	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(rinfo->pinctrl);
+	} else if (!rinfo->pinctrl) {
+		return -ENODEV;
+	}
+
+	if (IS_ERR(pinctrl_lookup_state(rinfo->pinctrl, "gpio"))) {
+		dev_dbg(&pdev->dev, "recovery information incomplete\n");
+		return 0;
+	}
+
+	lpi2c_imx->adapter.bus_recovery_info = rinfo;
+
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -603,6 +648,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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

