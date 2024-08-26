Return-Path: <linux-i2c+bounces-5784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9595E729
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 05:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A58B1C20FC0
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 03:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8542625622;
	Mon, 26 Aug 2024 03:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hgqsScah"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2052.outbound.protection.outlook.com [40.107.215.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D86443D;
	Mon, 26 Aug 2024 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724641414; cv=fail; b=S9Hoq50qiWx8r1IQj9LiA5VxrSftddyG2KedgIYnE+fkE0ww3dfDEeK7EiTTFlLfcYz39K85xDFb24NbgP/8ODM4TAioImd4SxhPW1ksM8AiHO5nTg8xESFangKMW6TPvdku9pyyY1k847RtVAxWXSdlxhSIqsRB0FwbRgUl0MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724641414; c=relaxed/simple;
	bh=GWqQWJKpUrOeMgIO+mKZqzfJ9ESlbWx8RibwEtGCMhM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S5cyunoCrGLyRNCyP9ILvTg/mZzJEZd0GU7eZ1wtAaAjjiYspqK0PLBxajw57u6oC3XVZh6yWfOCyadjY/u32cFdGWFp5w5dyS0YAHmVHaVxtO0sYOnnt8G2cfTK8OkKUsnxaoOtCTKWh5jcEqJY6O+/XrgsiFR2/LytnvpfNi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hgqsScah; arc=fail smtp.client-ip=40.107.215.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flv3dkcXLDslEOkMdl1iEPJg2YUSDFzQgtNYNNcyiymhuYVFMLnkg/19eZmFaE5xb7YSwD/FEGzFVRT98jgXfkdWSn1MyEdpbHnqltl/5qI/g6z0Rt5rewEC8vGmu8UHh4B/i6dqUs9Oil8vOYnAgcnlpdA8r2I5bMm03YzCrlnuWBjIY93gnkk76A0T5TK3PVOxiKaj227O9qHVcLoi+kypH81lKP+OcZeehcPVL+tnQg4AdsUWwqTrYFeTXwQaFQv8rxHkWY42RTuWmO9fnHPAU8VpJ1jsfyelaXGsHULnEnFZeufcGhywZ5xG8Uzu6D+PMZXGWl25L11LP++ujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qfu0lX+/XEe7UIN2KxILs9SZoyFApL5nuHublpY+MVM=;
 b=p2lK5WuW64sjr39Lzvd9N7PjW/nKqgMI68Rlm8sA6HRD6UFqRUs4XK2VqjqNq5Z8yyi2kPGN7udexX5S+PccHRHGM4EVEDbfajO8LKhqzNgUW8ot+av3ZhzlgG0KppuWNgMg1d4Ws3zccWMtyh35yeq1Y1BVsa9wsfdaVkKNrK7/+uHQX7NFg2SNYvnGT3vNRhH+rd69bq4G4G177axQv0dcrQ7XfWWVM7f8QjYzKqDen592cdFnnCE9iMS+CVeQ8JepcgzZShsWsKmPtVXLcuHyKY2dl3fJFtISS51FygoVNZC4KAppq8germ4Te+bziqelF63zN5QOzQdsRdW3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfu0lX+/XEe7UIN2KxILs9SZoyFApL5nuHublpY+MVM=;
 b=hgqsScah4dmc6xjP7gex4BrO4nrhoia2VKB8xFxk1o1G8onj//prCpvweYbWkTDAtyOeFNpDujhF+QtUSIwoPHh0xB2zkJJIwb7WmdOtW57mxIA7kZreEN704C3zSPVbdFPndJDUsuOvyUwD7qWee+MLX+ONA5z+3/PIqA7JWhzq5o6YB6ul3Y8S4jSEKfbQAvWsBev0GIH089HdvzlmUAAcOztGBaiMZKJocSrli9IsbMF8OjmI1ow9/5OcZ570H5/ydYmcmCsNJfq2XVIKMZylvrX1ih9h9ds52NpDSCnACgWLmgqbHpS1cW7dJCdF6db6Ms4dGNmRZ4KAWYF4wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5871.apcprd06.prod.outlook.com (2603:1096:400:331::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.24; Mon, 26 Aug 2024 03:03:25 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:03:24 +0000
