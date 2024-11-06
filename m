Return-Path: <linux-i2c+bounces-7836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9E9BE3BE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 11:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0DE1C234A2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213041DD871;
	Wed,  6 Nov 2024 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="KQdQZ84v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020085.outbound.protection.outlook.com [52.101.128.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E61DD0C8;
	Wed,  6 Nov 2024 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887758; cv=fail; b=S0/hojYFav5+7Kxc5ies3v7yAmk8EEfkh2r4lU9NqslZpbFxWxJRePFspiRenHIkL8IyfzSFkTwX6xoFyQy5vaCPIEVewW1PT47uchW678QjpJOmpG+X+iOK4g1RYz/oqpEqT67cdTKekRC5eVYj3H6LSg/Rm7qnC8U0NJbz4+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887758; c=relaxed/simple;
	bh=iTd/AZ310utx/qMw/TuE8HrNAgMKIyOhRafXY3cEG7s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pNhWtZFoBarqwOtIhf6Hsr36f4uDpdu5QgXJixYos4tByBr5CmnicAr+5VumO7Pr2lw+Z+KTp9I+HJkFutAdKQgR+WQFtsKokREW3KvJl2tk8mn1unp438iAS0ohJSnlH8JsWAKEOpJcLCiMEROuK7Ibv67A4nY4h2Xzc5MQlcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=KQdQZ84v; arc=fail smtp.client-ip=52.101.128.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF0izBsSwzC9iBN5RzegdjjV1MzbFvFy6E3PU2NFasygliJuvHYj7YqbXWsz6WvpJ307Jjj67XDFLUX/u+MiUNcFkOHwV5dm9jLmAjcFLwQplKNIqRe8u1dJNDx6xW7Y4hl6PuB70R56gFHfC91gx3wlMMTyHy9ioKp/bcL1ptvuNLMp1kwZgtsh8Bu47OgLolhMTVbkPW9xCfmzfxzfeoPQFXku2LkNGTJUlkAgSIrgipcNB7ccOBw4XZBWsh1o5qhGGW/LzZ4Y6v1AEmlyQQXX47Nrr2gvnbg0RHcC/f5J9Jsc6WW4qoEbDy+IVSwERstNcqrBY6HqmirwXjjQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZpsbq6FUqSTEw6rb9NV567UgWyqc1XAFbF8jynyK5U=;
 b=gkDS7M+LJ2FlhnfzhQVG+//zG1FLQDSj5Hg0csYfKZfSRlHIgtrXlAwvt+xg7g/4/w/dOrbLmFKlUbSzkGl4hSywTDDkOBwmqO1Uc+bO9kOImFmEWW8ffhCM3jGTikRIrcaGTCZ5O0HhAATsnjaf1YFdt36BtKojuaSFBZwInBtUA1SGvsVGeg83ubJiGXdD6akhuZEL9fUH75Iup1wvn7TER14AI1aEPMbywxGHxFxfYerJnARf96+P9plaYt8GHkN0k8CNWY8hsQLqT0VWTtMQ7cWjDytigrYVYl3MsVhPMV8cWRjCQbJTLHUsAd1HyzW/0T+R28ZfMMeTx3e2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZpsbq6FUqSTEw6rb9NV567UgWyqc1XAFbF8jynyK5U=;
 b=KQdQZ84vmpYPeYMwrnmdd58eGtfgekuB57ybq1eEMbsag5Twz1BaH300N/gH4H2ekgUOrW3spx6CJOg/nx7tFh94EHC4SKhEpiHA7bm+TIeGd3PTEudgwY48sQgLW72Qa+0vAsxLCYNi7St0C9VSV019u44BLJSE2sBb1aKKb7BKd90hpPnVD0hkrZrPJcKU7WAjsqGp1qpHBtMOGMjykPP3uak0u0rylJ0p0k1BTPxV7SrSv1ktvGhM8InGGZDOJ4o3PShJenSbLvcVvZMUxv0pneXewUMz2264svljlV6LmsGlPVse0UZs8Ygqby6TgZgXemhBp5SbFVNhe+wgpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11)
 by SEZPR06MB7022.apcprd06.prod.outlook.com (2603:1096:101:1f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.16; Wed, 6 Nov
 2024 10:09:05 +0000
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60]) by SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60%5]) with mapi id 15.20.8137.014; Wed, 6 Nov 2024
 10:09:05 +0000
