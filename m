Return-Path: <linux-i2c+bounces-7126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8A98B6F9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0BC41C22063
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C3819D083;
	Tue,  1 Oct 2024 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="UcmzWGqy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2135.outbound.protection.outlook.com [40.107.220.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BE19D060;
	Tue,  1 Oct 2024 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771441; cv=fail; b=UG/KkYC4wpXeqaBOXIunNr6WQGA//FXHgro17E6xGNVnv/2BdrvTCS4Y6oLvGtpf883OKaNM4fFdU1pJVMNea3FEFp+KyBla9VS7zthCBF+IrHoYVQKPv8MQEPgPy05Ps7w1eYdc/i8OHXFxSpG0pYWl/mTd8KK9inqn8ccWW4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771441; c=relaxed/simple;
	bh=L27E+5NJrZeGKEK+TG0kc+DZDmSRKgQ6EbXCJ1jdqs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k4XT17RtlXZw2816J0QI/s8hRabcZu7GaPykvvvAithjEjNoWUk+pk4IOW4kRlGWBJHs8fDIYL0MPSrAtED1c7uXuCkK9oyVY7/AW3RVwwXiB9eQ6jEJJWpTdZIZil8KUUaKgBDBdrikZG5q0cH4+a5FWCfUXt0aRXUzylY9hk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=UcmzWGqy; arc=fail smtp.client-ip=40.107.220.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7LzN5W+ZGUiOUKm6UWFh4pCf7/OLhyAtQ8+4o9bl2NfnDr24Eg4EO4jrGaAIyBm6hF9V5DEimXVY5jCB7RUZKOkY7N7QQ4kO5asH2/c13sVF2qGPyJJADfBsr5M8NjJl8yXzSJlhwv/7aBok6xq/lc2iJhBid47nOerKeZtFW7UdzRcWxGWljD5MFjPsHTkuGSkH/bd78GEZKkfL1O1xY4gIDXayl+OEKpiwCouHAMek90Wf6mOFRH/a4GetOxuqeomj+oeVRHK5b+Na7RsLwSICsUdIfJor+1uL1n9wJemm1FUBBNm4C5O2zCGOv+hzy+x1vYGM6feSqpnT6UGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4VOCKpvPHIR4tD1hKqY4N1OWg7ujgiN9eGJ/RyQhAw=;
 b=K1waiCe+DHhh3067V9riVC18TuPJ1VAGeH0pU6HhiJHbj+i4O6nAyuptVRK13w9o0CkqGAkbsQ6U7CoWHXl2TpAjcqnLC0dHZmPtxK1MTXdEY8HrDV1jRzNTpwmLiFihCsQPdZAn34Rw78cPlFQInYcWrnXhh8tAynRySuN/JPspvMT/gxMgHj4q9YWgz51W8/nNMcHlyUyIMigrCKPETrH+dC87g0FGyW0foT15p6uLKljEHJypTn11lBLz7jWdVR/MesrbSZ65k/XhhCFAMWHRI5GyWFzWBLjPyUTSB019qioawyZyKwZgnKb0ZmJxddNRHCV7NwplH8So9xDyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4VOCKpvPHIR4tD1hKqY4N1OWg7ujgiN9eGJ/RyQhAw=;
 b=UcmzWGqyC4mMQLpTBrgEI3jGyDawWx9xkW9lJ8rfmLUAPU7QmLVkE/MzyY2+WNZj2nwnS2U+/YmQah2+DnWLEYmFsH18rcNbT8yyt5Hc4iktDO3E8Ton3ZjVkp6EHpC50VgmcuV7qO89lT80jclg/uL4jZMtdJXkCOGUf84+bIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by SA3PR14MB6462.namprd14.prod.outlook.com (2603:10b6:806:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:30:39 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 08:30:39 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Morgan Chang <morgan.chang@kneron.us>,
	mvp.kutali@gmail.com,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk freq optimized
Date: Tue,  1 Oct 2024 16:29:33 +0800
Message-ID: <20241001082937.680372-2-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001082937.680372-1-michael.wu@kneron.us>
References: <20241001082937.680372-1-michael.wu@kneron.us>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::18) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|SA3PR14MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f567e2-9278-4537-0a93-08dce1f35442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|80162021|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bXJ3VlsbAkcC3rSVyuCoxkB51KpdAmv1Yr64tUL8oymPMnA/9dtKaUxwI9p4?=
 =?us-ascii?Q?HLJv17Un+AoRTb6+BpSEXzOJdEY5rgYPVm+lvV6l+1afkgRq4Mw8B7wIB7ha?=
 =?us-ascii?Q?80JqSYdRmF/uZmrUR4jCKfW0Bv432iSmXzvzxTJUAKoiN4ht7C467E/ZTv9X?=
 =?us-ascii?Q?p8TBKPzOGLC90vtBfp3KxgSM5CXRLlbNz4pGAK0izYlfnwKZLqNrkb8VULpd?=
 =?us-ascii?Q?Cd5jxGlgk/xdT5LwQB6CPPWEz2ha6orO+dueNYTH+v8//zOZKNdDFTQ44/+E?=
 =?us-ascii?Q?xS+WWB6yQuHJRv4WS9ZCYZ+kWF4yAcMIETCCGcaNohzo9CgkeGdhBt/0pV/x?=
 =?us-ascii?Q?6FvfUBDxigR6BuwgFK+sXN//wri7nLs7D6X4VDGaLi5SRk39AAuQE+UGGOlN?=
 =?us-ascii?Q?ouVgrpaDp3k0VlkHxcmy4MyHrQ5z8DIOAXfQCxuJDDSJEAr10dGITyhkummi?=
 =?us-ascii?Q?OUc+ZuEziwzTUMhyf/J7DlAbUCr+dp4Zs6StxvIRvW9GepVeUOCT6oUAJtxI?=
 =?us-ascii?Q?aiJqySNFzSHB/cmKXw0ifdlVEBaKrvuVSgfjb/aE3s18GrhP5Kwl02z3onWj?=
 =?us-ascii?Q?I+9f6ZXJ3XGGDcjWXIkKn0sn2VjA4O8+hFPoyb5Y5tseFgC2gJmLxZ2aeaKc?=
 =?us-ascii?Q?eFTuKI8dNRb6hsRbQ6cuBSdIubH2JRCKFPGebWlkOxgS65g+vufvbS4dEEKA?=
 =?us-ascii?Q?2W7TK1oAN9jOB86hyE6uJTTc9zXXHSu1uXtYTGB3n1UqGXJDdDFFO/TBOaCb?=
 =?us-ascii?Q?sXihtPUOw2hSGjsXEUSRmGew1CI7FWQ96biMXVGR/h14oEWmPhabIJMsyDsI?=
 =?us-ascii?Q?aaayiBumspWt7rUD9v6TXOPmRtF7vMQpK6bM90xYp+iUJxY99ACq2XeLSKb7?=
 =?us-ascii?Q?GRay2Lukq8Qu/KlUHh2eYY1UrraLCAFTVRcQaoY1XUjvNbjXYR3B9jcgLfBj?=
 =?us-ascii?Q?iMFpkqVTlTyrGCVULk1e9NED2SNGeUUbtQHCGZZe+uO3/vIPsIFf8+mpJMo+?=
 =?us-ascii?Q?4YRWQ3K3c17M6E8p+W3EJ7ssPfqhDZc5RFRukRRH6EFn5n5q0k5afOANFPAl?=
 =?us-ascii?Q?c1iI3UV7uL/jHKAVzPX6mFwjvlEa/luDn5yb+RnG9lVK+YfMZ2D+MUtp5eZ2?=
 =?us-ascii?Q?icDphw+QNXXoZZxz+qtK/a2lnoc5ZgdRsdZMMYtXOgw9duM/CKWVWawLxear?=
 =?us-ascii?Q?IE8wRh6r/8e0y3zi2hQJhyemJ7cU39a9msmHNZ7nafREydxL+MeO+b127sJi?=
 =?us-ascii?Q?b6JbnGu0MhBxTCrvChiZRaHP99J6gxkZQEORRU7KxoxsviF3l6asf+IMymVB?=
 =?us-ascii?Q?Axy4Ssa31wPzm7+bXM7mI4aQU2uPxHtt95R2c6LPPdL0cISrBidfQXwtkZjH?=
 =?us-ascii?Q?aWPHCjMjcpWrSy1PIhjeOESXHRUezX/9arWz8tUidb1egpoPvYTMHOULOMlb?=
 =?us-ascii?Q?xLmKLzeFSUWYyz+RNMCD/3YQfTiFSIdD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(80162021)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6mQtXIP05SiKWzUzxb6UQoc7uMa8cyrnz0oq1VYr4dXo+hBiomeVucu3efL9?=
 =?us-ascii?Q?5NKVodu71AbO5cwAYhhI/uFxlmNJHk74N5oR50uaUJrqAWhxMjD54yugPrfE?=
 =?us-ascii?Q?LrmWjWW38iOqot75nrBXPXS08UlrJhdZ+ArlXgL4oK3WdLpDtPqgGNb8CmMW?=
 =?us-ascii?Q?DLNRTV4RbquAFRS8Im1VoYvxbJsxVZPzC+wPPvBO1xV7NFvZrNwzYeV4yxOQ?=
 =?us-ascii?Q?feNztpdlef49xufYqwtvke1JwfPEdRRSxF15xbPUtpGsgjZFzTQObyvm2NP8?=
 =?us-ascii?Q?xMk2EvBhNs/nCxerShEz3U2qnAQF0rdPCdCyWrgNWLkiwV0+zOfIqK6yaoQH?=
 =?us-ascii?Q?GKvDB/uHK0g8Zp1atonKwGwF7MPdfM48DZBXdtCSGWYusFW3GbcJ6S50MF1m?=
 =?us-ascii?Q?iuFyWBOhj8pCYJAgjNoxZWLnP6W4ueJZvfU1K2sTQFoeY9gpJGJnFrBNaUqN?=
 =?us-ascii?Q?GahZ5Oc1jLcYbfED0HNMyz04fLekqHQC7vn3ysDfhuU0rGOFeZRrRHCWPBqd?=
 =?us-ascii?Q?qqLhtk2QiMrl63kKYoA8GDmn3N+qney6xqV7L+r+B+WeK1Q4EtKUkkG3W00h?=
 =?us-ascii?Q?YC5X3lIK2MMjG6IBuYH3gLJaWiqtYAdVkkv9Anvv4pw9CV+uuapMO9azdCQv?=
 =?us-ascii?Q?NObe0X9ZWuC1dhVw5ERhVnu66d0pEm5KtINNb+uIlKHl/y8rrO6UAoEBUtgx?=
 =?us-ascii?Q?6c5pOt4GBXLYS7bgQTEL1pm+9f3dIKCmWVW2VhkA8W99ykOATruSdhIDrcV7?=
 =?us-ascii?Q?76zGv2ZiKtRHUM3ErzRXHvnx50xGwRs3nOrDPN06OZoDxnlt3tWrpXnFg4wA?=
 =?us-ascii?Q?OoxyVSyUhtVwStb2TUavPyZjTu8qWY3UMIHB3ByZ6GTc0VcM2sF1xoIngLjN?=
 =?us-ascii?Q?LHKUfybVOQC5HVM8POOkg/iq7k6fk/DaiyKOmAuV90jtWZ+TnS2m77UYmt7m?=
 =?us-ascii?Q?f1kwFTlvRsCqJhVB6pGADkACi6/T/hvxtIo7iyTfmkdtj88iZDYiQ/7OdQHT?=
 =?us-ascii?Q?hQ/e4D0fTiuU7I6U2/imADt6d7fgOqpJjgV/ffuEZxLc06h1PqQxrgxWFGcF?=
 =?us-ascii?Q?KHxGyt97W9Dj8rQ0zRRIsZXF1V6qrG3sqVptJm/l72ZHB3DLEWnNx3EcHeMo?=
 =?us-ascii?Q?h1FXI8hg2cjF3vwEhLD8+8RuGpZu/4VcGWSheMDYloUcWiLz8BkFDmXJ5d8e?=
 =?us-ascii?Q?Ssc31IAwGE5/zGpbHKXWMb/Ev6DBzDulj+qg5gckWw8WqOCUVN92Y7VU1/rY?=
 =?us-ascii?Q?HBSesZgw1ynnWczQ/CWsSUPw+l1RMxweg71hurt+ZxYPHR+1xmMA1Zxq+uDO?=
 =?us-ascii?Q?mxSsPDIKkxbA4uEcaH7KmVGELW7TVnDLVowcTZJdvrF8riWhm6d0F2G7SGmo?=
 =?us-ascii?Q?Ha9HZFgzk2KMiDMBFsecqcr/gAfZW6+kQJGC3yG2126wUg1pEoMHdf+ih/kF?=
 =?us-ascii?Q?g4H5OmKvAfm9Y5yumCDCaqlHVRGKWo8hELWVpITgPjV89qsMWw7L57asMXEr?=
 =?us-ascii?Q?Pkz4Cqk2PLKUewqKc+wSbIVduFW4CsDe918pfrG9gtgj4rbfmHdwpnBmJW35?=
 =?us-ascii?Q?3onAY8OzEbYpo1ipfL7MzVW5iZcmmrf8bOlt0p88?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f567e2-9278-4537-0a93-08dce1f35442
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:30:38.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RArDOpaA2slth/fQYkXgDqdfaijI2I9iOfv2lXf2B0nag/BJU9Zja01D/miKWwQ3GUsW75bF1bobkLOFMOLjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR14MB6462

