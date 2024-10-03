Return-Path: <linux-i2c+bounces-7201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E498EDC6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 13:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C45F1C21E12
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 11:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB5A15534D;
	Thu,  3 Oct 2024 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="jGTJoyH/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2105.outbound.protection.outlook.com [40.107.100.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D155155308;
	Thu,  3 Oct 2024 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954157; cv=fail; b=hWCPDOxxwdFJn2rtnKq4RJTAwfK4yMXg8xPOgyqQh8hs3HKnOWqM2HXI42zm4Ux8EKsbi09L8O++GAUjixIx08tlPFtVrR4OOQSN6NxpPFWQ6SJe38p198At86td4mB8Lu587DfAG8Hcus4Q+FHLFW9rRMZ1bC8LFUdGwKLmwhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954157; c=relaxed/simple;
	bh=d2vixa3g4WgxDsP8i9IYDyMsXanIjlNNOnLXzj8eLnc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c2nsfmnJjWgKR3YkhUBVtky6q2C/rx96XXXOJrRXbJZw6pso4e94RwWGVZR8NQeXbffOQE3iVPtZoCYVQ/tbPPLStN8uzDAkAO7r2402BlLfEloiz0Y3n3xAiCWs2qpPaqRYO5VkTyk01vwqXex+ZH+ue0m2pbH7ktxkCeZnhe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=jGTJoyH/; arc=fail smtp.client-ip=40.107.100.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n14arojPfeobC3N0QWvyj9drG1bbmSP/1ZTcD0pONwk50E43vDmGynljKC2E9+kKTQBbBej8jccfJFwEvvnZHK1f+ZWsPNnJy6yvyR0oWg9pfSsHOATcPmNcdpSDq1sVoWUnjG6AP4t2l5mt43JOiH6Tpy0TxP0Hjndn7Oyx2cJSfZ3l5Mmsj6nf26Q89LWHcKxrJVKKIxXFinmrNqqsXYBQknKwVXlfsQBVJDj4tJCGowHAYkQQi+cCe3j8SlTtquCUOWylFTP3MpImkL0T4E8KzfDuQ/ipxOqCec2K4lk3qQ7kpfZ0IVlmVk8hlXmPwVHB6X62WvFbQxuTesNqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO/5pLSubMCFQ0r/Pps5HDHhhuaXuNTNlX8DAQzUcfo=;
 b=wl73gOrwWOzpstvHYFLNMJmVWEFUVtW0apxv8HbeSarRNAqb7SaE+k1taKMlRw58JGTNZl8FNEVlCuzf/j3eNpJ2cNTy6szLRn6pHd8N9VJ5YueDAmCA5cVZSJWDaCcTbebAmFaPM5Za/4YI/nTs6BQ3n7n1EUcg7I67CA+hhttaeusPWeH+WlOR5ETbgqJXar5Z+gB3H4nHwaVxR3cOuG+tGzFAZoLiSxBx/7UIyHGm8mcC6/qQfjc9RZgsShX3QyPs8F9wlszf/nOis8CSJSxfY5QzAqolD+laBRThO/vGQFsn8J57VDjgR+RVs4Yq0dobz9rEARQ/BGRE6gfAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO/5pLSubMCFQ0r/Pps5HDHhhuaXuNTNlX8DAQzUcfo=;
 b=jGTJoyH/MO/n2n3ItuGJH9X4fH/8G54muxt8/81XR7g86MX4A6zZhBvxn/IZkpiR+SmVv0ZAOBAvPe44+7xbThu89b/arzRFiGyCQJWyz2M6QkdyxACLDdfz95v47FHCxb/0MGr7T4hnpybCUbzt1f7XxWbZZ3F1pfDpn8Bwd0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by BL0PR14MB3714.namprd14.prod.outlook.com (2603:10b6:208:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 11:15:53 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:15:53 +0000
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
Subject: [PATCH v4 0/2] Compute HS HCNT and LCNT based on HW parameters
Date: Thu,  3 Oct 2024 19:15:22 +0800
Message-ID: <20241003111525.779410-1-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::11) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|BL0PR14MB3714:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e08e8de-5968-4fb9-1861-08dce39cbe55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eiJdGX74407ZRYDz0ypnPflvkhGczxfQDLY+lMoR5A2z9+gLTYKSwVgAFj+r?=
 =?us-ascii?Q?+Qs1fvWML3BJsFDA1lHSiK0ADIEyGSt3aHH4eTyTXERyGGxeFmSIAtK5Amiq?=
 =?us-ascii?Q?6KehzHeDCR4rH1fcQINXzO3Ws0AEHIrlsw8QvTWaQRf12q7L9PCK0T6KRVzI?=
 =?us-ascii?Q?s4687PkxU/kyn2Ti6mEJE8tuHuTSdMXFrnwlHuXWZUxRdw4QPXEcKRD5Ok+V?=
 =?us-ascii?Q?WmdGZQKBRXw1Q8TQmggl6VXM+UWeXbDQaaHh4qNmPFFz+AJE+YQhUndt9H2c?=
 =?us-ascii?Q?RsiUwzNfLYvdSO2hXkxaSMcq/rsLRtetKbiwsE70hIVKUJ+u4GgRKolYxS+T?=
 =?us-ascii?Q?gP7jRIpws2/oPCKSGv8cDpZSa28ZL84nvnPBSuIQyC8S6Ff0Gez4RhHXG4An?=
 =?us-ascii?Q?u1LKbOYG7JdvJZ4TSQDFfGPZ0jlRUpykbaHeM53yoIlOicyR+lG5aRQ/a9va?=
 =?us-ascii?Q?oduB3u4cD3iS9TR4qXyZ1mONn8/Nh7ijXs66HbrHzoGG1yvrRWNVW2nBNzzS?=
 =?us-ascii?Q?HuK5fbgR0pUykowrgUly4lqGvyaizuU40iZzumd+9yXki3Q3/Ah9luFAWWJF?=
 =?us-ascii?Q?nmUi3d10ZfYW3ZQnhI/1ZjXvxCDK92wUiCyVO51WEZNP/nz6a70SbD1p0FRo?=
 =?us-ascii?Q?PvUpEU1bBA4nH/gbE9PEGyw7hAp+mBYv/ASmQkiKAuTBWKmGRtYCl9v1ZvZO?=
 =?us-ascii?Q?F18YY20sC6yI+Dg9dTBtPbPQpjo+o/4eCQ4rLRxa1MEWWOXWUE7wyNyZiYsf?=
 =?us-ascii?Q?MstgXdXHUywbz+HSTbIR28OObuOIGP+L+7yBcKM3gvKqm55mgJha0eF+AwzP?=
 =?us-ascii?Q?q8GpuQ9xXPR8rAuxWHOpo1856EW4CC3h5aBxt1X39H4QjrT92N1/ErcTcV4V?=
 =?us-ascii?Q?4QPAe/EaESgvw1mlFvtoPshUyYiaK7msuLRqaOaobOHnzoKcEJPWtPdVQPbZ?=
 =?us-ascii?Q?+h8f4lIMzR873otuk8W0dEtDrpM5aGDlJwh6kwKQ6fPEj/FEAZfYjDdfVHJ4?=
 =?us-ascii?Q?hVte0pek35uPyfcZHic1Thyub42pLCx+4o2k/JAOZe7nOt/MvalX+tyQ6oYz?=
 =?us-ascii?Q?Kg/D3OtSBqtiN/KvdmVIhQ1QdOaJ/WwbqJzqk9eZreR+Xfu1E/t6u8PLRRWt?=
 =?us-ascii?Q?zB80zLmtSdt8fI27C1Hyjc1KORGmf/ZlInwGivIaV2S4By9nQ4rv/VTWn96m?=
 =?us-ascii?Q?m3JEhQzhn1896cXOtIo7hmcvTJJO9evNVRHEVlchUzKRqWISYBNArMlGCzVZ?=
 =?us-ascii?Q?J5Iky7P14XTQUtTaTbUhLSxLichN3xQnqJGO+sBxZ+pmZY9NseiYC4rUKLXQ?=
 =?us-ascii?Q?sHuBo7qq/wycP7L8rwo2223T1ymT4BU/hAlbCAix9AzRCTZAy6Wb7P6MO0z7?=
 =?us-ascii?Q?gEsItQUEMVayptxJpxGh4auC5da+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FflTyRYBmeH6NRjnkvm6zdh63SnH2dGnKlEf8SZCXIN/zCw/OabvLDaHGts4?=
 =?us-ascii?Q?rD3JR0YmuQXbB2+OppuQtAzeG93mw1JVKZaD1UooI8sBC0Vl2x7ZMvCc/XLj?=
 =?us-ascii?Q?VMfOdz38owLbFpzoIOF7oC00FVCxWS8MbcdgYkMUwzPAvDxhryKcYNyBO49d?=
 =?us-ascii?Q?kx6bRDUYLsKgxbq96loy7hmaGFdkjC6mQBbEbrgzK6SUkyVhkqqDHGQ8WXvi?=
 =?us-ascii?Q?65xJtX/TwWSpfLfj7AQO3vZ6+PrWRjPy+maWzGZVaeLLBJO61Gt7Re/LsJTx?=
 =?us-ascii?Q?Braln5TdDGqUWS7E9yV1ywN+ckzYCNgRKaBB4ApFzkCVcv02elh9qhZA2801?=
 =?us-ascii?Q?h7wTzNkD/TZ0lYHpCqQl7JyQu2XOlDjCRkWG5jhSv9GF45okxFu54RrxDloX?=
 =?us-ascii?Q?v/5rFuArgwCO+NkF4mWz++BGQteit55rysx+SxRqJTkvxmsqLEp1eVa92Qky?=
 =?us-ascii?Q?cfls6/1eQY5kArqLT9FXwemvtHcx5GC0yjNEw2+Vfe7Yf7NdfOMqjGBVgvt/?=
 =?us-ascii?Q?Ew/A7h5KwTveO1GzpvMskszeICoDKjaqt6dJi9sp7xZ7gjbW9aOd+wWf8Kf/?=
 =?us-ascii?Q?lXu3turbyOrJp0kovYvceujjyNASzQtBKnvvG/X6tY/wHwupkAQP+gWWESRW?=
 =?us-ascii?Q?cze7oJMYWT2rq/s3L3kGMaXuhfxcUpICYV9OH1ZSQ2t/TOCjeqzaL2PGGqU6?=
 =?us-ascii?Q?fEI5P1kCQCJ/KcHMQecNSdz/6O4A4As/mX5FUvc2KESqA7cusVPWZBk7InW9?=
 =?us-ascii?Q?uHUQ63SOOMpEbczfXODvJttbbJEQkem6XHgviTAxZrQRBnASBzvPLX4D9r/N?=
 =?us-ascii?Q?J9CcTh1bRe4kMhOrRtBeAfZOYs3n9/GLBvIcprkPxN3nT7AKQMU+vbOyjmr8?=
 =?us-ascii?Q?dznF6BaF8Ugruwq1UH90GZXohLIRSBYeo7Tc3qUYehCzDwMn+XfEUHRg/kvO?=
 =?us-ascii?Q?K9QbGYXh2Aa0Hchnb6z1h+M970N1gFm5jvThVXSl/V2OFOFw/KBTIvBOos1Z?=
 =?us-ascii?Q?WpeuZMGdSOMS758Tdi/CrgGmEbFg1gx8aUgUdTlyXfEgj2qWHqQ3tZrT0Owy?=
 =?us-ascii?Q?PSAZO9Sd3zbK1rCF8G1agRlQ6YWGevxnC/fVOlzWWUKhjrCQC4DsQmR0VfKV?=
 =?us-ascii?Q?vC/wGaOo4YFjbHBqkkRxE9Jq+h49Gc6eKss+ttlSf4WzwoNf/64MhGFJJU/w?=
 =?us-ascii?Q?zkc8Y+MzMU/zXliJopoCMIVwv8/+yqm9KXdjvJALuq1HSHMa8TZ6WeQGOMMY?=
 =?us-ascii?Q?CmOiVRCye4WT435fe5LofY0fnbDThRWv9iGpO0BasB+zegKELnZcUOyYVnwG?=
 =?us-ascii?Q?yQL8AVz/okj2ZlT+cOu699Y8dD19OKJhX1OL+fJ0qV96QLtW0kLDYo9CtYzK?=
 =?us-ascii?Q?xJSDW37si4+LKnkj7kPZaVcRAfGhwTRsytSpMCr2RKvciS3QsK1eStKWwDyT?=
 =?us-ascii?Q?UhnCFT8tvo6eHtGK2W5HuQUZk1NKtxYRF/jF4CMXPQXVhr01jXoxM8aUdfaq?=
 =?us-ascii?Q?ijElj3aUFqE00aSid+vMerbjOCg1JkQQDu9/n1LEruwno7ZYCLps0czUkovb?=
 =?us-ascii?Q?lhyuxEs8lNIT1WtqIdE7fdzgz6MTGwjGTDShPWHT?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e08e8de-5968-4fb9-1861-08dce39cbe55
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:53.0296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTJfWuahdMUCOpneR7bkwY4Ljdj+AGXLIS66JvvoNa6m0c/66ya5M14pN12tiwv6L6DuP12rfQsy2DADhdYMMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR14MB3714

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
for High Speed Mode") the SCL high period count and low period count for
high speed mode are calculated based on fixed tHIGH = 160 and tLOW = 120.
However, the set of two fixed values is only applicable to the combination
of hardware parameters IC_CAP_LOADING is 400 and IC_CLK_FREQ_OPTIMIZATION
is true. Outside of this combination, the SCL frequency may not reach
3.4 MHz because the fixed tHIGH and tLOW are not small enough.

Since there are no any registers controlling these two hardware parameters,
their values can only be declared through the device tree.

v4:
- yaml: re-formatting two properties' description
- yaml: enumeriate bus-capacitance-pf
- yaml: extand an existing example
- driver: modify the commit description
- driver: rename "bus-capacitance-pf" to "bus-capacitance-pF"

v3:
- add vendor prefix on new property name
- read new properties in i2c_dw_fw_parse_and_configure() directly
- in i2c_dw_set_timings_master() check dev->bus_capacitance_pf and then decide
  t_high and t_low

v2:
- provide more hardware information in dt-bindings
- rename "bus-loading" to "bus-capacitance-pf"
- call new i2c_dw_fw_parse_hw_params() in i2c_dw_fw_parse_and_configure() to
  parse hardware parameters from the device tree.

Michael Wu (2):
  dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk
    freq optimized
  i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters

 .../bindings/i2c/snps,designware-i2c.yaml     | 18 +++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c    |  5 ++++
 drivers/i2c/busses/i2c-designware-core.h      |  6 +++++
 drivers/i2c/busses/i2c-designware-master.c    | 23 +++++++++++++++++--
 4 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.43.0


