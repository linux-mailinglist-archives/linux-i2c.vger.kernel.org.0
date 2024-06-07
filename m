Return-Path: <linux-i2c+bounces-3900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AF8FFECD
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A37B1F24F0F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 09:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816C915E5A8;
	Fri,  7 Jun 2024 09:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lW2jJfYO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2032.outbound.protection.outlook.com [40.92.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D215B54B;
	Fri,  7 Jun 2024 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751193; cv=fail; b=Q88ekkGpIioaV8Q+5HOVBEobHKRUZn7RMkrVO/1QR+m8V3tq+EQcej4eVpKSXvDfg6pw2OCZ0/JECnJTYvAEhdXutCmHUSFQeEbSKUVQiUlDm+oenxzOqBInsYhQdkh5C0fkWy0Jq42pUSLa0wM4rezdSAtG474DW51Z8dnq3MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751193; c=relaxed/simple;
	bh=u3brwTaddRVIeWwRjL7MOpEjlwt2J0LAcpPl65RtHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZwdDN3Yn8GzWVpPIW6FxYPbIXpvFQ9fpWd7EvXuxWSbwtA97Uk7bsVBPRCmPXPL9pz5/TuVbHJT5b966WwCQ9rzGmmiyG3iwxUBbQKaTR3/Y8n2VTShocPRTfLIKY2zrm87anMa1592qMLbybcFxRoTvtY3V2zJeNGHjUXWZqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lW2jJfYO; arc=fail smtp.client-ip=40.92.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXDDEbH98ROrVaifSZH5Ky49d9cfcHBDF4/D7noS+8/7Mc2w7UfHAehRQ+ZO45obLjPviV3xlPdXdHUSlXkZvLo3sP1yp3dZwA83j3b1O+0IKkVWtTbUfgT38JUE84HjdCtJ+aYrmWdatSUXgvZQDsfkjGgjLudLclYyeunoI7onW+6nFLMDYK8kEI9NElnfDXc9wxR15BttygiJzKEtmXQ4VtNLomLGm3ez2QOSfe4NEyPY/o/lYURvQSDQs/eeSma5aEj5kLM/IQLHSits77OYsi/xfzWVJLKwaRtfYyIA2pXkPDyPt9AjHrNPA2XXqdx3BZ8/kAgIzmirkDfybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pA4DSUgysCzrr6T8S+eK/ZCXUkjivkPG0vezLUyVLH0=;
 b=GhN36V3HRHXNrUsc6iRR5k42xzo4QqHDe5EO/w4ehkJIOB+E3hN5T3eLztdt4dWTmBOoGlr8BW8NGkpT00sbxKTjpF3CaD3rYZCCZsne960TWfayqwUIlFlOXOp8jH8roaUgfZcDqPL4FiwETo0GqyZVarzJKYBW76rinSRZr4drtjRDHoT1F9GdNO6tuylJ8btrLhbF6ts7ppRgKDJn5FdJucId6oR1ILT8ave6duQs3n62oyN8wmpdXyH1EiLNLHPYKwGXDUeOrrUX5n7n9F8Yk8rSYQ3tmq6Atasq5QYJ1/bJ8Ao6TeyaQMDvpQXXVgxYxOCJjjVLqEEqAxvG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA4DSUgysCzrr6T8S+eK/ZCXUkjivkPG0vezLUyVLH0=;
 b=lW2jJfYOrvsZVzhGk8l82CB1PR9ZV9KuVvEa2IoK+ycv7MaXE4ruG7BMeIbPxUJVCe2oKxCL7x++clsJl6c1RnjSta2WnBfEtcYkTkRWxh8dieArLe7Hug4mnVYrcOrexOn9faygMlio0RIIZJC60eG5LdCQxF6iatvwf99d6/5Nfpofsnv7U+0TIgWYJ0297T3rbS6JX9FFPsnurpQnZGIWDNHVseC/ewW5CQqAtu20o7QS5wbSDOZ/FrG1HQ4Z0DCf7OB2kui8Jw0eLZT2eic14MMzOKnmM034wPPUTJA3UKldaxkJ8hLJ6Uflk6LSmmR5dXOvFopLimpu9knsfA==
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com (2603:1096:101:be::7)
 by SEZPR04MB8048.apcprd04.prod.outlook.com (2603:1096:101:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 09:06:25 +0000
Received: from SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5]) by SEYPR04MB6482.apcprd04.prod.outlook.com
 ([fe80::ca2b:8a48:a7ab:60e5%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:06:25 +0000
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
	Noah Wang <noahwang.wang@outlook.com>
Subject: [PATCH 3/4] dt-bindings: hwmon: Add MPS mp9941
Date: Fri,  7 Jun 2024 17:05:43 +0800
Message-ID:
 <SEYPR04MB6482481E90D384546EE56C5CFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607090544.466833-1-noahwang.wang@outlook.com>
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [JVJhJc9qNNrQ19TYpWGwado+sRk0l8gV]
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To SEYPR04MB6482.apcprd04.prod.outlook.com
 (2603:1096:101:be::7)
X-Microsoft-Original-Message-ID:
 <20240607090544.466833-4-noahwang.wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR04MB6482:EE_|SEZPR04MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0e514e-72a4-4ef5-4b76-08dc86d11bcc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	I8yRRyMMokvIViFvfhA1xu4Ahmm15lazh/RF2+FTfvK6mUMbc9Di1QtGaBNrMNoncHNm2Syj/NaW2Oi0SIH/vIqapfon4Z0PjSOg4Q6AezaTIFYegVyyP/prUXyX4032fgj+wuOGpBHZ9sVkVvJU9slrmXmEofnwHmzcQdp9oUqjprS9zm4d3ywb1lZisP00y87oM0ui9y+/+YQ13N5P+i5RuzTSL+79gIo68ELlybQig4XBlRtfzOfJZDp1TQ+91TVs6yAqB9MP1Gi97Fx3P7GftD+pK95aW649cqpoOlONyEEUwjKJdISQUehnFFheWyKFBOQD71P3mVX/K17yMIqfqGZPXt2R5uIGmQnhufw0XCPD16iXGF0ZYRW8YM2MADNlXgdYzPSUqGkFLDHDR5l5dCFCDIUk6R+vp/toMjVgMZpwELeW4Nl53N61eGcFcymb8atTOKB/colw0TFHo7VCK1PSB9hGCS7krUE1X5Ak+XOhetNuoJ4Ab3nvdXo70WycLZ6qRtoBkkKlm3VvA9hMFmPgeDKTxsg7lWZxBJDAR5Iqha4uJ6PDH6fPY/+SCTKxJx/pCJtOsqJwTO0KnMXmtA/isEDkFNOsONyKA0niwpSIe8C0SS3CKveqCmvy
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DDRkl0GBvVhAZUjxuhjk9iqHlfdrBOAc65tcGmpBaFMwHKwOtD+eUhP8EnYZ?=
 =?us-ascii?Q?DsIETQ3a0kV+Ny/FPHPp9DWzCltWpTSQ5h1Sm5tnyp91VxbZkxGTEAYiGsrg?=
 =?us-ascii?Q?TKIbzcViok8NAW01A4QgFHET2lSl5Wh7UIbI5deMtkpblluqzPAfshc4Achg?=
 =?us-ascii?Q?kvT1HzSNoCibl5IxZXmCsKWTgRC1fHZQduDF3Sr18xfOwVBnZexxNYSv1eJE?=
 =?us-ascii?Q?pvgpuZPdaA3Xkkqa/aTBj4QwVLRudK59GA7eYQnJjquGqzz6OFkPOphs7ovN?=
 =?us-ascii?Q?9faV+azXXwsn2WjUun+9B9RZP9Tw+vW4uuiQMhJ0q9KUbw4YIjKKaH3gY7tD?=
 =?us-ascii?Q?22ZCwny5TtStSkTV3eh01vvVmY7Rh4DDrrK9WpVqmSakW307WLE8w+QCqGnP?=
 =?us-ascii?Q?uHNnLtaOtTh/OGKkWlq1Rjzlk8mPH/R9hOr1sVLiaygbC+2wf99j81ReJxe2?=
 =?us-ascii?Q?GtU1/3HTG6t5kw8eF1w68jz5C3iPEpQJfHLzlFHTmtr/9lpKLBnzQTCtVgFJ?=
 =?us-ascii?Q?MV3ACX27rhNInNaPcs8F6TKbHVViUUQZf9hnAvxWMwRs8P4GE6TgAqGiLOvW?=
 =?us-ascii?Q?XWDm6D2ihKWg2UqSNkkssH6rtd5hstQ6Lb5pUSL3/RaYTxUrXDwy5byAU1nz?=
 =?us-ascii?Q?iFUlJGizCDYOgYfCOzi0ed/Uw0Xmlf4LYV2qMMqnV8a/h7jSmMk65ACC8v1l?=
 =?us-ascii?Q?qEIvX0zehChVFQYattlCOjZOVCfrq85tdqtdb9O3ypo7gP9eHmB71w5kCD8q?=
 =?us-ascii?Q?nt9lHrwNRcGmwCUMdFyWdg3ByStq1MKICl1/1+rxsWHsGszWObWDLz3CgMAD?=
 =?us-ascii?Q?GmEebx1yReMBI4tWWZbeoH5spFoyvbNhPmHCpWjoGiA8JyN95eC6Zp1h06bR?=
 =?us-ascii?Q?05sWEhfGh1JcNn6X19Lquz7sWD9MWdHh5ntKRtVHcamvV9HvyKJWv6j6qRnF?=
 =?us-ascii?Q?bgzIWjs7v/kk7ZstGGW3IkK1sm0FsegOdZQSFdlR1V96v5CwHyMn9lTrRZ45?=
 =?us-ascii?Q?R1bvqsHUkgUpAykDK1y6mggj0OAUGI5wKJz8zZxkHVmTpq1JCLDOep349fyD?=
 =?us-ascii?Q?pgFUH+Dqs3UAuAnJVQhYy0SPJILkcXzr8ToeY53Tw8r+BfuuPph2yPgKZyer?=
 =?us-ascii?Q?qsHnOi7kAeHy1DAUQvL2Cfh5JoIfBf81l80ABbd4SLrPRflHx4X8hBbQ+fgc?=
 =?us-ascii?Q?dW1fRw90U88hnG/ffyD6SEauEQo0y92IyEZGlsdHZg0QitasMkYhAAhz66QF?=
 =?us-ascii?Q?3LcmwjmNM2ZLxyHwHx2v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0e514e-72a4-4ef5-4b76-08dc86d11bcc
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6482.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:06:25.5019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8048

Add support for MPS mp9941 controller

Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
---
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


