Return-Path: <linux-i2c+bounces-7711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568349B8CB5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 09:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 168E7284E29
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 08:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F85156649;
	Fri,  1 Nov 2024 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="bXLKEuCH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021109.outbound.protection.outlook.com [52.101.129.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172515CD52;
	Fri,  1 Nov 2024 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448774; cv=fail; b=DOMoQJm1xMq3A0HIz3YICzvItyV0y7MpwHGYIR7olmezuXUwOU8bzthfLXbY7qiqjbpl/gXQeEb5g2Mj2D/4lAW40zS35DrafrvG+vZa0rbl1uz0G6PTqPJ9W8iLmD2yCiiC4tn/d8AHeSBTetf/3SV7bLUEppQPiMUF5AfiyKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448774; c=relaxed/simple;
	bh=x3FAWD+RwvLvApUpSdkRQIPikzCVm3uByqon+USLH6A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TRqGw3D6rntPXIlTkgnJtmcscZkdt2WvDqpQrkf67aT0xUswB01u2cF5nLYb4sMqQRkJwukByxOmQNU26GPLqiJBpHQ8og6s8MdLSa4GBo7BeJbdGvuX7ouUHH89GaI+DT78wbIIbjpQ9iHHOOWa8yAc2RIv/8DF59/FciyKc2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=bXLKEuCH; arc=fail smtp.client-ip=52.101.129.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjYGq5FWdjKvPJ+ApLGNviW57viJSkjgBqaRIx+3/3AK2M4uDFXF4HzAml7kiv8hvIGC5dkK/jVfnWWb8pM9931o0Qw2//s/Q4byJmq87r3Emv+zpL9z9MR04v9D/cWKf7U+nESGLU2qYQ8aB3Is1TbcBaQ14Zx6GigqscoUKpIodv2UjBHWCjsrhJStcA3sGSZl4msUUQ06CAaaDfVNlrBPmTrYBQnBEJ/+Cf43YRU985yoPDunXezo6ff9a/F/c0TIo5vtqwG3gW/v2WbiWCJ7HxmCgg4QpaAapRO8lyi4BrZwIgOzcyNQbO4Yg+R6oEnzKqJNAEpTH5CQh+jqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd4AoKwZaVCziVc97INc1tD8Kw1P1cRhxWOjKtPWtC0=;
 b=SIly5tqzb+aszj7ydtZcHr+9uhds4+o+Bh40lmyLbRl8wnus+a0lFztZ1yTeIcmhXPuL4srnaOFB9picFcuhtqqiQIu8HfUwuqG36kGn+4GPWnmCObsil2csjSyYZ8gjwSlmnbP9uri5lYTRYLZ2JhD/be+Lsf02Quv85JhRQViKdq6GYllgd8SV95xN+XuQtvA00NytvrxgrP9eV4iZBS2lmbe0XcvVpBnftUPPZXFZ8Hif90mqV6drKDyBuZAI/pVdaRajpy+qU8aiYWcUpxuniwtislZLUPwctvJqY57icIvuiTO9urZmMejDWpU5B1SV9cVsE8MWE3bA4InFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kd4AoKwZaVCziVc97INc1tD8Kw1P1cRhxWOjKtPWtC0=;
 b=bXLKEuCHvZJoX6kXrkMgzNU1Lq4EbZH6I5ihnsc3DBlEH6vUhflYBj8LhWDjwbLdPUV8PzjPmXFSd0gTUQ7gC0orxRpUPx6jOjV3MUP39MSRWyi6zDFequf1NxFYKA+5qT4lajbpntFJJvtHcDbva/KPpoBvS3aCaJH+GX/DgAXmEoT3n3rSF0IcYYO6jEwOoxuOPIrVKRt5nFoH+qzpFxJ0XH9CEoAS35hjPpwzKHqbXCtvGOmkhb6sHWqIAh0Ug97oJYtJlo938P/48xNE8wTkTcILHOtphw3yFjQ1K667+mzsd720bxEeeiQoGwEi+E8VaAkA+mDAkEF6oVvn3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11)
 by KL1PR0601MB5568.apcprd06.prod.outlook.com (2603:1096:820:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 08:12:40 +0000
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60]) by SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60%5]) with mapi id 15.20.8137.008; Fri, 1 Nov 2024
 08:12:39 +0000
