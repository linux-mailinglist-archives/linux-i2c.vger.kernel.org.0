Return-Path: <linux-i2c+bounces-3969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0C903897
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E008B26336
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 10:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D14F17B4E5;
	Tue, 11 Jun 2024 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RQB+ez0k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2065.outbound.protection.outlook.com [40.92.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4F17B42F;
	Tue, 11 Jun 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100890; cv=fail; b=qyLBjNF66MfBKOwYOkadv/2VVDVBseD8jgHBFXs8yIr5sS3gLtx9ftUSEcKgUpzVD3NJEY8m5eOwupl9i0BFBiHUg/5DoqzYkNdeC91QqDX4VdbZWFr8z2FzwW1wBCP6mBsua1MvnPqGhVtJHOrGJOMZ1dAaPbzd/D8gSeRqxvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100890; c=relaxed/simple;
	bh=nEZ0wTA7fLV9ayrqiXZc5QG8VcqyMDbTdUujnxnvTws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HN82ufhu1NeGiau50mTFQvw39ROGPJRV+12r99dM2LR0zjECa7XLR27xmlNklD4Czbk/DfIFIdfEg3+n06q0nVqsnluM2vGkNSvTmPE0oXWkrfKPrnWjevWFn5/0MKSpqae3YTVXP7ADwk/t3TEHk2Gzf2q7bwbNyQ114UnjgoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RQB+ez0k; arc=fail smtp.client-ip=40.92.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYcG0CSJju4Gk+xq6kJHDLX1G4xtHnQOZxsp1q18vddhhx5ou9zcHM5Pk6u9T2Q5866ymKR6z9XCz/UnB0y2BhFjaSi4IaNW7o/5QPnEFBmnztoFFqt+qUHeoxi5nObh5XHwC8Cp7bbgU20cDrtxUvOCa+9rKZxmepiCv2AjmvVz/aIieCzIrmITRCxMnikH9RM0XfNzZ1Z93tJ5p70bwVrS8f/o3ee5DfrZwTwo+r/x56HMDkYKSnD8atsA4qfh/+ve/hmL9w2v1PPL/5kD9aNmwR08HIJJbBDLt+VST9OWXv4DofvPiWWIRIKZepfvGRKZDNLczmdtG7bcoAwLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yffythjc46jj0sbeBpOb0oSUjM9OK2LopRwMQkP8zuE=;
 b=hGRBmHsBf148qxr3EQqVG5PdyFktP4sx7sxUeiEao2y9AbsuBKj70VDy//SoclUzAe5PPTrhFAgEVVvpLrdxbvDx/cebQHQK2zkauL5iBP+K3+2PCxTBEt9B/mPgMZ1ldshZyY7fR+fzr8yTY7KkUv39fGAGkwEKyMWx1SqYi7kgniWHVdRPj4Bs1ENPXY0Y2GGGE/jcR22JWl646VCLIgjOt0gE6Zw1cC1L8bifqaYV31USbuLPEAKB6GbVebmaMFE0WQK2uezVTffCMRCnNPqC0vyH5XtUB6vG1dEGwqVgkMFRVw1NeD9uA8Lw3nxNLhtCGHHBC9zy4hfgV7rUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yffythjc46jj0sbeBpOb0oSUjM9OK2LopRwMQkP8zuE=;
 b=RQB+ez0kgiyM2Hr93CXVdluH1ng6jbed4WmM6CKNcgQN0dTJsVQ0nirWWceAuOcmf8kQG1s2Ew3kzDloHXGCr4/2MEbFIS8R7f0lik/HINVYWP615VfZNvMGByF7QFfsD19QfST26Ql2TCeyWqB4T4d+z2uKUEO5jGFgfXwnO3LCnMUO8X81PGO7y0E0bRYE4PAumIcdak77eo3zkCAyVHrev8mJexM4kORUG53SCPyQmu2P2O4bWrdAESQxfhXDgnDhphFlZgeJtOzQ5DHFxPktAG0JmcfZAEUQY3JuyDNozV0rjx8+n+C0T9Miu8fsi04ArEPC7QHnbQFAPOtg/g==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TYZPR04MB8231.apcprd04.prod.outlook.com (2603:1096:405:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:14:43 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:14:37 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	linux@roeck-us.net,
	conor+dt@kernel.org,
	jdelvare@suse.com
Cc: corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: hwmon: Add MPS mp9941
Date: Tue, 11 Jun 2024 18:14:16 +0800
Message-ID:
 <SEYPR04MB6482612BBD0421F5428092AEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611101417.76911-1-noahwang.wang@outlook.com>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [mVhEYVcmiBaiO5HE+5qRiB38qFJpBOK3]
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240611101417.76911-3-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TYZPR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd159ff-0b6b-44ba-1293-08dc89ff4c7d
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXlVOWkSYJMIkESXiTBuWltLuoOjE7d7jYu4If2FOv+Ka0wdkCPmoGdLPVeCptr7l32yq54tdhMa/PM+MliRxUq6BBBL/ex2nKOa38wRJlbUNhgbzXm0UBlJj/k47tOFXeKlofeE3M26Fsz1wa0tDxXRcCIaJikkimAaKPmRxt4iybQDOsNn3XFCRkHV5B8Ks23qQ6x+hqNu3S7JLNzCZ4dBNCkmw/vyRJBB4Ss2rof66IQ+Kd0QOlvwS5UcV1ZGTEh2LynYkraRTk0PTUnb2cX5iZDRNJbPolPqnwOyF5HGUeCAo3LpZJUmc4PECs8If1qCHgWQUwBQl9cSMrkI8n3SrIX1rpavSiuarj4/RCijvm4n87JHbWyyBmqrh+4/cGSfJ6hdu7KsInc2uE4BN2Fo7xP4brRg4ADk97+0Ez00rX3HrzZMePdVzyeVMBrriVcHDSGoS+wjrP0/IWieZX+OFy6zGcsY+rnGecxFEDt9MInSBZTuYCF6OF5L75+3nb7le7BCKB7RM/vD2Km2tlbfKf06wHrfrv215wHDY7aCeuECC8HLk/rwhPqqXKQNsEOr85X3hyTHsP6aGrsH+P3kX82VG/Tgi02bJIEh6ktPbSz8Z5MIrpqz4Ui2YkloP1pIM9ba8j6EFfyGYG2kXnSbAGlWB3RNovvO1zQPAuk5txus/+80uDR7MjWtBa/DkKg3lf1xoIYUiDqiBqCbv3lnu1z6NpnlnJ/7NsA/H/yl7qy6PXhDRe8XTrH5xz8K98=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	HVWlUaM+7QsfW/hphdTQX/inTeL8uLFIuazqecDP+PnuvBUbrEIdego1/rS/u3SVeYf6ltIAIwAUPSlxCPk5kndmfw+bpuCfAS0IkHwTE200JYOIlPAMd/OaLgrcH9lSkQ2qBMrWsoC0SDMKqdVnyIgr9z+ynQLKnKzdocHUOw9hRDkyHBABN/VaJb2igteMOMfHL24ZkZ+ml6DyjQrGzL8gr5WyiUbhzdtgELP++n5eR5KF7t+FiKi5HYeAGKu5co6BEcHDufGUz2CVHGGZwHebool2IzpN7+LHqaZy548YMtFfk9+OwmaJ/pDiiRY2pFQKhADWHCsIlR6KampoDdnhNq9OqD43Svy/8aQwwDuy0r/JQchSP31xHQBVYrArG9I3b2EyvIJYU+VUDxWJOf3HkX6LAD8Mwrq67ZGu6Nlr+RFnK8LhH82t1NjvMWaQ2yfRt0YvuZkTgvog2vT8ZcbxHtlGNGDV50aXhUkhkG+pdM3u5yaJagJcxPJkX53QCY1nMBJeFi4JdRFTnHTysOTxhwQvT2IKyiIsYC/qUZEdSlqX3JgNdDaK19+WTFIqbYv7PWfkRcORQp1VfX0Rlmk/oJxZVlyYNyTQt/0Xrqq1Wy7MSgDJs3/UL6RvUeeG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?buS28DgMD5AWi3ZYH+15RLj3xmsxF8xNgm/fgLobKOt225ZG2MPChj6dMtj9?=
 =?us-ascii?Q?KCGv1ICk51hCtf0r+hwBXtib/vCBwhDVHFKyTEll6o/uwAwa232oLyZVH/Ui?=
 =?us-ascii?Q?kKUt8DLX4GgU04i+9lOlaUYqhcBgCwdlTSqRix/3GCvJf47faLIQX9iCY2V5?=
 =?us-ascii?Q?FbIjcn1xOyya+Im4+sWm4WSMHDumcw6YLjeFPw+Um46vJSF2pN3rj/N7WA29?=
 =?us-ascii?Q?QQ4MjoybK1kykrOXFoKPQlx1dtAXfcLQoE+zS9lLkNXriDJB9MZ/hERC1gZq?=
 =?us-ascii?Q?pixiAfMiQiRs6a9xE9ErwTtNjeFMXS2uCZP/h/PaNwL560+gGAf+1IomPR0k?=
 =?us-ascii?Q?Ec2mcJX8y88T4cB2C5zQ753maE85KH3NVgU1UoPgZk9maAMpuLVLrZiW5doI?=
 =?us-ascii?Q?hmKii8jcOqGooHvWDQIEMac8lgE1WE11WZ0KHOmbe1EmR0nJ2bWct2P/HDYD?=
 =?us-ascii?Q?rzUAW74E0yxBF2aZC2ykFwmOo9+CvpNjd9fziQ6U9WZBEKsb+rjC/ZD9KHOg?=
 =?us-ascii?Q?W5x441hHeiJhYAOzTeNVEismKnn0mA8qcLunmobVUUFOM8wDbnrSMeoaQLir?=
 =?us-ascii?Q?INzfcOYmWY5kmbEw7igGHwcTvYCdyftMdrYHRl+O20yPkOC18zvMILOne0/7?=
 =?us-ascii?Q?MXDJMJJBhbx3Lw/DIMQo/T6+q/jG3T7xjp+/ZuVHxyM4zcC8+yc5nuSSvMR1?=
 =?us-ascii?Q?Dda/1ooMT71WvcOYm5/s/7ivTJi7Qbb+SMwJosYiTRtpw8okMaJwP8nnwBkv?=
 =?us-ascii?Q?25A70w5/bblEtCEYsyZXb6ZJPXIFU7t4Ji54kpt8umG3IDMs6gW+0MUQ1meJ?=
 =?us-ascii?Q?LHIPg7+ldgcBxLQYzYJ8K0dsxRsWkKfZkXicInBDEC6aUEKrrrJRybBf8gnY?=
 =?us-ascii?Q?FtCu4xhWnq3XwmcQ7aPtOpVeSevi0Qa/Wr8iCH8Nr11hWUfjLivLo8IRG/Fk?=
 =?us-ascii?Q?utS+xVekIkfIw1P8IWqSvsa1uAqLlPcjp+FSDD/NNua9pe/9v46wGoPpTkar?=
 =?us-ascii?Q?deM8x3CdeHSL0XKsqsZZbVhQgne4psKQdRUngQwSaYRop5pDvHQ8hmnfwmef?=
 =?us-ascii?Q?Oyw0vIC7o/yjT+pQvGH9imqdfrZDgeICZWl4v8Unzr2hOJx/CBZucZAm00cp?=
 =?us-ascii?Q?e/RJ/qe0keGKMc4rcyQH4kIK4z5vvhJI6e2wJE7gmk3NOcyj1YJB0bsowtvA?=
 =?us-ascii?Q?fcKDONUxsfewoTToMcGy7poADSkVjpqSKa/OFsgFmm4dqH+Ob0bv22WKiMaW?=
 =?us-ascii?Q?jiF15WWkzmxzi8VdTijh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd159ff-0b6b-44ba-1293-08dc89ff4c7d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:14:37.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8231

Add support for MPS mp9941 controller

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v1 -> v2:
    add Krzysztof's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 01cc431eb59e..3b0355fcb9e5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -296,6 +296,8 @@ properties:
           - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
+            # Monolithic Power Systems Inc. digital step-down converter mp9941
+          - mps,mp9941
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
           - mps,mpq8785
             # Temperature sensor with integrated fan control
-- 
2.25.1


