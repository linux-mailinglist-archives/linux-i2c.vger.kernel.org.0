Return-Path: <linux-i2c+bounces-3787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63B8FADF4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 10:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E03EB23B65
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288ED142E7E;
	Tue,  4 Jun 2024 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="LdnxwnwP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2160.outbound.protection.outlook.com [40.92.63.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB222066;
	Tue,  4 Jun 2024 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.63.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490941; cv=fail; b=ZDQ+jwYMKqT7Ua5DGl5XtWGXF/qkY5IAFjsUHW62kRHbUjo1fj68IESAF1lZVWzaLSRVgOiTRdEd1KT/c1+X5Jhxa7aF9SSFxgI5z6CcqKH8PIND8W0eAhfJ7QEMqTH1HOjnhPLXLRZw2OI1m2KcwvNryh+T4H5gqoBB5LE2CBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490941; c=relaxed/simple;
	bh=sliAdc9zknd4EPTPPygv/yar1UeOf2JBmCVI2u0MuWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fx+No3+Iawh+SKGw3dFKy22TxDsuDGvjcClG3pGQdKcEes8Dcy52HaytGE04uGPm/9pIHV3vA0ObBkjO58kNjd5mcA0wpG6jov71JbY0c/hXe872evoaw1gDvhKNc6x5oPcnzwAH3PaDe7PPVQUF95kGorsfZkI8CrJg0YPkF8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=LdnxwnwP; arc=fail smtp.client-ip=40.92.63.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGiZghcCPFZvL8IZggChJ6lT6bz53+rI3eGzLGAOcolF2BHJac/0h9QAPBduE/P2q2RgVQYAWzNjLPOOWiQaHy7hk3opsnS/6D5RlT3d8OS0pM5ViVKZcDcm2eC6mGUuQ1wmrFdFHy/nP+UD4n1lr8UyH2Aoiqd7WvnOhzxW1pAXR2cA25PViy+G4jWS7Eu6bwOZ2HftY8Cd1UTHD7FS8Doe52zpgiRvXKFhfhpyVPtFwYO+wp94Nmr1xwi7DvvVTIEd1rMi1QUHSdN9LSPheVWAn0GV36C5cnWOh810d84AbLIiohzynV47lUfqehEfVUypCGRhVJK/vTZpQWmPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbQb2+2HmY5kY2Fdb25F8TfnULwCk59ICgHHEZ8Yr/8=;
 b=Bg5gGwPackXrTyPW2QdoREIQMo8XtW9nzFtBDR30YJjVTj0ZSySViTy1LYc4L7EUMohpQvVluMGIHxsHoRS21rjpZU76154YMK7OOVfO/jFL95A1MZHziizUORkRZd23CBiN2popS4ul3M/fFhX+e2dSnrXEZcS/wEdXRnPne+rpr7UBkh3X6QDzgRTr6cMJj4LsJ7+OQWitc5NIBCzyZJVTHm/kvzrbVAwNSJzo5qyO/3O27la+LoLsHTAOM52Dts0sbmutCa77T6UHML4vgYvkMA5U+Dh6kFFnxIUqNn2fMvreJID0AixDkSbCXEYtYuzJ1DpZPY5vWWbmFaLGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbQb2+2HmY5kY2Fdb25F8TfnULwCk59ICgHHEZ8Yr/8=;
 b=LdnxwnwPW/BV/FcJfOS2ztl3ClmAa65ta2KQhHj8Tvz+L9sFPnIj/TtE1SDFGdkYm9vAMY8uWglyuwkE43BFJFOJxVPcFLtlpbJOGtx7NMPKdwB2QheB4bdIRn9iTScq1IfKb38D4y4YsVAmgBk8TVTw9yH3PHKQbjvAI3LZqhc9gdu0TLAzGEUsY1GW033lt7JRlP+Gq7CeeKZyIiYiJs6z8iQIBuy0ZFHewQbn4n52E4URWy/lZBwfpLiSD5ChgQY4M1A0MS3IxLsb6H6wPu/bkz97auZTQoYASZHIUo8aNtKyOWJ4R3dugSfIqPfZkh3Pk7MUiWMNlh7K00aClA==
Received: from SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:159::9) by
 SY7P282MB4571.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:27c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.15; Tue, 4 Jun 2024 08:48:55 +0000