From: Liu Peibao <loven.liu@jaguarmicro.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: "xiaowu . ding" <xiaowu.ding@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>,
	Liu Peibao <loven.liu@jaguarmicro.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master holding SCL low when I2C_DYNAMIC_TAR_UPDATE not set
Date: Fri,  1 Nov 2024 16:12:43 +0800
Message-Id: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To SEZPR06MB7060.apcprd06.prod.outlook.com
 (2603:1096:101:1f3::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7060:EE_|KL1PR0601MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6969b4-b748-4052-b0b7-08dcfa4cf3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2vXvvnE0Bg96ycYsENPUOxCa50WYYj5l85kHUdVP50OCHdnomc+T70VzSQtX?=
 =?us-ascii?Q?Fb9SJG9yJ5bVG0JrRrAu67dVLHZigZm9hCoNHDVFRiFNaxxS5JyRVXzDddDM?=
 =?us-ascii?Q?broib/oof5nUkL9WqhNlbmmYhOnrhSp3VGDKn5rorxGQQoKn2TyMAbnZFLcs?=
 =?us-ascii?Q?2SG+OhLigxTr7dFstOejyalktHfq2H3TvkemG8YkeptxLUmDpup2N1c9YYNH?=
 =?us-ascii?Q?NUDgGx7gRKVLpxRTS+rqM+vkYTYli6fSRX+tgY1R5eoCmoqQOuRhIZ2I3zOF?=
 =?us-ascii?Q?aMUTaABg5+7EJPGNA75Ls53UuiCxo+MTbKdmXh1yU9ECPtE/bwiu2IZufT3w?=
 =?us-ascii?Q?mdKw4i72wjrgVCC6MFlxwXhR9KDURdRu6v7YaVCT7CgTr13WlCKIRawR73mL?=
 =?us-ascii?Q?h4ghBb0FTyt6lQKGYSsqKjVODeqqaC5X8konXLuuB/DmhZQtSOc40/SU/Vnn?=
 =?us-ascii?Q?pgvsmTQDVpy1Xt4TTNMNHEu6FxLa0OvQYXwwY+i1XRmHijB5XTzTab/QdwFi?=
 =?us-ascii?Q?DX7pgcE2Tx1rpT5Igi0JzfVMK3Nqvd4KUzXIlAOOERVeV1w4x/AK9TPONL4i?=
 =?us-ascii?Q?xGlotYa5lwpYPWqhancCEReZov2nrq+g3Llq9SI2REjQDzbsbFz1uXKAME8Y?=
 =?us-ascii?Q?1JRVgG7B7vfmPXEFk+RXz5WfmMJpONZVAY2poLOY9qCv95hHCmE6OQJf0Gvi?=
 =?us-ascii?Q?A7jE+C7xPYAPkPIVnjhO4M1kt5TcgUkQkm+Kg/O9kuaf1hTCte6FmquOlyeG?=
 =?us-ascii?Q?IDhnIls/0VqL8QNsTZ3B5olHDnPY2kYHz5YaK+uRjskcbOjU8783BahkJ2l5?=
 =?us-ascii?Q?jItNEIWeuKb5G2Fyo3jtqc6klDsRoO9fOW3rzagZ9/tOKSSKuaeQxmlEbZF3?=
 =?us-ascii?Q?h8XVaBVIZUVQ+YdQOdotwX08pwv2yzJThpeIsPf7xa7IeexQv/e2ZNlHtIkX?=
 =?us-ascii?Q?jJRbnc1KM5OFmDbL8Rwszy8pocs3wcRVMElkCKf2BAilThXjE76UBk9CMRC2?=
 =?us-ascii?Q?UnTCYMOAQyeP2HjM1aBQ1C20rPRqcSm/AagMei++Fz/mKNV0/63qoXy3pNTR?=
 =?us-ascii?Q?/ddP8kXtuIyf198uqqOPCmEQaxFX8Iy0cgzzVwd+j8t3obyBb+q25JTLcwSz?=
 =?us-ascii?Q?lW+5Yv+NYuCdt8hl9Fxhhep+Z5QYW8Wfy30ZKXk7PcGlual7JCe/DjI9fOZT?=
 =?us-ascii?Q?3XBibwFdJBet2Wkx5qiR0a00/zbAKChDA2RT2AzQk+TIPtJ5RZJ6q2vakog/?=
 =?us-ascii?Q?qiA7/ZFO2ohlKiwYYeLAwI/TEr6pskzKrUmX7T95vKeEA44NnR2fyxJo4BrD?=
 =?us-ascii?Q?g57QaXboE+2SceL1IOfI+UbH6+c8KhyMw2v6/MxWmoNLfHUzW4/BIRQkvZmm?=
 =?us-ascii?Q?q7YfGD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7060.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/acyRjCSM7Z2TfBljyRO2evMIdxhdZBIwbFQWDxmEOr2u+XkFJDIHLTawDL?=
 =?us-ascii?Q?sMyo9dsPOqlTJBoclqje/zCLTcvMGFzb/GiXRs/IjbZT/bhInLGxLS34tvx1?=
 =?us-ascii?Q?J+sQ6507W2zL0GFU/dXTyZxaSu9U+ID3R3hKm/Ku/HbUFELKsB8CPK4wTVZ1?=
 =?us-ascii?Q?tjFn44xbI3HsFgbpy+QUH8U6RK4BBLd7LGGaiW+oUlng+dORoU8k7JvWsR2d?=
 =?us-ascii?Q?uhPP0tg8WAX5xjjzu2wapWMWiMOaGEOHfkU+/oULQVcX2ZPDOOvMuaxeVpFS?=
 =?us-ascii?Q?0ML2WlsaSR3OS74ckVIivAeQXYEqvlVYxDyvXmsy6tYLNb8VjT4fUH3ywmF+?=
 =?us-ascii?Q?+BGu6N+HZf0UDJqS0JV3Q218Wxz1jxJkr21rgqplgKH0Yt1lLr5lJn/ywmk8?=
 =?us-ascii?Q?LeSthwit/xAzzmG647RdKbXc+yQet2/IUaB9IHzSnAfjfWkvJgCGKiqpiC6p?=
 =?us-ascii?Q?oL/ZIbNVCS7u8DlIox/u4wxIhT28Qel/zWkFOE/whwreeTyoteiYOX6ADMh6?=
 =?us-ascii?Q?TN97O2nr4Q3J9CrTZpxMGuaWuyzD0UwtHRWRHThzyuWtWcVRE2UdUKISHR9T?=
 =?us-ascii?Q?F7CZUIVorctBb/gZfKpRb0FwWobRLt5m2NiyohueSL5v+jrBFo7ulmjw1cz2?=
 =?us-ascii?Q?/MMFkluwW0dlBvViDXC8qx7u7hK8s2l/zEifK6UAFrZRZrfvnFf5aTQlG1Om?=
 =?us-ascii?Q?qh8+hZPyxP1YBcuMdchZZ1va2FCSSpbIP0PAI9w5v78k1NxUKu7Aeefa1DWI?=
 =?us-ascii?Q?100utgRCQNyY5sVelDyhFazBs9dbIDLx6DMXBT+UFt+nw6haOc0jUptAn5pX?=
 =?us-ascii?Q?0G/0jR1uzHLVygAc17jE/BEF51aBoJlahb/DcGj6lANnC203oDn8WZOdRI0F?=
 =?us-ascii?Q?3aoKNQhya9gONUBk8qHjAkSTE1K6KehWh8F1U6kDR4dQpX/ojgAYk//eEFyM?=
 =?us-ascii?Q?j0gLrBxys58K0FcTUIgkJiotfTY/yzCQqQAOdkI5GV/QbtcjuUtRyLHFy5Yo?=
 =?us-ascii?Q?ayvaPXrFxDOBOwP5wGl3hlbhx05OsD4JzLSKaIcZK6vjaC7SmTzGbi+BPjiJ?=
 =?us-ascii?Q?qSPAzD97pBNvXaZHacnK30V9TfCqKQ+yt14uy3uP8Wu/VSoFb67QGnEOFZuZ?=
 =?us-ascii?Q?Yb7ZIl3FpgWB38G4I/eGxGqItrJCLx8NZuddi9ZFOPRUXpl/vgZttyDWNP9d?=
 =?us-ascii?Q?SIrqPmjgdJsybp8VjpEjbfktCROkNh1AzY0PnikNnN7TEvapVqBa6OmFZiqL?=
 =?us-ascii?Q?Y1GQtvpfBrCPoZ/W0cNnf+p+7UHacZ5gBWNIYMkW9NCUFRHReWv0KIAG8huf?=
 =?us-ascii?Q?kMCOIRtMX3WDE2mqfPDn1Yj23CsR7Ud5IxJri1oYlF4s9kPMp9hhlAzEVczT?=
 =?us-ascii?Q?uLc5mqSM6gUDY0aDijcD2vVkPY6KzXqgxhDgwpD0Ol59ImIVSb1JCBTMXC10?=
 =?us-ascii?Q?2i1PyF8UaTa50YGLwytkVcdeZR/U4bCt4bOMvV7yEhTXAvbee0rOZOZhLCdl?=
 =?us-ascii?Q?SfbPHqZzRZDrkO/orZV7syM0XdpKDmaj0KNSBxqtJzkhnZSizroW7Q2hO7oi?=
 =?us-ascii?Q?iZi0MoJLdsyG0YVbPNeXWoGjMWN4uN9LyeW7xkCK9LGR73/IlXqF9yi71wn/?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6969b4-b748-4052-b0b7-08dcfa4cf3dc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7060.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:12:39.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaGc/X77x2jbv5SIeK8W3MwieVTQ+lc6IBQIMDF9HdCBE367uYe3oF5mnfW/LmAV+dKLbJZkDZ4FqiaF63Mn1ZMUy4lg3frUdqkyLLC1HQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5568

When Tx FIFO empty and last command with no STOP bit set, the master
holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
when IC_STAT_FOR_CLK_STRETCH is set.

Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>
Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 6 ++++--
 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index f31d352d98b5..9d88b4fa03e4 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -524,7 +524,7 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
-	unsigned int raw_intr_stats;
+	unsigned int raw_intr_stats, ic_stats;
 	unsigned int enable;
 	int timeout = 100;
 	bool abort_needed;
@@ -532,9 +532,11 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 	int ret;
 
 	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
+	regmap_read(dev->map, DW_IC_STATUS, &ic_stats);
 	regmap_read(dev->map, DW_IC_ENABLE, &enable);
 
-	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
+	abort_needed = (raw_intr_stats & DW_IC_INTR_MST_ON_HOLD) ||
+			(ic_stats & DW_IC_STATUS_MASTER_HOLD_TX_FIFO_EMPTY);
 	if (abort_needed) {
 		if (!(enable & DW_IC_ENABLE_ENABLE)) {
 			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 8e8854ec9882..2d32896d0673 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -116,6 +116,7 @@
 #define DW_IC_STATUS_RFNE			BIT(3)
 #define DW_IC_STATUS_MASTER_ACTIVITY		BIT(5)
 #define DW_IC_STATUS_SLAVE_ACTIVITY		BIT(6)
+#define DW_IC_STATUS_MASTER_HOLD_TX_FIFO_EMPTY	BIT(7)
 
 #define DW_IC_SDA_HOLD_RX_SHIFT			16
 #define DW_IC_SDA_HOLD_RX_MASK			GENMASK(23, 16)
-- 
2.34.1