Since there are no registers controlling the hardware parameters
IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
declared in the device tree.

snps,bus-capacitance-pf indicates the bus capacitance in picofarads (pF).
It affects the high and low pulse width of SCL line in high speed mode.
The legal values for this property are 100 and 400 only, and default
value is 100. This property corresponds to IC_CAP_LOADING.

snps,clk-freq-optimized indicates whether the hardware input clock
frequency is reduced by reducing the internal latency. This property
corresponds to IC_CLK_FREQ_OPTIMIZATION.

The driver can calculate hs_hcnt and hs_lcnt appropriate for the hardware
based on these two properties.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 .../bindings/i2c/snps,designware-i2c.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 60035a787e5c..c373f3acd34b 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -97,6 +97,21 @@ properties:
       - const: tx
       - const: rx
 
+  snps,bus-capacitance-pf:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      This property indicates the bus capacitance in picofarads (pF).
+      This value is used to compute the tHIGH and tLOW periods for high speed
+      mode.
+    default: 100
+
+  snps,clk-freq-optimized:
+    description: >
+      This property indicates whether the hardware input clock frequency is
+      reduced by reducing the internal latency. This value is used to compute
+      the tHIGH and tLOW periods for high speed mode.
+    type: boolean
+
 unevaluatedProperties: false
 
 required:
@@ -146,4 +161,13 @@ examples:
       interrupts = <8>;
       clocks = <&ahb_clk>;
     };
+  - |
+    i2c@c5000000 {
+      compatible = "snps,designware-i2c";
+      reg = <0xc5000000 0x1000>;
+      interrupts = <37 1>;
+      clock-frequency = <400000>;
+      snps,bus-capacitance-pf = <400>;
+      snps,clk-freq-optimized;
+    };
 ...
-- 
2.43.0


