Return-Path: <linux-i2c+bounces-11203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4387ACC6F2
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 14:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC503A3293
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 12:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B912231832;
	Tue,  3 Jun 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="tlUgB4Fc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA723230BE3;
	Tue,  3 Jun 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954859; cv=fail; b=fgz3vkNzxTER1Dv5U7+uSqY92+VFl/FCZCLUdf31MELnyVfdzEgZoLCQAU/ZMlLpoPnHkCYZonFraSv4nBVQQToWenkSLLxROozZll5h/IEzQC/4c3AcHxAiGnRsoegM0Tbw5cKZzcVEF7CC6y2aVwle2Dm8Dig6ZZyKS+OY+I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954859; c=relaxed/simple;
	bh=sG2sW6WX9/3KbWjDc05UpFRA1XA6fpgKx9PJVSMNXGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iypEOKi29uXpsk60U1FpqkEYvz8YXKREVhldXhI6JKdWgtJwfX5GrgcsoDqLh/+LXlzoVRTle/m0pyewdrVP9K4rQjiGQ+LYhzx8RcCwNiZdf0LzMfbiNw0+a+BgyXJQYRgCYGPNXOuBqhy3tPtJXSJJiEWSRL28MK8SfrN86UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=tlUgB4Fc; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVo5DNDfUKhHeJlzX5i/5HPHxJheCYnf6An5/chZ2gJpVt/NyU6u4FRsAGh3qyXTgtz5G49M4LoeO8xXVczrhI5GaDsieaJIN7QYrTp1dXGPlxeTvJSvLCAawIh9PL/8JAdBpRo6fFpTZFe6yA7o00rxMxmlKL4gKq0tam2Xps4S9Y9M0p3b5X7m9BruhpMfJTegMfH4fjB8/8Sr+Oq8MMnWigHPonwORjeYWx6iVRDXgWUQrJHMhlJqqn5j1fw9DuukRKrFz2TFtP8hKyXdGeAJ39NzNM/aE8U28vj7HoQ9LWzNB/2KX1AUwqlS2vmxTdvFfF3AvFLN9troiHRgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joRidLTBNEOx+GbF8FrTqpbiktn8EnChcYXmSxQ0hzI=;
 b=H2LRpFPMSWZLyAVEcF1hTvOIiBxiXdLEE0Bh75GzIHaDc4yE7ZT/+nzHPXH6KVvIVI6xdIvWL2tulJs0iKVxeYOS8qVU0qJz7kMVXVOMbwCKH+loUV4AY8JE+c9eV2A1Z1fQd23NKHDqyx4RAW+TDjvdhOxxkwUqyNVTv/1Z3h11nzUwVAQJgZEynMUFLI+N/svXR4iwOhXA6eKOuDA42byDJiL5p+YssxPQbHH3siIVaanhDcSQdxOBLKBXD0OsxIzd0RhnJLTKnI86ja52DUI5XKEgRB0TL13smfQIMxq7d3ch9P+RfeXbNnX0QSjtBgBo7jEH4RXYmBbh+o7nPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joRidLTBNEOx+GbF8FrTqpbiktn8EnChcYXmSxQ0hzI=;
 b=tlUgB4Fc/TISa5UsPZX7TYALfc+k0fj9diLdJk3lkBUbYcC1d657B/dr9oNrqEo0KkCsmHKVNVVZjW5RjYgn15s9lXHY7rbhK71asvAyRUkthJ2D+XYmkbHJ5W29nSVO+eTtOI8u7GjozRH/8pqG+IZZsTJvHgAMpJCs6MUCqfnTwGR9KmM542K/fn8Brbxq3O/eeqpk8g0klmi+lH3+YUQ1udvvfmR0/qpubpxWCMDw5nSHudaRrTLCFEKca34GnzQ1rcPZ/Ik7oxByDiFXb4Va0aEEgpQubwFN/JMq3n19+MsCInXaMP9EvfKs7dC5+/lamyySTlzACDPV7r2cDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by AS8PR07MB7510.eurprd07.prod.outlook.com
 (2603:10a6:20b:2ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 12:47:33 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:47:32 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	peda@axentia.se
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 RESEND 2/2] i2c: muxes: pca954x: Reset if (de)select fails
Date: Tue,  3 Jun 2025 14:47:21 +0200
Message-Id: <20250603124721.449739-3-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603124721.449739-1-wojciech.siudy@nokia.com>
References: <20250603124721.449739-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|AS8PR07MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bbc63c-c168-422c-84b7-08dda29ccee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wImn40u8UFH4gX92Ds6QiY84K6OKXha8NfRUGxPJxQ0ILnL/RGodYvYfi5pM?=
 =?us-ascii?Q?9HE9jG2SbDHTmtBRkEzsXxz1hWS8CcSPOS+lbCv/r/T80XWQyg+fewKZz1uA?=
 =?us-ascii?Q?OkaVbbEQdWgP9ftTc5Gv/Hx6WVSN2iZR4dw3a4xqZvH3DHLyKv3LHs3ifSqh?=
 =?us-ascii?Q?3uynrj1jQOa+8ey+zyzdbOUCkX/c3gU3l09L806xUEcvIPU3z4ukTnNHc1Li?=
 =?us-ascii?Q?YyKILp+Zjrv1VRsgwQaH1vt/DaQztr53aKniku/rxtfpQP2NTI7yJIdoZJ8A?=
 =?us-ascii?Q?G5rtK0cCTHuTMscM36W8o7a5t/UQoayBV6Hy9c7hLJ2wPfxiJRalKC3e7Rrc?=
 =?us-ascii?Q?jOaKq2NnbFc8miXw2y66+9mWK6kC5A/P+52mlOOJ5PuCnYHTyxHajGc+mJgM?=
 =?us-ascii?Q?2EpC6nLJUs9YHGgNbfTXNxSW0QGL4D+z98hzJIpbeVmfKzsVb/mET+wjfmXw?=
 =?us-ascii?Q?m41pk/a4AK8qDnZ26x2kWa4MJ2athsliWq0/hX+OM8TrqkbzBETqogUsXt4F?=
 =?us-ascii?Q?mIB9X9eGqFV1/eMr4ScC/75uX11l5R5y5pTR9K6xiST3fpkF43XU94UnwF4P?=
 =?us-ascii?Q?vs/Yn78oNC5mtE3as+kveTlPU2hBOOD2GXpHkefftbKcqOKK0KdL/hISQF6h?=
 =?us-ascii?Q?YmZEMQHvn5AkGJ5CDwysCSCeKCtP5lGvBOI1jWSh14W/lbvL41ridbxHa1Un?=
 =?us-ascii?Q?dGFwIqJvNLBWKtd3ll30VkwWdBSdCnT+y5OkBAeJ7P7fILmgsnXCDdGf55JT?=
 =?us-ascii?Q?vkq1/llCs6ILvKS7XjyOsrIvYAMOHQnW2JADEhmRNWZWtbR/0a4UxiEAQZQb?=
 =?us-ascii?Q?r2TE0DK8ipKmXJfFJg/llbGMtnsbykQ1ci0NTsU2eE2OlqN6C9j55XK5pAUE?=
 =?us-ascii?Q?3gfAzRz+7hqfte9zQyhAx9F3her05Ks7DvQHfx+lFYB76VyOFkahSAuXwgio?=
 =?us-ascii?Q?Q2Z3l/F7BZgOH6cdbOq2PHjFun3yHmTgwUpJQntEI+7/Ac/Xt8LCN+214csA?=
 =?us-ascii?Q?vz8p8z8sat4NpFIyo7uJTgNXmBdW6pd2ghy2felDJXy6dbk299LM4o0UkHVL?=
 =?us-ascii?Q?ciU2rzF8dfqZjmuj69uxFrghx20sEivtIKo/ZR6mo2wzzfjcatKfsE/Dm8Jf?=
 =?us-ascii?Q?PrA4T8nl+Ndt5OnvfJuoMEGVdeUnsiTjEeVT1XgTGqSmqVU0vcx2PBZzahW7?=
 =?us-ascii?Q?6FhRZn1hG9QBDo5kRkA5IdFb011XaoCf2rbsDLRuhjD9iyoU0uYZEUs1xv2K?=
 =?us-ascii?Q?h6Mab8Rvd2vPhCsVgU5KVR6I8wV8zfZ5uqurHVb6LzLmOiWGuEdxD4eujYyT?=
 =?us-ascii?Q?enNfdGwb4UvETr8PJ73Bcw0w5LAxQ05usFv+1clUHLg/4MFiUUHteSRY4EGl?=
 =?us-ascii?Q?QkMj7zN2zJQovl1ZcA9z9tsrvdwhdCtCLZGM/GPshHfYdmYAA1md+RbRkfai?=
 =?us-ascii?Q?ebc4b8Jy5fU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EBWx6+zNO31O7EdQm0vLFXZ69+R8psALUF7lbMgWY+wx1c3SZNRG+D4VfrGw?=
 =?us-ascii?Q?xZ50edSNP5RajOEIMgocgquPFFULkwd2YUKszbxYvUz+mIAIWOzZePi4TKBX?=
 =?us-ascii?Q?jNLvajqIgBUzEONKVGtH+T3HzVuy0RswDyB3QwCc5UHk26fkWSFBIx3Exl/a?=
 =?us-ascii?Q?ReGYYsLVT0WN2kN3LHpBbdeMIHx9hll0sspLoYi3hyku7QyJa7A9+nDaMQYo?=
 =?us-ascii?Q?i2oy4uYS7IF/kvVhSnaAOl2P1+nJfHjrG8La1KYF956bo/eEO/N3HNQq/Izz?=
 =?us-ascii?Q?B5Kv+jH39P9+6O0L1o2Jbip6ooN5WoTClcgN4oGl2J9g9rRLhZxsBhFx7BVa?=
 =?us-ascii?Q?2w3btQ9qkOAz4cfssI+mKzVv3OGBdCuGV3Qjz/Fv60VAmtDoSJxcO9x87Kry?=
 =?us-ascii?Q?8RVUW2fcC1JaD6Ic/G1qkm66Q7+iVUyZYVxdzljYTxwhneHNpTWd52bS3OiV?=
 =?us-ascii?Q?3qSLTFOuAXvXnmZvTjYYOBU8u+xOsarx77d23XjxMsxzysOOF7mjqFulgQb2?=
 =?us-ascii?Q?LLt2tg7977rsh7k02UYRfupnGMiE+eAmXQjUZvbkUwdLo08TX3OA7aXMuA0G?=
 =?us-ascii?Q?jtrmdOZXjL/Iw2kFSnvWPlBGYxnHMjVgOhOse/CGjUmCNEiP5qnMLKB/5NiF?=
 =?us-ascii?Q?sXLdsxSLS/xYGG9F43TRrgCLW+xcwlX1ilMcbRpwnOL8EX9lDhBOqBWFtCSZ?=
 =?us-ascii?Q?vn4aVcIpjwWcjg1+xJQ0OtH/hTR6dcqAwbS3eDE5kbRi8Nx5Kksnp7ROMhgb?=
 =?us-ascii?Q?r1vSC1QZeHrqYyCdwGdWgy4lG3BCbF7axswEr0NkRr3s81Y2Fgn3M28qWdak?=
 =?us-ascii?Q?ErGsQCqM+/Y2Iy6WG+V4iaASR8q34JkK3xaXEu8DSwS+lYwnUAQY51vPEcnm?=
 =?us-ascii?Q?hK1mI2ujVSu6t5BeilsaT75PKglsvY2GVyWuG8HGAMcIQlgEYiWm3HGNX84Y?=
 =?us-ascii?Q?sG0MghcnerFLi4in1jX/tRP24rZXFVckDJvxwVsrDvPqkk+6DR0lftzEnf1F?=
 =?us-ascii?Q?esgvG8Rjg3EXj27HAT54wQDITfdWysk19oVIABj53jL1mxNr1o2GKABwcIlX?=
 =?us-ascii?Q?SH/q5zEIwa8uTBjisHHwYqXSIWAecBSBg9en8OQDZv9C5do97nERbU8avMw4?=
 =?us-ascii?Q?ExgBwnds7dM8KuyapgmO85fM+qc1nuX3Wmb53xIKOrbRiocrsZx9/J7NmOdg?=
 =?us-ascii?Q?MfpiM0FJSjpaFll8vJkO7bFWL45lzLA2RN680Zi555h/2tJbffXfDQ8gf7cF?=
 =?us-ascii?Q?FzWkz+VXc4eofpdPTn5w00sbegCRLdx9AM5XalWaPe4m4DFKb9FkJKWgkaGS?=
 =?us-ascii?Q?hULx9i2BsDb7FwRd7Tg0E9ziljjZ8nmWMqTGciZSMQAAK/LpFmV36vicn2GU?=
 =?us-ascii?Q?n9S2z1YJje9fjdaQNPEjd4tcqU3/vl/OEq+n7gyI2K6dMHFaJOLd2ATCxmp+?=
 =?us-ascii?Q?JwF6JUJAUNev6SRQ6jAvoGa74udCB+XxXeBAsP4wkKhesGLEU68z3TiFEfez?=
 =?us-ascii?Q?j842+F74MF5uOyxYuh9C4Iv1IMm8MXnn7PwbIJ+O1IKbUihigrOdvbPtGP8j?=
 =?us-ascii?Q?qqi5X8Anshilel44UncL3fF3x6kWVwGBRoKXM8HYMDmFQt4yoviuTic6cYPO?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bbc63c-c168-422c-84b7-08dda29ccee3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:47:32.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxR4UzhGeg6vo1jnTgqvd7UOZlcO2oU7BDxoTIkwrI5hIXdePyB7/YWkS0GWobxqoW+8fzy3eHTI4qj1zRBIS8u77aEX3R4R0KKyKa7F/cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7510

