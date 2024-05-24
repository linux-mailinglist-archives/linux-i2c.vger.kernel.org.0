Return-Path: <linux-i2c+bounces-3673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880E8CE396
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 11:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037961F217DB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 09:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A185628;
	Fri, 24 May 2024 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vF+TXvVr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53285631;
	Fri, 24 May 2024 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716543355; cv=fail; b=SwjPKigFeyYJ9xy4aYi+kRbZoA+FkQLnzhQFV6/Pu1NEiA2kPcQKRqqLwatKnrOmg3BSSTHea2O3v/Ant82fEUw/SDIzHTio7j1WJzSnfRluJaWxp5vSDnIniztGvB6UJdUixWHrzodyadYY4v0/ovwPd4T9u7hd5v53gfhotqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716543355; c=relaxed/simple;
	bh=DGhs8Zo9gCtySHTJCOdxZx24xhztfCaI3kwkpn1635o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sq3qomCpxyIi87yKR8NpmeLXFnU34417xseOgiu4D3IHuQp9aB+4D72tF1aW28ceMUIKpVic7WtIHNOCf3Ed37ZgAB/DZynd5xnh8gIsGEydqdXIRNcf/P7lal8Y5pXSxJv6WVa8vuUpP+bfM9qNtxYwCjq1JO3SojfY3/k60cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vF+TXvVr; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmtiad2KvMoA3zay8fv9eCbnM2mzQ7VZkFSXPCpz15n0YQbCOESKDNFchv3W7mjxk4a8uXfzn1mDpT+qwUuhUiFjXt378Zf9awQ1suQy5KDvgqQ3G5IMLeU+5yMCSYil8uA1AtrAfoqNYtgKy/IHtoBxyJOyUiCbk7f10NRET5bPEpr1w2LXIqu6TFud+zUfaIlazWo07jmOGBUZ1l2+oDy4EhdQBrHUPzzsAl5JyNYsj9aJQEmu1aTs3NEPTk7dVi5CB/taa3GupZQcgf/6F2K1VTCZRVMkCbvbJVO1P3fkTP5hvmV7bo4fEKFdkVYNVQBVTYrbHf/4RWHqx6WNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZZ/9NiFo2w8/GQyfj1SMfb4UmW+TYgEwqu2aKLSyns=;
 b=IkXt5OJl2dFh0DFsiXGlFbx8g+tjATIbJpIvNVATqMeMooAWVqNwzCrWgjEI4siwbPsmhdjmqR5eFDE5CQWTuj16wFvYfnAqCCkopsGN90fEKpYsiNPc6WxPGZbf84VJGRdsWy8yzGi56+NtaUHvAv0U9M3jbRoVmugic6lpttb0vZt4F/YfuothLsozY5YuS7Gs93+tC6WLjHOi0hN1zRR9teBAJ1pyQ2wFYWbg/rHaf6Un9IJRTn9jVRK9ynUh7FMPvz+lkDbG9RFNkwKZsLsHmpzXqH24TURuT1UcbhzLuffmfLDjY0TsAsshf3CwfQNq5qzI/ikNDJEBSSoqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZZ/9NiFo2w8/GQyfj1SMfb4UmW+TYgEwqu2aKLSyns=;
 b=vF+TXvVrLBd40TBTwkRb07Aq/6YD7wA1kiWaRxanllXVBq9xINbrS43J5/7qoyeDcNbk/ecbVICcyocSf+vw39dlVMC2Ve4RMntN8hPDAcJ+fCRXGhhu0q9LtP74mDm1OGotVN3fuOJw8TFTmv1iFdoYC89aLY/NIbeh+k+a7mA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 09:35:51 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 09:35:51 +0000
Message-ID: <88d22b96-2754-40ba-a8d2-dcf4880446d6@amd.com>
Date: Fri, 24 May 2024 11:35:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: xiic: improve error message when transfer fails
 to start
