Return-Path: <linux-i2c+bounces-4820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720692CC6C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7AE1F21F6B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590982C60;
	Wed, 10 Jul 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="BODBG5YS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2108.outbound.protection.outlook.com [40.107.21.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF084A39;
	Wed, 10 Jul 2024 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598585; cv=fail; b=A66f1ZrVjNpHAYzuYaFhkGDE8JlhuWfesTR4WHowwFWQKfyPNKJpJEBB9VpQPzHKIT/IJHJSoaa/gRaosIwSmsF5IbtMxfV8TPiSv/sq7dOMbFMA6k2capeUBz3Dgtk9rtP0xKNDB6MJo1kEJj4EfC4C8wJZqE2PvF/8wEqTwS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598585; c=relaxed/simple;
	bh=PgsFRug/USgxKOIQbypBo9YO7XnVqa3rI4YQjl9ni8A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U8wXrjlDoFCethUiW9nSoGBII8Qg3detGRTWBsWyLBUUB1AiUDNdx431mH6UXZVm29Qu6mCShrnq6y2q7ktznXmrhw8mYnkO/iOZELYHalw4157zogchbNl7w3GSrNoEXltdYT3/YZxMxNagz4Lf4DlcIQY9ThWIJB+hfj5FwdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=BODBG5YS; arc=fail smtp.client-ip=40.107.21.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZrhOglc6/Z9gSIHI3UQTnp3dF3+jjRnfhRlzuWiNEpDSUTtsx5qTTHtKrpubEJToVI0LzQZ2la0T0O0aLH95WDIVHnaxIHSVVNIcOLZm9mXtPHShvF+5qlkhQhMCJnliIa+WpIbglNuKE08ejANr41K6+bTbAonUi9ODZIEMXGaKhzX7vVgL6ANDxeVFQaHlFhvNV6UuK1Yd5dfSJ1VpWpUetWhFheU/1DnrgHGiBSro5eDDH9JxetpFu1kGxNx/QPA233qrdUEaaSGN0Vvkj6pzepY7nNZaeKXxEqia19hMHvG3OphjSV+h1Nsecqb9YGovZ2oi0N4yoZG/aYi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ASzBECXSjvLE2aAcAfavUsIi4VZ1IpYwzOldbZ3Ozw=;
 b=M0QuSJLrg/Nwfqe+KxZ60cP4C9cDvdgPx+f4YT7MtA6Ko93YbCVkCQoWKraJdRudx2tOTddtf4VyVur8y/WDOGLEuYSRaMHXJnfT/FBuQ1e6Ja8DSV9aHYQNlO3Ny2K524jKUfWIE87ZCwChmAwN36V/5MvXXTtRnk6XAQJiWjrWK8yMQ1Djy3/q0W1W07pq+wUzWp7qzfuZEAEtevqgwD3P8TYvdBiOrdiVi+R76wgYTom+eT0zYpca+b3eY3IBLaNGwSOTlXMBlRUKtXm6g9CGufjUZV23X5FosIm3Y8oN1n/6zvDdC5MPb8C6r2rmB8ZcDg4gEZzittq/y6NMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ASzBECXSjvLE2aAcAfavUsIi4VZ1IpYwzOldbZ3Ozw=;
 b=BODBG5YSYUXwB2qhYtO+IgMomnGWkUQhfirudJ57JBiJEmOf+3P9ljEdGI5nNexfMaycUSbfkHg+yXRfJ/65TcZospKZTz116OE2VoL3mk/tDc7OFB7frouQl7+rL9jNtFB6DIs8a1rdiWuD6yOn4R/JiWOuSAfmzov2DKEXld4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PA4PR02MB6750.eurprd02.prod.outlook.com (2603:10a6:102:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 08:02:58 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%6]) with mapi id 15.20.7741.030; Wed, 10 Jul 2024
 08:02:58 +0000
Message-ID: <8b723ef0-a75e-d324-6beb-0f4e5a5fbaf3@axentia.se>
Date: Wed, 10 Jul 2024 10:02:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/3] i2c: mux: gpio: Add support for the
 'settle-time-us' property
