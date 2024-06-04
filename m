Return-Path: <linux-i2c+bounces-3786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC88FADD7
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 10:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5AC1C2205C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 08:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D93142E63;
	Tue,  4 Jun 2024 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="bibi9F64"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2163.outbound.protection.outlook.com [40.92.62.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92F140384;
	Tue,  4 Jun 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490747; cv=fail; b=Vd2P/d+okwAeTFGtrFsJWFK4Sl99ppRZhdB2XfmyMVgHiMBGFD0DGgqlsKde3s5Y3e3SkqEIXhAJiT/JoGHdeN8P6J98rK899IZ2k39jm+RW8sX/frP1ACN96rkPS67TFjs3piTJ0nChYBaKgJQAkbS9hoHOJ8UK3VSAid+un/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490747; c=relaxed/simple;
	bh=+Puh0gKnGwBRRB2HKf/WH13Mrk8HrKjtgqajyhtDTnE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EeokDNL54y5HTLMRQL/zLMIzf26mxypdmKlrABGoYM6kNCW3Iq9IrqYJNmAcG1j77AVYoHb/B9Q54QrEZNN7eOFZX6qujR1gmmJHVIawKwh9m/n3ii6Vd8XVRmw9ZAfCUlk9ergcwJEnfFaqZc75eLn+LVU3F3Clca2BGZBB5Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=bibi9F64; arc=fail smtp.client-ip=40.92.62.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROQxSu2M+7mJGdnFfiUsMMEmtOfu72/A+LRX+tgnrSfuG3FxPfO4nN15RW8YgbRx7aMoZcJX5TN6KQeN9HSpK0h+J79qyuLc0LmVHBa6ORm7Cs9B31+J1ArRnO2m3PrZc47q6eHZ/UXmE7cAXTobTxYhbo1pEgA1EBBGiatA7lyNlAmw1d2Wqbbgwezep1lusbacF8bjWo1zjgG2H+5oMEM/ZJyAm3AXRWjnwzLv0CnEQXjZsbDWnbRkO0mu1hqVALI0ADzPRUdp/cUM6Vs/r7/HVOhIBCEO4JstZ/7VK64QtAFeLWCuMzq+svc8emaXwr08FoLwO++QOXGHPSN7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srG2tahIHRjdsnh8I4SpQQT6WhmS9Axb26IIR9ZW/yg=;
 b=FwarwHGUx7C412YlBcuhk5V+DR9GazSp+BsbwrO2+2e8M3Mrwo1w7CZmzAQPVVyIyJWBAEQNMix0CpRuidoEa1w62cEiDeehxQV5zsVMlCWkmspioONrqEn6aOfeEV1SoiPSAjiW5JGpaAWcJWP4WI6OeaxlWGqZPX2C+lMVv7FexhUlumhLrE3UeFFWv93dvkQNcGYFoZ1JxedNOmRxpIuc+IWohCKRFRY0RCILbHsxUriSaHlwv8v9+hUnn+ypfwq3z+sp38k9ptZypV60P7WgFze7SoD6IkSh5D4MBBDfGd8Mw70hQOoUBDjDT8wUKeFlSUAaF91GuDuqgaFYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srG2tahIHRjdsnh8I4SpQQT6WhmS9Axb26IIR9ZW/yg=;
 b=bibi9F648hVj+wQWCgOyANylQPAm5gt1wpOKKXEnI5aRTDMiEPrjM30rr3V0T0Kv4vswmHx3/+PzuaVlPkloPOiA6RCdE/y29TQrJg4CVPOwGgtMWUfB6jIFJaRwoD5DHp5HLbWJZXRdq7tVS5WghRXT5b54HrQSMOtl/tE05KzWCHcp/mzsW+Gw02AB9C8/vR52gYbCTRbD/Zczub8xCoVVAYHbSkPt2Y7yYN6680Fm0n2Nl3pyLC/Azq36a7FO8o5jWLTjVqMjLcNIw8Faz1odska4N/HSmxlygCnkMPJ769yQaVu1lBRtbICqHqGR4gGOZGeboCMvcVb4vtpnHg==
Received: from SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:159::9) by
 SY7P282MB4571.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:27c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.15; Tue, 4 Jun 2024 08:45:40 +0000
