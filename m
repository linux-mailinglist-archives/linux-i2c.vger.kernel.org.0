Return-Path: <linux-i2c+bounces-5720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6295C3EE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D851C23281
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ADE6F2FA;
	Fri, 23 Aug 2024 03:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JKiR1lsT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2057.outbound.protection.outlook.com [40.107.215.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B96BFB5;
	Fri, 23 Aug 2024 03:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385114; cv=fail; b=Nx/jvVFe6xToPb1uy0KowhT/5apssTfHR5u3PVB5ePb/0MKZCHyDxjnmCaDOu7nUxF/+/Ph91vLYDc98xgvSyG23Z+5RFRkgCsfLAdAN4fV6EdiKozEQV53moCUjcIYzaQx4UxRUVvaL86yqBojLlWsNk+/XPjwm4N8HpZiR0Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385114; c=relaxed/simple;
	bh=e56qIJqbwOCTZn9ppef18ZoaON5sqKdeil9QshSltV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t+oj51nx4QkmGNEZqx1eNSgh91jg7nwsBBJb8Gn0sTZbmn+Z35ukSX/zydfEopchLWFofr6mNrbri6mtktpKM09w/YIy64JHNmDc8Ij13p2bmroL2iyHjO8UPtzlcBVNKSxH1xVwlQwKU9skzlMCV1/IqBH8CuUdFn1r4zDDF1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JKiR1lsT; arc=fail smtp.client-ip=40.107.215.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN0Z3lqOJFYL46yiwMXlSZdUcK+ID2/iW9r28x/Jkr8Vd6EKwZx1Ldj+z3JQLNWbsNo5rBuJ7TO005QoRXVu7aUy98p1ieU59WZffB/tHCoLSIBbGaxtvDEw0cyS+0Ky4yMKms8P7j9O1TWn4qfxNMqFuU2kJXG06TzbtAAjIU0X4v7sc36EoH1X7d6xP0iSF0ZIE6W7CUndBRyYAMqGnL19hDaUbHWjgvcApS6Lg4O7JBBmiW9IaDKHqaFNGDGm1Fkm3XRQCtulv/hywDE+YKVauVIe9Ixr/aWnx9ARe3FLstkthO77Smt48wQdtk9T/iiFoTXcj7dRLxPEvKGwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwKDZYmGKw9a3hNIv/FBwEXst76Lx9rzoYJLz6Z3k/Y=;
 b=prji6Z3pq+c6ncOgvKtBivzaB9dO5S/DCWTleAgcPk83YT7Ypmu0BgFE3FPNIe9tnloLNJO3PP8EehgBDBexqXOvodrWI16jaNIBPGOsU7RYB28NobWc5pEscVe19TDOevrZ+CGVEsOhpSzywDupBOhMnBlsZPhewiT89cnv6vz8yNcFAOuRLIZJXdQMcvtzcdAEySwzknTsIwYQEd7YYlLCKXDFpeb2+SXEzf+6xnyqw2ZPY4Z7quh4I87rBjKeXi3z3eCwolhrWgXTkyxueI9yII4kIktT8kVKclpKqrcshk/j6+t7rjrbEiVWP/p7dq35iCr8tXFiRGfvAZhrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwKDZYmGKw9a3hNIv/FBwEXst76Lx9rzoYJLz6Z3k/Y=;
 b=JKiR1lsTXX6l/FLQ7/PfOblEaZRnTnt9cKsnK5IdfMCD90dGn+7dZIvcWZR/Z5Tx+o1wpffqbhs1FDIBfOCo8ujms8x8S9+qZs1tJmwLKdohJLJjTTNSfinTJQrYLKN4Uxb6lLwAV/vBLt0uTPUMOY24Ksa1YrA1RzlW6eUVW37UPrtvfHqHYO9fyRLXy9L57CUjFuOMkAcSbJ8iMh4bt73NcEr0vKxVZfir8ibdFQWdljfKybnE/UF4o6SZ4FYDpYJoxO6BInXjqKPlMYLr+8UgbI9DWYBdCXghi+0bv1OO2yL4NN8CNWhANv2kymrGzlqRc1vFHWR9dlsE9LIkJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 03:51:49 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 03:51:49 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v3 4/4] i2c: jz4780: Use dev_err_probe()
