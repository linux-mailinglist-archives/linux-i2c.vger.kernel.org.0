Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED29775266
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 07:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjHIFzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 01:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjHIFzD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 01:55:03 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB3710C3;
        Tue,  8 Aug 2023 22:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCjpYJfWQIBGlwaZA95HoCLgDF7XlUycf7t+ceNLXeAtnWw2iAZaHpgAX9GAQOdsGl/HZhmUa8nrVJJ1qfWslzwNN8koCUX3RqK46hzfVtqsFCeWFOrcoXlnfwwHubgKmXczWXuyRL7Zf+ZXdd9z2UdugbgZpCpAkmkRPKxwrD+GraT74JtY9dwIT857xosXM24n580JteIdb4gHgOXIL+BmzzoyZmFnyZqe9jwjhxXu2+5/i85GxdWDRfQH8ZqGl/MwH71gqhRoNPvJQ4M5G5nZrW7Wa240vqPDugd68vlQ3r2O+Sbbc01tyu2JKgFTBh/hyyV3FMqRKFbvriUfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISlsyE9xANWmYShcYQWWddzHT33XcqHPcec6y2FdJAw=;
 b=iB/1gsKoDprHqdXY71bxH4ExEIuFuqJwG8xCRpX+KYtgh/hIhQMRCMmVdIWECERdUBS+3L0EZdiFn2Z/FUkkEJAi2UP7Si4xPyYsHPc0Qu9QpubF5eROzH2koOlcwNVkwviku5Mgo4AacjZVYLVvMMM5CMFr36oLNCQLkKUltDoVc3O9iDaODVR1TnpLWxHYz7sfh9DQiy6xePm3cAZTDIK3Z/gXd2haq1crk+YyIhpK+2/wgvTcqAA6NO2myGnwvEzigKLIU5J2m3LCbDecd9B6MKikZEF37myUY7Q3qHoKgvgvN0dUmQoXqIUU2zF9EWaMRI17V4oak6niSi8+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISlsyE9xANWmYShcYQWWddzHT33XcqHPcec6y2FdJAw=;
 b=MjZswrL//ZlSBdrqu6MvPgFxtNGBYZcmlhr9kjvziGXVcL88Gl0w+uISmF4zj54ORh6u7bla4+m4S/vuXPNefbO7fPh2nb6WfXS6fYGcJ3PRXgygYqO/U1Llv7FT4PwL8lQ1RHvOh+l3kO6jrBJFdAOhfZBcfGXLsZmT0Jco3dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PR3PR04MB7323.eurprd04.prod.outlook.com (2603:10a6:102:88::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 05:54:58 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::814f:85c1:a406:a475]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::814f:85c1:a406:a475%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 05:54:58 +0000
From:   carlos.song@nxp.com
To:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     carlos.song@nxp.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: imx-lpi2c: add bus recovery feature
Date:   Wed,  9 Aug 2023 13:58:57 +0800
Message-Id: <20230809055857.836427-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0182.apcprd04.prod.outlook.com
 (2603:1096:4:14::20) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|PR3PR04MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aeff804-3cc0-452f-fdb9-08db989d29b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfiwEWX/pRSGusa4rcpiMw0/HlfPNY+dfNmPxG5QmH/Q0VHW+g+XmvAkkIXBrp4/b2rY5wItXxJB5AmfWz4a14CnKfBn015e2CtinqYa1ycAT0DeZXvJ4cDwJJbwcBzsXc3aZkbRYP1dLXwwouxoCxKJF7FkdL7ivN6QEjMZboJoZDiqCOlCmPshJjJ07x+KjP8rWBJLpZQ/NH+SoqE/oCMq+T7UTEIqIizMdcnIj4ePt63t2SXgcajItpZsNbLzoXRx0IJpq2B5W4nCN0p20pgU5LoCUjPbZ8HfSSl3iZZpyzoGkn7663MDNTNjCaiWOV5nleXD24yC9hqaBcW6yKSes48wD0K2gG851zMy+o9458v/ini3e2sAsLQ0FST/r6AaUIFKBNlqkSnuoZalEWT9RTafnnSixcH9TKFx76AScADffkBoUYRi/FLFKUML535Eov031tB6iyVW95W+Ft2rwiP5nT/XULweGQmhaerpaXozjO8UmowwrAjZcL7T6G5JCTthqw6LHmDjtHjrclTNRHFSBNhxXgE8rHTE6U2c26PTM+C5OZYN9ka2sbLUp3F5LWYmjrureYHd+R/0veRQ7NMK0cMGtpFSEPRMdS0CdXZuyWR0DOs8eniWSCUs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(1800799006)(186006)(451199021)(36756003)(66556008)(2906002)(2616005)(5660300002)(38350700002)(6486002)(66946007)(66476007)(9686003)(6512007)(4326008)(38100700002)(316002)(52116002)(41300700001)(86362001)(8676002)(8936002)(26005)(1076003)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EmGQiBQXLifYhwLIEM7jO4hMG1xEU26GCqcnLQ4F0ERGDZBTZBWRJvgTz+R?=
 =?us-ascii?Q?KWz+AXkoDyXkjG38ZB2tk46UJf5jrCSDJvLTb/ezZHfLBRjj3APPmtatntLM?=
 =?us-ascii?Q?j+fW40yw/PUz/GCmnFRUSDQa7orxVEWxRf11SdfAc6RFwQGTA+COmQYgyaTl?=
 =?us-ascii?Q?2m4ssrIxuMQ5y1Te8qBMs4eZayM5VfzHkBH1FVD8qHC02mytijWhLcnlyN2g?=
 =?us-ascii?Q?vtttsIbNbU10KLtiY5C4e+daRI+R5kmm+W/sWpWRPE5HsfcSK7CjtfcFW8JT?=
 =?us-ascii?Q?SaFs1qv3+iCVnsExmvpcO4hfEshHtIXXmnnd7mJcQZpdUxb89O/cBNJeNzmo?=
 =?us-ascii?Q?cLMzk/1ZB7nKQfC4AdvEshrPcvtqyU4l64qPOS7clh3ETjDA/qwWf6j3vqmU?=
 =?us-ascii?Q?PRWb6dLaN9r7QWh2xrD1TdlnhdMLTAfn0cWVEzr2wKtxXDfCgl/DpHsWIOmJ?=
 =?us-ascii?Q?s6TGuOIfXBG3RiRRZHDDdsLRMWCHmlwvTs3oU35pYkiLpoLGjkqv3tW+DizS?=
 =?us-ascii?Q?P+gf96GtGme4sqfGl6rrB9J3+6RnThDhWY/MbmEcqN8KWpZmMbraUJGPEK9L?=
 =?us-ascii?Q?BD2pt+cXT35Jk7k+qgoNdZQhWJm7dkfwmE5lSh1Enei8CzBYkMFFax8BZmTM?=
 =?us-ascii?Q?3eLw6+zEt1lKMW+Kx3usEIQ2R4rBF3GdKvxzxHhFilAtGLgPEMIeb7q+U44r?=
 =?us-ascii?Q?G4yDcm8kK2QQoUp2/pSWz0oajkzCTytpGQp4Jj//FwuioCR3VoyfBLfMccwE?=
 =?us-ascii?Q?BamDpiOjrMZx3rWWckjVliEJmWQijYo1FGvJIeHsoA5SO2kCzkuKUtQ40riL?=
 =?us-ascii?Q?W/5Ribf01fxZROmpKCj2OLlrAIF3WphAr+JAmlxY4FyauDtzE8+tbTCdEDqE?=
 =?us-ascii?Q?TTfhpDZZR9+vKxyoHWbZqxW0FLEq60pQEzV1fDtroS5kSJt6+Yh4hEdoVvH6?=
 =?us-ascii?Q?QyOe3onV44i3XBhdWWWVXMS/iCacd7bO0FG5HvJN9IM13EmM3ZA8DbZskuXc?=
 =?us-ascii?Q?dCSDq0nbOi8cAvb8TrRR+v6JMMXLQQkPWpJlSkjyGTRe7hTEuLJTfVpiSji8?=
 =?us-ascii?Q?SAl8DA9pg/AtgEWiO9mJGtj9UPlS/6l63RcNQ87wtw7e2pYg7ST3LV4ogWhM?=
 =?us-ascii?Q?kdH8dvjSpGoQTIJTb1MeKMT1TcJkiJL2eFlNIP/UXn3+5X0txCgIBPMZPjw4?=
 =?us-ascii?Q?w19DjY9avzsnwnWEU6n6yWHfaD6ysSBk2B88lgHyTCMxa26vP2jZZthOZBYa?=
 =?us-ascii?Q?tCk2pMaKVk/V2sCdVXvA6J1mvJP3QRdjpechTpQpVFYZVtxiwroNIaNS0rMj?=
 =?us-ascii?Q?mmCqlbbp7+3k4Kb7LD0lb90feY0Db3eqjWVTolB5M8pwuNz+avie3PcTnn+5?=
 =?us-ascii?Q?dPxKm/ittHojCMS2ZR7+41mue/hZS5WNMgzKleTT6fwj/lQV1z9G5P1ygwm8?=
 =?us-ascii?Q?SRPjiBIVSBpDpR/cmmJWaGLqaBO2AdR0H5+9KyW/d5qsabRny2lHyhXXW0/s?=
 =?us-ascii?Q?fjmHBNbM7CYszmtLNQqCwUpkOCO+t1e+nW9AYBIfXmDL1E8cnGjImYA6R3WJ?=
 =?us-ascii?Q?u6FxPaSYcLIxbOuE9lMYkdrv3MPYlMZBhSWRAS3T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aeff804-3cc0-452f-fdb9-08db989d29b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 05:54:58.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmnr2b/EqmXy+uprnnAQNVsSyQ5lUKmcN7Gk8ajdHGeeiuJBZW5B74YnVaI64pYKOvkwh2/yL2InyQaL91sbAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Carlos Song <carlos.song@nxp.com>

Add bus recovery feature for LPI2C.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Changes for V3:
- Modify commit log.
- Modify the return value in recovery information
  initialization function.
- Modify return value jundgment in probe.
- Simplified code comment.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9a3e3a1bc4ee..22b7b0b9db97 100644
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
@@ -326,6 +331,8 @@ static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
 
 		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
 			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+			if (lpi2c_imx->adapter.bus_recovery_info)
+				i2c_recover_bus(&lpi2c_imx->adapter);
 			return -ETIMEDOUT;
 		}
 		schedule();
@@ -527,6 +534,38 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
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
+	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "bus recovery not supported\n");
+		return PTR_ERR(rinfo->pinctrl);
+	} else if (!rinfo->pinctrl) {
+		return 0;
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
@@ -605,6 +644,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->txfifosize = 1 << (temp & 0x0f);
 	lpi2c_imx->rxfifosize = 1 << ((temp >> 8) & 0x0f);
 
+	/* Init optional bus recovery function */
+	ret = lpi2c_imx_init_recovery_info(lpi2c_imx, pdev);
+	/* Give it another chance if pinctrl used is not ready yet */
+	if (ret)
+		goto rpm_disable;
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1

