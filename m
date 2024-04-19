Return-Path: <linux-i2c+bounces-3021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B488AAAD8
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 10:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FA12839C5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 08:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677C571742;
	Fri, 19 Apr 2024 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="EZXgHfA+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2137.outbound.protection.outlook.com [40.107.241.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3E1E4BE;
	Fri, 19 Apr 2024 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713516486; cv=fail; b=K8Mn0mnbJUgKgzjGeuk63o81EBKpD31204F83irImDDnnSP/U8HDrxRbAark/voVy88JRljKaEod6WvQ2W5eEJ7gpwzCFVBbkURYdvDAcG+ZzpVDy1t3FGlHrc/OzQOQ5U8TGJ51HLN70//jFC5JG2MXEc2j1gY0Jd5MKS5YwEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713516486; c=relaxed/simple;
	bh=q2bi0VG2ta8+4FYa5jjwkbGz1YQLZlmTErZ852Xlwqs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oI4OM+oX4lwjc4+jwZ9+HdyArOxrdWoL8mixVp/HFvq7X6539uQU3tMh9LYo9R4IDKJ0rgSUvl3Hz7jv4PWCdmGzv8p8zwaIOWKE7a5AYKq5qceoW5WgpCBLNYSuTRML67hGi4jgAs7v2q+5o4JTCFiq3h53xqGR7c5jgKuzh3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=EZXgHfA+; arc=fail smtp.client-ip=40.107.241.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+YmWkHD+QFM9m9twGkD+AzP1nboB3MU5/6bQ5jLqm/JCg9M9Q1aTUIPmSDuJgGYwm7nOtQBin01M6aVst489/Dl7Yx+qKJzPSMT4cgFHdCgXLskWk4m+N8L/Cfaxc1sxUUifo5Km1TMIvGNLExP70Dnv3FF82Gm5I89BWD3n9Uyp54hls5hCIMN88ZthCNaLR0eXDhYW6o873808C5J8Q6fFgG+aoa4goimas+EbHexyE879KsPftu6snecOs+KrKpGtrcmCqVfMRMPEFLOyHNYbBS4QXwHqKZ0voESVMtV+62ApHwpxYZNfEcA1lNRfsRnRPaOkjJ5QjcUmcZ6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flj7qQjItZmapGvuBEYGhg3pCPVSq53CK5wVZB7HtQA=;
 b=gUoBvHyLdyGTkqFaDLuF1Xj0jmxUuqpegEm6eBSBgCI6ZAPpqKxKWe30Mvljb9q66yndO34ppxbiTOmEnD3XBU9UBQzFglKP79j74JkA7DY8kr9oLRebAGSIfb6u4QV4nv5TJatuDYOX8n2YIxuT+NIC95TiXSfBGo4gVYPafLF1aLOstt13wjP2l9FCA9Pv0zpjxXIl9OT5f7Rs6CnFJUanYicUth2t8xxLqP9RkNoY1PS8eynhDJE6uN50P4+F3wQVlTT2CRaoxWzZRBcvMixOT7xkSQr7o+9c94ZH00yW/AS/LwgKnyvCYqNlEMlVEfrg7X4lqGON2bA6xKRkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flj7qQjItZmapGvuBEYGhg3pCPVSq53CK5wVZB7HtQA=;
 b=EZXgHfA+dH+M+tmvg6vkzjjSNaOEjGv95+SxSXGU/qszep9DQo5HlnnacvFVxivLJzS5eAkYuelZKi7kbZ5ypvvWm6pjJRnMiqUch4EA13zplg5pQTuXZddr+qrUKFlLCQfu4mOT9CSdrKKOuciur2eGagQ4HlNN7Ut3dMhoccI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DBAPR02MB6118.eurprd02.prod.outlook.com (2603:10a6:10:188::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Fri, 19 Apr
 2024 08:47:56 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 08:47:56 +0000
Message-ID: <8b8b1b11-7a79-fe80-a5a8-db407d0e49c6@axentia.se>
Date: Fri, 19 Apr 2024 10:47:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: mux: Remove class argument from
 i2c_mux_add_adapter()
Content-Language: sv-SE
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wolfram Sang <wsa@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij
 <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0028.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::8)
 To DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DBAPR02MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: ac77a3be-3668-4ba7-72c2-08dc604d68c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BaKwH3rHmSBOKBNey98hD5o+yrgDh1dOZls17aFPWPByItBIvRic5I42O6mAVUy6GzhL8f+zwP+TnNnmYxGCxjJr2Kqx3EJkVqYfMny554BLo1SDz3WnBOTdmwxaexoPEeMeOgap4i/sVD3QAXctRRsoR4B06OP8JVO6gyCsFyP7SMmFt9moUQ+upitTyv4wtWCmB0khWchF7L9x2Rg3/fp5AhPHnOrUX4Aan8SPu3ltY8yiookUiRIvv+PWjjK/Bc3RWIxUzVToyWk9aa1JoWbfIy1tElLM0KfjYO2Ty/nXUJMJ3S1DNLYmywcPq6Sm/265Vq4uaZWoroCCnK5WFUKvDWckVcBEt5VkKp50t3CysMTl7ojH7YacqqF3c9Pzvq6kfeCNbhQ4eOD2GJE3/EVZPQxDcVCIrImFncn+IVNoCceFWBEi4bWbqBTlpmFwkTbspxerU595d8IdRsqAPi7QwV4XBGKlLPFA20Wqra+DCxFy++RbQwku7BeyuaMSR//ETp0KkVSiP3tgcu6Jsrl7zCMgxLudysJuRIyGoKWPXBwNa1wlRDvysFsjyR5CdQJScEr9I6LbCw3rmKS3YutQAa7gI6WPn2BOq+lL/AbhFDXmIyMHnRLc7RmejMwFpTmbwUsyc5YJXqS9SwC6hkFIsKY5iNKafQjyUyHvKohbflchCbFxcpvWVeqBLX6C9uIfL0ecABT3MHYv/h1hfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGRONzhyZTgrWkJBYXI5NmJRY1ZxbUp0T1FkSjBLK3ZHN0JjaGhMem1RMi9l?=
 =?utf-8?B?TDNPM0ppZm5HWk1IMWxsREFlVExmQkFRRjFtOWhVTnFTZkZ1WU5HeC9YNCs4?=
 =?utf-8?B?aWI3LzZFU2FiMUtwZjNwU0tqOVIyMjZqNU5WTmx6d3ZCOVVxeXMyYXVEeEVZ?=
 =?utf-8?B?Q3F0blloVkFZa01kU1BDaW02dDZOaDNMQlFTODd3am0vbncvbGpXb2pUZjVq?=
 =?utf-8?B?NlJMcStnZDhpckREdzhhbWpUQTB5QmFTdENEVFJJRmpBUzJJbGI2dVh4R3lT?=
 =?utf-8?B?SGZJcWpLZUg4OWk4amp1TE9sYjJsMnQxTFJESVhiMDJSWkJkQ3c1NVFqZDJO?=
 =?utf-8?B?TlNZYTFYb2hHRVJSejFObEUrUWtFN3IycklhUVFmRm5KcFVPL2k4RlcrUW92?=
 =?utf-8?B?V2Z5azdwMGxOM0RYYUNveHl2RmdWOWRUd0ZTNUp4ejRWWW1NNGRNRUU4M05k?=
 =?utf-8?B?T2Iva2l3bk1renN1WWpVWm1BalptVHpKVktQcjlGYW1qSUhEY1NJMmxSNGVN?=
 =?utf-8?B?czJuU1J1ZkF3NW5TOUM0UkMrWGNCVzE1dzJtWG9MV3BUVFkwMnR6YVkvRHJ4?=
 =?utf-8?B?RmxNVmg3T3hmN2hMYlkyUnhVcVlhVWhGTjJ5b0JrY0hxRVFXWWYwSWVrOWhW?=
 =?utf-8?B?amowMGZyaC9NZDZuY1duejYyTGNhNS9peDFYQ0xtMjFzQU5mczQ5TitQSXR5?=
 =?utf-8?B?Vy9WTHBrcVdjaER6NmNCcnpJeEpvRGQva0I5aHFELzg1N1JxcklWL2pIWVlV?=
 =?utf-8?B?aHJIK2NkVERPMHJYZWk5cmVOUnFac09zOVU4WGpjYWg5Ym1Tcmxwb3IxQzA5?=
 =?utf-8?B?ejlzL3NaSEhhZTRoTWVwYmZvd3FnWlNBdWJLWUsxQTQ3MWFMRCtGRkx2Wi80?=
 =?utf-8?B?c0I1M1FVR25jYmhzMTJWSU5qOTA2cTc3VEIvRWJ4aHhCYkh2Zno0NkNFU3pl?=
 =?utf-8?B?akJSU2tOWkFIeHRxL1lLTEFOZ0xnQTdFbUxRcU5IblJJOXZiOFRtZHZzUzJB?=
 =?utf-8?B?YThwU1kzeE96RTNhLzRoSlpJV2RBVjVQK2VKYTFEdUhGMWFlYmUxcWpDdnd6?=
 =?utf-8?B?amxvNDAxYTJLV2dyTjRyVmlJWWNnSUQzdk5TQ28wbm1VVmFKRWJuTU1MMTBi?=
 =?utf-8?B?SDk5WWoxMldTZGtNb1Z1dHJTL01nVXk0aS9ld3NjOWhYZmZqK01xaElTbElD?=
 =?utf-8?B?VXdCUklKQ0tieU54TnFnQjlWaCthL1RzZ0Y5YkE1UGxKN016ZXhDUW5Nbmgr?=
 =?utf-8?B?bjA4bkdTTmIzU3V1V0krVmliQjdZTEl4T1JsYUFRSzA4UXErSlVGRElhaTlY?=
 =?utf-8?B?Y293YUJ4OTNHV0JXdm1oY3VZaXRicENiTjFkUWlUbFZTSXcybk51Q2JnNUFi?=
 =?utf-8?B?U1U1bys1NStWK3FRTjAwZjRHVjdUVUE5bmNtSDJ6a2hBeFVNOUVJeGRDWVJJ?=
 =?utf-8?B?ZFNxbkh0TnVkbmUyV2xDZkRFL1QwamllRzRYN0ZYZ2ZHbFo0cUw2Q3pIcjMr?=
 =?utf-8?B?a2xuUHZxMmVxTU5TM3hvTTRTcnl2UkpJN1hvUzZ4RGJKNGxIZHQ1WWdMYzlI?=
 =?utf-8?B?dVl3VkZFMU1taDdScGU2aGhpc0lLSFJ5MG03WjNxb0p3b0tDVmhCMVNpRmFs?=
 =?utf-8?B?MTZ2N1Ztc05HMjZBWjZaV05mRXE5eEl3RUJIc1ZwYmtmZm13ZEM5RFp2VzJN?=
 =?utf-8?B?MTB2K0o2OVRtbVU3blBMbnhCdTZMejdqbE5JVWU0cHpLOVNybGoxSjcvSFVv?=
 =?utf-8?B?UTBLaEZQN1gycHlsdEUyVTdLdnVEaUs3ZTFibkwwcHc5K245ZGo0enRwVGxk?=
 =?utf-8?B?MWhESGx2Q3JQbFZ2TjNXTTlOVXlwcjUrZFl4b2t6cFY5YXVnUXZHMlNka0h5?=
 =?utf-8?B?dXY0bnZBTG12OFRyemdYMzhQMUJ6WnF0RFFaeWFtVENmb05aeTNJdVZhNnBx?=
 =?utf-8?B?VXNld3NLTlNxeUhLanlYY0lxbnBaT1YyNHF3cC8va05XLzN2NUJSdjEyQUFx?=
 =?utf-8?B?QkdnT09CYTNWQlNmMWtnUFhkaTVVazVBUkxpTm0vZHAwMG5pczZESHRYRE1P?=
 =?utf-8?B?OXNZaHFBSzc1RVdDOXFTOXRHQjhtVG9jdkhZTXZRSndLK0xpWkNMSjNQRDYx?=
 =?utf-8?Q?JVmzTWFwWEIZKwgvQh8k19oKJ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ac77a3be-3668-4ba7-72c2-08dc604d68c0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 08:47:56.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZRY4Vk1MnGu/ZEkLz+NrdHU3NevWSXwm7ncWj/vAg3Iq9x0HB8CUt8H2dE5ye9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6118

Hi!

2024-04-18 at 22:55, Heiner Kallweit wrote:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
> 
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

