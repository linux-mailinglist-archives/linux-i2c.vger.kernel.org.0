Return-Path: <linux-i2c+bounces-4369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C2917CD3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 11:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50561C227FE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC1716CD19;
	Wed, 26 Jun 2024 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ruj6g2Sd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2092.outbound.protection.outlook.com [40.92.107.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AA149C52;
	Wed, 26 Jun 2024 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395189; cv=fail; b=HCQZPs7ld6ijOGsosMO9Y573wUd0giLcZJ7aSuHsxyYe76ICSK2RX/yjLDbOl79dUv/Bpm4TCnwGrSVlYNPr4CQ0H/VxwK6HbjnjXjngAuQDJZ4yqXCMQIs2G0iTfbsXpHxSWaoxaqTuIWV4Ja6ZUeZBhYLAzR5bl2zquDOyEAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395189; c=relaxed/simple;
	bh=rgC22mU4WpI+vsvnrkjmVrU+AolHXTlpyzYGY3xDOdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kKeo9lnfX5lc8nhMd9/Ub8I34KVyTx0adTL7A29yQDCUuRWpScP/d1l690sw7an7dHRvniVDxszDx6f96q0ROuHtuQMRE2ZZ67YR7nyNb/8NuVpIhTtsdA2dsYzX+Zf5412qNNvwUxYXzy3KcqsEDKe5KwDZ5FQMI25LcIrBP0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ruj6g2Sd; arc=fail smtp.client-ip=40.92.107.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zu+An7Jio31ZrUbLh3IFJjaDEZpXiaM5Ws//eXqXcdf1hi3zJiQZxgrChYWwfQOCfNOEqlgIil1j0gdelkIKP2l0xPjM5tiQT6kXVHjValJmvlzc3UPOHlyfV8lsTFXt+gn8IwxPlGyjpipdH4ZLZRhgRNowltXIl3+KtLEA0UK3dh39gfwFus+BIU0vkTafao3sSsUX13HqOP4jUQT549jggECu/D82750UQo+V/ZK1Obz9DloeH6nfSbihPPM+TH7KA5frz0BjZShn0kL4440WZU3+6PAvUogDu2zuZI+5QqXdRn8KpKp1zZnbStdoT9Ey242uiPHSTCgZVdG31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNxlTTFtbMu++uEV7DguxSTE8gJD++FSui00LFxvrM4=;
 b=Ahxuyxr1RzhuJ6J+Ic9dsy+T0e2oQgOvo6Va2fwSRVvEdV2o1ZhH6G/5kze3h9oqoRbBdDEHIl1SCHMzFQsUd7lnjmxMQ1PGKiYqr+vTjTi0fBPUdElL0erdvRDc+EQpw+2ChF3Ab3qPgwV1Ta5dtqbKUwMfBRaONkWR5//qsxbiu7vOkWe7FQK2antSsYlyROWFnhBAVHC0I2amruU/SUhSg9SBm5FJJvJiMRApzfLVHBPkxa/YY3by6M5P69qnFmOPFG+yaNxVtoNZeWXuFzk+U0NfX0G+judjGw4IYDGfAiugL5TuHINFMZwASa1tUid1S58whmO1VdTlY6CHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNxlTTFtbMu++uEV7DguxSTE8gJD++FSui00LFxvrM4=;
 b=ruj6g2SdCRHsROvWuIkWH3fdiqmKPaC3a4hfehd9hJSmGkrR9hvs0hPEfGLzhPwQ03VxscHbvb2sZD9gY1QN5KLJLUy6p2otiN2RET6fc3GsiLeEQ/V3FKebOKfac9tyZQijxFY23B3Ltp+byBXnuyiJ3fFzXNIYjK8MeefMPMkzn1GTTCkrm+3A4+K4JSL+6uveVsza3v03ce4rZ8Zt5u+tmYCU8X9OPX9qq8NYRFeeSQeul3Juu8V4c9CNwekQ70C+fXtKsXBuc0wTwj7YqqMIeYCNDYDTo918TYKgjF76L1+Q9C6XYdbg4fmmnCWJv+TfT992YSCHiNIO/3sK6Q==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by KL1PR04MB6877.apcprd04.prod.outlook.com (2603:1096:820:cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Wed, 26 Jun
 2024 09:46:20 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 09:46:20 +0000
From: Noah Wang <noahwang.wang@outlook.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net
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
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add MPS mp2891
Date: Wed, 26 Jun 2024 17:46:00 +0800
Message-ID:
 <SEYPR04MB6482BC95D1242A5675FF9DAEFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
References: <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [cfuiPipfnhf43b78oMvvisFN6Z30J5aw]
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240626094601.52298-1-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|KL1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fe060a-7420-4d6c-c5e6-08dc95c4d52c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199026|3412199023|440099026|1710799026;
X-Microsoft-Antispam-Message-Info:
	1NNoZIMO+vfS6XBfOnayw+u7aX5ASPWJQ0ryL0w06tjbPKd14KALIQXlc5DcpTlVaVhM9PutIXNU3KJEqebC4lYIxwRfZINm3yAdVIndPrNGp0Im00cfxVpZLU3k1KLwc/5T8BH3NTkZ4e/t7FqeXX8zZ7YzlWQyFr+fnTKYwA/jyy/ZFaIUzDtmDqaJ+ovWZ7nvV98QUFgpAxlOdPypG2Hk+aB+/hHAS3616d3/HVE/CVSisP9Mi4eTJurK7ftRcdX+vEwwL9pRINQDZRnEY+g7wfDttr6E1TsnaGdUrI9otyzmKXS9JtcXimKAcWPvnR48NpQ9vS+rHe87lv2vPje6NnhBcDCoqpk5qR3J/M3OwtCK6Nf+Y7oJoFKQ2mOERgerJv20GdMR6+pNLQejctprW0podOFXuSDgEmZIAO/ELcsCaeBD4Z5Md1vRhKOYbZrUjg+QWIDN6Gd9bhd7/EZziuiodLx71pnF1MKAIyjhxeAva83Qfwod4zJuCfinKdabSjpLXIzd4nYrL63AmBliwDY8LZm+WucsfAVYvcL5KXk59ZlSHF+kGWmVMf5Ppy2/D99uq7RWCDl1+flRxo8xsSjnWIbeVAtOHSTqVtjZl53KPmvBjY86IqFTPxJn
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YkuL31zBQo1nKtoTpJx7MKV/mGEsIBggo/RU87YuX2MrK6acE7MLeeOmLbkq?=
 =?us-ascii?Q?OiExa3aqS0pfxPsSsI1eSnxvuZbeMe8ug4O64uRWXL6aWTxkhMtViady1Zs5?=
 =?us-ascii?Q?/X4gcEJWIm0XBJJCpe+H7KL0nEtfIBrs9DpNJVho1q9h38sYEjsqvJI99Nz6?=
 =?us-ascii?Q?Vy8rdIHw91Ud35YUECbhZ7INAr9mPGDhpRU9lOteriJimcpVwPE2ZbKxSpTp?=
 =?us-ascii?Q?scp137YvnnInYwt0Ncnuelj4o2WQqUeFXmqlSKHFrlBhO+A/nfd6fa+BZP90?=
 =?us-ascii?Q?tVBYKCk8RlvKYDynToL4Qtc1/p3+Imqe3PLZ7uZ4HXYUIovhbdjwkA2m1HWs?=
 =?us-ascii?Q?nhBiu2h8aXYJjV0Pkn1ZGseM3avZoy0k1fuB/YKNlim2ZFuZslDT4EUFP93a?=
 =?us-ascii?Q?tbps88cvvm/bbKKgb4d9BEuG6ZSyCpLTXQq47B3Cuz3HjZ5ZVDD1sxRcJ6Y1?=
 =?us-ascii?Q?woGxQWfDPe9AqybsUiAR+4xFqDkVBtPv8L5ataXvZ6cex6oFakzcSBfdUC2y?=
 =?us-ascii?Q?cGDdx4CU+3HpkB5SrnpxSupns69MIw4uAfMXuWxpYYX47qfyqlkdJj2R7IN+?=
 =?us-ascii?Q?RGmEO5mWVirr7p5T2gV+FTxjUiOLqWpVHsg3a+bYcVseiKMSTeUE7vttkRWS?=
 =?us-ascii?Q?P/16AdT6DX0W3WJvcWjGC7BT1WYrJkxuG4hqPUK7OM24h8TM+4ZoJs2ugRHp?=
 =?us-ascii?Q?pIGwqy5BfVoDLBomwDXxbFTD1MPREkvsW+WfowLPw6MDXodMoVE2BmbXrJb9?=
 =?us-ascii?Q?JyPLw2C18tuGX1mZJdIE+N0KqWgZZ4qwySGhNF05QhU2eXFeIJgVTs3v8613?=
 =?us-ascii?Q?lG3tvgTlYHCNUZYf0AWwm1RiM35vKJMQPN7J5OESNgVQCqhJnmoZBVfkLVgv?=
 =?us-ascii?Q?B/LaxWHgKuOz6zoAB43j6DjtrwK/qx/5PtONN69xVT88VlA53DaJdfwAPSY4?=
 =?us-ascii?Q?MzFTmEVqfvtWncabMkExL1wn/H+PelWTWvqYXuXhn7pU4wMEJK8EtCcW6gbp?=
 =?us-ascii?Q?h4ha7VDSLm6kJX1Rl9oJnkismym1pSayU2IDxdVNDqpm1ihm4voyGNHRR6VC?=
 =?us-ascii?Q?RvfHyl4jFX4eenvtef+AVhnW0Rnl9n3nbV9mhO6xMPkBUnyYmw6R8LzMdZJY?=
 =?us-ascii?Q?YQqhYbXz4MibYWWs8loJCKWxaJmEW0llwjKwAC9Znat/MlY+TxRP9HKtlJ4q?=
 =?us-ascii?Q?ofE9HiCokrlVvvOPs9EvWLw8+3deCuz4NLhtz8LE08v2DeLz/QYLk3gjIbN9?=
 =?us-ascii?Q?Dx2k93kBiUZf7WEgfdXo?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fe060a-7420-4d6c-c5e6-08dc95c4d52c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:46:20.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6877

Add support for MPS mp2891 controller

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
v4 -> v5:
    add Rob's Acked-by

v3 -> v4:
    add mp2891 in alpha order

v2 -> v3:
    move mp2891 dt-bindings to trivial devices

v1 -> v2:
    add mp2891 dt-bindings

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..191d4c3e0ad6 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -286,6 +286,8 @@ properties:
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


