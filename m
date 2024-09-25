Return-Path: <linux-i2c+bounces-6974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3898550A
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB33F1F21059
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E799E15CD42;
	Wed, 25 Sep 2024 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="JHUMMOT2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2103.outbound.protection.outlook.com [40.107.92.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2515C131;
	Wed, 25 Sep 2024 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251497; cv=fail; b=b0EXNUd96bQ9vo6NNkfN1A/FhOdTlp1FtGziqvx0w5w3v8dLLyMh/x1QMvLTa5zTwl/D3S/RPEHzwEEJjbfjwBtjedN+Z2mUwHb7CJXozAHP1xQi7tWn9O7Pdy5B8BY0ZMDIDHVOkD9JcguLHQ/2rvPctcXpvt1K+4GrxCMVrFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251497; c=relaxed/simple;
	bh=09KeYWbDKiHO4/wxPYTeh6VRxir/sUs+bBB1+6YNsPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k9ApwGdnLlnTvyzdBBbbCD+pyZv2YJenHy8pg19Z/gmHtx6qnzyyMtZK51YXx7LLQjDqYnWnsH/UfgfOI//kB+PwjpFV3Bm0CfzRbotYsLALbBOnn7QS6rt1N07ESRyI3OJQcH86xcjOfJ0yq4ceZ5S7v5jM7/rVuYTv0+hJUjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=JHUMMOT2; arc=fail smtp.client-ip=40.107.92.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNTDEKMKuZCBpJFaHRKdasL6d5oUHnfmxuFYImJiEg+IT03/oScaemoVPk40BuL2vjzQi86g12wvGd5hitrO2kbfNGVHu+Yfgk3k2I5OvBkC1lXRFLf76R5d8Q1cDa69lQejopQBS58I75pdVNCyn0j3aD9lRF0zms2BzAQnrnLjC0jraOr3Etp8dktE0EZMtEY64NQ2Y+y+WnSh+kZ4WD1jg4RHnDebMW/jXaRoPvgx8DZaYRJR0pZm0OojTYmo56hRlLkLU6ZAgKZHHw0uZkPJ+b/dcj4pEFYdVsMq+qcHaQG0Vs/dXp8FlG34yCkc2K2gmfeYzUFUjYTvYhDUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu1IlZSGYKMCi9HZxVx35VHlH5Y7Nyg5Jzhl1c5Ddds=;
 b=pL0ou8j1C1jfFv5CwincH3MjxGJlHCxKtCvo81FDb3xqkv1EyYzV0N5Xldulaw4GoDgUgDZrlAE4ydm+EzutFqZM5i2wPEsjU35myarTO7ENhGGIZUCtHo8WQrDQTZ0+d5A74ezOrmAudx73F6J8Ai7MY/mCXEcIfZKbOlOp4b1TftuNmIbrE7pkQY1n6gWyWH/Ak3OnOQGqjluH2fpZ8XspIsEEBHLl9mC8oIrnEyB1/QmuQ3V+omrqCnW15erE3+mi164d/4yMFjEvAGbK660AKfCwLtvo7BPbrAvOnt1RzvRi4fV35Yw4FkQvT1ApElDfRsrMCCJV0ONe2cr3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu1IlZSGYKMCi9HZxVx35VHlH5Y7Nyg5Jzhl1c5Ddds=;
 b=JHUMMOT2Is2XPkDg0baiT539IpMhE6T3uXzuQuqpZO6awfLwt8O/MHB15Faho6fpYMZ49hdz88Cier4XDcGgQ0A4JxSAi3yH7GmAAG7X6tK8Y/zJmANHdGgx+KyuTMT/6Rai1XEVFydRIwJqRQLRPHtkcJ4Cr4V+rhOZVN+/cfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by PH8PR14MB7109.namprd14.prod.outlook.com (2603:10b6:510:254::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 08:04:54 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 08:04:54 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>,
	linux-kernel@vger.kernel.org,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH 2/2] dt-bindings: i2c: snps,designware-i2c: add bus-loading and clk-freq-optimized
