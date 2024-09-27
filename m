Return-Path: <linux-i2c+bounces-7040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF488987DD7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 07:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8FCF1C2281E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 05:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF799175D54;
	Fri, 27 Sep 2024 05:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="A1W56Db9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2094.outbound.protection.outlook.com [40.107.237.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D22170836;
	Fri, 27 Sep 2024 05:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414711; cv=fail; b=qEdbdkKuxnRNVrCMd/RsB0DxQajNLNUo4RDOOGlh15aklsf51/JPFO3GG8mm/znQ2cdok4su4ydrXXGIwmIQMhXOg2/sCtCZnaHKTFumSuA6zfsa3kicps4WGHJztjt2vGAZIkjKaCujNij22L8StC346jd+wbjlenhm86v2gWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414711; c=relaxed/simple;
	bh=5ekITy4Ofip2Xj/exR4ZlKCvGt8huJq6VWCdGxO1MfU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BdmFqal+d57KPM4E1CdRp0PsJX6tn0YBjpCUK+Bat645WdjTG216kH9xY5EiXVzvJ33BLn0xhA8UxlvY53UAzRY8pgiiAfLg6NRWiYwYsWgEJksAzTBCMSC/5CIXrFhqQSKXenr2hzMUMSfyGWL5wBcpfBqUu+peXln5uT76fps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=A1W56Db9; arc=fail smtp.client-ip=40.107.237.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAjkQoeQ5mG73uNjDWpF75Po2U9FIqyWCEoHXcFNC3eofNJqyqNd2IXnKU77d2KBra4GSbqH5V0lK5nxoHFICAHiW7MCBvG9W5Os6a0CMk2pZS/a/e14cmcAXjjFTBBjbBNmBT37FnvEeSKzvLOlR4X3KlofV2xHRJI60BUP/tyzPBEJp+TvZ37wjS7KreHYKbn9E4mFVf8nG4mdziu0pSICxDQ80q+Cs5coWgROUDIWgucUBO7uADVZNvIXXjE8jDHbPLReub2DnCHm9rpAp1Ivs/RUHRd3o0QZ7NMJdY5JCxeRKc9sGtr7wiLg8FoOSTMyWrpDcctwe91jNAQxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBT8G3MnDtY3w5AoGkKsYicm6VAsPn+OT8Ddcnky3Wo=;
 b=nM4A07MLa2lrJsMCa/ysfR2YqLqh1xD5DANpAQ8sehCSaVsd2gOUJ72zsuggt26MgjqU42/6uT+cXJUMYU1i/f5F9c3+wzI6s49hsL0ZNPR6JGdWWO82WGvCuHIC6G2XO33T1demiVtmIEs438FwqCcsIKiGclh6A9CuM3eKYtqSlKweOyXgbbfReREBsTZ8e4A2kyc+jB+LeqaqLdCYeOMKs32maANglf4lR9pMhWEuJI1H7kLp6gIz+sIec8CvLE9lG9oNA9vRFvSm9r50aYdHhuuNNbLvB9NHnU+2EnQ9ueipFPfzI8g9IQZCbxS6yL3uqFVb0PbhhYh+Z4Ev+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBT8G3MnDtY3w5AoGkKsYicm6VAsPn+OT8Ddcnky3Wo=;
 b=A1W56Db9EpQPEHUQHeZ9I5TnA5d+ywlmfV8Inz0RmoDfxaQ4XZsxfQNA18WpGed+i7ciz3esCDbvOVco+DVvZ7yWnKwTYkN/P7HUzTUjrb6A8EhHbjZNY7RHa4bP7NV2LMn4bOjRA4HRDe+UtQi0JlhsjT+VhkMOSOHH32XZ+/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by DM4PR14MB5526.namprd14.prod.outlook.com (2603:10b6:8:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 05:25:05 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 05:25:05 +0000
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
Subject: [PATCH v2 0/2] Compute HS HCNT and LCNT based on HW parameters
Date: Fri, 27 Sep 2024 12:22:15 +0800
Message-ID: <20240927042230.277144-1-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|DM4PR14MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: e925a85f-3cb8-4603-3f46-08dcdeb4be4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|80162021|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJ2USWWj7oNg7iuCYdqEh2bWw84+xjG0Cc/yGWvkmnVrdVYnf+ZfhRGEYlLJ?=
 =?us-ascii?Q?Z0cP78ij0gUn5jyWJIhG3sxv8B8EBFu9zn0Jf9ZQogcCoWGuX/EZzSbhjTK8?=
 =?us-ascii?Q?V55RwjYYqLEGd1fkHvVF1kuEng66X8QQAxi14JlMBBkpmC0y6BsR1celxGKa?=
 =?us-ascii?Q?TP7ssrH31YrCUYww1PQqpRtwo/0hGfcAoDiIv7i6V8VdRjKYASkODTb+x/L6?=
 =?us-ascii?Q?J+n3J4shO+UQLF7P3EHW4UgpVXFMJ1vYbfFJlRwEXe5ZTkMa0Z8h0aC06KB6?=
 =?us-ascii?Q?ir61yTcrH7iLw7rEl+kSsdnqcJoqvQs6RNLxoY0+70uISBgMvI0Mem9qKe56?=
 =?us-ascii?Q?AA+gx2yza/1Wotm2/gQIy1G08JFAEDjqD9szkYHANX//jsHsTNemCREg2v4R?=
 =?us-ascii?Q?XjwUrazO+QlipY5Jw6VLRoegj6h4uCfJt1N6jwxjSB35DUJ3SBCZFYKH4hdA?=
 =?us-ascii?Q?nGako9d/khotUr9kXsoQxBu2vwfET8gW49RRJPPBI81WRAJIu3euI6Kb3wm+?=
 =?us-ascii?Q?kwd6d4xjCGA3qBTPusaWVuu9dVyeZoLwsAxN1YSaaVqNODP5GTFatVb4FoAT?=
 =?us-ascii?Q?kG6EEsPYkZL4/z4AQpzUca9p+T7kHLt4JWCOQCafJfoN6DxgnoeStnJJiaP9?=
 =?us-ascii?Q?68uu1OQ6+Wg6BtIA0BTACPGPvyE/IeIDAH9wCx8rtrH7q1AqcHozn+gPq+eq?=
 =?us-ascii?Q?BNwVUXh59Yi9NYN+xf04RdYeA2O8YRWZxxNCEwAnvKbmnJTMVfnN9tWqdR/j?=
 =?us-ascii?Q?lT+KDBlfaNntYl831dnAFAHEM0Eiui38KK6ALQwnhbcsf4ddkJtYa2mUjOfN?=
 =?us-ascii?Q?rMhvVQOid/p/j2bofIVrTvDa/0kMBRt9ihvZFcIh1G6IrSnWqDyMPWZxSI0h?=
 =?us-ascii?Q?SXWAn3v7rbP/T0OL+dmzKYxL2nusQjz0qTmtoNjxGTG+hKubDM298/14uRUg?=
 =?us-ascii?Q?ppquoWFWQHzxJdsgPJ3HnrNzMtO3+CiexhhEpU/u7cHw8vBp+NiWziSI9w6f?=
 =?us-ascii?Q?MwpDuyvY6vx8xUfhoSJS7EdQCYOHWI7GQpUcmMDv6sd2SsmKsj7THWL2KThL?=
 =?us-ascii?Q?k6axMRVQ46tDtXUKD+4icVhiH9RU47DGEx//+6KrOjO8cUpDwK/xBxTq0X7r?=
 =?us-ascii?Q?PgZMetkChNVoyiTgz7G04DyKc2uEY3t4D1lYVV5o3d/KKPULiBH4B0SuTK0S?=
 =?us-ascii?Q?xazUOw6jf1lWFEcXXEAMefzXF0dpC5luNH8zqfz0ILbnvtBtMP6HUfzR9DZ9?=
 =?us-ascii?Q?QMKuu3efeJCDzq2Ssjop7vz5XiVF3lv4HuLWyk2VlT/xCexqL+vzyF1Sld+6?=
 =?us-ascii?Q?hrnpJB0MV3jOig0d8v0Qow8O58j8oHIm6C3IH47YBNILcJ1eqDOYl9WFewF2?=
 =?us-ascii?Q?2JrQEEJ5PJECOGhJ4il42rq71VMMnAXNO5+5vkxHl1/k6iMDz1DbVXDVo2SW?=
 =?us-ascii?Q?1OiIaDqSRmR9l+Fq2+VGjcO1VdPn7NhN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(80162021)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nADPzshrJ51TyweAGtv4PC7r2eE5uTIJMjzYLlyoPMlXIsQsWd7XR2/M5c0T?=
 =?us-ascii?Q?i59kRbvqWuiEAR0BTdkbvvUkf4awQfs037XuLXLxUJ29wYtvpBe6brci54E1?=
 =?us-ascii?Q?cWPgX9ArXPVDQNA9dE1RKUvp0YVM/DcxcXFzIALJuzzoSIz0SZYa7g3bkKxI?=
 =?us-ascii?Q?0BWo5juaQEYBIAXs7Yu+92TpwdPTaO2B5oqj4STgT+5Ni7jqxexezmPOYw7p?=
 =?us-ascii?Q?thnncyw65dRS2BeqyQlZ2Mjd8r2aIlXoJO4aMnx4Mcq8Th6tXaiv6p3fcwFN?=
 =?us-ascii?Q?NjPBxs5/zsMuqwkQ41CMNmN0BbXoma998lougFgeZI5r/zbEVRRjOdeEHqoS?=
 =?us-ascii?Q?n84nd4ztZY8ak5sjy/o2Dxl0LoCCLuGc2XIZx8tuJNw/Y7kSUz1IF0E8hfc+?=
 =?us-ascii?Q?NxvVOeY/KBExvKL/6x7QgRKucF4MfPIsQ3SuC1Ds6fGivW7Rwq1MseNnX1/Q?=
 =?us-ascii?Q?ApHQCDPEFSR2KeppHbmAgcfaQuuY4h588pswqx8lu9DIJu9YZ4NQFXjewM8o?=
 =?us-ascii?Q?k4vQGUhVKSdJ5DhuF1Pto/OUWZydmzOVlLekukP6whB1Wvv+2f/szdgB9l2P?=
 =?us-ascii?Q?lTmm5tStRsPWImzcHNzmzcpToZs+WTDSwpzdt68tupiNHLRwzEM5p45lWdLn?=
 =?us-ascii?Q?yu6cWgBDxTAZo5wt4zEWZwkRlueu2mh+Q3pNh44z/zk8AugHlwP2CXSLv6gk?=
 =?us-ascii?Q?knQCQkL3hveIXHzv9EL0+3FqRC+j7dEDt4oapFcXSBO9Xu1KDuJGbGVPadGK?=
 =?us-ascii?Q?OKAg7UzSjq9CJbKwkoxxmXBTZMQedCNmPXReEaFVxfGMieujrAv4LqyqWxel?=
 =?us-ascii?Q?arf/ShMe5Hs4aLuLrSaPKmxr6mS3gnossA0FosvwB6HaxhBk3PowyD6M8jlX?=
 =?us-ascii?Q?6xIbpAVQsds23RPjwq5P2gtp6dOVKvia4pTInGVh2ou9Mh/NZ6sqRwbdwPdL?=
 =?us-ascii?Q?ZEt7LSRTyGtMhyuvrnV34r7tkp6k1wi3QwN1qArobEX7axkPBu2+0fU4HTLm?=
 =?us-ascii?Q?TzwWwfy/u5fIqSEiX2D4HJ1tiDnF76fXtIcuClmnC9w0M5ME/x27cqQQzPXU?=
 =?us-ascii?Q?Maq/rosfRK0PjwlIn4UP+3O+ePsqYNxrwWDiW06T9P+hf1RWwFJeYqtgjAjZ?=
 =?us-ascii?Q?XQpKn7WmCtueXWJo5gGY5IiiL5IHwioxqOtZqk7aQbjcAL5Gi8lzbgcsiGDt?=
 =?us-ascii?Q?7VZNDkfKa7XWPUwuw3A8Ms6q2yqt0/ax78WpONQQbxk/e+7wzBHrn0K3HwqC?=
 =?us-ascii?Q?s6XEq/h+LbsModUtX829PF+P3yfcSAxBz3OGYMuVQ/LT7YScuBgLLEArM7pA?=
 =?us-ascii?Q?n0fPq6y8ZR54YOM3kd3Td+Ipqm/DLhBVoqYBLv36D2yNHtGMJ4UhM3RZM34L?=
 =?us-ascii?Q?LwrYeDyntmEK90UYSy9sgYfy4pelDhpNk5kPjuvBtaBxLNVFjXAW08LppPI7?=
 =?us-ascii?Q?tu3N6qWC+X7wj9EPA9CA3UN7hlMo1igU2SKUTfIseucNByIk5Z3Etfoc1pmI?=
 =?us-ascii?Q?n3rMz3M2YFMN9EUY+2AE9O2wbT82oizykTBuC/a8cm3y8zlhpbDc+paZ78Ub?=
 =?us-ascii?Q?ylntxYP25sXye+DcRQdGbZu/BOmXLzejQBnbFdMq?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: e925a85f-3cb8-4603-3f46-08dcdeb4be4b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 05:25:05.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BLCvEYBmAOsw/LsaG/ztCuBDLTLvbuSsttv2Q7p4jpPSUYQmvYZCXur1DzPlVFCwCroQI2ua2SlYIaD4xW3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR14MB5526

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameters for
High Speed Mode") hs_hcnt and hs_lcnt are computed based on fixed tHIGH = 160
and tLOW = 320. However, the set of these fixed values only applies to the
combination of hardware parameters "IC_CAP_LOADING = 400pF" and
"IC_FREQ_OPTIMIZATION = 1". Outside of this combination, SCL frequency may not
reach 3.4 MHz if hs_hcnt and hs_lcnt are both computed using these two fixed
values.

Since there are no any registers controlling these two hardware parameters,
their values can only be declared through the device tree.

v2:
- provide more hardware information in dt-bindings
- rename "bus-loading" to "bus-capacitance-pf"
- call new i2c_dw_fw_parse_hw_params() in i2c_dw_fw_parse_and_configure() to
  parse hardware parameters from the device tree.

Michael Wu (2):
  dt-bindings: i2c: snps,designware-i2c: add bus-capacitance-pf and
    clk-freq-optimized
  i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters

 .../bindings/i2c/snps,designware-i2c.yaml        | 14 ++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c       | 16 ++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h         |  6 ++++++
 drivers/i2c/busses/i2c-designware-master.c       | 14 ++++++++++++--
 4 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.43.0