Message-ID: <bfc14b55-35e1-479c-bd9b-d40d1ea88377@jaguarmicro.com>
Date: Wed, 6 Nov 2024 18:09:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master holding
 SCL low when I2C_DYNAMIC_TAR_UPDATE not set
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, "xiaowu . ding"
 <xiaowu.ding@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
 <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
 <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>
 <lv7hm72ngmjohh3hd3tsiawh47pjcyq76iw3weboytfcywttmt@jjrcuwan74rw>
Content-Language: en-US
From: Liu Peibao <loven.liu@jaguarmicro.com>
In-Reply-To: <lv7hm72ngmjohh3hd3tsiawh47pjcyq76iw3weboytfcywttmt@jjrcuwan74rw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7060:EE_|SEZPR06MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4ed052-7b47-41ba-219e-08dcfe4b0b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2d4RDlaRThZdnA0TXhOZTVPaDB0V2gxQmxvWjN3c21oa1MvbnBBaHc2eThn?=
 =?utf-8?B?TzVZWlFnck42dE9xWXN5Yit3ZjRjcnhkM1lMQzF0QWYvTnNWSDV5d1IxVjQ1?=
 =?utf-8?B?ZEttcXNkRTFXMU5SM295SGJ2aGtwUlRHOWtjT3F4VDhEVTQzc2F0OG1LTkVn?=
 =?utf-8?B?VEgxT3pHYzNSNGVCb1A2UG8wNjduZWorRUh2MEVVMFBNM281NU5iZE1PbmVN?=
 =?utf-8?B?VlB5Snpad2JOSlg2RDFqUUphcm1MeFJQNERYQSt3NU51TFp0WkRHWWkxOGpy?=
 =?utf-8?B?V0tGZDdVK3hkMjZsaDFqdHh0Tm5CWm44aDdxb1hiOExJQjFueXgySmR1ZUdK?=
 =?utf-8?B?TUYvOXJvTzdqa1RBRVZicHN4NkMwekdKc0YremNacmYyU3orVjZRRnB6cHZF?=
 =?utf-8?B?ai84TUlIWU9ESU1ZWEdpUm11VnBQam1aZlErejU5VFRjSi9vMlVZY1g0c3ho?=
 =?utf-8?B?RnRvdmJyb3BvbDBQRlpVaENJd21zcWVzUEU3WTlGZzk1K1BzVmNCcncvMXNk?=
 =?utf-8?B?TGcvZDB5NS9kV3BWMEtQMjZXR2JSSWtxUFNOWXEreTBzNStqWkJnbC9zTUJI?=
 =?utf-8?B?ZUNoYXhZS0M4VUxMSWVVajRJa044bFdlMm9vQWtOa3E0Y1loQm5EekgvL1Q0?=
 =?utf-8?B?dVV4TnJDMU8yMEY1N2JkS21qZ05oRGdBSVNwRDdjbVBUSXJ4cWw4RTk0c2xu?=
 =?utf-8?B?T05qbUora1lzQUsxU25ER0VwZkVLYUIwc0daNWhUTklLcXdUa2xIanR6S2N6?=
 =?utf-8?B?UHd3bUhhTjFRejYvLzNKaWFHcmZmaElHU2YwS1kxRHJRaUpBWm5HbE1rZDhv?=
 =?utf-8?B?OXBUUXYwZU1yWjJsSGEzeGNRZGZQbVVWUVlqMzNzek94SVpxeVRJTGlIeVYr?=
 =?utf-8?B?eWdVMm1FWGJrYkRaajh1OE1MNEhQbEtFNWNiTWYvWGUyblZtU0FQRFJYQ3BF?=
 =?utf-8?B?RXlMNlUzcmluQkwyYUNFa2RMdmtrRjRuSXFieGpGbVZXb2pWWnU0VGtvb1BL?=
 =?utf-8?B?aXpFMVpaRExpemhhWXQ2WXZOSzNBekM0Q1lkWjFZdkRTN1pjakUvVDJXZTNn?=
 =?utf-8?B?S2tsZm5sbG5wRENGQUgwOGUyWUhKRm83enRxSkFxVlNNMWpMZmZnWUpMVHRQ?=
 =?utf-8?B?azhVUmpIWmJDdTRoOWgrYXdSSG9pWG0rbHVXWEN2b3dJVnZMVlZwU2lwalg2?=
 =?utf-8?B?Tm9jNEJJRUpmLytYd1BhRnlTbEk5Um5qQUlDSExKSkRBK0FFRTBLMUNQOXN5?=
 =?utf-8?B?czU3dVIzODFzeTEvZGY3Wm53Nk1JYWsyVlQzTHFFa0RocFNkdU5LSGYwR3Fz?=
 =?utf-8?B?TXBndHNUaXVNbmF6Q3pwaC9ubHV6OG1QREt3Q3RvT3Bzc1RtOVN5dnhKWThC?=
 =?utf-8?B?U2tsd2RFSlF4ZmNiTnI0M295dElDd1B5OGUvOEhrM1V2cU03aHFLbXc3WENo?=
 =?utf-8?B?RzRHS1hNVXp3WEF3cHBXa2tnUjF5QzlYSjJPWU4zOWthUFZBbFRmN0tjQWw5?=
 =?utf-8?B?T0NvaUZ4ZDk5N1dEQ2RESVRvdDVBRjc5RFNTM0luZ1h3SFdXOFAvN0RaR0dY?=
 =?utf-8?B?MzNCU3dWT09NQ3g2eEc0V3JlUzFIeHJlOUdnUVNyL210WXYvRGRlZHludmps?=
 =?utf-8?B?YlkrOUt5ZGRwR1hVSkRsUmhGVGpTUUtXdTkxeXdlZS9KUDRyc1JWMTNWb2cz?=
 =?utf-8?B?b1gwZGlDOWowRmVMVFZzbHRVWkF0YWJxMmk0c0ovbkpqQ2tkdXdIOHNIQndI?=
 =?utf-8?Q?n/t5jnxV84rkeRW/v67dD2fF21SPfhDdQ6DEjWf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7060.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJacHZ2Q1l5THJaaVo0a0cwWlNPdGNwZXpmK2Zxa3k1NlFXeXBMRTR5RHJD?=
 =?utf-8?B?dFgvMURwa2F2MFI1K0J0SlU5ci9TUG96eGsxSG94aUFWb0VIaTB4Tk1ReEFI?=
 =?utf-8?B?VFBGeHJMUWpFQzh0SEpMemtEUUpSdjhrY1RtSUE4TzYxdmJLcW5zZ1JXUGdy?=
 =?utf-8?B?azR5TUI1NGloVGUrVHRLRE56NGtkTUdNTjlTam92cVdYS054cklMN3F2Mk1W?=
 =?utf-8?B?RDBwS1dRMWcydk9vNlE0Qk96THF4Y0Fkcy9mQzlEdVkzK0JXSkk2Um1OVEty?=
 =?utf-8?B?VXd0eGNrOFloUTZsMEhIYzJsUlhwQS9FMmNteXpBSWV4Szh6MGNyUzByaGVJ?=
 =?utf-8?B?bHpja2JrYnlBMkxMa0lBSjAxcnJsRDh1S3I5UWJQQ0NaRTRwcG5QYnJGMkxu?=
 =?utf-8?B?bGVrVEpOWG9qaVE3L05BUUZGTjl0eWxwRjRGNmdQMDNrSXNGUklmNHo3TmZr?=
 =?utf-8?B?QkJONXBzWEpiUm92djFHQWpmODgxalFQMFFIOUc1SzBpRk5sRTN2ZE12ZmxI?=
 =?utf-8?B?UjJaT0s2emFhNXg4TlE1dXlzeFUxRGExck9aclIrbEJtZit6NUFFd3JMbS9q?=
 =?utf-8?B?OWFvZzMrMVREVnFjY21QSksrbzNkRDdsRndkVFlvNFRTRzkrbm5yb25XM0Fn?=
 =?utf-8?B?Vi9JT204cU9lWEVYeVhhMTU1U3V1dE5HbHh6OW8wa2RuQkkrWGNkVlhpQU54?=
 =?utf-8?B?MUlWYzJmR2VpZjgwNitEdndxZ3hlWnp2eE9vWVRoQnhQWmt0Y3l4c2Y0WHhz?=
 =?utf-8?B?QVhwaS9xeXFHK1QrYkJQbVdTZGVzYWRsN1NMdk5TZG1VL09GTUZPTm1LOHdN?=
 =?utf-8?B?S0VHR3EyNG1GVlVhVyt5bFNUR3RRa3lwSUJnVjdWREl5aWRHZkVpb00wMkdt?=
 =?utf-8?B?MitWajlzOW5PZUhoUTREL1p5RnNHQWw5YXZURFdYMUFrYmJ2VDBubjBrWWRK?=
 =?utf-8?B?T0IzejdPdHNOQVRQbXlEL2lSUzAwbDM2eEJ0WDljNEE3MUZlZnU0c3Z6bGZJ?=
 =?utf-8?B?bkxVODFJTFNIbjdUNDh1U05XNUZLMU1ZQ1dHc0hZaW1OeldaSjZPR0ZNZHQ2?=
 =?utf-8?B?TmNmMmxUK0RRc3pHOEthZXdLVThrRWwwZWRXRDNMRUE3YVo4YTNobUpJeTVu?=
 =?utf-8?B?WjcwL3NUcjUwcEExbC9maHJFRGxNNkU2TjQrOWR0UGtEOHYydzJMV29GMGUv?=
 =?utf-8?B?cndQNGtDOVU5QlZPaEROWC9wWjBJQ29nQWUyM0lmWktzeWZpSWJHNEowaXI0?=
 =?utf-8?B?M2Z5T2diL2h2OSsyT2RrMmtFajFtNDRsRTA2ZFN1SkhVa0x1ZHA0cC9mcjhl?=
 =?utf-8?B?U0lFODVXbE01OHlXQTVZSDE1RUtJWXQ2RkU3bnFZcHduUjBXSVVnVHJibVRB?=
 =?utf-8?B?TkQ0ZzhYSHdOWThlQlFraDVHcU5JTENkQmlCMFplT0tvSEUxOFBLeU1VRHFo?=
 =?utf-8?B?NUhMMTkrdzBWb3dQN3lTUmxSWDNIQko5S0F3S1BBNHZGTEQyd3dzdHJrdmVD?=
 =?utf-8?B?N204b2FyeVBwdngxcG5qM3Z1Sjk1RUhkMHlQZExBalh3MFJnak9XT2I2R05O?=
 =?utf-8?B?WXlldFF6bi9Ib21vWlAwWHB6OTFqVFFlYStYakwrTVp4SWhBTkVaZXV0UStr?=
 =?utf-8?B?QXRaT3hIMVFoQWlXb0Y5TFo4NmR6NXJZMFNEaGtrNDdReUpkcnNZL3JJZ0hk?=
 =?utf-8?B?dFBQMUFicnppb2VCSVgzK28rM1JKSmdKK0xPcDlSQVdjMFdDUW1YK2ZWcys3?=
 =?utf-8?B?N3FETS9VYnhhclgwcnNHcm1SdkV3WXZ2aFMyTXZEdmoydGVZRGtoNXBOOE15?=
 =?utf-8?B?OGJNQWtJUnF5MWlUSm5MY2NMd2M0M09HdDBJbDBDWGxaQ0JHOUFQR3NqeW1B?=
 =?utf-8?B?YVljamFiYnFhcko1T1RVaFBPN0FxdEJYOFRMYXEraXZNUjJSejBvZVcvdzJW?=
 =?utf-8?B?MXhxTU9DSlROeTN5ekMvRVR0NGRtTXE2U0kvWFNvcVl3MVFNRW1xN2ZRZlQ1?=
 =?utf-8?B?cnlXbTNhdlNnT2FKRUlvOGdwTno2RitURWhiTHBlZWJvcmRqZmhiNkNwUHkz?=
 =?utf-8?B?SHYzSHJZMGJkRFBWdTduVEVIclJ5MkxWc2tHZjN1cnQzeGFab2NUd2R0TWdF?=
 =?utf-8?B?Q3AzUDhoczRCYzBIdUkxdGt1Q0dVQmdXK0doNGVrZDA4Zm5DMGEwVEl0a1NX?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4ed052-7b47-41ba-219e-08dcfe4b0b69
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7060.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:09:04.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDINl/Tj0tep7FDYzNJyQ5uKVwwRwp0wITQb5JQXaPJcpb0UmDC843QwCk38EUkQkdknKCt7xVgogo2KCDhmjZHCm6oIfRR5713uLdQ+O4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7022