Message-ID: <b625df1f-9ddf-4eb1-8b51-6c63fac36530@vivo.com>
Date: Mon, 26 Aug 2024 11:03:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] i2c: jz4780: Use devm_clk_get_enabled() helpers
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>
Cc: biju.das.jz@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-4-rongqianfeng@vivo.com>
 <Zsir2Lo5TM8YKKrY@black.fi.intel.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <Zsir2Lo5TM8YKKrY@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 46caec95-c9d3-476a-4f25-08dcc57ba6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUVydmdvUk5reDRhVWl0TXdhWE0xRk5YUzhIamREUGtIQU9EUUVUQWJpeUow?=
 =?utf-8?B?MnhMOWFtVWpBMlo0TzQ1WUx6aHIyVzZldmNJYmUwQ3cyZFJ2dHBhUGZJVFZ3?=
 =?utf-8?B?eU9OdVVqNVBMMXQ2cWM4WTByT2I3WnA1ZEpJM3l2QURQU0Roc284Z28zZXpC?=
 =?utf-8?B?cUtyWW1XSjdrWUhPNGJaNWhFanZHbkZwcGQwaVUwemRybFp0ZU8zZ2pCdzk0?=
 =?utf-8?B?bFAwTXQzTmxhSlNKaHZtRWUxYXJBZ1kvS2tua2U4bFA2ZCs0UTZjOGFnd0hz?=
 =?utf-8?B?emdLbmdoRWR3TmRoYzMzc0N5Ty9PVFhBRmdZOVZpTXQ5OXlrUFhheHIrRWV6?=
 =?utf-8?B?M0FxS1ZnNmpqbFhreTFQMFBuS2pZY0VnWlRmYlFSVkdQN3hOaXJPWlNOdjA5?=
 =?utf-8?B?LzBnblVGSFRBN09QZXh6YUJXNktJYVVpTksvNEJMZDdneUNZKzV6ZjZkRisx?=
 =?utf-8?B?QkhydGZGU2lEMTRJNWZDOC9PeWJjOFRFdEpmYnlYcjBiaFZaZ29FZEd3SVZN?=
 =?utf-8?B?TXRlRjNqc3doRDBnV1NQdXpSNWhKUTJjOW5oTGxMRExLeURNcEJxeE5QNS9z?=
 =?utf-8?B?ZGZhMEFFa3BSVzN2UWUrNWR6S2trcDBxS0loVnEwVGZvM085NG04VGpIZUhh?=
 =?utf-8?B?NXpZYmt3dnVOS2VBa3VYWHJuNVNOU2pYZmxjNlk5eDdFVExpMkdhNW9qUmFa?=
 =?utf-8?B?cXRuMiszUGQ1SytTRWNWSks1aVBlZ1BzWmRnVWJ3d3Vhbm9TdlBzZGtyQVh6?=
 =?utf-8?B?ekJ6K25LRTRwTEJac0p6YVNNZXdkUlhQcERVdWkrODJWSUVjeGpOMk1QR29E?=
 =?utf-8?B?OEdUQlZDa1hvOU5jU2tldlF6RDduR0ovQXZab1ZXc2Y3U3hHTkg1ak42Tytt?=
 =?utf-8?B?dkJ1dWExc00xZUdTUHBlMG9PeXFTSnp4SUZNMXFOdUk4YzIvMjBQYkVIbkx1?=
 =?utf-8?B?WVFVRTcvdkRvcTVXZTVvTENGdGF0V3VuUTZmbnFtRFB5ZEsvK2dhelg3Vldy?=
 =?utf-8?B?M3AzOCtiNWwzUjhkYkpnYXpFYVlvRmtLNkViMHA2WmhVSEN0RUQ1WVhLUDg5?=
 =?utf-8?B?ZjZHOEUxZ0ZTazZFU0RLWlB3S1NEejVMRnJEWGRjbk5hZzBCNk5vbDJ6ekxG?=
 =?utf-8?B?dWQydWpnWHVBUWh1UmdpYTgxL1dZbW8wYXkvVXMvakVkUGtJY2J2amFlbEdz?=
 =?utf-8?B?TUdFV1VMN0Z2R2t0ZVRUUzFhTm1BSXZ3aTBmR0Z6UHVNTWVZSXdCSzljS1hk?=
 =?utf-8?B?NVJsVDc4a290SWR2dWdNZFdCWTQrcFZ4aTJQOXhRZ3hSOGREU0xtVFQwTVlr?=
 =?utf-8?B?eHF1NVdXckUxa0JtcDRsZGVoQ1lVcEJaWXNtaTRCeVBiUTVLOTNtRi80Snp1?=
 =?utf-8?B?MU9tNElTR0xybXFsK0pxL2IxSm1CaXpWWEowT2tsdVlhQTZlNE9OU1NMRWh0?=
 =?utf-8?B?QXBRbE9kMm5jeHRoZkJoUElQRmRsODNVN2tZcmlMc1A4UXhWancwaG4yR2o3?=
 =?utf-8?B?NmtYY1hId0hNVjlxSVp1YU9TcGd0OXc0TGQzQjFxb01MRnhOc3g3TStSc2li?=
 =?utf-8?B?Q0VtTllvQlhHYzg2M1BNM0JBUXJUZmxZK3ZwZitJVWIrdlZyaWsxNW9BUmky?=
 =?utf-8?B?aE55R1NxM2t2OFByRExuWU9RNTdVM3IyTXRsMVg0b3E2Ty9EWEwvb1Q4RTZo?=
 =?utf-8?B?Z1dIbG5WMGxCVWVsMTYyS1loYUtFSzhVWDYwRld3Q25FamdiNjgwY1NuMm81?=
 =?utf-8?B?WWNsb3RZK0pXdUpyVVpmakI3Si85bTZTK1BLOVBFSVlQa0VYSER5K3Mya0R5?=
 =?utf-8?B?UlFDOGJ6ZW8yTkV0ZEF4UjFESnZqM2FHbkYxY2o5aCtvcTBiVGlJOUhZSTk5?=
 =?utf-8?B?N2c5UDU4VE1Gbm5pQlU1RkdmNDdObldTWHRtUzdpQTRvMzBMbkgrK0hqWjVi?=
 =?utf-8?Q?RVRQ4Q28FxY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXF0aGNiWExvYUVxZDdJZDdXSXBLWUsydGlxUU44dmsxWnl1M1BzT08veW93?=
 =?utf-8?B?SENGNm8yUlhNNDhDNVE5b3ZjdXBmMkFYWlFVYk9XT3lSaFB6Yjh5WVBGYVBK?=
 =?utf-8?B?cllyY0Zuc3EzVDFaa1duMHB0UDF1WThoZ0tFWVRIdC9UQWMzMmlVd3dyNmV0?=
 =?utf-8?B?TlhOUThiM3JLWTFNMzk2ZnZhMVVFZjY4dVdtMkREOHFVbjVrbG52eFFKdWhv?=
 =?utf-8?B?dm5mbVp6MVozTjdGOFhvRWhhOWw4dWN2Y3g3a21uL0p2MEFBUHdicXgvTjF5?=
 =?utf-8?B?TkpUTVRReWNUbnlkcEEwVmp0a0ptY3VETTh6eXNLRVJUN0IrTXJ6eGJySGJ0?=
 =?utf-8?B?c0l4bmJNV3A5akZoemJaalVDOWo3QllSblgvdUVDdEp1SDlRUzUvZVFsbzV1?=
 =?utf-8?B?QnEyRm8rYVlxTDYvcFJBR2daRzdjSVJxY0NKUVVMUEIzem45N25tRVVFbE4z?=
 =?utf-8?B?TUxFd0cwa2VZdkFRa1crbytXSmVDUVhaYllKbWdPZjhFSTIxSFZFOWJBR2Mx?=
 =?utf-8?B?V1dVUG1PM2lwYTZXSU9tcE1zTmhvWEl2bGdVOFdJYmVyb2VsMVFaNHVxQUs4?=
 =?utf-8?B?SGxOY0RzRGozT1ZlOWc4dWlmejhRS1ptWjMrakcvcE0zRFVLYXlzRmVvN2wz?=
 =?utf-8?B?Vmlyd1loTEVmYWRPZmgrWkJiZ21XeUU5RWU4K1R6TS9wdmhyQWxrZnNOWnp3?=
 =?utf-8?B?UnBxcXpsdldVbnArd3ErVHlWSkhydzRHdkJsaGRBSkhuY2xrTTNCUk5aa0w2?=
 =?utf-8?B?Rm94aloyUFJValdiMjRnc1FaUWMzNUp2MWdKK2JyaHM0Q2VJQ3E2bHVwUlRk?=
 =?utf-8?B?SXhtR1IxejE4ZVZvSkxOK3JuWWNkRVBzaEhpaFB2Qy9sSU9wc1EzTDlKUkZz?=
 =?utf-8?B?R0lmL0NTL1hrL1lrRVJINnJGVmtONVlORWE3dGdWRlhDWGhGY3lGbjcrSzIx?=
 =?utf-8?B?Y0pFOWtDc3JWcmVQbFZaekpWNC8rbld5VmtxdjdtY0F3RmpPd2RLNnZMY1E2?=
 =?utf-8?B?dm40U0QyTVBWamxuS1hJbmk5V1B3Q3gwamF4NjRrREdzKzFIZ0grWHBNMi9Y?=
 =?utf-8?B?bmM3c2FWSkNmb0hKYnNaUTJHNUU3THVLaVZNVGUxY3FKYy9iZUlvamVoS2pP?=
 =?utf-8?B?R3lxeHFFS1B5YVVjODRYUzB0bklxcTVuV3VhWW81TWhkTFFRNnFkakVnOUVQ?=
 =?utf-8?B?SXlPaERGaVh6Q1JOOVB4YUNhaFVseWpCWkNaeC9DZEtrNXYxUnBlVS84cW9D?=
 =?utf-8?B?Mk9pbmV3ekYrbzcrSkpTUjgzS1IwK05mbzBjNlNZM2xsbjM5NFowYzdLOXFN?=
 =?utf-8?B?aWdzYzk5Ujhzc1FhTWw0T21RZkp1VTJBSmlOYUdOSHN2UldxSnlJTThuMm9p?=
 =?utf-8?B?RHY0UnIvejJ5RGhNL1FHZ1BsOFlIWDdSdElUTW9OVTZvVkpSRzZJQ3YwSzRW?=
 =?utf-8?B?dFpJN01KVTA5dTlHRjFxRjR2ZDNWdzJ1TDdQNTYyWjNIZElzUWhVUGZENzJh?=
 =?utf-8?B?Uk5HVGErcGxDZEJPeVlmQkRQM3dyRUhNZHZCV2VBbWZoc2M0dmh0ZGpielV4?=
 =?utf-8?B?NTVtT0xUZHVNOVh1eTRqT1RQOXVGUEk3c2gvZlFOZ1dQMmZQRkM1T1RISVIv?=
 =?utf-8?B?b3ZzNGI0cjFZM2k1SndCdmtaVFBvM3duUGU3ZkwwdldjZjFJYlJqY0YrdjVC?=
 =?utf-8?B?WExROXRwNDBDcURXZU5uVXpMQWhlYTgrdktOMzRKV21WSmFKOHY2M2x3d2Ja?=
 =?utf-8?B?bElDSVp5VnN6V3oxa1pncGlXeFFQV1Z2bWczTGVkSjFNUFZsSHErN1Q0TElB?=
 =?utf-8?B?S1RqYmpwRjhtNWRYamZ3YzliQlVJZ2RSZlFwTDB6ZkYwVDdCSzAwREJvL2pr?=
 =?utf-8?B?Z2g1TC9ZeUE0bU1YTVdxSjNqNlBpNDhWemtIOGpiNHBLWUNpWFpkYVpIMWxN?=
 =?utf-8?B?aGZXcHlTQTZwYm00Zzl2MkhFR3dRUGg5aTFxeitQVkFONmU1WXRmcFJOS1g5?=
 =?utf-8?B?QUtpRUR3OWU1cFBPNWJNalAzTnpLaytOenpseFZhMnNSYXl0dm1XdnBIa1dh?=
 =?utf-8?B?a25xdk8rd0o1QVlkY01remRIVHNaamZhRCtLKzdsaUkrZDlBc0xiQjdjWmVP?=
 =?utf-8?Q?meRQ2sPp/B1zclHFncRC+pLL+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46caec95-c9d3-476a-4f25-08dcc57ba6a0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:03:24.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyoQd4rgc9TLa9Tt9gDygo4dMQA3WF1xnhvV1dcepyHR2dcMH1T0AvWC79upvkva5U1pRxOvPEFDXIV9MAmaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5871


