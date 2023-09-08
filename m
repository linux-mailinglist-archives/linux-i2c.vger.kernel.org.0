Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F2E7980B7
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Sep 2023 04:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbjIHCyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 22:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjIHCyR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 22:54:17 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2042.outbound.protection.outlook.com [40.107.8.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AE81BFA;
        Thu,  7 Sep 2023 19:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTv/vIFCn35ACA9qAaW/ROzfoSlHj3EyUdQGnOFAjeFMZzYktYGhWOanNGVSd1GsyY1vz7PLSUQ2w/xGSo5l55pxrSBZlPObhakbH/lsu+X6af/Rm2WhOyyeDF1WeZwv1L4/vYuu6kocmu1pmlSkhRClMEYbN7/n6BoeUnH3AAerLeYR86Srr9e9OwjfoMYo1RrHWzv3+zM7S3Zz/zPHNiWFpM7WecCS5NumhEAZ1GbDIR6VNSV4SLd3tnn43SQqKaUQddkaC+3Id8ngDpyKkBhNoAknwgEdqccXX5beEFqgndA/bMPyYYkdBiqYF6QuMY503+LHLCt4hCV0MwPxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaIpEw+Sv1zr9XgVY2rioJZkW6CTsoz2tLWibDXY7b8=;
 b=AywxfBMo8OCga20+ny6NuhhzhFK7q2wMfrRqkkhiudayFGqAFB7NUSFvbn9DvIKB12YXOC8f4XaxZ82S1bagkke/FWzf9oJ/tX5tCjquaAep7m5C+sm7S/vvT+k3TFpZYHV2SbIvRIBuQBdY8cnp0a+dZtINkUAfzZ9C8tRcT4Fr0X91dfEYsAq+yQv8lrajzOpthajp1JcJm9JDAIWuwsi54BlmLx0dD6W5J728RfIegXRqB30/QKOPbyH6BwvW3f/fCTfqlyQp0qZbO3I1PWlKDJPsIrdhxbTvxC3xA1FjDCsXrTaWnQz2Gn8yE6wA8VmWhKRyVuMrp4ROIYr+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaIpEw+Sv1zr9XgVY2rioJZkW6CTsoz2tLWibDXY7b8=;
 b=O2YNErb7mFhnby9Q9hrtmuDWcNJ936k3MZIHIZq5WNnl7j8fno+Z6Ss3/25mbpqKmow5/97AtL6vNGqqOzcMQsoExYrXn8blIs8us/4viT07er+N2pXC7icVecNmn0sd/anG3p/8p3g4de1ZO1Du97Ek/FkbLcbBDbU8V/G7t7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 02:54:07 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::dbf0:a2ca:3a03:afaf]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::dbf0:a2ca:3a03:afaf%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 02:54:07 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: imx-lpi2c: add bus recovery feature
