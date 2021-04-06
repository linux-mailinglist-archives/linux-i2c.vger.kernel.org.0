Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD43F35524E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbhDFLeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:03 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242991AbhDFLdz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:33:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMskF6Q1QCqJfPdTiys4+IcAocHfjHF7LATrIz164AzliptF2iWEskop67zf1kDvqEUDQe+rL8b0DBiVXyYGNwFiiU3YB/rGa+xCrWejcyx440TTfOO7z3FRUI712dLQcjnbKQlGDVozJGgTLIrRWNwrjGD8C6XE8LdwfSOHhL348XV+6z7MMMRBnmH5OmtgxIqR53qBe/Z3PsXya+SPrX871FZUfwCxs1GMHddRayXct60dvXDs640elJ9a9A/O1O2qWnNh7O5KgDO2D24chLorno01lFR8/4/ZjPh4ITfxU8IIK9M0/5dMn2R1vzZWmmt39l/Wgv/Qcjk1BwJwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/raBy2/SYN4Ubz6Mq9D1SysCyJwQrph9ttm4A2kPYDg=;
 b=fh6Wt8E90q2RTRWW1DLfyWrK+/6UHjJK1Dil1Etotb60sf9mS1ybTVLs8XnFmugl0Y/iL3XlWXUSVxTc7hoeNc16qsQWdWktgovnmrrnxxicQRXq+eYBpusB2BaMf1/RSmeSbwijPGpsBnloMw1c+SiTZdleVo3b4IdspN6xqwout+Y0SR3M8zpD98aDgEU7Mw+Y2QhSIgkdo/OTUN1mO6WHjTb1ik11oKiit6UQzXiVCV/eZsadU3XTYvjCVqGSiKKxnN68Z6d5fVC3l1DtEbCnAVlib/MsZwQUAmLz6p7n57gNDDhdePcWcyzEFy7M3duaROvyXIRiN0mGtEJbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/raBy2/SYN4Ubz6Mq9D1SysCyJwQrph9ttm4A2kPYDg=;
 b=T3sEqU5FvApgmeUG8OEeevjYter9dFNcpOcvjsHo0JLBVthKHXDDC5YlHyiLlqTag8PDqqhOFsPTDYuDj50JK2ZspusL9QwY/LSQXK8/vNh7WT+dZrnL0m4N318dC6hZPUadGlRl5qbRl3tRv6HFL1j/LrJfXVA9HdYNCmMv1jA=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:40 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:40 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 12/18] i2c: imx-lpi2c: fix i2c timing issue
