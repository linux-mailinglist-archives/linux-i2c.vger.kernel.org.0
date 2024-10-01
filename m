Return-Path: <linux-i2c+bounces-7125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAB98B6F6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B625EB222C2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A48A19D064;
	Tue,  1 Oct 2024 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="nuEGQf17"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2135.outbound.protection.outlook.com [40.107.220.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169919CD1E;
	Tue,  1 Oct 2024 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771440; cv=fail; b=owTEXIbQdTPgCc5aEdtrhPkkGWQ16MhKty8DRbcKpU33r2S0sX1V3RwFuuQrWLy98w98QS2xE23lkYUUsYCJGLQIJLOkn2GSkcHBfX9QwS9J/tgma6TyLTtVpOn0v1u1LfVtVD18pZ0ZWVS+4RPp5ASlMHMcZLxvNj9tUoY9wYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771440; c=relaxed/simple;
	bh=s+cY3fs/9A7AZ/wT++Sg7X9m20R/lELSmTQBjboJF7c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dFqiK3KYLGIxvLDKHk4vP9N1I1W2sudljWK85xfmX2qlPczZnqQU6U8pVZFCYa8imXMBWnxq6Aj+WoaL78g4NE7Gh9xIH+lb3BnB6ZFYZxKn+8OoRD3k7Th3REo5MQ7HfqJmEm2DOvkfgCB/gG+PSavTeTJqeDNps5wAphonvhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=nuEGQf17; arc=fail smtp.client-ip=40.107.220.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL4qZEICMO4N2HR9FcwwGmTUwODVx/06XAg/3CpX6yvh35n1IciutoM1szNPpilJzl4lkGJeyB1j0DoNu3+hHOxqBYn4Ertwx4mAeXBuley9TcpDRn5AIRnMG6dWf0X8l32yz7yjV/SJdyQHTQlI2sr3kWs4cAfNfB4u4/i+aK57as1cLeWbK9IH5gT8bFTRG1XlAy3mTh16XL/28miR5zhQnNXxCulzkRwCLwpIYu3bwu2y0yPxCdsDA4eM1tneGKEdlAfShamsHXH7hhDTDoKdSoNcejlzSvGNLE7+3B6qhEl6bs8yHP/9zaJsmQVHfycU6u5OhF/VjDFEyw8F+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qY/G8Uoait+NfoETwWZ77HDYTbLcmjNnToBa14kmcg=;
 b=gRWlS9Bk/XJia2NNiSZlPdHJ+fOsxUcH9W4P1YrPsuCp/rFYBRMr/mCGfk8aXMreyMWDQI2UpuaFbvvNvesBGVfsFLE5TF4LaovwGPOKgqyfZG3Xv6hM90gEmEbhR+xsSUAePto3Vj95MWpF8D0x6kBz3Eiu0ltg7Q7curykaAlc+99QiJWdyOSdryb4IkJTtXIt0zkmL0T7Hpy93hitZEKTPfDXnNFVq4/7qYAOc26o1MHOQsmen+p8taMcY7ypuddne6Ba4Fp5Rn/70sE01Zlnr2o7frRzT2lVyfkhoP6l08QEvAGu3vFAUXGdnU+QhQjQCixm2tlf9RtO1plZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qY/G8Uoait+NfoETwWZ77HDYTbLcmjNnToBa14kmcg=;
 b=nuEGQf17wmE1THF+NGrcmVtDgMVrzNTS4FPh76Zno9xBJNsZXodLhVU3XV1vPsxIVKNprWoXVs1GZQdy29D75IV4ReLmKk9nkw7PShdN/mZKBIfnfm0O96AnZ3MghA863N3kkVokCkyitk++sRfZa7yL345DdbFx4AiG4LqWS6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by SA3PR14MB6462.namprd14.prod.outlook.com (2603:10b6:806:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:30:35 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 08:30:35 +0000
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
Subject: [PATCH v3 0/2] Compute HS HCNT and LCNT based on HW parameters
Date: Tue,  1 Oct 2024 16:29:32 +0800
Message-ID: <20241001082937.680372-1-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 4a7102ff-b825-47c7-e7cf-08dce1f35210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|80162021|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vJhVjmVPpUX+87SlWFUX4CMWWg7rxlL7yBtC7Y9zy7Dsg1cHZqotV+cc+nd8?=
 =?us-ascii?Q?LmUhXuS9aoic3EL6qk44XPKH+P1Dg205y3pPyxOt3dX9IOED5q3IpUED7M+q?=
 =?us-ascii?Q?nWjIhgZFPQWs7Ii9KuerPBls248Yk030c66XDlYkoRtBeqh8yJBe516uqJHZ?=
 =?us-ascii?Q?8FZF4s3qKgSuQLCcUnKP+/QSibON5RbgMAt6LVjX+1rgoQvUNgFIo2bdEZen?=
 =?us-ascii?Q?TWDvkHisPLm3BkgfrVpl+ZoQLsP+XJ6J/ep9x7vYNCZzQAd9CvNDJ2vABRsV?=
 =?us-ascii?Q?3WeFOZ2o1O5Jm77G5G6520wWvD7nMqTWv5/En2d49UWtif20ywOVwNFi9a4D?=
 =?us-ascii?Q?BFP+FEYZjm+TrRHi8avT7AOWDA/vko6HQCJFNyg74I3qfGhzM3z0u7v412nn?=
 =?us-ascii?Q?T+zMOjNXF4YtH8ODJ3lS9UNNb0l0Svz8TyZKbIwVfQTTSakwMwLi0G95TiAO?=
 =?us-ascii?Q?Droep1nQtO/+f3y0Z/YVoJsVVTSVFw+1Mt1RglmyYB7Q8Nrr7pBkPBVo14xv?=
 =?us-ascii?Q?3Qoqr1SatRZHfdtrKT4JQPeI/dWLaVa548npZOpUgixLDs4HKFrNKgo8JB2C?=
 =?us-ascii?Q?FDmDmllpDk/2jh3k8M/kCZMPkMHorJWK8jKv+JjrusRY5znHEH7NA8uxH7jS?=
 =?us-ascii?Q?FxeTVBaLpvhcJhs5vqJreghH0x1WJomVWFdX0lAFgzISwcHkXfLLl5n3WV2S?=
 =?us-ascii?Q?cL0GvIpyzY0ErEd6OsJcpq4g6UVwXgnF+Yt4T6YvBVUYQq9CJwgSLOc7kU3f?=
 =?us-ascii?Q?YTPkBEVGFzMLOSCqh0XTiWebNY3VJBu2aYYZ0Eab+qIwY2L86NJbIk+gX39O?=
 =?us-ascii?Q?q2S6dWVNHZ/966SJNJFgdi6jrCcgXnjd3SOLvKXqx+7VaTC4x15o7XptWsDL?=
 =?us-ascii?Q?qo5QAUUNLS/h1TZktmXExRwO8j7yRa0ISf5EWAPRusid/xYSCPt+k412IzTM?=
 =?us-ascii?Q?L+2gE4WtOvv7oTVJgB8+xAMTG/zHUXh6uwNM3bSn/6oaSNKD5QfuNMstWz2t?=
 =?us-ascii?Q?aW5UGRzG4nXkjvPBMhGXAnSZ7J07YAiI6fXFzB0VPRufKjMYGdbhci4PZb/N?=
 =?us-ascii?Q?K2Fc8sPmYyWT8Ilh7FpEeXNGLr7qswc9OQ7GfXfBBtlNMApfzvqheaaxItBa?=
 =?us-ascii?Q?snWZOhXXzVUV1bZo1cxRUL/rf8fcZkLmn+c4eAhHey77ydcvKcUoNRdo4YF2?=
 =?us-ascii?Q?dZ7o6dBrKUgAmdwdW6AkcJVQeb6EBZ7NfDpvXt8+OYQHkbvdFTPSayQg5q9k?=
 =?us-ascii?Q?ypoYYid9csO+m5/vUwOJp35X4hoi4zkgwOLbL8BY7UFOwEgIe31yM98u9y15?=
 =?us-ascii?Q?EV9uLA9VTvmz4Fvb6rwiftTY5TgcWwJNRPJBTBiwHAzgRTMaaYcU+jUVcnl0?=
 =?us-ascii?Q?/ujuNBayv3RMN3Gd+SJhveV3rCN/PEpTUA6Oho1pKD2zbl4lGgZT61lpDKmf?=
 =?us-ascii?Q?lKoA16olbQ3Yf/uYuQtWIE5p1CpfMtEk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(80162021)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P3aqGucludsKqvUaYWuU/u3gqpo+4RlU7/bl8l9reuwRMdUaZKLkka4d87Sk?=
 =?us-ascii?Q?bG/uI9pzgA0/n6dNzaQjUT3r/oNggaBLq0yZGiRvLo6NA07JZZjztWnZkuBy?=
 =?us-ascii?Q?8Isi3D5TeUpGiMf5QHKHQS5J5QvYlxTuMfuRtscDZORh7kY9K6eKk7n81nwC?=
 =?us-ascii?Q?tdCk8xldbScnPUZtzoDSataCLOwqXNIf59c5+X1McV03vDmbo5NRRFumYamv?=
 =?us-ascii?Q?h/8nlZqhj9mTUYPGKhaNKahIF43hmIL8eNpEJYBF+TFSYYpTzJiLKUjzs+PU?=
 =?us-ascii?Q?ez0FvTB7SEL0Bm/5YkNBXtie0zRjFLq9+YbTup5nTGbRCndTAW6jb1w+i8BZ?=
 =?us-ascii?Q?fDZzrDBIv+067UJoIGsMdHix2CF+VpPi+oEOkXBFCaxWCNf8RDBAYD5a4B3+?=
 =?us-ascii?Q?7Y0PbcdBLdIc4xmP8ZJERoweFmdbdCnGB+PaVGAdNvs6TR1VUuROtn+RRBQO?=
 =?us-ascii?Q?nQBp4utbrMjbbRqkB3THPaLurNGOXe6lhq64IPN77Q+UImoS4i7Lfekm1gI2?=
 =?us-ascii?Q?awN3U9hVPEKchjLobEvsfLWUAHomNph46eLWGaq65cuIxVsU8gb9lUIUtzpE?=
 =?us-ascii?Q?HN8i4XYxHnCwNVGncuz5B7OFgeJrLnZEsjXNyWB29TM/ZkEPW22tTp/Qeu0/?=
 =?us-ascii?Q?uwCXCj7hDnHCnP72nkgqMya8sSgxh9PrQdUU8zWF800NEJQ7/ecMNKkAnpZY?=
 =?us-ascii?Q?o7gq6nKgOiuQPPQBYTPpqh49Ddm8YFRYTwN4dnhIYP0O37mnPAv8e3m2kqt0?=
 =?us-ascii?Q?crGwKpPkaqr9xE2SGL+oaamKA+FNB18AVTlHH90WNHF/r7a6Bnp3Uk7Ow117?=
 =?us-ascii?Q?eZGaZqa4vW9MmEc5JgBmNN3csNG2LQ/RYwkDWTW45a+JAsMrbi6+idevuPVZ?=
 =?us-ascii?Q?dbtY6Q5aUiYuu87tOipbKAe4nEfYYywfJFTydTOIfci+K+XykgAUaMChOoaj?=
 =?us-ascii?Q?PUny8udm4yySGamgdesf5tNAyWZpqwMVGkxt9Xga+Ak+hEs4/SS97utpKDCM?=
 =?us-ascii?Q?s/0VMzNKmxYrfvJhJTK6HOvp877bVo6EvfBGIkbGqjWy0AOkJODzAStZQj+A?=
 =?us-ascii?Q?EaKKoQ5NXGq8vj9EB+W5we/j9VlI72qIJz/Atv3OceCMkPhzXogjGxDmYfWN?=
 =?us-ascii?Q?WB32spTJEcb7/Iurwi1L9sn003kadbhGbD1G1Tyj6lBqOibW8y7b9GwGbVMs?=
 =?us-ascii?Q?UEHCRAaj/8SFG5cRU5wBGsdyAXnXhD0UotqFQbEhYHqLSLQ0CeOo7DqDmiaZ?=
 =?us-ascii?Q?ykbG8P8jlxExC9TfSTfaMsm6zyAPM1+egpAdONFyF5+ODATzdA0/es9QhAE6?=
 =?us-ascii?Q?wOMORLKBhe0kHLmk4n5Ha4cAIiDQm0om7NEqt/0KgNfOr2aSODFoft4q28gB?=
 =?us-ascii?Q?DxIFxSHu6glxYSBq15Ausl1NUY9LnIpEE6pJl8NPpBrwvuhMUP0BgqIqqn48?=
 =?us-ascii?Q?WSAS9u0py3S658TxOMUyn/ZP+KuVtUTdb/WEhHk+NASf6T0WXf68LETR7t9k?=
 =?us-ascii?Q?KcbB6YMF+w/6vAHT+Ke4eCzdP3uPXJOMzIG550bZ8wHqg/vwCp5vUAopXcDJ?=
 =?us-ascii?Q?oIyRkF0m0yxq96E/dG+Or4udTZlB/GeRWC0c1YiS?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7102ff-b825-47c7-e7cf-08dce1f35210
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:30:35.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmiopbYU15ojjTjrhc8EFD+7zkh7PVZ3NnfDHSRBQva9i5IvMJWaahGuOCyxaZKbU+c37602XhwBWEbSniWDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR14MB6462

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameters for
High Speed Mode") hs_hcnt and hs_lcnt are computed based on fixed tHIGH = 160
and tLOW = 320. However, the set of these fixed values only applies to the
combination of hardware parameters "IC_CAP_LOADING = 400pF" and
"IC_FREQ_OPTIMIZATION = 1". Outside of this combination, SCL frequency may not
reach 3.4 MHz if hs_hcnt and hs_lcnt are both computed using these two fixed
values.

Since there are no any registers controlling these two hardware parameters,
their values can only be declared through the device tree.

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

 .../bindings/i2c/snps,designware-i2c.yaml     | 24 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c    |  5 ++++
 drivers/i2c/busses/i2c-designware-core.h      |  5 ++++
 drivers/i2c/busses/i2c-designware-master.c    | 23 ++++++++++++++++--
 4 files changed, 55 insertions(+), 2 deletions(-)

-- 
2.43.0