On 2024/11/6 17:46, Andi Shyti wrote:
> External Mail: This email originated from OUTSIDE of the organization!
> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
> 
> 
> Hi Liu,
> 
> On Wed, Nov 06, 2024 at 03:27:42PM +0800, Liu Peibao wrote:
>> On 2024/11/6 4:30, Andi Shyti wrote:
>>> On Fri, Nov 01, 2024 at 06:18:36PM +0800, Liu Peibao wrote:
>>>> On 2024/11/1 16:44, Andy Shevchenko wrote:
>>>>> External Mail: This email originated from OUTSIDE of the organization!
>>>>> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
>>>>>
>>>>> On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
>>>>>> When Tx FIFO empty and last command with no STOP bit set, the master
>>>>>> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
>>>>>> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
>>>>>> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
>>>>>> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
>>>>>> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
>>>>>> when IC_STAT_FOR_CLK_STRETCH is set.
>>>>>
>>>>> Who are those people? Why Angus Chen is not a committer of the change?
>>>>> Please, consult with the Submitting Patches documentation to clarify on these
>>>>> tags.
>>>>>
>>>>
>>>> We have discussed and analyzed this issue together. I developed this patch.
>>>> This patch was also reviewed by Angus Chen and Xiaowu Ding.
>>>
>>> The tag list follows a specific order: tags are sorted
>>> sequentially, with the last Signed-off-by (SoB) being the person
>>> sending the patch, which is your email.
>>>
>>> The other SoBs are fine, but if someone contributed to
>>> development, consider using "Co-developed-by" instead.
>>>
>>> If someone tested the patch, use "Tested-by"; if they reviewed
>>> it, use "Reviewed-by"; and if they simply agreed with the
>>> change, use "Acked-by."
>>>
>>> Please ensure that "Reviewed-by," "Tested-by," or "Acked-by"
>>> tags are visible in the mailing list. I do not typically accept
>>> offline R-b, T-b, or A-b.
>>>
>>> This is why Andy asked about those contributors. Three SoBs can
>>> seem unusual, but it's acceptable if justified. Reviewers may
>>> ask for clarification, and it's fine to specify contributors'
>>> roles. You can also provide extra details after the "---"
>>> delimiter.
>>>
>>
>> I think this tag list should be much better than the original. ^-^
>>
>> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
>> Co-developed-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
>> Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
>> Co-developed-by: Angus Chen <angus.chen@jaguarmicro.com>
>> Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
>> Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>
> 
> Thanks, this make much more sense now.
> 
> Just one question, do we want to keep xiaowu.ding or Xiaowu Ding?
> Can I change it to the second way? It looks better and that's how
> it's normally signed.
> 

I have confirmed with Xiaowu, and that is surely okay.

BR,
Peibao