Received: from SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 ([fe80::37cc:3733:d1e9:d8e4]) by SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 ([fe80::37cc:3733:d1e9:d8e4%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 08:48:55 +0000
Message-ID:
 <SY4P282MB30639393B10CC313292C936BC5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Date: Tue, 4 Jun 2024 18:48:52 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] hwmon: Add support for SPD5118 compliant
 temperature sensors
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-3-linux@roeck-us.net>
Content-Language: en-AU, en-US, en-GB
From: Stephen Horvath <s.horvath@outlook.com.au>
In-Reply-To: <20240604040237.1064024-3-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [5Yp1q1fTKdMd5OIUcM9vBiS+GROZ3QAvQbsbmJ2pQHsMLvqkeKOkbqYlAVhB5Zyw]
X-ClientProxiedBy: SY5P300CA0056.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::20) To SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:159::9)
X-Microsoft-Original-Message-ID:
 <286a8879-3995-4d6c-a9cf-12c61f0bf019@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY4P282MB3063:EE_|SY7P282MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: d737b2fa-72c4-4874-a2ce-08dc84732a81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AiCh54RhxqxUMOKz23bT/Aylu4Ljuaekor4Za8Jg+xLlvo8sCfCEDdx7rdxW25D0WGmuBm3pmbklTrrFlzCqNLUs3fpXsnE+w/y2zGjUK/0wCg5wyXYKtETox7n0f5bQIrlShcD0AckojX/OAYu91oeL3NHpYsZh3aNHBEOZR7ZhbkFwK47J7C8qqKuMgS6rfZ+l5fL7DqQmo6+lANYXy3Du90c6th6vDMeH6hS3hGIRUZbUveGrCF6tfAP6akguhNrvmltNYCCg5jIiWYHQCTI6Vj2NRLls+EZ7UgzIV8u+Yebsht/I0nXg8Rl2ZpNvw9mutPILMx8jIUu10AWhH7pF/EOqH7acBPZLbRZyQirH0VsFLUXoanySuuWsrKe588xHT6YKuafsp+AiNpC6y7mSWbVoyz8RZqIfEa45j/AVq7R22Uij7xJv2cEDWcWquSgSXoqbD2o1qCFpfE40AM/Q2B1A0zEkTtuCvEtMns4V26501WAnAP5uatTfcWCSt1MD9zwzYSkmT9MhrsNJLiBNsfkG77aMxsUI7qDUSfKH4QSVyk0c7BYjup2rmjox
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rko2Zi9vV2ZPWFRhaEgxYVlyK1R4RDREUFBsS1pZeHBwOVBVK0FvR2kzVmRq?=
 =?utf-8?B?MVpUZmZvQlF6ZE82REJIUVdvSjhEMmFrOENlSGZGeEltcEtWSjBjaVBJclFH?=
 =?utf-8?B?U0lMME5sY200SXRTV0dtVHQ0SHo3dEd5OHpmVE85R0RycEIvOU5SN0pROGR1?=
 =?utf-8?B?SmlOTzZwVmxWMkx3VUdwVUY2d0hwWEVLc252eENXdXY3OW1pWVExdUIvUTlk?=
 =?utf-8?B?bVp2SlRSb0ZRazJheGY0aXU4YWpPdnpJazcrbkRkVUFXRCtaWldsZ2JaeWwy?=
 =?utf-8?B?aVl6MnlHQ1d0bWRETGNGZktHYzB0OTh4cHk2RHY5bVBFSXVEOTVZUllMTTE5?=
 =?utf-8?B?eGhOU3pRbFhReUh5T0Q4ZE9Fekc4U01ickZ5SUhvTEtvbXNndDEyNGhlZXBK?=
 =?utf-8?B?aEQxaGtYZHJaNmsxS2F0d08rS0s0VmV5RlcvTW9KWFV0ZVRUcEd5N0QvUUlM?=
 =?utf-8?B?eDJMYVhMVHh3RVdXNjVlRms3VmZ0R2h1RENEZEtWc1ZYVjV6R1JJd2V5YjZG?=
 =?utf-8?B?SlRmNHhUTGJYZU1VdXNzUWlrNzJIYVhrcmVTZ1VGSWlXNnR5SkxvZ3c5MFJ4?=
 =?utf-8?B?L1FZaEljVjBtOGJESjdRS2NVQWg4VUx4VElZTG9oNy9KcCtKSDlLQ0IxRE1w?=
 =?utf-8?B?TlNqbjR5KzNsTnJ4cTh0M1Aybk1rNnBoMUgzQnI5Q2xxejMyQU9GeEpRUnNu?=
 =?utf-8?B?VUgrakhqNlM1bjg0TFVSZVZZRWdvZlFEZk1ndC9KcEwweTlNRWsvd2VZanpy?=
 =?utf-8?B?QWpyL3VZajQzbzQ3S3V1WDJ3TzE5UElobUltOTVmS0hMZFQ2M1FQYStXdzh0?=
 =?utf-8?B?cC9kc0xtUUJYS0FxcGF3TTBvSTlnOHNaWnZmSFJ4VjVYQUxOSGNqYXRpdFE2?=
 =?utf-8?B?Z3kvd040eUFCczhrRFc2N0drbHd2SFluVytSMXBJOHEzOEU1TkpiVUZ3SHNY?=
 =?utf-8?B?Y3pxWFp0dWwzU1laQ3QxZk14Q1ZlQmMvUVVKWFREZ1JNRFJPR2wwREFCREdK?=
 =?utf-8?B?dEdOSHJLeHN0Y0t5dzBDaEtkQzJFczJXT1RKalpOOURON1VNRldsTkM2QVVj?=
 =?utf-8?B?OVlVT1YxbnIxMk55Z0s4M1ZBVGZOWUZIeW5hejB4dnErK1kzV2pJcnZlYUhH?=
 =?utf-8?B?VFZlU1Q1UzlnYkVTaFRUNjZMSk93R1YweUxQNTcrNnUweGNRODJjSUhRWUtW?=
 =?utf-8?B?K1ovWkovbE5TM296a0FUMkMzTENBZSsxVHEzcnVyYVZZMzhBa0FESFh0L3BL?=
 =?utf-8?B?MjVxeDNPZmVXM0hPWFRNTVF4M2x5elp4SjVOeWhWN1MyblowZ3JZV3FlY2tI?=
 =?utf-8?B?akFtQjBybzRxdDNCa2pSRFJvQ2RhbW45dFFFMnJVd24ybUFnYnBKRzhBdjA4?=
 =?utf-8?B?empleXhDU1dGVmQ0TDdjay8wOXFBU1NuazhueXNnQzcya2ZTWDNKUlRFdXhW?=
 =?utf-8?B?ZHRqSHVkVTU4YUJzdUdaSE1ZSUJIbHE0QmU4MFU3K0NxZXJrTUkycHlBVkVH?=
 =?utf-8?B?MWpXcXRwdjVud1JtMHpFQWxIZzd0bllpbCtNOXVtSEJ3ZXRVYUYxSGNJUENP?=
 =?utf-8?B?OWw2ejB4SE4yY0JVcHFoR0Q2Nzc5WnRTSUpKSkRkUjRjcUE2Z3YydHYxaWRJ?=
 =?utf-8?B?SjBoTFhpWFVzV3laREVxZHpTbUVZUHcyTjZIb1RiR2kwY21jazliWWVNVjZH?=
 =?utf-8?B?c054QWhERCtLajBmTk14bFpwblBwaCtoSlVRZjNNYkxGSEV4SGpnMWF2QnIw?=
 =?utf-8?Q?LIwlWtwOm3mmqFYYelZZmOxxaR/ZoFXsx3ByHWO?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d737b2fa-72c4-4874-a2ce-08dc84732a81
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:48:55.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB4571