Date: Wed, 25 Sep 2024 16:04:31 +0800
Message-ID: <20240925080432.186408-3-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925080432.186408-1-michael.wu@kneron.us>
References: <20240925080432.186408-1-michael.wu@kneron.us>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|PH8PR14MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1536a015-c219-4f9b-c1ac-08dcdd38bcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pwiQtgvqTyjlE5dgMlukPjFagFamprp0AE2Iyzycz7e0YzGZNV09YKKsDnD5?=
 =?us-ascii?Q?lGslFj0KPWo+Z4ZDpm9IdOY7oSYX2mLLDwSDNY2OJawR9DIAYhy9sl4xCwPP?=
 =?us-ascii?Q?Gphk98ZB/nx9pDQdQT9A3HEuNLDzZBi52xXLhYfXrVl2X0BJ+mTXg0ulF7mp?=
 =?us-ascii?Q?glVpXsAgfyBDtDOAFo/awoSsFXUeK9g444qXmJH1jBDgX/BpHePTQhjC+Mcy?=
 =?us-ascii?Q?uN+87GrU5XVjfkMavD54slQFHEZhluaCVVQiK7BpyG1pPWTBRif8XYlkN7aq?=
 =?us-ascii?Q?Zzv9jjc5vC5AkF+uVqkqXIGUQE+/96rZ/yqTNNUvo4AwwU63rYAgSlVDAoOD?=
 =?us-ascii?Q?NHBYmddkru/Def+J8HXO3jnXb3psj93Cz6LztDjwzb/xxj61vVF7UIbL80bD?=
 =?us-ascii?Q?VB8tVPcAoI4iUC606iZKdpx72aoIeFXSJB/FSZMp1nzwSkaBPGWJ3TybYT44?=
 =?us-ascii?Q?rUXHsTNLkyqUlKALvqASWXXRUr5yZgN7rUmozYkMLLDDeelS4QLXv7M55zJr?=
 =?us-ascii?Q?IRy6WBff//7eRtbHbaGUBA69V43YZI5msPwZeOJBlvYbRlu6A1lXXN6tsMLQ?=
 =?us-ascii?Q?hWGQUrtTEpIalN1F4s4rykwaobyJrz8slPz3TzlxdpvJzya2yjDLDk+FjmbX?=
 =?us-ascii?Q?2FtbHeXlnqpPTZXB422zKxC6z0cMaNwBziXusQSpHjcuCP1/nivHvH7UzPYh?=
 =?us-ascii?Q?9+HektOLP75a5t4z7Igf95xzV49jWcB8GsBXaOSuKsUlVdcIepyy5s77lEMj?=
 =?us-ascii?Q?g1+etb7rz9pvINoJSe3+PhKc9sb+GzstE8am/eo13d2UQZ2DoJYtUJvO451b?=
 =?us-ascii?Q?2Hk/H5DGQqSDKdxGZ2If2mThj/tViJyidg1tdxxyxw7+rcje5YfBj82LSUB6?=
 =?us-ascii?Q?MUvpwUfi+qKvwdqsM0W1L9SyY+TJjQZ+Lmvj7h5OzLYxrG8b8+0oZBluV64l?=
 =?us-ascii?Q?k4246mMyYqT8zZaXhNYCBOWXPfP0CmJ4b0VQUatYoi8NhhmUOGOKdqlbXt+M?=
 =?us-ascii?Q?Clwn8DLEI+Ojwcp+XPt0rPWalljmq9qfUH1S5ouyk9saYVDu3Xvt37/1YCOy?=
 =?us-ascii?Q?v/jcJMIWCho7tZBhIfjcAQSW5x8hqmqzGCqAJjevXXy0K5ZbQ5kZj31m9hil?=
 =?us-ascii?Q?6oyLCokUvaalQwcZCUzTAwB6E7AkfxrN6/EbKZ23TzAh9v7a2qlZKvGGwxkk?=
 =?us-ascii?Q?b6KcCzhMDFkObpfEHAuRxl4mA7HxkFMv5xLMGLMMMRH5mgUWQawE2+MiNTjw?=
 =?us-ascii?Q?TrqgEnzexm6OHmX0mJaTU/PMGmhRGVEui1gHT2XyabNhucG7B599PUqlh4ON?=
 =?us-ascii?Q?V39N8NeE08NRFI1FeL8O9jkMOYyh6TccNXDlGN6dtSgYbGUiBoDG9NRA7fhn?=
 =?us-ascii?Q?IMyRGVWGvA7bs/v7HN2VCWtxEJ5vmteDvYc1mvYjmoMGxLQKSsZLyB75/1Y2?=
 =?us-ascii?Q?UKBtM28qhw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcxUoTxlQvQael89LJZ5tbMGO+Y6y3JORViE8sDAOdtGB+XPtqa/3SRwbZm3?=
 =?us-ascii?Q?E7oAwGDcVbb65Q7EmtAiwae7S6PjxNQ4JxCGzhZPvqTHElke2BY/CkuJ87jd?=
 =?us-ascii?Q?BBk7Dj8fwmiFifYAscOcre4CAziFeZkMfgNcYibd4nY6QBrY+1uiTvLCtZcv?=
 =?us-ascii?Q?xIB2IIW9WVdc9OE+N7Kit85y89bnLISsI0NRvVkEDr3QbDIcCJqdk02GO2bL?=
 =?us-ascii?Q?pTMtDTwxym2mVgryROAaHR5f0l7qII9YTBmLn4muKzJkuABcYdzqGyovW9oA?=
 =?us-ascii?Q?WNmy9VPrn8giiohbBXXpyV+i3hu/19jpODQXSI69C6QIbQPfSgzL8nxBX6Us?=
 =?us-ascii?Q?227DHDzFT5jIqFwiHVK9AiQDLOQTnOc85+y9/zI1R4vNbMAl0pDnQy8S0MPK?=
 =?us-ascii?Q?q6hE2VY1+WOOdzRf6LalyefAG1IrBAelv+LPijf0g/6sHvlMYB3cCSjyNcHV?=
 =?us-ascii?Q?uHfCN0d+gqcJvOJqIAThkDCov7CYNHPOiHtY9jWQ6woln1m45w+w4hVgWzNM?=
 =?us-ascii?Q?IVoSnSsLgyAFTJmlwAbhu99SPA2AurH8PU4KoQALx6P5zARiTMbpEk5kLguy?=
 =?us-ascii?Q?Bf1SgUKbfERI4WXQifEuU8SpqarILckekv4vew4noWNar9Ww3ZMeKvspgU8h?=
 =?us-ascii?Q?HV37LBAShpcf3LztHuCUpnsVlHAifBKrxhfZQOhoD08chvcsLm/Hk216NSDH?=
 =?us-ascii?Q?gWwKymBfNP+S47rBOy4/kAQFnRWKPnOKMrA3vx3+zKK6101BAchupneZLSwO?=
 =?us-ascii?Q?KqsgoRJGXc4Rz3i8cm6jUrSWB8Mk0rXXN7A8VZ5ZpA8QNB6VdbQZ155TUqdB?=
 =?us-ascii?Q?DTPRsjyu/9n14pLpHDp73gDmShLzc0B7J8jtQjnzfc0MnIgFXmB5MvFkdSAp?=
 =?us-ascii?Q?JS5w/i3O5EYvirepFr5XSHWgr7eMNY2/NRBIB6hrVVpuNbThGC4jCwtk6Qoc?=
 =?us-ascii?Q?/UXTvDYQPWEONl6ztEmOkGbaOZOuSSofp2w80VJVmSLEfX29B3MnE70GxzaN?=
 =?us-ascii?Q?hEnYutLAFYlvXGauVIYxvnrlaiNjybm+boyynx8rp/Yq8Jxl4R6I7kGkCmNi?=
 =?us-ascii?Q?0NMcPtPLfbhoqK/e8FLqunxvl5F+7s74mUSzSODr+rZIGJSoIfeLdZy6grSB?=
 =?us-ascii?Q?2LS39gnMVPBFVywCGnoepMaSsTZDbSMAnM0mEdsk2vHUcQ2iKbUTU/E4ko7C?=
 =?us-ascii?Q?gh1qo/qWwHRYX9Vset/QcggxyARCoLNYtOe1j9fTZEBL6+VJG9nd9MHTY95S?=
 =?us-ascii?Q?E08vOHOESzMTUdH3tIs10JxwR+M1hPVuTUrRil0uE1tUd5PO8n3YeEoq5FPh?=
 =?us-ascii?Q?u87R7fQygB8aQ0ci+4V0ppruOggQTQVqXjSZEhcLEi4ZGuZ71nqAmK/eUnWK?=
 =?us-ascii?Q?iJC1AsY2Hh0Dj8H7t9EDwmMEl6biKwrNPm3fo1FbuCZTlrH5YU0QAlyFJEfY?=
 =?us-ascii?Q?sD+JbvSIfVvVy0GIRY12Pcbjv4SFD6gV/Oc4jLEEXVZ627qk4vYyi0g9ugGQ?=
 =?us-ascii?Q?C+0egvVgU0xdd4vweAycMuAeDwUTSppVdGMb9BiUToHJjNncmNOc08uJh8de?=
 =?us-ascii?Q?Y8ztQww4agtOGsiKDWcO1PbYuGmHohe8tM+apZ9R?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 1536a015-c219-4f9b-c1ac-08dcdd38bcfa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 08:04:54.0065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRXRnBcL/JsxmkZCVNkS2IvHefvTWpfnBed0tP2+dAGccYI36i4/9hRn/cloewz1AZBgVs6xR7pSkcaXMkpk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR14MB7109

Since there are no registers controlling the hardware parameters
IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
noted in the device tree.

"bus-loading" is used to declare the value of IC_CAP_LOADING, and
"clk-freq-optimized" is used to declare IC_CLK_FREQ_OPTIMIZATION = 1.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 .../bindings/i2c/snps,designware-i2c.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 60035a787e5c..f954f5014a00 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -87,6 +87,16 @@ properties:
       This value is used to compute the tHIGH period.
     default: 300
 
+  bus-loading:
+    description: |
+      This property should be 100 or 400 for high speed mode.
+      This value is used to compute the tHIGH period and the tLOW period.
+    default: 100
+
+  clk_freq_optimized:
+    description: |
+      Thie property is used to declare whether the internal latency is reduced.
+
   dmas:
     items:
       - description: TX DMA Channel
@@ -146,4 +156,13 @@ examples:
       interrupts = <8>;
       clocks = <&ahb_clk>;
     };
+  - |
+    i2c@ce500000 {
+      compatible = "snps,designware-i2c";
+      reg = <0xce500000 0x1000>;
+      interrupts = <37 1>;
+      clock-frequency = <3400000>;
+      bus-loading = <400>;
+      clk-freq-optimized;
+    };
 ...
-- 
2.43.0


