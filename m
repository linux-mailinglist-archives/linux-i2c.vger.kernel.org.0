Return-Path: <linux-i2c+bounces-3753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D85128D8065
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 12:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6010F1F21171
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 10:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D84107A8;
	Mon,  3 Jun 2024 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pNoG9IEl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2014.outbound.protection.outlook.com [40.92.52.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C183CD3;
	Mon,  3 Jun 2024 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412031; cv=fail; b=LsQiVCsrkQBzQXhPRmPhY23r6brwo8JWvnOtdHChlKBbACBiW1RCPUFDtOKvOs7YnrpnjxWWswZ3e/IFEIMGDXD3ZsyxJpnlX32lhEFvdxUV1jMuvgmfiYqZwq0B/ptzFaTqgjgpNjfv011nRRkICJti4YXL+sZCgaAIR8fhDDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412031; c=relaxed/simple;
	bh=kwCIJfZIyEPg235UrLcxjJvwyrFJKRyUwVsWxrR2X1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTxBDrPUird4BrGmcbNtd8hFwoSzleFNmVZFdIF9Nbtj7hmy9sdwqvrKFFj/cAW013wcDUs89qRpnB3LVSBz/jjH6xsL6tFgza1uNE/SKScColHDdyfOJT4Zn6DNPCoUytkfxm3rR7uOBHQ2g6hyR6+b6oDTpylJPq14lw95MS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pNoG9IEl; arc=fail smtp.client-ip=40.92.52.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HV5JnygYvn48NiiL51PM8NUoFF6yqz2BgdhG0J0zm+AmptRXn/u2kXQ0YoNXyWPm3G4D84UJyYf/J82DcDHergL15qnMeUvLAL9hdmK+YBEDEVAcDsCnQQgLZKB+wXkKobpPirWEHtek/oSriQxCgVyBUvUX4vIg4phV+Cg7akiO0t7BLstqJrKw6ZxDbrJ0VQPVBNKpuy2u/8cdzX5PTzViZRs4++AYv0XIGWNqYYtidyUpXYgRsNxPstv2XaW+BNcZ/O94kMpOIDeWWt/q2uMym2LpWe5OPS+TsaGsppZWJIXiTbT3wPNzILuTyupezuQXP/MfVkE0cT1tnsQ0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LguuoJQFHTDPB7SkHbgEP1zi070OF0jAEUD/V1jsiL8=;
 b=Fge6c2GiTlYroZ0Vxqe8WzS4eEj3jvaErtpZPqyeZWJavzvvCm98jYmCKED79cEQGkpz6zfOBb2P7I4tfZoJcvC7Nuj1O9+20KfRw1Rvo3Lfj6kxIcLY3IJ5yoL/8fR4mKfhomSOzde5XOUvcWUutHs+jKKbn0RHRTgECGUUYhYmbnKTEa7HVvzeKnr4V8dna88SB1I258vM1EVXFpUufYeM0E0EGffxDiiEU5CGOp2+hl9KYj9HflI7ZTG1A3WlTwtSRF6auLubiwCqlYrJtoLEs2teTs17Bl38HuEYrFO3mV2eVFmLvf3otW3Q6ktVjuRwETtMPbYY6UpDc2DOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LguuoJQFHTDPB7SkHbgEP1zi070OF0jAEUD/V1jsiL8=;
 b=pNoG9IElqzrB659DhEnbzX7FG6wuI18RpWTRZez6px4R+iOwHaqNsu36/Hah0nB4x5DHyYJOiRfCNw7NwH+nlnQhIAQ2Kxa+Y7+0ewPOPjD35lkmIi+lKDDxEeJo7vg31mzpQVglU5bfDJ7BFqOoPFKystVJmcYZEGJmIclckcn5U+zU/e6l59Lzb5GFFXmxvbSTqmyVLcCBrJ5BQG8zyz4+GWrWpNQmFqp7vDvqc0HBQZemkWOBkCgi6LBpevntqEuw+xxM/9Ah8tAHL2qOFh2/vTTSN+dayS/rm4gGrMyY1yZe4RGo5D7bw3fKrOJUo+vESyxlCiQXYB8DbZaPng==
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14) by TYSPR04MB7967.apcprd04.prod.outlook.com
 (2603:1096:405:88::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 10:53:43 +0000
Received: from KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190]) by KL1PR0401MB6491.apcprd04.prod.outlook.com
 ([fe80::d4b1:6b60:841e:2190%5]) with mapi id 15.20.7611.025; Mon, 3 Jun 2024
 10:53:43 +0000
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
	luca.ceresoli@bootlin.com,
	chou.cosmo@gmail.com,
	bhelgaas@google.com,
	lukas@wunner.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Noah Wang <noahwang.wang@outlook.com>
Subject: [v4,1/2] dt-bindings: hwmon: Add MPS mp2891
Date: Mon,  3 Jun 2024 18:53:05 +0800
Message-ID:
 <KL1PR0401MB64917D1D51254FB1D6C0371CFAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603105306.180874-1-noahwang.wang@outlook.com>
References: <20240603105306.180874-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [oAd8MpMpYa+4WDysQhuulAnHrPpsLA5E]
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To KL1PR0401MB6491.apcprd04.prod.outlook.com
 (2603:1096:820:b9::14)