Hi,

On 4/6/24 14:02, Guenter Roeck wrote:
> Add support for SPD5118 (Jedec JESD300) compliant temperature
> sensors. Such sensors are typically found on DDR5 memory modules.
> 
> Cc: René Rebe <rene@exactcode.de>
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v4: No change
> 
> v3: Shorten JESD300-5B.01 to JESD300; 5B.01 refers to the version
>      of the standard
>      Drop unnecessary 'attr' parameter from spd5118_{read,write}_enable()
> 
> v2: Drop PEC property documentation
>      Add note indicating that alarm attributes are sticky until read
>      to documentation
>      Fix detect function
>      Fix misspelling in Makefile (CONFIG_SENSORS_SPD5118->CONFIG_SENSORS_SPD5118)
> 
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/spd5118.rst |  55 ++++
>   drivers/hwmon/Kconfig           |  12 +
>   drivers/hwmon/Makefile          |   1 +
>   drivers/hwmon/spd5118.c         | 481 ++++++++++++++++++++++++++++++++
>   5 files changed, 550 insertions(+)
>   create mode 100644 Documentation/hwmon/spd5118.rst
>   create mode 100644 drivers/hwmon/spd5118.c
> 

It seems to report correct temperatures for my sticks, so I guess:

Tested-by: Stephen Horvath <s.horvath@outlook.com.au>

Thanks,
Steve