Date:   Tue,  6 Apr 2021 19:33:00 +0800
Message-Id: <20210406113306.2633595-13-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a34441-06ce-4a19-64c3-08d8f8efd380
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142E5C7EEEFF84791ECC390F3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T1co7XJYGL+cFZ68VLBtgTlegdnd8KZtZYBIzAGd6CQT9X5cHRhAziWTqm0/ygUHpXgzwxmfMfIpvow5K64OoTbEbteOv3AR90R+aWLRHei0kZogdE4sAkTS+tI9yioIwUmr8jTIuWN5QKppWzO/Z6VBA9vsm/A6LcI/tyLw1D42mx4c0zaMApaFFsAkCBOOV3lcpwauHsesu4Qo1Z74b+OOQdyVnSQwtgG1aOH5hv333v3Y7v4AZkk66r4yxdtFiRmDgFKG5u+9IvMpKjRW0BMTVFmOix0sp4HyYJtbICrzC35wjWKQNOLNGIf6tjQW0YSHrN5yYwW3C7QkYbEY+Fjkjpc0LTQX8G1o45FsI/pcHRXlwhAgLCQmPfgxc1OdjGN8HoTjqa3UrrVc7dm8zKuc6w1kHMCYbJYLDKlT0o2kjkxPs/jYToJPMjtniYzaVF6FmGe2qz9ibbtpDIF7FXPj7rYUQZY3f4n5N5Alw2+iQRA9Wuat63dFfGaMDGbIHSwriusSxaGLQjuq5mo0Tp8Mpl8rGO9bkkmv9EEG5Kmny+ng0Lb0Ub0DPs8fcQg2sMPKL4nbGJkuPVPCvF0HE0b03C510zYv8TjocGwqebp2wMdqKqbogm+P5fRkSKtFJKM1aeRUV3TNmMzukC66b0fY9G27l+tsDmTJPtHrjPyA1OM7ptLMqDOlcySDwTo5GTgsgUsJn5jwl1DrIbaxZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(83380400001)(956004)(6666004)(5660300002)(1076003)(4326008)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OekcA8b8x9wiuLfoQUlNb8EfqKKF0vrqv6wx0V4QDDB4wwtRCOs1xm3vxM86?=
 =?us-ascii?Q?WUMMpwvYqM361nOQuw3W4q+zn4A/0rFL2MRxXnNApjWK0s9MAU5CrlfVatYn?=
 =?us-ascii?Q?OHJisGI/Yfzic3rzKWALoywFob8y7HBxiul/75t0bKQ3N7YmUm3+LPrncbqw?=
 =?us-ascii?Q?UusEiSl06dE8LqNfc9SWNBC8SiAkDBveTfaY39vvanak328CwWGJdpth0893?=
 =?us-ascii?Q?jzDrEv19hgbQd/5R0vyjIQ6hJVK6li1OaRbTmC6SoN698Ms1VH8cMB2ugm2A?=
 =?us-ascii?Q?aZMXIFZIoZvR4rhzAl3/u2YjDV49ZsApaDU2I1YNxMx5c3LBy3QjS+k2H3NN?=
 =?us-ascii?Q?TXiAxr7tgFhU5H1e000ZSakY5AcPcW9/VQ5/uCaVodxL/cPx8pfTZ5B1+Es/?=
 =?us-ascii?Q?iU2p5jXjGxErhEK8cKBHie3CtoSG16GRIdbBAJIIYf2+XHEINYo2JdY0R099?=
 =?us-ascii?Q?IRmwCS9rQFHvpcsZv75hCzj1MrUJ9Ns4vFN5VF45wKsbgaOvggDWCaQNVfST?=
 =?us-ascii?Q?unMGA6L5TLYzsdAFk2tw+7tmbI5o70IDIQ9aTQcciPykvgJAch1RdZIQFXsU?=
 =?us-ascii?Q?PoywaXAl97rddxDn+Z06fYIlDRo1uX8aMgUohIw0wuTa/yXH+ypGr8jiatK8?=
 =?us-ascii?Q?OiS0N1bSWLqsVDq7ucp2ApbiIMzr6w/j1CwIWQqRXt+bCP4Eq3Kl+GVBk3Z2?=
 =?us-ascii?Q?ioEh7iPLvYMWtsT6jaeLKi3l0LG1loC8v03WI0CS9DY0WpkagFt15o+GcrVQ?=
 =?us-ascii?Q?V+hGLebwWiYtF+maKYp8w5nsQ+KmWvo23b6kq6njF6B9XZ8iVHrvT33R/5eM?=
 =?us-ascii?Q?UQfB9ZkjuqaNaio47DLwP+PriwlTD7sULVC/GsA0aW57piSbcEpS/EvGKCmG?=
 =?us-ascii?Q?Sqv7+kIJqH0AVRqQtikWtGe2UvQytqwUPwW9/p8E9FWJHMQct3YfJv0qKaMI?=
 =?us-ascii?Q?Iz+QT/MkmFzrSQq5sQv2y7fXdIGDzUQbSfMorGlAM8U3RSCPCdZOkCp1R8VZ?=
 =?us-ascii?Q?3YSmp09/hslBvOTZcAE7/H3HAL95saiAtEv/XDNzY5NhMmBElVMbrTapcceo?=
 =?us-ascii?Q?O1xFtHk1vnIz9Oky+VObXuOS267cfJEysoJ5r7kAfHDz7KqB83PB2MdALa/y?=
 =?us-ascii?Q?m7vdVYezTyR5JVJNFV8Gm5kI/ZZzDxAUmrg+NPi8T+HhxR6ntl3bYxcRdLOW?=
 =?us-ascii?Q?wYKf2QTjiYlzMneM1Hxs22XclDKw8mAOUQSMKiY5PLXxbJTnHdpFoJIPMM6t?=
 =?us-ascii?Q?NQInLrVJVAkDAjs4QwheY86PCAmDzVSE6BvNeHlv1zLhI7BLs4SRQKQ5JnjB?=
 =?us-ascii?Q?6rjQpZPFWHY+5X0Peijvi14f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a34441-06ce-4a19-64c3-08d8f8efd380
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:40.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/1Ne6+0yVpUpUPxQtlotePDo7bCzfRPdwyzS6HWJBEDfb7KmNjrqBds/E8eQ5NutlATNS+vRQ6DZCaFM2F2Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The clkhi and clklo ratio was not very precise before that can make the
time of START/STOP/HIGH LEVEL out of specification.

Therefore, the calculation of these times has been modified in this patch.
At the same time, the mode rate definition of i2c is corrected.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Fugang Duan <fugang.duan@nxp.com>
---
V2 changes:
 - No change.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 77dd6ee5a4a8..d124c4000823 100644
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