Received: from SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 ([fe80::37cc:3733:d1e9:d8e4]) by SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 ([fe80::37cc:3733:d1e9:d8e4%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 08:45:40 +0000
Message-ID:
 <SY4P282MB3063FE1968B72C3187042917C5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Date: Tue, 4 Jun 2024 18:45:32 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] hwmon: (spd5118) Add suspend/resume support
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-4-linux@roeck-us.net>
Content-Language: en-AU, en-US, en-GB
From: Stephen Horvath <s.horvath@outlook.com.au>
In-Reply-To: <20240604040237.1064024-4-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [/ivfvdM1y5H9c1P3/2ITQS0SBxd5X+fGbl3n57VyyskfbuA0GiisLm1pDl69VwcH]
X-ClientProxiedBy: SYYP282CA0001.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::11) To SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:159::9)
X-Microsoft-Original-Message-ID:
 <60a00f05-0cca-4762-a4fb-87e49d0ec106@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY4P282MB3063:EE_|SY7P282MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab923d1-310d-41fb-e2e1-08dc8472b50c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YMd5odYv00y4+ciCzzApd19o2BY13azjxdN2miKZso8/nR1DcUK3JFJzF8DXb/7WRZUoaqgJwRs6bMxZqwKbROPbewFvucLA34aatdDQgg0OkDQYmRRsvcchCjxW4VK2XmVdWtjAB6Lp3d5TbbF3wn8TE0S76lEcp79YmHlGWxeq99Xv9yeOtBLtB2lJjp2bd3O5T4qeXzbNjPtUqPMOZsKlOosVvZYZljtuf0702k7G5p6ST6Sh6RRffw+KvqZIWWxIqixD/mzvxzABBojreNYB92uTDH4Ocwe3DHfHs8gfC90Tdpj4OjJHepu9WDKvWDQExmMBamJm2HCC98Ubadyu/amlnivBR1AMK0V8s+oWry5ZVoJr/kuL6R9pUlpTYNFAyH0ZwEUQB+78B4TT+0uivbq2Dt5l/0vCN9jAtFbUyjR7XHXZ4VauwH9SfX5PEgpQO0D0eMAzZHcxSyOHk28AKVn6k4T3ifo/X2Z4DckmgqgPKA84t2JUvqXOAkhrscLhPuc7jmIBg6kAUIwRYYNKEMmdTyAl7sZHkoydqPO8wpdxaato10NHb6O6qfw0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3g5U1NpNk5GeG5QTXpaZElzZEphQlVZNEN5QUVxZWlVV0RsRmRBcWF4Vnh4?=
 =?utf-8?B?bjd3LzJxWmR4Y1dYUlJvUy83M2VrWHd5VmlaTGkzcU1mR2ZOSytQd3YraVYx?=
 =?utf-8?B?K25mMzloc2JLdDBESmRjelZNdkhhVHRKcG0wRnQ5Z2Z1MGhJTlMyRmxXYnN6?=
 =?utf-8?B?dmlZcjRWVlFXUDlET01YSEJ5RU9IamthOVFHcVBQODRpVE0vSzFEK3hZbTZW?=
 =?utf-8?B?RjZhVHN4T2lFVFY4Z2F5SXJJNGwzMW81NURkeXgwYjlad200RW51bjB1U1pq?=
 =?utf-8?B?Njk2Y3pnRVZtOEFRRzF0SVlvb2F4cnZQNGlKT21tdDNDYUEwbEJwelJZT2Fs?=
 =?utf-8?B?RmlGQTlOVDhYM2I3RlpMQzZFQy9kRFJlQUhDbWVZOGJBcWVFWDlwYzNoLzMr?=
 =?utf-8?B?MUdmczJqNEkwY1R6TUwxREdyTy9KM2hvSEFsRWY1cXU3QmdBOFlyZytZTW52?=
 =?utf-8?B?OTREb1RrejUwZjVSeFdjeEh4OWEzeVNkbzRWQW1OdnhjSFRUY2lUNEpkTVM3?=
 =?utf-8?B?MGJMT2xLUUlVQmF2Z3RYbTQvb2k5UDFyMnU0ajJKc09hVVBUeW9GMUxTbC9U?=
 =?utf-8?B?S0tCNnpSWnZGWms2TE1reHpuc1Zyck1CMHM0aEsrVUNPdHNYbWpoVlBGY0JS?=
 =?utf-8?B?c2VTVWZCQlR6cnppMHRxWFZSdjh0dzB2NTlBQmpNeEF0YkJQcmQyUktsN1Ju?=
 =?utf-8?B?dlE3OGtLbGdsT0s0Tm11QWV1aW1QVHhsV2FhSHdyQVlSTCtXM250bFN3MUcy?=
 =?utf-8?B?YmFxYkxRby9Ua2xNemhXWEFsSXZveHl0aXhyNUgwd2hqN2VTdWMyNUs4WXVP?=
 =?utf-8?B?cFlzeVozK0syd2dFdVJpQ2lxUVp4VnZzbjBLQVV4YVBPd3JDajdtbG9IWUZm?=
 =?utf-8?B?TVBLYXJ3MDNoZTQ5clF5WThZdHBmb095eENrazhUOTNwdWpWdEJDYlVQV0VW?=
 =?utf-8?B?QVJaTG80VVZNNWFaRDhLSmdzT2U2SVBOTktxd2RZbWZyZnVaNGRqUFdaREVI?=
 =?utf-8?B?RTc5N2dIK0FNdExsWTdTaFJCd3A4ZHJuR0VwWlZVdThWUmxnOUF4VjgxMytQ?=
 =?utf-8?B?Y050bHd0NUhCd05GTmFaekNpOThON29QZE9IQmtNSXZhbWljQXhGRUkzVFF0?=
 =?utf-8?B?OVNjS0g4WFNIWEN4T2FBdk9XVjhsK3ZCcVRNM3NyemhLdzF6Z25IR3d6dllx?=
 =?utf-8?B?Sjd3S2NhcFdZdlJZdVptOUJEb25nOHJqWHd5ZElXS0tmc1llM2VnNEhkT1c0?=
 =?utf-8?B?cUdlVnVOVVN6NEphNHJSMzVJdGtZc2t2YTJtb2RFKzc0cDhKOG1xdnZoZ0tX?=
 =?utf-8?B?Wkp6L0ViZGNDTGNKeUhtZmgvT08vZjB1R2RseXNLQnJKQnp6bDVrclNQVFJl?=
 =?utf-8?B?YUpzbEN4dlBmZ0ZOckZrSUpGNzJTSFNrN1Z5RksyUWdNeXZ4b0xrMmwwZGNI?=
 =?utf-8?B?c1FVNkNrbW5xUG5zS1JYZU8xajg2VVA1K1F5MDZvWUR1Qkx4bFl0bVpKVnJw?=
 =?utf-8?B?UWVucDVZQW1jbnd1YWpPbGwydEFxR0paT2FGenFkY1NEdDE2Wm1neU95RjYy?=
 =?utf-8?B?cnNEQWxCd2NoSFFMSWlWcFZLc0VIS09nR2ZFdFdRelNYQ0xFK0hqS3BuYXpU?=
 =?utf-8?B?Q0VPc0dhVEJSaUxGLzJBVnF6VTlBRTJvZjNoVUQ2ajZrT2h2a21aRVc4c0tY?=
 =?utf-8?B?REw0NGlVZVZtWHhHbEYwa2hyb1ZOWGJVN2EwTlBadmVLZ0lPT1BBclZub0p0?=
 =?utf-8?Q?m3wbFFAWFdB84XHxX6Muy4c1EXFglzk/nUPvqyB?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab923d1-310d-41fb-e2e1-08dc8472b50c
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:45:40.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB4571

Hi,

On 4/6/24 14:02, Guenter Roeck wrote:
> Add suspend/resume support to ensure that limit and configuration
> registers are updated and synchronized after a suspend/resume cycle.
> 
> Cc: Armin Wolf <W_Armin@gmx.de>
> Cc: Stephen Horvath <s.horvath@outlook.com.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v4: Fix bug seen if the enable attribute was never read prior
>      to a suspend/resume cycle.

I can confirm this works for my devices, so:

Tested-by: Stephen Horvath <s.horvath@outlook.com.au>

Thanks,
Steve