To: marc.ferland@gmail.com
Cc: andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Ferland <marc.ferland@sonatest.com>
References: <20240513160324.3761564-1-marc.ferland@sonatest.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240513160324.3761564-1-marc.ferland@sonatest.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0147.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::40) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b914e5-c4b3-4fe6-f26e-08dc7bd4e699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFQvcHpYdHVGRzl4K1llNys5NXZ5bUJnMUVZS000WVhKV1B2bUNIeEZrZ0tk?=
 =?utf-8?B?QldqQTNlUGJNamdhd0h5TGJxMGpwcDlyTVI0Z2UyS3lkT25TckQzR0lOUDcw?=
 =?utf-8?B?YjdoZFlHOHB1OTlvTVdQSW9aR2lOZkt1b2hkc1FxYXVMdXFGNjJmNEYwY0g0?=
 =?utf-8?B?U1BycXkxUDFUTkNHcldRTmZCWGxrb05XZDdBL3pWYVV0Yy9hNnpLcXRnTjBI?=
 =?utf-8?B?cXRvcmpTd0YwbWxQT3psSTBrL1lqSkxHQjZIMmJjWWNCUG1CUXdBVk4rTHI0?=
 =?utf-8?B?dzdKZHc4cFgvYnVKOWpkWGNNN2JKUjBqZ0dVSStQRVBvMG00eFFsWWdQdllS?=
 =?utf-8?B?dDdkd25EN0hWU2pBNlNCUWs0ZW9rRmVRTlNlbVdIRW45dWVjak9ZL0NQRjNm?=
 =?utf-8?B?Z3g0NmNBZmh4S20yTENPOXhVVkdVSEJzYjFaNng5VU5SSTlJRy93eUlPTVpJ?=
 =?utf-8?B?aUdsbGpLcEVCS004OWtiMGVncUk2MUtNQU9aQTU1UWlJcFZkejlPZmRpd3V0?=
 =?utf-8?B?bGtkRlJxRy8zbWdleWZXdWttYlh1MlFxZ0RiYTNzTllsdEtuajU3M0V5bXJI?=
 =?utf-8?B?L1plMVBKNm5tRGRFOHV5c2laNHBlT2RtK0VLcm1sSWtIWkxnV3pQNWZVem1s?=
 =?utf-8?B?VDdpNmg1K3pOQkxpaWZmV2RFNnp2VFZCQldXTFBLdEdEbUI3UjRJNWQ0RmlF?=
 =?utf-8?B?L1JYUGErYlJUNlEwNEtFZStYQ1ZLeFB5d3BmTUN0ZkZoMVJnOWlqcHhacEZP?=
 =?utf-8?B?SHEwbjZDUXl1RmgvZnFZemIrMlNQbFdzdGJuVVBubGZ0QU8xNGZ5Uk15WG9z?=
 =?utf-8?B?eU53SDh2cmMwRGp4dFB2QVFmSlV5UlZac2FEeWpSWk8rTVF1UVAxY2FPL3k2?=
 =?utf-8?B?QTU1c2tSMkt5SzJ6WVJaaWh1UG5YalBINFlRYnFGNG40RzBxSjBMODlnNDFM?=
 =?utf-8?B?UTBzODBNeW9yYTZQQ3BQMEFVMHlZb2NQUlp1aU9qd3VmQThTV1BhRGtZMkN5?=
 =?utf-8?B?bkxLNUJYQ2VUejVCeDl5djVudlBpUmI5eE9UQ21lZGxjcXRXd0ROSEtNSkV3?=
 =?utf-8?B?dSt0c0ZZZ3paM0xrZkp6b3dwbWxkQ3I2ZFVVRE9GMHVETmQ1YklBKzBZMjVz?=
 =?utf-8?B?bHdYWGlWd1BFeEFNbTZCeEZOOW5lU2h1Nm1qT2ZVVk1Ob2hUeWtYMGs5U0p0?=
 =?utf-8?B?Q3hYdXRGczJOQ3VFZzZxUFc3MDBqdXMzaVRVVk9BVFNKQm9YSlBqUW52YWZT?=
 =?utf-8?B?aEFKRjJPQU1Cai93NU1laml4bWNNbTZrYzdQSHNIa0RySUJkd1pyZmI3NVNh?=
 =?utf-8?B?Wnk1RDFxMXZuMVFwcm94aXgvU3FJckdrbHh3U0RtMkxmVXZ3djRzLzZQVVJP?=
 =?utf-8?B?TC9yRTE5SVh4YytnUVRlY0RQZDBVaC81UnJFSGhGYWpmU0VOOWxnazh1RnUr?=
 =?utf-8?B?YkVleDRNSFBnMStMSHFvSHNiYldLYm5oOFlBQ0l3NkRJLzNlTEs1YkdISmly?=
 =?utf-8?B?NkJjTklvTjNKa05ta2Y1dWhISEpxUVJuNVJFblJtTXhJdzZJSUt1NStlU3ZI?=
 =?utf-8?B?Qk1uYlM3a2Fhcm41SzM2U29RTnNvbkxXSUM1V0d6Q0FSMEpaM09SdFVDZENR?=
 =?utf-8?B?M0F6T2twQ2dqeHp6YUhJSmQzK3RCeGlwcXlkVjRxU1p0Uk8waXo0eTNPNFRN?=
 =?utf-8?B?V3lrblNFWSszcG5ONWtwZ1pzRkk1Nm5JVE5sQzBXQktoYXFGang0VzBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERtRVJrbkhNcE00N0lLTllnZHF1SGlwOFhINGI4dmpkbGluMkl6aHFtNXVE?=
 =?utf-8?B?dVZ6Mmc4LzRQd2Q3cDhYOXp1SDFsTzJuS0d2d29kUG9ycGxJaGpIYW9sZFd0?=
 =?utf-8?B?L3dDRDZRaWxlaFJhY0lzL0d0OU50b3FVMzFVYllYU29GVHVxMXJKZHh2RXVk?=
 =?utf-8?B?SlR6ald5Ly85YVVRVnJkSFRvdDJ2UTZ1cVJiKzlvbG5HWDdQbEpkY2pJUDlv?=
 =?utf-8?B?czA3aWpWVHdwek9EQ2NVL2dUK01JQjlwRTRxQlIrY2F0UmR5OTlaMnNHbUZN?=
 =?utf-8?B?eVkwUEk0akE2V1JEejMrZWFma25XOHFyOEg0emVWcWNiSElIRDNDVS9aWnFn?=
 =?utf-8?B?NVNLUTBNSm04U0RZMUdNOE5LSHV0SXg4TDA3aFQ3SUdScnRpZStUOEt3RTJ3?=
 =?utf-8?B?SUFkcWQxUWpVWEx4SC9UT0pYQjhDSDdEdEFCemYxbGQrRDNaQXd2b1FTMGw0?=
 =?utf-8?B?aFVqTzF1V3pWZlhTVGYwYUN1TGxPT005L2dOM1NLSFFZZTZvMkFHRUxiL3A1?=
 =?utf-8?B?TFZ4Y1RJUEFCUnUzQXdDNTdMQnRlSXhOYW1rcFJuOFVENnplNkJyRkY0VTBk?=
 =?utf-8?B?QS9ncTJTbk9XdlVGYWdES3cyNGRvRlgyR2J2bmRMSVpjS25MSURiNEIydzVV?=
 =?utf-8?B?Y1RiRG1OTjExWU1CdEdnT1JMVVNCMXkrVFgvekJNeWtDay9MR0ZGRGc2UjJn?=
 =?utf-8?B?L082cnR4OStjKzcyalpzMytVZUFoWS9CTzJFNW4xN1hIdE9BeXl1cWNuZVZs?=
 =?utf-8?B?RUM0UVpleUl4MmlMWjRZckgwRFU0NHJ5cis4ajhpNzJGbVB5OXhCQ0EzUlpH?=
 =?utf-8?B?REtVRmZSZ0t0MEJEUVk1dGIzN21PVUFKbkViVjBYbWZVK3lQSGlnZWhRRTNh?=
 =?utf-8?B?dm0xWTQzbkN2dzdzR21nOTZIWjh0VjJzUU15N1YzS0JJbWhIYVg2Wm9ZM1ZU?=
 =?utf-8?B?MjM2dFBOanJjek4zRkNXSDZaNldXcU5adCs2RVA3elpKWnMrci9ZN0hkdHlC?=
 =?utf-8?B?Y0prczRKOXhCZGNneGtzSm9vSXZaUUJ3QjBKYi9sekNsYjNOV2M0ZmtENTNz?=
 =?utf-8?B?RjA0aEFxajlVUmlNT3lRbm9YQXVxUXpkWDZGWERQbzN4Z1FJMkZSTVg3QXh4?=
 =?utf-8?B?a201dmlPOE9tSG5XSHhvWmN3azdmVlZIeVZScmdSWFBNeFcvdVRJblpCU2R5?=
 =?utf-8?B?YkRsaE0yV3hKbVhuS001d2pCelNiekJ0aHFXNDVURWlaSjdzUXJkbHk2NlB0?=
 =?utf-8?B?c1FFY1hIQmFGY1d0SEpjZ1A4MndEclF1K0FROFhQUUxRTTZFM1hQb0dLbGdU?=
 =?utf-8?B?blA5MTBOQmlIa2lBVFVzRWJxZzY1azk0NDdwd3FTeDcxb2FGYlpUeGY2TGV3?=
 =?utf-8?B?VVROMUxXTU4ySytFdzJjTUg1czBlZnFSMTVVVDJ3d05yem9jV09PaEJ6QnRU?=
 =?utf-8?B?QkhpdmdlYkxkYmpveXRXbWM0VG5JdDd0RmZ2aUN6Qllnb3lldXZaUmFiZERC?=
 =?utf-8?B?UUhOVDJ3aEQ4SnlzbUJxWU9lRWh5ZHFFdC96QmF0ZW5SWEoxTlE2SG1maXYz?=
 =?utf-8?B?MFZCQ2FpWFMwV0I3c3ZrTFlxeTl0TkZjTmlhMGc2NGpKblVDZDRLL2pNd08v?=
 =?utf-8?B?RXpESCtjUlpUVG1KRzRBT0wyUzhDS1VBcmdCRlpmMU1qdnNPeEVpTno3ZWND?=
 =?utf-8?B?K25mTWNwUTVUM2wrellsNjhiMlUvZ0ZBZjJ4ZVBPOUIyQitwSmpqZFYvNjZT?=
 =?utf-8?B?clZtcUZUcDUvSjdOUVlyZkg4bEVYNkxUNVRsOEhzMEpDcVZpcnVGd2R0ZkQw?=
 =?utf-8?B?VWd2YVB6ek84RmlKTXhGbmxXQnBUWjlIMndkY0x5TUIrZElPTk52QkIyR096?=
 =?utf-8?B?VGs1S0d2MGEzTlBIOGNQa0pLa3o3dmpIVFcySXlnNUZGaUVIOTh0KzdxL0c0?=
 =?utf-8?B?Vks3SThEcFRGSTNBNzVsdUwxbUZ4WUZaNHdtUmdROVprZGVTVlVEWjVQeEJW?=
 =?utf-8?B?VHB0ckxsb0Z1ODN1Ris5WmYzT1ptTU5haEcyNEh1MDd4anppVWZGMzRwd3E2?=
 =?utf-8?B?MDdsMlRGSkpzU2R1L3p5V3BrTUczOFh2ekNHcDQzOEtPcytncW9Td0pMZ1VG?=
 =?utf-8?Q?46uustfVOckmcOZ0mHIiIosON?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b914e5-c4b3-4fe6-f26e-08dc7bd4e699
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 09:35:51.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/jk3ipkoWbkt9Gm/uIHVBg2aEmWVV/ScwcdTSNsTDe480GEgjjV1UZjsDqlzXny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384



