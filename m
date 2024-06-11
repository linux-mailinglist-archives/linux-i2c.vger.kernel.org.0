Return-Path: <linux-i2c+bounces-3967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB5903887
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 12:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92FC0B25D87
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 10:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A625B178CF1;
	Tue, 11 Jun 2024 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FZ2bl+Oa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2019.outbound.protection.outlook.com [40.92.107.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7755178397;
	Tue, 11 Jun 2024 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100878; cv=fail; b=MzGC9h7gLwsFxRao4uehtUM3ESzfn9uBZ5obkoQhNR1EsN3ivH/jJqECwDHHD8/SGRf86Y1NsCszWNPrP6qRpa+euW4/6/533ltt6EFHSZweSJY0OPy6bKoL9DVCM8fBJxn14ndwJXxhrPfy9eDIYTUr2cfZQPbr1NHD037uRyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100878; c=relaxed/simple;
	bh=55zTi90QyNs7RwnG+xem8CwSk4yvFwDpDOM44nCzo2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s7xYqd4F9PTa14hbR2lVPWRVgSbSWQ5A45vegjNtub8TN3/Z2JeQztU6U1kPvi5e5pD1roCfjQ7jGy70rJ1MrNuSXtWjCUdLWY+K1GmySpoHFXDhYfNsgWujA+EbUJYdXkfOTNpSGv1tPY12wVcJ6Pzpu9G4fK2Erine1bl232Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FZ2bl+Oa; arc=fail smtp.client-ip=40.92.107.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIKwvjyYxyRwPxIcsFbQRDHjKLa8wxVAabj7CdfgAzw6VPOgYRYqNDWJHCFCm9+ryUi0K+c1U5CsERXbQQ0kVXwJlB+qfP1rIbCm1gjXQurEriDIdif7uSEAGPwe4z7y0MDhQxZ1MWlx1Al7LosRVroQC2XsvOAo/nYDQL4yE9mc1JJBR3rKh5zdre026pFVcjB6lMTQLd53toV8V51ksfiKhl5VxpVR+XEE7UpmlG1CO3pMrStay26qWvcmzjlZrtqPDF737iP0M3iD9ZOVNacrgHkVtgt0wvntSkcNyAc0kaVOOY9ZwcOzdCkVvE4auBvRIwmL9ngCVhfIIqj6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAL2MN99vlKXUrVMt28AQ43zU+fqQ/FIw1sh9AgwYrs=;
 b=VTcPFowxX037ShCFIgBEr55N4v0ZX89bmY8hoOzUSMXs5alPctMfE26g1XqDtniacYVCI2f+fVFuTX+DeqwCTI07QWBmEIS3Y4F1xJRbg36KV+52PKfrPIimXxvrkaDo/V+EXjTL+oWbhGwV/y6Eewhz6nPt6UVUlYbGXaSKww4UMNHRVHAMjbaPFVf7fPL3lDLOg09zUZpPaPttdoWNhQmIls53KQZCzlf2gJr7Z+JW/fpnllbGjkYbZF9Omqqptf9TpodP5fNov8Kr0hqyi26zUdj9hb04cWuhTGhKjIbOd47ebVAEYKaO3WZEsAnGzgQHWyliJfLD/5kx6alK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAL2MN99vlKXUrVMt28AQ43zU+fqQ/FIw1sh9AgwYrs=;
 b=FZ2bl+Oatm6cvBzq32xAPL5sDhAmN2bFcPrFG3kYr2HLFNh/yGI2H5NYVVl2SKqEycpkeFKGkJULZMDLMf7vUvkth2OnKXeTU4lrbsbW1HH3CejZcSSzFcBBK404FbmC4VQS3gjYIaCcP2SwU4GW0RDAGctTfuCXgU0HLACCtO804UoGPeZ5mLolMGKjAOPQzdxOij/aKflhEqbW04djaOEb1jLVOT1WtnZZODNRiSTJpiTeEq1I8W6s66k0A5jpPtVQrO8bTk8QiM2f+H4A2WpjA8vjGAMxqwnsmDZpmd5px5uLYlM4MAUXYVEDxxOt2ivPNX0sdaJDMii0In2GaA==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by TY0PR04MB6255.apcprd04.prod.outlook.com (2603:1096:400:328::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:14:31 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 10:14:25 +0000
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
Subject: [PATCH v2 1/4] dt-bindings: hwmon: Add MPS mp2993
Date: Tue, 11 Jun 2024 18:14:14 +0800
Message-ID:
 <SEYPR04MB6482EE5CA0C9A3F14863B999FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [hE03j4yHgll01zPHgxWtuZwYZnp96pmp]
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240611101417.76911-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|TY0PR04MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 826490bd-7a7e-4ee8-a547-08dc89ff44eb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	eT9omMjrp7wYT2axe+5F7xafUsZ9BaeM4RFN8OpkFgdaYEvU1Uiv3p2J4DbCCTFTvOxePch9KuLrekbzkp20B84l81nNKABJ+01vHqKzaSnxHZbI4QTy7xp9OX88PdbN/0Or1+U4Gul+i3AE/dSpYI6vR1SOvM6jPvl4qVUcpARHXnWVLuvHQFVjrTN6+vUeEgjLjHcF+Z8Jp2PNWb8vk6eR3/Aggc2vLD3TtWHPKtZYE+jx9E3iMFFn9UhhwLg+RQUkQe0vcfpmzv3hgFNOym5rIYnnZryAiP5LCeIiImrNlARqljDBJ48+1htK8WNkjbSWME/qI23TDabAq1t6PHd5PnvjFgn5eLHepxXhm9Y6MWXOJC+29vlpjFRmf1V4ontenYWK1LgOaulCzixuWEz41MC4HgbOE++KSQ8WXkxcbZA8abmjqZHtxBxIDATzPUPR9qqgEFe8M9ixWDL70oCN1bpoWK/Pu6nGHKbZOpnEGinx6rCSD3I+tDH1x2M64f+GwHn5F3rR1metDGJkCXDVJlOfy4YExwiiBKWpLWzYYpYgBfOWNNzHUG2C834qU1JOh3tFcJ4Cr2eiydt0+aNH+UnbTNTuzqMDscD1gGBNAlhSszD9l7YrfoPhgEbJ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eESuFrGEgpDDpsAWOyG5eM79NAqjiqJj5m6XM0QjHIokz2RCBJbac9JXVFcx?=
 =?us-ascii?Q?AtApqJL1kLwjXjtft6uSlJHbi0h385ihFfQmdJXgJhu0CXUs0VhK0NKIivOR?=
 =?us-ascii?Q?U+8s5DqlNiR4FvrecE8N+bsZDlCsYwrygZZjVSQHcgk9FdOoOtNmrxLGS7EX?=
 =?us-ascii?Q?CXX+ItQSK3Gg2KXTQpf9f5S3zOIbQ8daWki/Hn3ompfJQyLMXdpYfdOLuzMM?=
 =?us-ascii?Q?tvDEH6BD+RqNdAyW319OquC41sOJP7WfSKOC370Hc9u/L0Lv7JnSWJIjXf5R?=
 =?us-ascii?Q?sfMmxSk1KdJJIiw5LEflI1k6bx6IwFMxRZGUTKL06SwxyrTrTwHNTC0pvKfI?=
 =?us-ascii?Q?l8vDVHktYzuo2NHNOrCQsul7UQfZZNdLraXNPbMvDdZ/haIM2WUfM/UkrHB6?=
 =?us-ascii?Q?xsUfcdXK6OeRW0cL6RG/BnYngU4p3Hoc62YXPy+zAWJFFR1Ak4FG2NktvEEh?=
 =?us-ascii?Q?vKvjGdT73ngPZsiwVcHpiE19lZ1s0IT5dEvV1K3dBgo6HZ28cnQQqVAYBFKK?=
 =?us-ascii?Q?JsGlmvW5XDr/wvh6OJOReHyAi20VqomC3gxBWq9Ij5JnWjU/MZfIb7vSvvzj?=
 =?us-ascii?Q?IbvXD85GpnybPnagAIB4xcvQjJ7UGUuUlSro0TP2TrKCpQvz4vPlpwgdatsG?=
 =?us-ascii?Q?/acGkPH3SKgORfVStruNIQuKJluVVJiQBO+m4+DDc5EQBpKHEWNPrsQJgQuL?=
 =?us-ascii?Q?wD4ExyMQS2SL63bzUbFkhCbPxSIQboIDCqv6aCsdNq4QjtkiY44+CI7r2K3f?=
 =?us-ascii?Q?TKsVhgecdFOC+vZbLQlWqH5rsedFZiq9UrCKrcCpjPqJSUnk01ALygTUiMR2?=
 =?us-ascii?Q?h5BUbqGgEKfpdNdWHyMRDy2wJbb1lHV4o74u3QZ039h6Bd3HoRMqlKR3cHox?=
 =?us-ascii?Q?M4ICnYX7fvNGb5EnIk1c3RRPULkqLmNCSKTym9Sb46NSh1F7a/fN2Xp+7VS8?=
 =?us-ascii?Q?s6OdE6OKZ2McRBh62LHDBwnMUuGE9m61PC9vAAjvfIbDLIr+dejylQKqo6nh?=
 =?us-ascii?Q?NRmZEzE+s5pidJHNlMpFxdVaeWyJG9yHRThjFuXHGfLj2OfUeJlZ63Y7BCbg?=
 =?us-ascii?Q?brZfnkDna+z+sHl2p2gGkeOIq9CyJC/xbpuCdH9PQJlNrFRzG5oexeKYAF2v?=
 =?us-ascii?Q?IZQwkadpJu1z6rw5BltZgUH7mkcIX4JJmRzqkF98agTjx3RmchYZ7A6vhru/?=
 =?us-ascii?Q?4jzUp1M56dbI7SLDCGV8IJqrJ/wciCuz/pxfV4GezfuInMAUjmo56q4VKW6D?=
 =?us-ascii?Q?Wgt1XxEyaFVgqnkWhuOO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826490bd-7a7e-4ee8-a547-08dc89ff44eb
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:14:24.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6255

Add support for MPS mp2993 controller

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v1 -> v2:
    add Krzysztof's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..01cc431eb59e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -292,6 +292,8 @@ properties:
           - mps,mp2973
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
+            # Monolithic Power Systems Inc. multi-phase controller mp2993
+          - mps,mp2993
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-- 
2.25.1


