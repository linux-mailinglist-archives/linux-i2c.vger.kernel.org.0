Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B9633EA33
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhCQGyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:53 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:2528
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230221AbhCQGyY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr0mgjdGXdawsqtJzlm0KsqHWr4dOJn/ea6bPsnulDGX6+v82H8GJcz3uCXAAZFoS0dp1pSHHyeVmM8iXOBuahI4zBJQRyChWO/pCxbantgQFeAAcvYNogn29Nh6AKD6O5VQUHmnSbgw2Ap+TXD6XDHOM4vLIPH9uUHu2essVGLS3WhnMBBUjAk3EREd+VfOgh8siyUnrHSAUsbj3zao2koCmnlw/fZl7PjuGu2xC8AZ6kGYsn+TrNzb672jqdj+L+/Vy5OB/Zz+tNCy6mhHugHC5Kc87cCZKHLVItmZMd0ryk5Z6oXFWlBLmw7na9sMKJW3gHG2LhAoD1FxGvu1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkHcFGkTTlg/KiqKJNNqbc4Xd68IuBwLk65N1EA8VtU=;
 b=LADxwuEKwldxF0cRtl4nrIiDYsJr+TEN1RdJxu8tm3+0/OVKLPTcQX4emTdwKRAOf+evBVMFWV1O6M8kjEUA4GQjq5PTYkLS1g+J82mloMpoL7Py4ad6yHCfz4sKW/KhCFZeiSDBbL53aueW+dz8HnTje41Fu6yvNjveEXS//TSbKe9+e7X9pxpCTe2csq6kVm02iold96rVsEoZZ18vaxbsV0KIHsgs8DOmUywZi+qsavxpESQAvHzVvDX4CMSz95sb0N7+W0W68MlwF473ngIZUqdMgLbGow+L4lPpHMmpTo84IK6achZeBNeDiu6u/iu0hqRIv9mr+UiCVB/Uiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkHcFGkTTlg/KiqKJNNqbc4Xd68IuBwLk65N1EA8VtU=;
 b=dH6NXslEC4UNw0Hueue96pNKtrKAmaWhBPQt9uSwTJAuIkqQ2wMiR4bagA9JNfxvXTlbNI5dlL7QH9I9qUpi9UD7/9MVEkhrJLuE7m1ggsqpc3lZunKXgJ8WzOLwSKOwp4mCBegoqSC6FAw7IdiNCWrPO/Kuu/SJ9DNIAaHTcaQ=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:22 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:21 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
Date:   Wed, 17 Mar 2021 14:53:57 +0800
Message-Id: <20210317065359.3109394-10-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dc97743-6b52-49c2-0a2d-08d8e9117df5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091491C4E20EC1116064B26F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbyI0Gna1m66OV0E7LA6h0SLw2CTViKfvNZJgiJvKNubxvFZzEX+10wRZCKbyquT2FVX4YSsDGxMqPdbgQ0BqwoPMgDdfrnePWxacu3NXWA+DSlLbj04PTHn766jQWMjsUo7cVfxVfn/aG3QvSqVY1CL/yMyTR/FZC+d9auIIeIaES45QPmdhETMNji3WFxT3+1xCU7SuPz52axtk5ajk1Rg/kTu0gkrn5W2jZkfLAZskhdk0UF5x40Eiq63AozsHAj6TvNYB1IIyh83dHV+cERxycFiuPMPjExICulj4B6kv3gj5GRBhI3AmkhXqTWS7tLxgUrsViQ36RdOPf8QMLCeyboehG3lPgYB3fnyU6wdO7m/DgML1sX5hI9CHiOlTVaJwVy38ZO4bYrlc+xECUZ6XikeFxKBWnU4741TmHdCupeSgQrdwGFOXHqPYGI1tOW4bnBYFUwfXu7hrC4XAu8vmdW+oA6J5VO5/mAEGAqNiw1FxkyqguK3Jw7u+rIg1g/8BNZJAF6nr9/pxPJfslC4D6LuCjmf9QFhWRdyFTgxfcGxacvFyzKER4bWtfw5k3kb+YVfGxYiW1O0QTa1Nsj9iJuV5h1dEBFFot+nUfEB0x8i3OcS6d3XuT6NuME2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?01ClM5sTREFXEU6Nw9F5uuKUZ4WWNsnh3ItPiHBbgoAuLFid+sI5CJMbZSxP?=
 =?us-ascii?Q?s/2oo82EnRveHWuE54EWgm+aDcVH5wikmGZ5WUvf3kqvy9tp4SX4MKUQ/HvZ?=
 =?us-ascii?Q?mdP0XCpr9W5Qf4GFEiHbkdcLAA8Q/qB0Zueh0WBTCSUi6wAt+vreG82Kfinn?=
 =?us-ascii?Q?cm7OCZHasFgpVW35rVaJijYcE6MUJog2iCtx/S+F3vKy/Vsl3NTocy5JTPXh?=
 =?us-ascii?Q?E/S/qzGD0o8nQPar2QH8c3mO0KSInqiayb8lrQ8C/6vXP9PUrwor/dlgWmEK?=
 =?us-ascii?Q?9ENn+CaEJ8bxSgFB7kGCH5EM48snHZ/XWX2UsVeWN/VIO5C5ZYQTJwWYvjX3?=
 =?us-ascii?Q?qQZCl8p72AXiNni3p5xR6CzR8o1QZ9+OASiCMTmvAipQk6xwGe7RZBxexJtH?=
 =?us-ascii?Q?2n/YT3zpPhMOU6/eUbPvNCytBOyZ6zKV8y3fJPJ4hWLU2wlK29/2VHM51Jvn?=
 =?us-ascii?Q?i88vgNRXn/Nr3obTgJpj8Lu+b0uCl+jfuP7/+kRKluroNdPVqMOr2dg2HS0K?=
 =?us-ascii?Q?5xWLNb4Uyfu263KBFktITBSYk3pk46DJqXZEjm5dtUmyN+xkRL1xQ6YyE2SQ?=
 =?us-ascii?Q?Zhr8BoQjOwWRSPyMTinAoXe6TKCjK/2QqNlWS2FqNam7JsAXJnJdLPDXc3fH?=
 =?us-ascii?Q?/ssLEBH5g8yxP/3zMQRT2+MhN5NlQQonwdrTiiijkOOe1GtXDFuSz0OuLNW2?=
 =?us-ascii?Q?tV8QmvrBLZSYQMqpU/od7m97l+4C4rB5fG3tCQTGyYmJHGXswvK8jyjD4vH4?=
 =?us-ascii?Q?1miIpcxFUc7O0GZ/UeJA28hnalhr0xEH/SmLyFll693iADXzmbtSQSr5eD5q?=
 =?us-ascii?Q?BV5ZsgQ6qk6CZ8NJolk/mUF1euse2oc/IyN1oiZQCs74l0T3ek+GXB/oT8IJ?=
 =?us-ascii?Q?xFKj093y2YLAXAvnMKkLM/sgfTjVw6853mH8nJfHU9kcoEhbRyoaaymnVA8o?=
 =?us-ascii?Q?64nonM1CR+l+iY1xThcz6CtVvbFxU1h2xE2GqG1AgXbc73LhknsgXACCE5KN?=
 =?us-ascii?Q?bI1gNmyt1FLvC01KElNgVIpxMA2oVZUrSHG2texAOk5naIsbxo7sKbyWXHsB?=
 =?us-ascii?Q?Kn4/vIu3EsdilZKon88+r++XXJ/6iF6010qllFfRIBnH9W9zOn7IWJfy4Cdw?=
 =?us-ascii?Q?5RfvsIJEQ/63KDIcNRfqK27Exzj7S2D1ubtXGqW7NjZ3l50W7MeEz4cbneKc?=
 =?us-ascii?Q?+CqPWeuEQYNH/T236aV8emHmHfu9CmxNiriN758ozsHhyNM4sn1DQppToPNk?=
 =?us-ascii?Q?i03xA4Wxjzrz7U+RgbEydPtVklYA3fNSRjyxpCmQtzPlzJx6EPOtME6CbdPb?=
 =?us-ascii?Q?pbrQkA5wzTZ/Ip7jVab6qW9R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc97743-6b52-49c2-0a2d-08d8e9117df5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:21.1321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6zyQvoIu8OMe5DJ2wx7JXICzGNcxhTKvv27ZWzg5oMp5KpPqC6riv9lmWLpyuYPGfaw7zO0GqgbfmKlvIKkVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clkhi and clklo ratio was not very precise before that can make the