Date:   Fri,  8 Sep 2023 10:58:32 +0800
Message-Id: <20230908025833.786452-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM8PR04MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 74200df5-ecf1-4ea3-70e5-08dbb016de4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8blCuyXmblzcIOGXNHQm++b5Fxa3xDGGwQJyKyUxJSz0OJ4LE+yXuybNqbL8NXIdcC2HFp/qEsDGg/NJl+ys8USvq4Gc2uWayxVCparZDN2Na2T4p7OmINOZwhpHswoMhX78gtxsSDUxU855zhFv0V51pM4tz0e7AKfB9S5bEYuMDj8g8VCnUHOx+jCFrkbsYxdhKMGrc2QnjbrtNJjDpZhi/Lm1EBa7mOHa/Kds0NUEIq6b5oWCAccbCZ9iUkReQMDjFOUrTg/UylaFNMUoJ+WTbMRd/erYLryEOcmN5IqWtQOpWIzPcGA4eCKFbRf0SXgUGGqP26uMuv+0my9K1wY8i9vhI7uOA3BxP7FKb6A51HIlfbgDOFJqSAEdzIW1WMF/hz/kYn2pm5GytTHUxeD7gotzd9w0yQnaRlqy0SBcI6BMHCvrZvkZ2bCOFNqUJIO1m4Xac+ZauoAhDIEUBkGfzvaWPcyPrpdbtyb8mgl/RhyW4a0MRR94C8sg82blJQ4Link/8wezipNvc1fUzFgbt7Gs9tDsUGqEe4O311j4o1LYCbNeFeBSHoVGyzIewFWn05RKYxk/2iE/cQCWEsGP8R3vLCH7QAknqfbcYt2qhBHwd64InDSfrrUjNsC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199024)(186009)(1800799009)(86362001)(5660300002)(8936002)(4326008)(2906002)(8676002)(36756003)(38350700002)(38100700002)(26005)(52116002)(478600001)(6512007)(6666004)(6486002)(6506007)(9686003)(2616005)(66946007)(66476007)(316002)(66556008)(41300700001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wR7LU6WafTfFVrgAWnP4rWnmEcrYlc40iPbEhrkkxL0zkeZ1+07oJVF+fR7t?=
 =?us-ascii?Q?p2bTUFkj5Yr6Gv5pYlROkxj8g/6Rl9hrFsnMbwYA1uggnJweNA15WClJchiA?=
 =?us-ascii?Q?YgEJMOOV2krm4z2i6rDNTMunKBT/LBQUUXeuhxY6Wwe+izdkppbMlZGvCaa/?=
 =?us-ascii?Q?GtCAmQrcFBH+vc6nZnN5vQuktYSNK/htYotV3sF+v0SCnd9IT0jRptEj31Xf?=
 =?us-ascii?Q?N/rpsZ4AweKLKQdRC3aAXdw5G5zCnqZ51DG3nWfXsssOXPxL9e7tB+YNjzgY?=
 =?us-ascii?Q?Zkfun3fOraiWXTYK4EMzkIP0TyGEnsW4gQjtj/BF2+4v7ATJulZ30Y/lC9aq?=
 =?us-ascii?Q?DFxd6PUSqmlY3HgqFNH/dqxXa3LRIOXstyaaCoDBET98NrvU9xkrU48v80fC?=
 =?us-ascii?Q?Yz4II6t+G2jbp4Haa+z2bWNHHswedOHCTsCxn9u9A1zo61MNF8+mBjJjzyy+?=
 =?us-ascii?Q?8aThhwo+DP2zyI+vx9tWAdOehDDTYtdiq9bG0+IkvlLjQYXMU/t4KeN3dhvs?=
 =?us-ascii?Q?/wPy0Q6jQvahuYcBFmlAa0F4+qvYWOwbO86fNU8ZJ1INoAHte82yRlESE0ae?=
 =?us-ascii?Q?/4hdTgCCH1awTyj0hi3bmyRvsS00nhQ9IoDHcWTY7S5L5BYaQ8phtovfsll6?=
 =?us-ascii?Q?s/aXx5njArgKHaOauSj+6LKau5YjupjnMoq+eEXZlABFiBxgGVrHCDSSNAwb?=
 =?us-ascii?Q?MjtmX9w7DttXObt1F1QGtfW4htZHdJB3wvsrPGvFHrNA6OsW8zvIVizClz4k?=
 =?us-ascii?Q?DHxRrdj7FCiXGjba6D+Ktmrakc1Zrf2U1m2N6As33uMquRjRoF/jVbUMcjoz?=
 =?us-ascii?Q?lGWjOpV4BTmGP+ZoTU5DzU3k/PqAXMNwvlV56lRldtv5Rog6PlMawjwpBVxD?=
 =?us-ascii?Q?4XV15A7ydIj6rIkFCvMf+9LzMxwwWnrtu8vdEwVigJIyW2bW9uosgXNup/S4?=
 =?us-ascii?Q?rGjp1Cav82eaEcMIUaN3RYAWm+IFag3PIm+CtSgeDjGJfe0Pcpx+jJ2dpxPW?=
 =?us-ascii?Q?f+DwPOFt/dLkH6ZnBM9MGqiWyfWYWQefbROGTD6ZzOYVpiQD856c4dO3dh+5?=
 =?us-ascii?Q?LTVX9YexZBk+nCsNpcLTdZelmeydYclfnjjEADiJbGxk2RmHJM6tXfNOde7m?=
 =?us-ascii?Q?65YS0jshahnbMlCeMSFEm2st86X84xjVhVaOW53leN84q5PLFR/CUPnfeeai?=
 =?us-ascii?Q?m15mBKoajIsASNl8re47ywYeMj4sEpdktbYMVxReZW3vG0gijT8sgkxwut5l?=
 =?us-ascii?Q?Fci4h+zMXPvkRjNut1xyCmZXH0rPkhRvaaoV1rL4P8h2ctsv+lzcyZJSy1bZ?=
 =?us-ascii?Q?e6t4YkaDNeLXitmlR4kcT5xmv4R+hwdmgQ33kHaKcfreIm7EPLoz2OzJcj4p?=
 =?us-ascii?Q?SJmfHBTf2NyaD09J9yCtO6dXKKrYYfYO3EX2dY+o/U8xe1EiMAnI2cqAJ863?=
 =?us-ascii?Q?iYgmFRjplA5P1A6rgBEPQAQIQyzloSTE7K3I9+XisY1V0qFAa9cFmZhEMn+5?=
 =?us-ascii?Q?sZw6RIQI2nT5bpOcpfkbqDsMMeRq+dsNyzwKRkIX+YPixmbInWP+jE4bw46I?=
 =?us-ascii?Q?Hur5SlNw3sJlkRccKA3F+vvL21ZMtGWmQAto0tZa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74200df5-ecf1-4ea3-70e5-08dbb016de4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 02:54:07.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4b802zYrLFKqB0D8+CpoyToqZHeDfesEK2ZrjPI2l99MPNHLNjLfVQ24tT2NKYVONuAlMbigaIhaM0eUWV7YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

Add bus recovery feature for LPI2C.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Clark Wang <xiaoning.wang@nxp.com>
---
Changes for V4:
- Fix error conditions to return error value only when pinctrl defer probe.
- Add review-by.
- Clean up code.
Changes for V3:
- Modify commit log.
- Modify the return value in recovery information
  initialization function.
- Modify return value jundgment in probe.
- Simplified code comment.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492..45ffb672fe8a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -106,6 +106,7 @@ struct lpi2c_imx_struct {
 	unsigned int		txfifosize;
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
+	struct i2c_bus_recovery_info rinfo;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -133,6 +134,8 @@ static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -190,6 +193,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			break;
 		}
 		schedule();
@@ -325,6 +330,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -526,6 +533,34 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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
+	lpi2c_imx->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(lpi2c_imx->rinfo.pinctrl) || !lpi2c_imx->rinfo.pinctrl) {
+		if (PTR_ERR(lpi2c_imx->rinfo.pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "bus recovery not supported\n");
+		return 0;
+	}
+
+	if (IS_ERR(pinctrl_lookup_state(lpi2c_imx->rinfo.pinctrl, "gpio"))) {
+		dev_dbg(&pdev->dev, "recovery information incomplete\n");
+		return 0;
+	}
+
+	lpi2c_imx->adapter.bus_recovery_info = &lpi2c_imx->rinfo;
+
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -600,6 +635,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
 	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 
+	/* Init optional bus recovery function */
+	ret = lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
+	/* Give it another chance if used pinctrl is not ready yet */
+	if (ret)
+		goto rpm_disable;
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1

