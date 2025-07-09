Return-Path: <linux-i2c+bounces-11874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21215AFDD9B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 04:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7B611BC6A31
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 02:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE1D1C860E;
	Wed,  9 Jul 2025 02:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="quTPwBxc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012047.outbound.protection.outlook.com [52.101.126.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11F74059;
	Wed,  9 Jul 2025 02:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752029078; cv=fail; b=BhaFc+Rj19rei70VUsTQvVlNJZBU0uS9INbTbgPXrEDPNOICjBOm2gw6gkFk1E4pNt2EwhJjcAb/cC7/2Knu5AP67WqGy2BJ64Cg3t+X8kaXOZh0VfgmF7JVMSlYeZdSy/WRak8p9VmP0sz3Y+Nps/E/iCoG9t7fipJG0LO+m1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752029078; c=relaxed/simple;
	bh=rb8ERJhob/98KyqTs8SLv18mPcKPbBJWl1AGR0RVvU0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/cpR3TIKlsHhQuGrRfA42AH1r4AH71gnddvUKOtLMgNlKVz1IqQcx6VhjAJH+YEyvg6UqPEsZJ9mwwI+fjQla99yUap3RYSckQlx4aQb1Y/yUpB0iXgV/mfMeyvZFVueFRM2tDOQYZ0475xzx4ENG4YRuDlwZvHyMWGJgiugC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=quTPwBxc; arc=fail smtp.client-ip=52.101.126.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7/JPxaomPvtfMeXqYgMo7un/8pq/Rzz03P0oe0YHo3tsa1yaLexny61EGMzMnpfmTXOxKdGeZg/J1O8PC+PxdkVLRJlerrC0EHsbTrPeIvndvSF2+eS7PyNzGOIzvfSm5lOL3/EZX2YPhBlfIeLFM7LREujztpv2k1KMbaNgeFKXxWq+MdXoFSHHr9KfCSAwN/1CR6x7JZbNp5akdy0lZXYL2F35vFiKh2zyAZqkHPUhnEG8cZOU4hY5WrIox48sXJdAEXuRRoCKU7hyKvLQzmyiEbFDDPxPVJqinaiwax+jtOk26BClr+zTbemxyYeIQY5N+nuWuh9N9N1UgoDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAlK09CpeVq28ErOecWR9XcC8993UnpR9mZ3GbkLMgg=;
 b=LHDmHSC3Oxjd28Ro0QO0i5Yus8pbclO93TvLUVW841eB3bnlqsmqoBSycWxRgPkOZLxnsp33uVLxXGHD5Gmp2cz4BSYVdO94rpeJl9ru2+VZS6exjeYufJ2W93afdF4n0x1DTWGhhBwczYPnFH8VKQr8NjxvQ0cOmCdHYKp7SjL77aiD44I3Xgbn9bsO5mNV4VeH/O0+S6W5R4gwzZu3fHVf/LRaw0aRfYa9FADEtZIN42vNWJObM913Y8L8Cm793WhLBynLKt/GphcgBbwgVXpQUbxkV5FBhYqXgFK+PHt6WTKd/7IT18IGWlZeXLyuWy1ncZst4B375+xI8uimYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAlK09CpeVq28ErOecWR9XcC8993UnpR9mZ3GbkLMgg=;
 b=quTPwBxcNcS3Gy/+/sUoywniNSEJOrVLJhdEa6JlRBe7Uhrf6FWxel8Lbh9BqJW6Kun1xK+GIXP/T1JGFksz8NNbUePTw6PqjRd82LRWVejLAR/X7HqO3zXBtztzdNvEHtgBdWmHpikFqLeeHc8uQ0tk9DshvKi2csVUSpatjwsN7YkvzuagPXv5UZu/3c9HLe9Lr5jMKWYtii38t7njZlxkvTkctkXJTcSz2VqpSxOXhLjORM5jotNUEw+S6rLNoeA5TF/SY8haW8Uc5IfxCsXwGtRtxeKekITZkSZWoxBmxg/F380uMMk+SVK6pv6JapuVdRDiGx7MOYssL/RjOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6957.apcprd06.prod.outlook.com (2603:1096:101:1f5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Wed, 9 Jul 2025 02:44:30 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Wed, 9 Jul 2025
 02:44:29 +0000
Message-ID: <969dbbcd-e965-4c38-8817-56bd87a83f98@vivo.com>
Date: Wed, 9 Jul 2025 10:44:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: busses: Use min() to improve code
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: wsa+renesas@sang-engineering.com,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20250708031520.365110-1-rongqianfeng@vivo.com>
 <20250708120658.0000668a@huawei.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250708120658.0000668a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: bc417a85-6c52-4af6-4c3e-08ddbe9286f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sno4MFd4eFBGVVFuMUxHL0Z1U2FjeGd0VmtYVmgrK2dSUmVwbVVYVGdHelZ2?=
 =?utf-8?B?dDIwYWNpektnOEcvMWpoeHhPdXNYVXFrcjllQ0hRdlVDbFFCVHJNdkpvbHNo?=
 =?utf-8?B?RlgrSkpyTFhNSWxodGpGM3lNZGZ6TGFiZ3VOWEp4VG1CcXZleCtjUmdCWVh4?=
 =?utf-8?B?U3Btc1pMVWxZOUNCTFA0eGZqcERTRm03QmovbUNwazJLbnNtdHpJYlAzRGpR?=
 =?utf-8?B?YkVwbTgyQkF5dUZrT08yVzZvUGFpbm94NG8xcGdKNXJHdjh6VnNEb2UxTW9x?=
 =?utf-8?B?VHR4bXo1Nm42Z2x3b29RMGFTa2VYMWhZQVRUZUM5TndBNXY1R1AxL3lpay94?=
 =?utf-8?B?MWJ5WDk3bWRXR2t6YW92MEdob3drV2VYTWZQR3FXd3RnbE4rS3o3bjg2NWJn?=
 =?utf-8?B?eHBkdFlxNzFyeUU3TEpPZ0d0Tm9jTjJuS1oySUlKZFlWR2R0S1kxbXphNERv?=
 =?utf-8?B?dUdzZzBCQ3k4dzFmclIrK1RPVnB2a0tBblVzclV0Qnc5NGI1bVR2Z0ZmQVY2?=
 =?utf-8?B?bEdDMnhqdzZVLzJqVUtucGQ2MkpsbDhNTzg2bVBheGM1U2VxUlR5VWFrZXBD?=
 =?utf-8?B?MmRUYWhlcFUrSjk1dnZscDNlRjBiMkdGMWtoSVpkeTlsWGRCYkRBSHBMaTZn?=
 =?utf-8?B?SE9VQ0JxbjZTeEtLYXJCQ1N1bDBJM3IzcWQrVjAxWjdpbUk3dHFEU1pVb3Rk?=
 =?utf-8?B?RTZMMFlyZXVDMzlTalNaZzVOOFVHb0IrN1NjZUE3RVkrQlNNSjc1ZEowT3Yy?=
 =?utf-8?B?UTJIWVY4WmwzaFd6bkxkOUJCSnlGUm1sWmlpczdRWEJSRUthalZTYlRIdGZV?=
 =?utf-8?B?VW55UlpHQ2JCOTMva1dLcmM4UHpyV3E3MFBvQmlUOFdBM2Q4VHQxbDYxTkUy?=
 =?utf-8?B?blFoT1VwZWtla3EvWTNiakV3SGNrTnV2UHRIbFgreVlDOGg0RzdlUWEzWVBQ?=
 =?utf-8?B?bXpiK0ozYkV4Z0taVXJkREE5YkJoaTk3TmUzc2J3eTNNTlFJK0FoY0ZjMXFZ?=
 =?utf-8?B?cG1oNkxleUdrZ1g0bzhCSzVGVUM1WDBHY1VDOHVPTjlCM1lnRER0eS9uVVli?=
 =?utf-8?B?N1F3TVNQSTcrZ092RVJ2SHExMWN0VmEwaWhNQ3lKME9RNlFLSldQelM1ZDlt?=
 =?utf-8?B?OWJXdDdQbmFob0xBTXJESXB0M2xiZEs3QXpGWUl4VGgwc214VkZucUQwODU3?=
 =?utf-8?B?b0FCWTlsZ0d2cVFYSlRhdkIvcE54ZjRMdDZKV2FvWFMyMU9zeU95ZXFrTEU3?=
 =?utf-8?B?Y1g5SnN5L2FhbXdZYXkxRUNrTXYwWWxlZ0J0ZXFnMzZObFRLN2RDUGs1ZXJn?=
 =?utf-8?B?cTRrcEhLaExJNk9YQ0hhLzdGQ1pkZmQxUHZONVlqWXBUb0VTUmRKOVFXejZL?=
 =?utf-8?B?TDRhYUI4MDNrY0tQTWgvVC8rN1ErZjFwWlFCcis1V2R6VVgxeU5HYzdNdWtF?=
 =?utf-8?B?Vllia2w0UVVwa25jeDBrLzduRm5UbHFvTjUwaWRyZWJxRC9vTTBVYzI1L2Fs?=
 =?utf-8?B?UXN6dzQ5eVBwZDFDOUZBWERYNEt5UUYrNFhTUk5TQVZzUWpNNDBvSy92UlRD?=
 =?utf-8?B?RDZadm9CSDZjU2trUWhoeFpzbU9jR29INmZBdFpOQWNWSnFJUitDTCtoNWRi?=
 =?utf-8?B?VVpFK3U0bDF1OEFiYWg5cDdiVmUxMGFmVVZacXFsRWtWbDd5TDZQRXNNSmRV?=
 =?utf-8?B?RitjWlplaFBXME52SmtXRmk2NTh0MVRwQ043d25VeUtWTTFuRUZYMnpNeEdX?=
 =?utf-8?B?QlFJTms0R0V2bUxUNTRmK3ZncUNOZkJqR1FXbmkxL0FjclJ4M2dPRXFMbity?=
 =?utf-8?B?anlJc3pFYkRVdnIwVDJ4cTA5QUw5L3ArcE1zMndqQVZMaHRmM2Y1WlVoYlZL?=
 =?utf-8?B?blNGVTNCaDdiWHV5RDlFRm9yQU54bWNiOU1hdEZaQ3BYV2FpTlFtZVFpTEhR?=
 =?utf-8?Q?4wXeoMoJ3OM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtsWWEwYXdYNloxTUIwY3cycVQrQTZ6eU94UFFzUHJJUHVaUEVFZWpUVkVZ?=
 =?utf-8?B?VnVkb3Yvckd1dDZtN3dDTEg2NWlMTlRob0xzRUdrcGlSSnFwSm54elJYQlBj?=
 =?utf-8?B?ZW1ITHFiNVdzTHRJM09PaVlpVzMyNnV2RWRrRkdKU2ovdDg4Mm5ZY3MrNWU2?=
 =?utf-8?B?N0w5S240SzBwYmZnRXhkZ1dYZFpubWFSOFMyS2JONG9BU0NMRG9UaW5FRDZF?=
 =?utf-8?B?V1F2RkkyVEZTSjc3aGExUjlQY254NmJnMk1HVlpyMmxtcTE5em1VV1VLZlV6?=
 =?utf-8?B?WXdyMVVHeGg0bG9FcHB4dkg3R3R2ZnBSYjl6SFYxMnhJTWRZT3lsaXhKa3Zj?=
 =?utf-8?B?Mjd6LzNSQ1lKOXJDY2JJbE1JMDVtSHFIemExVHB4ckhZSWZkdjc3cmRnUjFS?=
 =?utf-8?B?YWVKYVZITm1IV3JLbWtKRWY2V24vdGVCdEV2VmVSanJ3UzZ4UENZaDVtUDlZ?=
 =?utf-8?B?Ti9UUEdVdHc0OU1PTlFBOGhmck1Zazk2OVkvMis4V1d2V2FwUU5hU0ZiblQ1?=
 =?utf-8?B?c2l4R2p1cUErcVdQekkrcW1zdU1wSVJNVGlhdXpacE9HYXl0N2lCTlJGNk01?=
 =?utf-8?B?enRjVmJGTnBRUXFvV2QyM3B3aUwydXJ0SkZrdHJxMC8vTTRKaTNxa1Zjd1p1?=
 =?utf-8?B?U1BhdVRQVlBIL2dmU1daOGtrazB6dGRTczlJRFBXNFE2U0NhelRQUnk1VjRY?=
 =?utf-8?B?a2hTdzhiTThxckE0bjZSMVN6bXVMMEdqNkp2dnNFVENDaG1KYkFPRkZ3T24z?=
 =?utf-8?B?KzBpcWRYZWliMmprdTJjcW1MZUhWbHY0Qk84QzNVNlFrWW9GNnI5WWl4bm9U?=
 =?utf-8?B?bkFyemFFNCtiREZzdlhEcURsck82OHhZZjEvTGllOTBMa0tFd21pZUp6MG5j?=
 =?utf-8?B?OTNSbEdFaW1Fa3FQUno2ZW1CUlA4TUJnaVRKMklvcnB4YnVlRXhkcm1CdGJ1?=
 =?utf-8?B?dWljdERocjJGM04zL2t4OHRKeVBjeTRHS0NKWWFsNnpIWEREdzB0bE1xR1ND?=
 =?utf-8?B?SWNrM28wbjNEaHNiTmlwS2xHZWR3a2EwZTBLcHRKakJFMG5oRGxmRG9XNnAr?=
 =?utf-8?B?TENNN2xyTFJOeGZiOWowa0JPRm1aejlZRzVnQktqVTY2b0tvSWxIUWdqaFJO?=
 =?utf-8?B?N0NiY2ZReDZWQWFJb3daY3BuQnhxNXhTU2lkVjVPeUZxNGpyZzZEdE9ub1FI?=
 =?utf-8?B?aHE3eEVyR3Uxb0RPWFg4MG9rSmxOaFlJcmg3UVJ5R2t4SlJyV3VidDE5dy9Z?=
 =?utf-8?B?YTZqUGlmdTZrckozcjBNZit0SFhkWXNLWEVvSmszQzR5ZUthNEQ1eThVQWYw?=
 =?utf-8?B?K0Y3djIxbmpjYlVTWVVISTBheUJOckxvV0NMZmdrSUxGamI2R0dsVDl1ME96?=
 =?utf-8?B?d1RnSFg1K2wwNSthVnllcVFiSzdQRDZFVGJ3Vk1RY0U1eVRUaW9EUnFkdUxu?=
 =?utf-8?B?KzBxWW9UU3J0SkJtREdrY3M2WFVaY0FLYXdKaTFUdnRxNHFGNTdCazhxQnB5?=
 =?utf-8?B?anRLaWZCeVJVeGloNHUyQ21TMy9CV21PcFpKeTllNXRMa3E5SWltZ3FBTjJG?=
 =?utf-8?B?MTFReEd0b2JDUTZGYzMxa0ZpOFo4Z3RQUWNHcDRPSWc3ZHBiM0Zmam9nTUJo?=
 =?utf-8?B?Z2paZkQydGlkeURLY1dyWGd3ajAzY1NGV1J6RDE4b013eTdBOTBJc3F4V3dx?=
 =?utf-8?B?cDFoZk1TZmlWRE00WmI2UkJBaTlvQklaZEw3blZUajNQbWozVHcwQlVLZUxu?=
 =?utf-8?B?RjBRM1dDNEdVbllZUGl2RlJ4cTRyN2lLZ1UyN2NoS3Axbi9SWVljWnQrbVBp?=
 =?utf-8?B?UHY5N2F5QVRuNDJtaVgzNWl6NWxZWm54cXl4Um4yKzdNb2IxZ3UvUUhYVTVM?=
 =?utf-8?B?azdudi9qQ0VUeHBjZ09hUXpRVlJYNVJJVzVQajV5dzI1TFFxb1lVTkpiR2R6?=
 =?utf-8?B?enZUbUdhK3M5Y0UySEpISFFtOG9rbXpQMmI2Q0ZDdS9ndGVZaWIwa2lyWGtH?=
 =?utf-8?B?b3FoZ0F1QnZ2Q3ZQUHFZSE5DZDEvQWNVaUpSbVVyZFNwaERWaEtYMS80cTRv?=
 =?utf-8?B?WW1BcmNML1VnK215UHp5TkZObFJGVFc3dmRWYmJZVHYvYzh2RmhzOSt1RnA4?=
 =?utf-8?Q?6tMBydmS8LSqkb1ZjMgRNNJk3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc417a85-6c52-4af6-4c3e-08ddbe9286f6
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 02:44:29.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7c2Fsmv23x4GavO2je2l5DJgjvj/3Y9VrH1iOHJ+B+Rr7Ia1hAuOjTGxzRdYAlpfpAyQvzMB+lnqrSFD+y5Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6957


在 2025/7/8 19:06, Jonathan Cameron 写道:
>> -     for (; i > 0; i--, c->count--, c->buf++)
>> +     for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
>> +             i > 0; i--, c->count--, c->buf++)
>          for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
>               i > 0; i--, c->count--, c->buf++)
>                  st_i2c_write_tx_fifo(i2c_dev, *c->buf);
>
> So different alignment form what you have.
>
Thank you for pointing out the alignment issue in the code snippet,
Will do in the next version.

Best regards,
Qianfeng