time of START/STOP/HIGH LEVEL out of specification.

Therefore, the calculation of these times has been modified in this patch.
At the same time, the mode rate definition of i2c is corrected.

Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 7216a393095d..5dbe85126f24 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -73,17 +73,17 @@
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
 
-#define I2C_CLK_RATIO	2
+#define I2C_CLK_RATIO	24 / 59
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		1000 /* ms */
 
 enum lpi2c_imx_mode {
-	STANDARD,	/* 100+Kbps */
-	FAST,		/* 400+Kbps */
-	FAST_PLUS,	/* 1.0+Mbps */
-	HS,		/* 3.4+Mbps */
-	ULTRA_FAST,	/* 5.0+Mbps */
+	STANDARD,	/* <=100Kbps */
+	FAST,		/* <=400Kbps */
+	FAST_PLUS,	/* <=1.0Mbps */
+	HS,		/* <=3.4Mbps */
+	ULTRA_FAST,	/* <=5.0Mbps */
 };
 
 enum lpi2c_imx_pincfg {
@@ -156,13 +156,13 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 	unsigned int bitrate = lpi2c_imx->bitrate;
 	enum lpi2c_imx_mode mode;
 
-	if (bitrate < I2C_MAX_FAST_MODE_FREQ)
+	if (bitrate <= I2C_MAX_STANDARD_MODE_FREQ)
 		mode = STANDARD;
-	else if (bitrate < I2C_MAX_FAST_MODE_PLUS_FREQ)
+	else if (bitrate <= I2C_MAX_FAST_MODE_FREQ)
 		mode = FAST;
-	else if (bitrate < I2C_MAX_HIGH_SPEED_MODE_FREQ)
+	else if (bitrate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
 		mode = FAST_PLUS;
-	else if (bitrate < I2C_MAX_ULTRA_FAST_MODE_FREQ)
+	else if (bitrate <= I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		mode = HS;
 	else
 		mode = ULTRA_FAST;
@@ -209,7 +209,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 	} while (1);
 }
 
-/* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
+/* CLKLO = (1 - I2C_CLK_RATIO) * clk_cycle, SETHOLD = CLKHI, DATAVD = CLKHI/2
+   CLKHI = I2C_CLK_RATIO * clk_cycle */
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	u8 prescale, filt, sethold, clkhi, clklo, datavd;
@@ -232,8 +233,8 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 
 	for (prescale = 0; prescale <= 7; prescale++) {
 		clk_cycle = clk_rate / ((1 << prescale) * lpi2c_imx->bitrate)
-			    - 3 - (filt >> 1);
-		clkhi = (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
+			    - (2 + filt) / (1 << prescale);
+		clkhi = clk_cycle * I2C_CLK_RATIO;
 		clklo = clk_cycle - clkhi;
 		if (clklo < 64)
 			break;
-- 
2.25.1