Date: Fri, 23 Aug 2024 11:51:16 +0800
Message-Id: <20240823035116.21590-5-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240823035116.21590-1-rongqianfeng@vivo.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c33e95-2bd1-412e-009b-08dcc326ea78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7/xM5XR2brAIxjwJ4/ztbQHCCnuZ60O5Rq3ydCHRjWA9ZB/dZeQvmsJV4kTG?=
 =?us-ascii?Q?q9i46rguHokiQgZd8Gg1IRgwYSam7mrc4LAKEe8HD1n7O8yPf4H1BX1Z0ZWV?=
 =?us-ascii?Q?WGQBlbSZ9BLHFAC0mV5npqr+G91ClfVQRhsS6RgeRkYmFJA3LzGyALVb1yNc?=
 =?us-ascii?Q?0Tomn7M7CpGNRCJ2uULpxS92aHMkHPDz1bXCloLJUwyYjhuYXIbHyh2xTlzd?=
 =?us-ascii?Q?U6ypfKtANHdSjqFoDucXsdPsmZjtCWt9weuJPkjAU6vxBuceGfd7MzEkPs1N?=
 =?us-ascii?Q?+a5BF5L8kBaqvKUYKKqAs0ZxjwX+BnQG8HSnvoyQ9HjFXwO20KOjqm9JraQI?=
 =?us-ascii?Q?IlHTh4+qvEQOluQafgvoeXYESVedmllLpES1KWa5IkG6qxsCFt9rYt0fPMr+?=
 =?us-ascii?Q?bxGa9QtEUK7y4eYBi4iUq+vtqDsanOMfeVMvM48mMdh2gdDFJn5DfIEKOShQ?=
 =?us-ascii?Q?d4ghnz2526eZA3WJ5/UMl1LdImrc95V/mqv3rT9NubfIZOCiFFCPyJPQLkPW?=
 =?us-ascii?Q?QzkJ9Gf9uDPh2ld54eX0xUo7+KLKNWLWFVfKZNp11H4wL+8KEpWb9A69oJsa?=
 =?us-ascii?Q?xNeuLJMzI2ivPh0vjoUAohA1Ww5GYl4sitA5pTZzQYdYF+VQyQECVBg/6gbU?=
 =?us-ascii?Q?JsK4aWFKfZzcA61Jy3qpMWB059q+OTKMZjzzZ+cNdHJHzPYhNEtMU4igmdzH?=
 =?us-ascii?Q?p6kED0vFAtehwchi0+si4Gjoer49PWSaozo1cJJN0FTQslmIK3FsR7984YG8?=
 =?us-ascii?Q?Vh8wm+hUTRtJ4azAGIpBixNJlVEjAYIrzITAntQr+Dy0P4h6mzqvGQNt7VoZ?=
 =?us-ascii?Q?fzh2lLLzt4/IVrwJk8gwjn9rLb4QomlNmi94MjPuIsRbZ7ThEgkqQ495orUY?=
 =?us-ascii?Q?InSwyfNdN0coSDlA/KcZZAUKjmYNyknXvkrhKJF/GrYquVvdSTC8i81ZiUA/?=
 =?us-ascii?Q?esprMlpqCXu+TiLyWTkoB/3La8Ru1FmfZQ8/r/jxZO3wFfFezSatRDkAjVD7?=
 =?us-ascii?Q?MDYGHqRhF9uJWf3ncpStBnF/WlWP33YKF/NcXwV1bJapOK0pnn8tXYEyNpCw?=
 =?us-ascii?Q?ccqhV9D5aYJtnURr/79TTZaOXZaD5jdcFuIVDdij0QoHgNkTeHhv+fqdEYf0?=
 =?us-ascii?Q?oBzY7nK4FYTp1KKoCxssujet0xnugWsJBqcJVR+iFrlrtWI59uJxTWHt249N?=
 =?us-ascii?Q?CjO1Waz56kKwrNmZMMFHXnCEEO0489hcaN6V06Y8QIRaRLkBwMD6Xe/C0fis?=
 =?us-ascii?Q?/HHEfQjeS1WWT4DtnBrjgA4dZ++qPny7P+6dil0DYS1Pl3cdW80W8wqLqNiG?=
 =?us-ascii?Q?k+tvnHiJsqwzSTM/gRN7OEOwdjL/zyKk/+/hpcHi3+eYWCJB1JnmrocLJLNv?=
 =?us-ascii?Q?kYtsa+FU7W15FAH4h2d5yBa+owoaZDKUlfySxCw2kxXV8aP6xA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lY8MRPAD1ST1m+YueggdrTOiVdtygdM8MQFHi6JlLANH9FEMNLy6b1AC2JhD?=
 =?us-ascii?Q?ThAPHzv9lLJL0sIxoc1HuFNGkx0Fg/AYcqgyAOvJp/6Wxd3z2zpygaUvFah5?=
 =?us-ascii?Q?u9bE7xszyeX8knFAn3G12U11Evge13Zaw2FLcvis0B03DtKpUJbbFkt91pcz?=
 =?us-ascii?Q?k0siUgafoFflaKdijGwIsooYZ05PnHf9+hXoHcC42fbNmefvAZkuSnx3ambe?=
 =?us-ascii?Q?4E0y6U+zhpMzYWWLMaqWC0IjNSXO5gHaNnL/kP5t0eYhx0iPhBCYxk9SihoI?=
 =?us-ascii?Q?uFicrBY5+3+JAsCnjxbI0AqYAcswZ7LqZqXj1W6LXkHwg1qq6qOgIIw+rX5M?=
 =?us-ascii?Q?GFt9geZT9SDOdABkvrAx8UjofsC5TSj8t0fiyMGpqocQCS4ODAsigv0yhp4b?=
 =?us-ascii?Q?Ni2zbOFrYL8wygqTx31GzY055D3wE6H4Or2Mak/LV8A5q7BJuDcv86KHywgN?=
 =?us-ascii?Q?0Tt3F4dg6gG1YDh0pRRxSMitmZ1XM/kh8E7U1/t/k8TRyesUnhiqpQPi6C3z?=
 =?us-ascii?Q?q7kIqC312I5aCLLOafaKHk0nCkykEjti7JJlL2GYAgwRbARWaimYWWEGmVwp?=
 =?us-ascii?Q?Sztxnc6Ce3rDM04KGmSr3QJt3ks6bQJOew3TOE6weNY8pwCDc0Hl9YzEvdKp?=
 =?us-ascii?Q?5s/fHTzKT8/AfM5GQ/fbaonwmvivx9mmSeBnu7pSBiN36iVcAH9epY71EfL4?=
 =?us-ascii?Q?NONQbOC2Q9b1Sx9Gj3/l4iT8bNzymxpsPC40V/OiiXEah70wpnGjdWqUfGm6?=
 =?us-ascii?Q?hTJ8RJKPwRuN+0w2LA0yx3qaOIQVwYR95uX7zjtuuE7Bi9UYOuCOxeMOg7RC?=
 =?us-ascii?Q?ZBUR5dwOgzMbik0hmPlXNWof58/KXPvu/tw9DwaJWZwkgD7ekFfB0I2BqTny?=
 =?us-ascii?Q?9IrdkWM6Wgy25svtyJhkqMjXelYW7spXALGrIpAtqVXGxhwXbn+ENIP89EX2?=
 =?us-ascii?Q?ioNPh4YIznsL8VsGfviWW0Reua3X4RzPpi56LFg1rG5vssL9EHxcSPrVXNqi?=
 =?us-ascii?Q?GvgWsIuWoDdZtSurH5k7j8eHLT3XsfVmmjg2OgdHg5xRvLR6OnuUwjem0kKz?=
 =?us-ascii?Q?eqRg2bI3ub7QHafVCH6qtdEj4iwoIOSIyPXqO9NDdGaANy5LjOyDb/b1Q+Zc?=
 =?us-ascii?Q?ZR3VZz9ms2VibI0Xx/0JWDzxrb35FwK9oGaPxzMdCp6b03sQ+1CY6PEY199u?=
 =?us-ascii?Q?1tz35x3T7R12tIjjjiFCE2CfaPWjj0XfoDIxo4rukrfJF3zFySMxT0BFr0Ah?=
 =?us-ascii?Q?zVp4Z+oE8PEX/CmgL4cqUTevomxpd4lQqjB5x+l6lwL0hQ23UTCuhuxMB5Ft?=
 =?us-ascii?Q?LIhfg+H00w8bYcdkFJCzTWsWCoC4iQELlBlVW0qFcCDMxgSu1Ix/t9Hv1Iwm?=
 =?us-ascii?Q?niAYzKQBdkCoaskyRcVqL29PtSAZlksriCs66x5fgMmVXgtSL36xULjuLeRJ?=
 =?us-ascii?Q?OEK1Y0LGrQGn1zM8A/jH/HeJ0aVzBIediS97iBJ5jkUPGAq9kTFHboj+GgeT?=
 =?us-ascii?Q?Uasdq4Je0HNRdClBagffj4iWnSbE6SRuaeWoGmIg9oL0i11XuPJH4otq9t7W?=
 =?us-ascii?Q?h2zZDDsdx8kV39V74H94pKtHvLm6yVAyMOXUuaMv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c33e95-2bd1-412e-009b-08dcc326ea78
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 03:51:49.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPojTmkI08xIe6hB2tf1q29IB4TbV1uL/YN8U3Tbda+U3BXJ8hqbRAjbPT5z2qwMqzMmAyx0GN1VJqnnD20WuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

No more special handling needed here, so use dev_err_probe()
to simplify the code.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index f5362c5dfb50..0cb52a6d05b5 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -798,17 +798,15 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				   &clk_freq);
-	if (ret) {
-		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+					"clock-frequency not specified in DT\n");
 
 	i2c->speed = clk_freq / 1000;
-	if (i2c->speed == 0) {
-		ret = -EINVAL;
-		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
-		return ret;
-	}
+	if (i2c->speed == 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+					"clock-frequency minimum is 1000\n");
+
 	jz4780_i2c_set_speed(i2c);
 
 	dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
-- 
2.39.0