Content-Language: sv-SE
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-4-bastien.curutchet@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240617120818.81237-4-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::47) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PA4PR02MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: c07fce3d-88de-47c1-048b-08dca0b6b64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE5qVVpwczRjKzl5TUdpdzFlNVErQ0ZwdlVLM2FuazFpTTBwRDZ2TTFIK2tk?=
 =?utf-8?B?Yi9yZ3crVnVRays3bHh3U3l4ZDhCU0d5S1dzMTk1S1F4M0xDclNIeitJRVc4?=
 =?utf-8?B?V3pZdHppWk0vS0g3bUNvNVNxclp3OWJRN2JTTlpGc3BmTllZOERUZE0rbENL?=
 =?utf-8?B?Uy9SL3UrdmpKcWxHL29sZmJCYUpqWGhoNkVyODBtTUIxYkViMVpSM1JoSldM?=
 =?utf-8?B?VndwODF6a1lCdXMxSEpPbDZGNThhOUFXeDFkbXFDWEFSRWhoZlFIcVB2Wlg1?=
 =?utf-8?B?cDVVVDRJcHJrS2s2S2F6UzBPRXlDYjQxOVQxQnRmb3JoazFHVWRZN3RLOVBL?=
 =?utf-8?B?bHJGS0NtMFMvdlhEYVdIckU0REFSdWN0TGhiaDNDd1ZET0dnbzVacXo1Z1RD?=
 =?utf-8?B?dWI3THVnYzJFVksydHRlWHU1SEd3czZMb1VuWGwwNDBLS3I1WUd2MnJhMHRo?=
 =?utf-8?B?L25iMGNQVk9CL04wUnpJQ0YzWmtrdXJDUE5vU2dUcHQ4MTdLRUxQakR2cVZx?=
 =?utf-8?B?SFpycVBrN1o5aEtCMHBPR010VDlSUi9qVjk4eDlzNnlFT1pCam94bmxmQjJW?=
 =?utf-8?B?ZTgwVFB1U2VPSUJhUDMvRzg5bjByTEdid2NtMkVpT2xPeTk2dldpbVp1N1Ny?=
 =?utf-8?B?ZDc5WU53UTUzUHhwdHhHQ2xkclE3dUlYaXhsbWdJOXRwL0dwamliUXVzTG04?=
 =?utf-8?B?VnhKbTYwUnJHOWxlamNEc3lZSVBPVHgyQ29XN2phQWF1dHA2RllBTEYrc0tU?=
 =?utf-8?B?b2JZQUJ4TzF4WGtQTnVDUURsQnJJM1k5aGdwaU1OZ0xrRHJvaDlOUjJzV2Rt?=
 =?utf-8?B?UnYxeU5RZDBPV3UzYk9Qcjl2UnlSZTRGU3AwZGZjZVhwcG8vSkV0MFlaVkUv?=
 =?utf-8?B?Sjd5Z0VxYlhlMmxrTjFwV1lQeVB3Z3FJVXFTelp5TEF5MHZkRS9OK0ZWa2kv?=
 =?utf-8?B?SzJOVk1kc3lxN29mVGVKWkl0NGtsaWx1VHBOSkdBbXpMVm1panczUmpIditn?=
 =?utf-8?B?a0hwNm15VGgvd2kyVm01TlljaW52SXNWQllLR1BFOU5HS1FOWjZabjVpbExl?=
 =?utf-8?B?N1AwQ3czM0ZZaXh1TDVYNG1hOUlkR2pQU2ZHSW5VdEVqSHlEV3VJbjBFVlZ1?=
 =?utf-8?B?dk55cThHQ2NFZFZUdUpickNoVmpEYVlTczVYV1NkdncvSmZWVlE0bEg4Yklu?=
 =?utf-8?B?bXZBWm9lUXpqL3d5elpHbkh6aVhzU1RES1E1USs5Z0J1NHVIQzZoMnVUMGZ6?=
 =?utf-8?B?Q1RsZFh5Rmtmc25vM1E1eWE0akNsQWs0QjArMzlkOWxxTGs1QmhQWGlaS2c1?=
 =?utf-8?B?WkRNOGhSTFBGeGpnT3VxOUo3TVZVTEtWRHZhamduM09US2o1NE5ab3dFS1l0?=
 =?utf-8?B?WFVtQkYwK3IzejhrSDNpRkVrSmZrdm4rM0xXSG5mbWVIK0QxUkVKWm5MZWpO?=
 =?utf-8?B?YVFwQkVoOTIrQXA1NVQ3Umt3MjdwTHZKQnh5TUhCcWo2RkRhR0VESXpqSkFr?=
 =?utf-8?B?U09IWUVweS95amhncUt2WmxNU3c1bDdOaXg5QU1RdGpvVEoxdWkrTlI4dHE4?=
 =?utf-8?B?QjBnMWFOTm50UzRpUnN4KzNvdlFuQXhkVURGeEliWFZvb014RDI2K2RJVE5k?=
 =?utf-8?B?YTJzOTg2ODVOQU1Bb1Y1dnBBTWdVblZ2RGRzY3RlaGcyeFpmSTZ0UGNxUHV3?=
 =?utf-8?B?b3I1Y3hUSFBXUVZoMVJDV0hlOHZid1kvTG5pMFk3dnAyWE9rNk9LbU9yekpi?=
 =?utf-8?B?RWcwaTVlbytDbTVTNi9YSEoxMjZjS2ozQUF6YmYwNGdzc25ZQ3ZtTm9WQmhj?=
 =?utf-8?B?RHo2cVhsc1ZaNGZNS1Zhdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym0xUzFENmJxa1BUV2hVSEpmMlk1Q1VrNGxxc0dWNUJxck4xS0w4cEZWRHRt?=
 =?utf-8?B?NjFEcVl2UjVpUzd5K0RydkZUZ3NRVTRjL3o5WTRFdUN4aVQrdHN3RW5xVGd2?=
 =?utf-8?B?ekNFZk1US2dla2d0S2hiSTVHcEx6Q3d4c2FxRTh6MlZCWmg0RzAvWjIrSTBj?=
 =?utf-8?B?bmtLVHgvdERKTnMxVGFzRzBMUW4xUTBTMW9YY2dJRFdwSUhjeEcwNU5PeFVw?=
 =?utf-8?B?dmJqMWYyS2ZqVVk2di9XaHlKZ2F5amMrczEyQzZCaUgxTFJiWG9DR3ZrMlZR?=
 =?utf-8?B?QmRqaENZUUFpWmM0TmtiSDZCTEZsOUdleFpZNlJNOEMzVzJleURZZlhBYWpR?=
 =?utf-8?B?SmQxT09qbVNHVVg1MjQyL0RvSTJhWkUwK3VFZ3p3VmExOFhjRk1TNWwwQzZt?=
 =?utf-8?B?OVdKdlpNVnpYcTR5UGhJc3R2SzdDYWN6Vi9HL2NINmcwZi81VVo1UzA2b0pO?=
 =?utf-8?B?bWdEYzF0QmEwbE5qY0RqNFV2dmRoSjBEZmZFN0gwSmVhK1dxVEI2UVdJdGhx?=
 =?utf-8?B?OTlDQnlhQmdQTHVhd25xWG4zZnN4SE9HeEVqd1BpOVN5bWJjOTI2NnFHOUJW?=
 =?utf-8?B?dlBFcUsraWZndkFGWW5FYVhoOGs4QW1YVjN1N0VXampVVkpyY09ibGYyQlJ2?=
 =?utf-8?B?ckVqYkFhUi9ONnVCVGx4L2IyemZRcTVqWXM2MElUOWhBNklNOVhFT2dXSjZG?=
 =?utf-8?B?Uk9qT0J6M3hRZCt1Q3o2Ym1WWDB6WVBxeTl5U1hObWxDa2ZoWWhpZXlDK0xV?=
 =?utf-8?B?aFZ0Vnp5NzdPUk1CeWpVT2x2dXM4cGUvcXkrNjJFM3hWT1F6QzlpYm95UUVM?=
 =?utf-8?B?M0FWTjVkUDRPTW1FNk5zcG4wL3FrVnRyMlJUdlo0eDNGY1krbHdETGJRcWZQ?=
 =?utf-8?B?SVprbzF0MnAwdVRJQ3VhU3NFYWVYYVExMFRQelN2QnBvaHRxS2FYUEZuUzE4?=
 =?utf-8?B?YndTNXhuQjI4QTJteFBPM0NWS1gwOE1Lam43Sks1VjVvWG9NSExFR09ZZE8v?=
 =?utf-8?B?TzBmK1NHSUpEcThQVTNBUXFlaktoSm52aTFMdXg2Z1Z0Nm8vcCtXM2JHcGVV?=
 =?utf-8?B?dmlMQnJKVzNQNWdrbFdPREFyY05LV2YyR0N0c2hlS2E1aXdzcHdKcjZyb29p?=
 =?utf-8?B?V0NGbk5BRWxjSkxxRXZxQTdEbjQrYXdRckh2SE4xR1RoeWhJaVdoODduMkZL?=
 =?utf-8?B?eWF4V2U2UnVSK1luQnlUczdnVEJkRlVnazVSczJFZ0owc0QrY01vMkMzZGlR?=
 =?utf-8?B?YUNzRDVpTkxHT2hUL05CNEtHVzlUOFoxQXprMlZMZHRiZkRoaU1scTZyTjNp?=
 =?utf-8?B?dUNrZG5pWGp6YzR5cjZWM2QzUlM0dFh3c21sSXlsNkJJdUJmelhEMW5tSzZk?=
 =?utf-8?B?WFFvZjVlRVZ5MDlyd0FJNnFGdUxXZWY2MXREU1NJZjk1TllGVHFKSitpcmFD?=
 =?utf-8?B?Zmcrd1RkOHAveTZ4N0FKZ1RCS2lkL2NFL2tnZ2s5WnMzY0VzMlJtRkU4K3Vp?=
 =?utf-8?B?eXJaVkc4Yk5Udy9DdWlXNUFIUFhIUnQxVWRqSm83NE5IcUpBQ0FqRGdtYkRh?=
 =?utf-8?B?Q0ZqVml5T3VJTE80UXpDQlRoTUx2L2V2ODNJL0RQUGloWHBkcldKdU5oUjdF?=
 =?utf-8?B?RUpKWUJOdHRRV1lDYzA2NDB0NTdGTklqR2J2aTRpL2ZqRXZsMTVJaWw0Unls?=
 =?utf-8?B?V2JZSjVBcXBRV2xUT1FTRVBXdWdGcGZ2Y0gyZXBKUjRBcWp4WkhLYjdPYjBu?=
 =?utf-8?B?QXhsUG9ZSG9JRzFsVzVqZTFHbFRnUklVM2ZmdzYzbGZscDBBdEJ1clBtbys0?=
 =?utf-8?B?bzEyKzFBb0Izd091MjhwdS9xY3hsdTFIRUJLaVVleCtReTJvc3B4cFZuNm1S?=
 =?utf-8?B?TnhvREttMmxZNWR6bW5ZeHJwakMzRWZvV0IyckRYeWt6aHgyREhWK1dSdk1x?=
 =?utf-8?B?UVhYTEdrRXg4OTZ4dlhYYlpCMHZuVVRoZEFmWVZBMlpLSkEwZnE4V2ExMnFT?=
 =?utf-8?B?Mmh2cE41eVNvSmVVMVRBRmlTL1JyZTQ3MCsramdRMXQ5NWsrbkRhc2Z2c0oz?=
 =?utf-8?B?MnUwVVF2OTFLNm54NGV6cVBOTVkrdWU1bjFLSjBKc2cxSU1Jc2E5OW9QS09X?=
 =?utf-8?Q?vOnXW9j8HKYJXCOANbQIGpUer?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c07fce3d-88de-47c1-048b-08dca0b6b64a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:02:58.3594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhSzvqUeP8kXQmRZoqpKurapA8NE4Cm6EknXFJYKy773i/MMstfPqkO7EJpYrXKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6750

2024-06-17 at 14:08, Bastien Curutchet wrote:
> Some hardware need some time to switch from a bus to another. This can
> cause the first transfers following the selection of a bus to fail.
> There is no way to configure this kind of waiting time in the driver.
> 
> Add support for the 'settle-time-us' device-tree property. When set,
> the i2c_mux_gpio_select() applies a delay before returning, leaving
> enough time to the hardware to switch to the new bus.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter


