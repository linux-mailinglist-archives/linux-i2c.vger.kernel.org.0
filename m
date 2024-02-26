Return-Path: <linux-i2c+bounces-1967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633E8669BF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 06:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A9E1F221A8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 05:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92021BDCD;
	Mon, 26 Feb 2024 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="eSZ3zZ5L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861241BC5E;
	Mon, 26 Feb 2024 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708926868; cv=fail; b=bQSQJvseJsnuwDllV02SyPOYhhAHWw/RgYcZr61Z5Mrt+nXbDCMHjqDO1m+W5HgUURHqji52cbKcNE/exfmTfjfh/0rJMm+F44W+aptgpxmbP+bytWGq48AV05Ugxzh3XA7zHbubv/c2st3GEBVqx8F3hso2D16/rvrqt7Ynq3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708926868; c=relaxed/simple;
	bh=dScSyiohX7TFWeLWY2B8OJix7eku4Kw3uUn1eo3EauY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i7vOGkYW7nyAxdLTR3leFzgy7T/lRiK5qqvfUzO7EDGcLPjCQqhkYQv97nR5ZWfhj9pOXUVG/HNxtCdXzc4y4fflUeJtwG+Rb1CWsO2wmN+9ZfPhU5vdTN8SZ7j/KLu3VXwZQwOMu/VFg03KnepopdSS+aOANwmULFIUfHsxogk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=eSZ3zZ5L; arc=fail smtp.client-ip=40.107.7.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH75WvNf2WGfdBm9LstA9qJCWp3PJIF1kUzztLxQPooLcYoNvnigxRtSc0mMvEFF5oBDTNf1luNZzbsrP/Ry1W87jozGCFvXkvRhMdCcqi3cb5M+F8UCy+a8DxTVj7PLnkWh/hpcoR+nvq72wnFENT7VAGZq/+u1iv4eEFKKLx9hlLaSpVe6vmUL+HgIGTuUpl43/Q+HhEEGnez8q8Rq7pASqABNYDxSZyXWiLkgXZ/rm9LWYyoJl4K1vAQCGuwWsAcuSUdRqs3ynNoe2zZyWT9OKWh+B+V7bq+cj+jCNa8ccyz9PnQhpxq+PSepqXwSnOafydRKp8p/6T56PpxZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYp0lvzJm1hP5C1USdVkpI1UKlYu3pQ3aRAiZNbMsJA=;
 b=MCWptj5vHbn1sDXbotJY7WmWA4xWMrwwqiTtvSSOVfSR7WrxiKAcu1Wrv334MhLvvyvYErDGcegAhHPfnUjyj3vGtNzadafXOMtZaYVrpcD6fI6bLdtXASWb3iYm1vjN8xqaAohlGh8EHrgQVJNEx21CkQB6U0EbG5OZ7ffjIKjSBpQceJXWDBr3snFa8thpWE6ceQEDuQZrRYwzqxdrD94SH5z+7Bl/UizIpMpW1uQUlNO7qQHTH0L1ujqk1PU+8PaJh28FX6gpHsXYbBF7mC5WSVwLGHeaai8Y+msDsR65gJS6o5nJpQYSy1CYk8u2qf/kYfZKMdheMBBL1NbqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYp0lvzJm1hP5C1USdVkpI1UKlYu3pQ3aRAiZNbMsJA=;
 b=eSZ3zZ5LBT3mrcJP3Mqj23HYKZy2l3E0JtQE4W2jSiNLciuIeaBOJFfXDa30s/f4TSLW2OdcEzuhVcW8MszlNMIAF9wh0pTGFrTDu5OXWQ0nWYGNzg0BXhK6qyttG+1WgHz8fUWx76QJnjuwyA3YWoyFXd19yO6yHqam5gsZwkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 05:54:23 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::e906:b7e4:26c0:5ed9]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::e906:b7e4:26c0:5ed9%7]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 05:54:23 +0000
From: carlos.song@nxp.com
To: andi.shyti@kernel.org,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: carlos.song@nxp.com,
	xiaoning.wang@nxp.com,
	haibo.chen@nxp.com,
	linux-imx@nxp.com,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: add generic GPIO recovery for LPI2C
Date: Mon, 26 Feb 2024 13:54:18 +0800
Message-Id: <20240226055418.3314913-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:3:18::29) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DU2PR04MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1431cb-ba31-4e20-7ae6-08dc368f61cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJ+8GGe4WUPjpxZki7YcQDk242LNZGtpxNkwNI8JlREfpF3fXZpBrbZCDTkRGtKfp1dZQ4J643XpZayOd8ayVZo97Zv9nbSI+69Li/4JRbhbNl50N8O3jimgu6D0WNvD7bdCUBo4exx0MVRrEU2EeidNXiYL6TT4C54vsjIY3eobSg9NKSKVUcLG9Kzo4U4yLvtSTQles1QHl4G8XO1Et4sqDqmcvXrnm5e2jLPq9sLlFnOHl3tVWFjgc+yA4N9AjYeqTFcb5+9YC6R+9ickLYp//GhV5ICwckGi2gBLuXchD5KVB8bPy1vbeKVbiukm65gwT3GxdgMqvDcT8Wkz5JjXuZn5eq6sFX/dLIxJDOIYnRu/UMhQyGXJZCfIJ/jNdyHTn7D9ih3NLuv3UMmeFrqIoPmtZ8pEmjF0L58l/qOIbsD1CK1CTp2xFbgsGVQsFnsEPkpIRoichU6N/TXm0AWYeOYTpCkluSZ69XMWlG6Cp0ttc30EggCaAH1zeuKHKInzy8NtTxnO1vrhf4nFJy3ES5xOv6tAH41Mi+A5TXaCEyjJkvLo3B5jN3GLu8AUntEQfGxYCYtNpv7ENdVLJMbqDU3AeB1VF9NMyv/8Id+rGPJL5JKJ/hnQj77TdBF3ZtwZp+2RcrGBMXjk0Oyffsh1kGsxAbkxUyK1y/MJ6xuQOiI+9nhLcAX2McHnCBkoLHhwPCcInSM60P95Ina8Z5YxxD62q8ZF+k7GYLwQwBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+42pfFuE/RA06d4VMApfRZ6udx2SXm+kuI6j1G5m6LNDgFGn6Iz0wIa6PUV8?=
 =?us-ascii?Q?2Np4HzuSkUUSc2TUD8NQSWSbT99RX9m/TqtyzNIGfglDQR2zt2AW/nUjqfcS?=
 =?us-ascii?Q?cPIjlpDycE1oFp+gsiywxFf0z5f9mtCht/GoOe4walBt2ZbDzGt1ULHSzdAT?=
 =?us-ascii?Q?gw0SzVW9G2bThwV8AQ9csEsx+PYlxtDvja/I4dUcpvZv2ebaILFc4+QmMD4y?=
 =?us-ascii?Q?YG52mCQ9QsroB1GMFG63gZkzjrnNhVe8fxTI/iMk1PlwyEzWe7+pXLt2fxnS?=
 =?us-ascii?Q?iypRyoD2JTHzmlbvaC75/5ZAIaSrE2he5W9L9FRSrIcHpkINR2WuqoZWOl9y?=
 =?us-ascii?Q?UeLLSF4Xolzio7bkl9sJnpOdLvsAVFLvlpWwtmaEVBSADph+K2oz9W8M02Uf?=
 =?us-ascii?Q?scDAS9bARUcCEAWZH+mz9BNCVAe9aG+EfsII3OnZV4GQ2jEEFsb6+/L9Sm2R?=
 =?us-ascii?Q?U/UyPS+c7arLDWTLLavlJI49W730faHt4eAsR6fFAeXsBX0M5pA14MjH52cz?=
 =?us-ascii?Q?F4qPZJyMRDZM3z2tCLUyHMWFg2ktFrh8ZuLJ3IFqLv9Nb94XiHq5lRLWD8WF?=
 =?us-ascii?Q?PdMkkta4jfMHNL7gwLqagSeoudXb/0acclGSEI7vsBcubxXi3AU8hFfEQNu1?=
 =?us-ascii?Q?qNEMrT7RzpE/nhNbC1yJwOvbVm8azDkgpBUIPIhyZu1gwejSPPKCQOnZ6I9E?=
 =?us-ascii?Q?gm/exql2XOjZBFKWgNViTqp4xeRD8WDaPnYpVmuvx4yqLANlYXouDGMXXJFh?=
 =?us-ascii?Q?Y6eRHQtvOu1uRCC5O1Hkikb0PmB2vKX311r0N6qDv+YOUSIG9F0tOwtbdaZV?=
 =?us-ascii?Q?t+0jhuOSUa/ZIdTeIrk734/aEAVELN5kNS1yip0sqM9Ju2xpn6NC4hokOb1k?=
 =?us-ascii?Q?9rsL2we9C9/t/0qzXLvPyB3/n0tsMQmD7kMRd9FnFjb06uAtNdexoQjXNQkp?=
 =?us-ascii?Q?3MPOzYv3qo+5ciOKaFcGaWa40QbWocBjQsLY0elV1JFGiRNOzsQLmUCaa8V+?=
 =?us-ascii?Q?BUQ9b2LK2x2MhZJirYRcSw1F07+BYEUUVkPuyGkaJ6KFmd/U8BRoek/a+8k2?=
 =?us-ascii?Q?l+5/yKfwUlL6jCFnALQJPIgASacd4SEGiGOtitk9wcscRpoLIX40E+D3dQnx?=
 =?us-ascii?Q?mcja+5KaNS2nfjqe+NsSBJ0U+SXjU8L2F00938c9mJsYEP8XcpanogWCmB01?=
 =?us-ascii?Q?x2wYswswhIAf6npqyeBtj6b6WAzlNTp7zerFmpVlrXhUsg7E+nyXI9WLzkj7?=
 =?us-ascii?Q?8ZBKbXF2u4Xa7uHQP1/5vrGpA4Yq94FmcdB+q6fgEpq5tARatoEJgc7r6g2Z?=
 =?us-ascii?Q?OB2xa9Sn5uMClhT0fHDA+vZaRYQZGvxsb/BQnM+2Hh0GK9fcyZPUfPVBSSVQ?=
 =?us-ascii?Q?NHvn9C9Xd6ftWxy8eTdFQ3DwTTlEwnQ+ShKH6JIasKcFCaEu0CY5o51nArZJ?=
 =?us-ascii?Q?pplTr6MGnHBS/3M5Q4oLctf2/C6dMxvUY06mSWpHxqR9kVO2r+owBOhWtDQn?=
 =?us-ascii?Q?74RrcO40VY0AMjbRhKsTyZVCWGR7OSPlrgc85PaHvOitI87UPdf+SVKCOvfO?=
 =?us-ascii?Q?T45+yAEx1gI12ZNtHGMx823QpGBWx063byWPKdKc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1431cb-ba31-4e20-7ae6-08dc368f61cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 05:54:23.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKcws288pTMGanAELZ67pOVTH+5uePeZrGnH4Dqz1OZy3f4C6aJLRelKEyKTdI9yOMBJDGikp3OF5KuUbX0jQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068

From: Carlos Song <carlos.song@nxp.com>

This adds i2c bus recovery to the lpi2c driver.

Uses the generic recovery function setting the SCL/SDA pads as
GPIO pins and sending 9 clocks to try and recover the bus.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 678b30e90492..6d72e4e126dd 100644
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
@@ -526,6 +533,20 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
+				  struct platform_device *pdev)
+{
+	struct i2c_bus_recovery_info *bri = &lpi2c_imx->rinfo;
+
+	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(bri->pinctrl))
+		return PTR_ERR(bri->pinctrl);
+
+	lpi2c_imx->adapter.bus_recovery_info = bri;
+
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -600,6 +621,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
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