在 2024/8/23 23:33, Andy Shevchenko 写道:
> [Some people who received this message don't often get email from andriy.shevchenko@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Fri, Aug 23, 2024 at 11:51:15AM +0800, Rong Qianfeng wrote:
>> The devm_clk_get_enabled() helpers:
>>      - call devm_clk_get()
>>      - call clk_prepare_enable() and register what is needed in order to
>>       call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code and avoids the calls to clk_disable_unprepare().
>>
>> While at it, no more special handling needed here, remove the goto
>> label "err:".
> ...
>
>>        ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>>                                   &clk_freq);
> (side note: this driver should use i2c_timings and respective I2C core
> APIs instead of this)
Sorry, I didn't fully understand what you meant, it's my problem. I guess
you are suggesting to use an API like i2c_parse_fw_timings() to get the
clock-frequency?


Best Regards,
Qianfeng
>
>>        if (ret) {
>>                dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
>> -             goto err;
>> +             return ret;
> While at it,
>
>                  return dev_err_probe(...);
>
>>        }
>>        i2c->speed = clk_freq / 1000;
> (side note: this should be HZ_PER_KHZ from units.h)
>
>>        if (i2c->speed == 0) {
>>                ret = -EINVAL;
>>                dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
>> -             goto err;
>> +             return ret;
>                  return dev_err_probe(...);
>
>>        }
> ...
>
>>        ret = platform_get_irq(pdev, 0);
>>        if (ret < 0)
>> -             goto err;
>> +             return ret;
>>        i2c->irq = ret;
> I would add a blank line here.
>
>>        ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
>>                               dev_name(&pdev->dev), i2c);
>>        if (ret)
>> -             goto err;
>> +             return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

