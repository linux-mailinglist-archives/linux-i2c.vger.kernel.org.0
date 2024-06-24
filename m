Return-Path: <linux-i2c+bounces-4311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27BB9154C8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00138B24911
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 16:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0647919E838;
	Mon, 24 Jun 2024 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="audRNkfG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2101.outbound.protection.outlook.com [40.107.104.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71119DFAC;
	Mon, 24 Jun 2024 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719247768; cv=fail; b=DJPvPgR/+gXAWR9bHyb8MURdpNjQj1BEYXX6SKzI9s+D+DGbpSnJ/HyUEl+kF+/qd5MRC9RGa9SKNQGVRPERyG08yPvZzQ2IfVMUz9wXmI1AVwqHWHAMSY7smalE7HZu6ll4fvv2WnwTXoGtNp4D4eW8oamVVI71zw9kpiVe33k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719247768; c=relaxed/simple;
	bh=kPGPfSVundjzfr3uxNkzz9/T0BFenDe1Xp8i56uI44w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IfzApolyynGAd4RM55t2rSa7XpMPlY/4Vqg7V4Jh0ud4uCEa/PWxT/iCqakrwjmk2ht4Q6bK6qbwjMoclQDhGARes5y5NMHGNnsbHnbVDuD3NiXuUuj8bsGvYh4cmjAUQ/EBjfn58CW+mvTkAwUEQTwPjbASDhS1dTywAyH8lCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=audRNkfG; arc=fail smtp.client-ip=40.107.104.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyWqMUaLe1/gL2hfJD/ZbCeQELQkVvlTGcbky9QMvCtQCrE2e2DIRh3IVP5weRrELEe+uQ/zjX6DrbAWq3v4M4Ajc0vuQ4awgkhvz6zokEm4aPGloajVrVNH/3nc5SzqtvTwJKKTZsbazpFfqpU8lgf15SE8l8gPT73+bmy9nYg9wPldNu5prIvA6JAjbGX3Yq2ECPv6HuNPHSv6OHdMV2XzlqAzrX1krd8wXINLFmIxoB8/qeLA7SEnOya3vRwGsQfrEyHehdVHIHA/92+KxSbBK3YMA8X6Ij4QiLE6p85wq6gGUHU1arBpNE/EfRqOxLOuzZR6mJJIuhm5q5F3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4P0ukP5raK5cf9traNdXz8zmugJXm5MwHFQT4ceAYc=;
 b=EMPf1WFuVQ9SN9ihlh9qrBJuGLekFabshgFjPYxfGWA08TfxH8MkfITQMMOldyAxZo2ymYMe1WogFkwS5KeO9hdnzg2bge+a7ilfndaFYnazRmjHkCjvNQXP5UJVDKGZVUYOMaSuLk8sFV69HMhnK78ghZ2RsilrVWnwBSGFib6f9FqzRxeIRmKWTVYMK62L/yoPNBLtG1OvG8mW0IGJFftACXLCu5kKb3Lzp+ud/ahBdiaKMT8RIpLS5A0Wh5Xub3h/qbVhvLn85Fzk9N47bRcAe+k8/UxdDw52PJYqO62t0pjtHrRmUTxkDFC48c+cw7NCR6XyZZZvO6jHp8TyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4P0ukP5raK5cf9traNdXz8zmugJXm5MwHFQT4ceAYc=;
 b=audRNkfG1w+UUFwb9i26jGb8yoYBz8M+Ugak/r0DJNnBgPn/ZHm+MPpmD2VltWwmuXblvaL9wrREg0RJweOmaION+Gk4mWi71uD1ZpPUNh5DoUDiJAl1lpnnWkYv+9WzNVv7tQkYtFN5sHyM4yEIcRzyRKhuh8F890ZV0c7bw6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by DBAPR04MB7288.eurprd04.prod.outlook.com (2603:10a6:10:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 16:49:22 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 16:49:21 +0000
Message-ID: <85b2061a-9f5b-4998-b9cb-21308ee1965f@cherry.de>
Date: Mon, 24 Jun 2024 18:13:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Guenter Roeck <linux@roeck-us.net>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
 <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
 <19ee521d-298d-4718-bdc6-f282666de371@cherry.de>
 <2a1ae708-3718-4f70-9837-bcc50b7c8f66@roeck-us.net>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <2a1ae708-3718-4f70-9837-bcc50b7c8f66@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|DBAPR04MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9776adca-a603-436d-c624-08dc946d98bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|7416011|366013|1800799021|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0VIVUlxRTB1cXVrWEtZOG1XSVJsMWxNZEg2NnNjZ29iUzZZQkw2QjNyZ0Nk?=
 =?utf-8?B?a1pKS0Z6K0JCZlZkU2xSUXl2Q1VUMlpyRVp6NWFaUUJrQkt5K3BUZitLZTg0?=
 =?utf-8?B?c2VkM1A2NWV4RW40WmlNeFBxYmhYS3FRRnJNK1V0NSsyZjVOTVAySU9kNVdx?=
 =?utf-8?B?b2ZZS1Jsa0RVYUM0Uk9neElOdmJpcFY3VVVWdXFXeDFURllWbzBOS0w2VU1s?=
 =?utf-8?B?WHlPYk1iMU5yQlA1elFDd3ZOYlNiVFJlS0VtdWY1cXduQXhiYWl6N1Zid3oz?=
 =?utf-8?B?dmFuVG9kQkg0NytGVVpDZ2FkaEJnQ09objltbm5NNTA1bkh3V3VKZVk3TVFr?=
 =?utf-8?B?WklXbm5jZitFTU5QNVpyOEkvQXNEU1dUS0xITVdjZFF2S2pUUm5JenBFeXp3?=
 =?utf-8?B?bG4zcjF4c0w0NDgzaFlLNk9iU29ERS9UUVRGOVdRSEJuSmJPSUx3cVBkWnNE?=
 =?utf-8?B?T2RndUV4UVdKenYyRytxREtxbEUrNkpHaDA4YzJ3Q3ZiMmFrMEhQNFpsdjdp?=
 =?utf-8?B?WXl4VlJVUEFuSlFGYWVpbjZSUTk0U2JteUxobitKdUt0Z2xOZG4zQU1UaUN1?=
 =?utf-8?B?ZGFMOURSbWtuaGV5YUUreVk0MzlkdHZyWkFXdXNiVC9JWnM2akZmbU5mVkpj?=
 =?utf-8?B?c3B0dS9Wamo1RStRYmNQdnlQQW5XRDlKZldmUFVYdFBvTmJ4MDJXNWtHY0lU?=
 =?utf-8?B?eEd0RC96ckVOR0h3RktBcnFjOEZ1MG5PTndXZjYrMXU0ZWkzUGl2QmNzVlhz?=
 =?utf-8?B?UTMzd25NNTZ3NXk1WEcrQU9KUW9pQVlud3Fab2w0NVplNmE5aHlMOFdvYUVE?=
 =?utf-8?B?N2VvZGUraWtKTDJLbFZibE5CdFFJR21ndy9UQW9sWGZFWFNTaXRjamVoUm5v?=
 =?utf-8?B?ZFJtWlRXa09rUnI5OENXaWFTcmZTNFpsN05TUmw5OW5BcVcrNzJGbmV5WllM?=
 =?utf-8?B?TUFQdE5TTlM3a29laktNRmRZYm1yYlpzTHV4ODFGWUJ0QTdsRS9xNzFOM2FH?=
 =?utf-8?B?Q0l3SzY3dDlhcEJFMEJFMUhWRitmdXJ6U3NqbnhyRFNpTDBkcTJEdU52dXlK?=
 =?utf-8?B?V05Oc0VxTCtJZUFyS1EyVU15ek9mU0FoSWhMUERianVENXpqdzJhR2pZNzIv?=
 =?utf-8?B?ZVU0MzBGbmpNMDJBRVBtd3JySGlnQlZZWCt2LzlzbDAzWndDem9VNW1jcE40?=
 =?utf-8?B?SUwyalZTcGVDWEJqTi9mME4xMHNhcGFrazVzRmlFeWhlS25qUUFPb2VpMzhV?=
 =?utf-8?B?aHdxbWhrRlZPL1FDSVAxOTRLZFlNSFRNbGZwNlQ2VlFZTHpmL3FPeUJLQzds?=
 =?utf-8?B?VnorbFJoR2svL0FFdDQvTmJiQk9adjM4ejE1SEhYT3ZpSWlpV0c3TlF5RTN5?=
 =?utf-8?B?aVM2dDNwbDVoRGE1eUVXVVZvekZaQ0lHaXB2N2pVRElDcko4dkJIeXJ4N3lB?=
 =?utf-8?B?MUEwallXeU4vWkwrZ1BMOHZ0M3llZWwrU1c5Y25CWVdzRVc2QlZwN1NTS0Jo?=
 =?utf-8?B?dUxJUDM3QXR4eXljbU5CMWdZdWxYeERPQU9kUlBLNFVJRGFKM3hCUTBaZWU4?=
 =?utf-8?B?VEJzeWxzVlhsK3hib0d5RXlyMW4rSzJUMFJmZUF4VVlsNjQyVklNR3YzL0pK?=
 =?utf-8?B?bHhNUlhkRlgxdjhYU2hsbXNqd0ZNWmh6eHBQeWZNenVSTjVpQ2crc3ZGYUh4?=
 =?utf-8?B?dkFKczYycEdmZ3R3MUw4eHoyamNUSVhqMzZVSUlVZ3RVZ1htL0RxS0ZqSnBR?=
 =?utf-8?B?U0lXWHdtRnlBdmU4RUxTSERjRzg5c2tKOGNjSWNTWnVrNDA4SjNuZ1ZYZ3F4?=
 =?utf-8?Q?g4k8Hqlqw3Vf9lZVdLi9Y8eKDiJB5bic+j9So=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(366013)(1800799021)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2I5K0tFR2VDVGVhdlhEMXEvZlh4OE9hWTcyUmtoRDY0UnBydWoweXliMlgw?=
 =?utf-8?B?SFM1RUJic0RBejZuL2JsNlNDbjdUZFdLOVcvRllDU3JvV1RJTDh6eXRodnJv?=
 =?utf-8?B?eXBNVTF1ZWQ1UWg1dnJMcldtMHU4UkRxVVZaOXNxaHZ3bHZLOEpzdEVXRzRn?=
 =?utf-8?B?UVBERXpGQXpoSkxiQjhjd3cxUjdJUDd0eElndjNWR2JIcDFodEVnbElJRTFU?=
 =?utf-8?B?U1Z0WFVSQmR5M3h4bHlteVloWDdmU3ErUkpSUk5Cd2YydmFRS2VSRFJLaWlC?=
 =?utf-8?B?bm83Y1RHYWRiZ0VYWHc5b3pvWWZ3amFhUG1kR0dlZm0zQTY3MUVGZTNxTjFh?=
 =?utf-8?B?bUFQWDdCRytIZ0NsY09MYTVrNzlkcUxDWWZoRXEyTXVtYVFTajBMYmNwTk9G?=
 =?utf-8?B?Qk5IUWRud3lCcmR1QWFIZ0Z3cGpBY0pteWwyU3lkRUpaTWpkQ1U2L09wS0ph?=
 =?utf-8?B?QUYrQTZEdFpKSEtLTlBtaCsxRE83NTJ5RnFmdmgyU0ZCaVM2aE9nRSs2cnJr?=
 =?utf-8?B?ZGxmL1lTbnl6STRhUmZmUXlvTnZwc3lXYld6cFFXSlpSU3RCZHlNLzgremVX?=
 =?utf-8?B?SWtXNnkxcGI5cUM2MnBQNWVhTFBGSHhOa0c1K2JodUYvN1laZHJZT1EwaGk3?=
 =?utf-8?B?ckh0TG0vNXdXLzFZZktvbW9DQjUxOXdUZHJFWUtKN2tDdE83WlJFRU1yL0Yw?=
 =?utf-8?B?VU1JeVBaU2tWVlM2cmhJbzBLTjZDVDYvdktKWTdEMjl3VnA2OE1ZY1pFRkUy?=
 =?utf-8?B?RzJ0R0ZjY28yUExnYmw5aXFKNkZqWWh4aGYzckNBQnFncWUyRzFSWnlFVFJa?=
 =?utf-8?B?NG8yZkxFMDRxVFM0Y2tBSmdmaEI2bVZmOTd5WGxzN3YvbzBjb0liT2RsYXRF?=
 =?utf-8?B?TzF4cENTZURxaW5wWkQxcTR2bHZPVHBrckp3M1JsSzJNMUpST2YvUHRSMUlU?=
 =?utf-8?B?WXV6MVVlVzBtajBDdTl4VkkxakM0VDdoK1o2bjVyYjVEc0EvWDZQQWxvWWs0?=
 =?utf-8?B?QWU2WmVhcVhYMTgyQ1poLzhWaFNGdGhIVmNUa2dZSUM3eStTcDVpVlRPL0ZW?=
 =?utf-8?B?OTJ2NE42emtnYlUwYWNMdzNpakdldUhZWjFLeG9LcjFGSjRmNk01RDE1YTVZ?=
 =?utf-8?B?S0tYNElKYUVxTHlwSS9ZcnhpL0orYmhzd3lUKzNPU2JMUVBoRXFzbnR5aEFL?=
 =?utf-8?B?ZW81ajhIVElJUC8wSE1kWTFyZkpxTDF4MHNYQzVEa3c5TUdmMzRObWpiMnV3?=
 =?utf-8?B?NTh2MElmSmJyMUEvKzV5ZEpwVEVJZTh4QVNURyszckFFbDJydldRRHFQd1U3?=
 =?utf-8?B?QzVnRnVyeHBVMlVmYTRGUE5qdEtpYjhNU0tRSzN0WjRWaEUwV3NreEVxSUZ4?=
 =?utf-8?B?a0hvaUtFOExXQ2RDVnJ6WGtiREZJOWZrYVBvVUNDbGdzNkNpUHBOUnhMVTRz?=
 =?utf-8?B?ekxyWGFpdGptWk1rdDZteDc3WW5ZS053cytrcTFJZUNOeXd0cnRpbzlLdUFr?=
 =?utf-8?B?VWhacUQ3dDFBK2oxRTdFUUxDMlRyWlBMcEltQllDcFRxeFo1ZlcvN0ZaNTBV?=
 =?utf-8?B?SExiSGZzSkNHNFlIam9TYU5wRzE2R0lXck95bVRoQmNrdklPSU8vSW9TcU1w?=
 =?utf-8?B?NnVtRGJvdXdPTzYrYnZJeGVwd3ZHTktJaW5XQXRkck1HY3ZxTjhCMVBaOEdn?=
 =?utf-8?B?RW1qRHpUNGV0UGIvVW9QRGlhYlIyaXNHZWVxR3R5aDhaWGtVaElRODgwa3My?=
 =?utf-8?B?dFM5MCtHRklsS3loWlpxM3FpZ0wvTlU2TGtCTjJHTk1lVWVuZTQraVVDbTBw?=
 =?utf-8?B?WXltckQ5ZElQZjZiV0d1ZnVjMkxlZE9TUFJOSXdic3JlUTZMa05kcTJzMVZk?=
 =?utf-8?B?N2pOb0tqTDlIVWhOMXc1cXF2VmtzTW9mdkttVkgrZzRjVS9wUHl0bnJxa0Rq?=
 =?utf-8?B?Z1RKSERKUFFBWlQxbkFwT0ZOb0VrbXFTWGZxYnJ5ZjVBU25vbFBLYnBLbDda?=
 =?utf-8?B?dVZBVkRPUGlJSHNIWWJ4R0NTeU15czc1WU5QUS9JZVBUTTU5YUNqeGxBeGRz?=
 =?utf-8?B?alJVMnFPRlVReEtxZW5DblFNa0JLbS9jL3dtMXBxTnpzZmtJT0Nod3owcURm?=
 =?utf-8?B?TU5BK0paUGNmV2JUb01sTkthTS9sR2ZPL2c1TzRYbFRBUWFCb0VWdDlwckV2?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9776adca-a603-436d-c624-08dc946d98bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 16:49:21.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWQtWtp23KyVkhOmFkPFZyvha1dyFdp129PcY1xqMHuviGNQwfSGIyeZMkbmERomFWNzj0QCIUisi4ddCnLmyXmyF2NDuZph7esNmVeStGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7288

Hi Guenter,

On 19.06.24 15:31, Guenter Roeck wrote:
> On 6/19/24 00:45, Farouk Bouabid wrote:
>
>>>
>>> If it is properly defined in devicetree, the emulated AMC6821 should be
>>> an i2c device, possibly sitting behind an i2c multiplexer, not a
>>> platform device.
>>
>>
>> The emulated AMC6821 and the Mule I2C mux are both reachable using 
>> I2C address (0x18), and hence the use of MFD as the mux only uses one 
>> I2C register that is not used by AMC6821.
>>
>
> Whatever you do, the amc chip is still an i2c driver and needs to 
> remain one.
> Modeling it as platform driver is simply wrong, and I won't accept 
> those patches.
>

The issue that we have cannot be handled by an I2C mux because in that 
case both the mux and its child would have the same address which is not 
supported in the I2C subsystem:


i2c-mux@18 {

         compatible = "tsd,mule-i2c-mux";

         reg = <0x18>;

         #address-cells = <1>;

         #size-cells = <0>;


         i2c10: i2c@0 {

                 reg = <0x0>;

                 #address-cells = <1>;

                 #size-cells = <0>;


                 fan: fan@18 {

                         compatible = "ti, amc6821";

                         reg = <0x18>;

                 };

         };

};


The I2C maintainer rejected supporting this use case and suggested that 
an MFD could probably be more suitable.


On one hand, the MFD looks indeed more appropriate and a lot of I2C 
devices are modeled through platform sub devices. On the other hand we 
are emulating the amc6821 in our device which requires us to have it 
modeled as platform:


       +--------+----------------+------------------------------+
       |  Mule         (MFD)                                    |
  0x18 |        +----------------+                              |
--------+----->|    amc6821     |                              |
       | |      +----------------+                              |
       | +----->|      Mux       |-----+                        |
       |        +----------------+     |                        |
       |                               V__          +---------+ |
       |                              |   \-------->| isl1208 | |
       |                              |   |         +---------+ |
  0x6f |                              | M |-------->| dev #1  | |
------------------------------------>| U |         +---------+ |
       |                              | X |-------->| dev #2  | |
       |                              |   |         +---------+ |
       |                              |   /-------->| dev #3  | |
       |                              |__/          +---------+ |
       +--------------------------------------------------------+


If we cannot proceed with that then we could add a compatible to the 
amc6821 driver to add the mux device (Basically the "tsd,mule" 
compatible in amc6821 compatible list would be a combo driver with mux 
logic + amc6821). Do you think that is more appropriate ?


Cheers,

Farouk