On 5/13/24 18:03, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> xiic_start_xfer can fail for different reasons:
> 
> - EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
> - ETIMEDOUT: timed-out trying to clear the RX fifo
> - EINVAL: wrong clock settings
> 
> Both EINVAL and ETIMEDOUT will currently print a specific error
> message followed by a generic one, for example:
> 
>      Failed to clear rx fifo
>      Error xiic_start_xfer
> 
> however EBUSY will simply output the generic message:
> 
>      Error xiic_start_xfer
> 
> which is not really helpful.
> 
> This commit adds a new error message when a busy condition is detected
> and also removes the generic message since it does not provide any
> relevant information to the user.
> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
> Changes in v2:
>   - add a message where the error actually occurs (suggested by
>     Andi Shyti)
>   - remove the generic message completely (Andi Shyti)
> 
>   drivers/i2c/busses/i2c-xiic.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b9ad935d7ff3..afb242be456d 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1114,8 +1114,11 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
>   	mutex_lock(&i2c->lock);
>   
>   	ret = xiic_busy(i2c);
> -	if (ret)
> +	if (ret) {
> +		dev_err(i2c->adap.dev.parent,
> +			"cannot start a transfer while busy\n");
>   		goto out;
> +	}
>   
>   	i2c->tx_msg = msgs;
>   	i2c->rx_msg = NULL;
> @@ -1173,10 +1176,8 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>   		return err;
>   
>   	err = xiic_start_xfer(i2c, msgs, num);
> -	if (err < 0) {
> -		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> +	if (err < 0)
>   		goto out;
> -	}
>   
>   	err = wait_for_completion_timeout(&i2c->completion, XIIC_XFER_TIMEOUT);
>   	mutex_lock(&i2c->lock);


Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