X-Microsoft-Original-Message-ID:
 <20240603105306.180874-2-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0401MB6491:EE_|TYSPR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1daa2e-df46-4c53-a5fe-08dc83bb6f6e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	N+CC71JU9p3ES5m8r3IYDHwVY5ciNmkg3uTOMjmDLwlnaLfb1/iNhJlX1OVNhWPNIBP3mzRDXOCfBnWyw2OJKZi5vDSfXW2I4ta5hm/qS9Xnn9yygSglp+t2QRc36dEqhRCmKBJdoMqHeHhI/ay/SduEoWZiN0k1QmToira4tfDZRschxVhX0SMJAdL3FCif0jJffLRN3of/Ob1ERNki38JZVsAHwAlcSvroVr+xE3cBccfKELdLF27znFOaQgBVTs9uUzciGFJr6M+8DZx95lGp5iaYtIsQg8SALnr6PTX4iXjvYkZCgOab3dRtekN3WOkx08s63Ah8Tz1qT8mtemLq59IwhS/YfntqWyk3/aW6q7xBBflzfD1wtsCs33S/e4qlHq+kF+oQkOit6TdzYq9Yu1CAHY+OhAXKOvuOhh3O6AuoP/vDSw5+9hLUfQaiYleOGsHJg2HxNy8w44q/PHAVubxZRhwgjs08p+FXNBzDAe7jYf2VTiJioiQKOQeyg8zQlYRxuIE9UnaTka36Vavriem5LC1tVv/20xMvYZIdYjg5uwJ7sfRpwqa4Xlkn14DGppu/s37U8Hp8urt2qPlbbcVj4j5E0OKVztSFQ2AmQGiTON3EpK9gf94H73kk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tbUpAQz76MkvjbdSHsYi0sV1fkzHA0TpZsTsMiUHkKb/NXz5SCoavGONRn1o?=
 =?us-ascii?Q?0Tg5O7VTsY6xK1plzQlx8ejKvRu9J8jiJc3lKcZQuwL2qygOIu6uJiUStjQk?=
 =?us-ascii?Q?TOl8zTyrNcUEimAGMr+ynx4d6DqinERMDNOR1t1nKNS99uxfiSywo9XAkarS?=
 =?us-ascii?Q?oghsrPH6bVfvmHFDtFnBGiI+oaWE5cNZj3NB1dFUgNFL8Cl2e4APBfc1EBj0?=
 =?us-ascii?Q?aK/BXtMJfTjE9y2RtuMdNixB2WeE3QA+DlyMoKZ13vgmKIbX8cRh8N9JRh9l?=
 =?us-ascii?Q?lRHo180Zolz3W9wb2IMkoXRG07g9ZG7rGcpDLim6m9nIDiKHnAJoS+P8JSna?=
 =?us-ascii?Q?l/nIYmFrX2AIFlEPimFaTEwY4IQ9BTJMrwWD04G3cmFvmPNnWgcMvSwJYqKY?=
 =?us-ascii?Q?7sAywe5Kqv+LWDuStBNZmv6E7Xpjy3KyfAa3lb7m8+eC5VCpi1LXQR9vjsPu?=
 =?us-ascii?Q?XfB/8MmP1bMSZN33z+ueLTMNTQM2GSGlpRtT8y74Cr+mUyMXNHQC4YXVqamy?=
 =?us-ascii?Q?HOXjo0I9hah7DuMoSowWkDyb0tZXNlQq7cXOxz+/pmczjK8j63EiBtEf09le?=
 =?us-ascii?Q?09EEhGySxbnzQa70tpTPtpyrX5BQec9plCU/X+aAWoGDu+gDhVXxGiuJIbsV?=
 =?us-ascii?Q?ZEhPdDYbvkgVhiySys96oTGPWAIJr3ovy5iYhYyC9XEOU1q10l3R5NUxWPXs?=
 =?us-ascii?Q?vBBfyPUyg1oKByL+D8F7xE0u1n2GQjus1oc6kVvNnoPETZJCw5RvAWgwROsR?=
 =?us-ascii?Q?nOcsnrNSX7C8f4UGqhmkIcgesYTjI/+H6z2Hz4RxHd7rxv2Gt6esLHs97Ab/?=
 =?us-ascii?Q?Z7STISN9irZTDqsmbxjy/YByrQMOdVuqZWK0TFgxzjciE8KGRClZub2eR+NB?=
 =?us-ascii?Q?LhsSttjXflEYGXmrCGq6ZGjI0MTdm5x0IEOWTOKpENUTz3geRkONBj36WiDf?=
 =?us-ascii?Q?517wWCMksARR9rZIpF/Wvw/Iw9SLLtwIzcPDR2rO0+bCJThBqKOU1XcL4pml?=
 =?us-ascii?Q?21piIyb/1QP8iIHBalqmcdVp2O+QUHq1veS8h8kirn06G1uJkE4ZGrZBhmxm?=
 =?us-ascii?Q?34NmtdxdqArFxO1kDvMCrFGIrYaQQRbrr9GXaRzdiQwW+/YVusAn5GBQA3/r?=
 =?us-ascii?Q?ZATrxwkyFd7sOj+1HP4uHndetMHiQA3N6KzUNGw/FzDlfBoC2h/Y4/GAqhxz?=
 =?us-ascii?Q?2hggBZ0mirBhWN3+6GYYTDhf1pmUgfT8pdzY0Z7NXO12DC0mMAzl9kXVTOFJ?=
 =?us-ascii?Q?mwWDEA3Xsm5PFs1Dsnc+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1daa2e-df46-4c53-a5fe-08dc83bb6f6e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6491.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:53:43.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7967

Add support for MPS mp2891 controller

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v3 -> v4:
    add mp2891 in alpha order

v2 -> v3:
    move mp2891 dt-bindings to trivial devices

v1 -> v2:
    add mp2891 dt-bindings

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 025d50454f88..94427d9d73b5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -284,6 +284,8 @@ properties:
           - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
+            # Monolithic Power Systems Inc. multi-phase controller mp2891
+          - mps,mp2891
             # Monolithic Power Systems Inc. multi-phase controller mp2971
           - mps,mp2971
             # Monolithic Power Systems Inc. multi-phase controller mp2973
-- 
2.25.1