If the channel selection or deselection times out, it indicates
a failure in the mux's I2C subsystem. Without sending a reset pulse,
a power-on-reset of the entire device would be required to restore
communication.

The datasheet specifies a minimum hold time of 4 ns for the reset
pulse, but due to the path's capacitance and themux having its own
clock, it is recommended to extend this to approximately 1 us.

Since reset controller is used, there is no need to take care of other
devices sharing the same reset line.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
---
Changelog:
v2:
  * Removed mail header from the commit log
  * Decreased reset pulse hold time from 10 to 1 ms
v3:
  * Make this functionality enabled by appropriate property in
    devicetree
v4:
  * Fix missing condition check from devicetree
v5:
  * Declare dependency of a new property
v6:
  * Don't add any new properties, use reset controller only
---
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 33 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index e09230df7059..eb19a3566d35 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -315,6 +315,26 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
 		return 1 << chan;
 }
 
+static void pca954x_reset_assert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_assert(data->reset_cont);
+}
+
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+}
+
+static void pca954x_reset_mux(struct pca954x *data)
+{
+	dev_warn(&data->client->dev, "resetting the device\n");
+	pca954x_reset_assert(data);
+	udelay(1);
+	pca954x_reset_deassert(data);
+}
+
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
@@ -328,6 +348,8 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		ret = pca954x_reg_write(muxc->parent, client, regval);
 		data->last_chan = ret < 0 ? 0 : regval;
 	}
+	if (ret == -ETIMEDOUT && (data->reset_cont))
+		pca954x_reset_mux(data);
 
 	return ret;
 }
@@ -337,6 +359,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 	s32 idle_state;
+	int ret = 0;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -346,8 +369,10 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	if (idle_state == MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
-		return pca954x_reg_write(muxc->parent, client,
+		ret = pca954x_reg_write(muxc->parent, client,
 					 data->last_chan);
+		if (ret == -ETIMEDOUT && (data->reset_cont))
+			pca954x_reset_mux(data);
 	}
 
 	/* otherwise leave as-is */
@@ -531,12 +556,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	return 0;
 }
 
-static void pca954x_reset_deassert(struct pca954x *data)
-{
-	if (data->reset_cont)
-		reset_control_deassert(data->reset_cont);
-}
-
 /*
  * I2C init/probing/exit functions
  */
-- 
2.34.1


