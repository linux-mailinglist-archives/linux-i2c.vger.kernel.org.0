Return-Path: <linux-i2c+bounces-3705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9368D3626
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 14:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32BBFB21F46
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 12:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A752413699A;
	Wed, 29 May 2024 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="Ct5brx8D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2133.outbound.protection.outlook.com [40.107.6.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BE22089;
	Wed, 29 May 2024 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985024; cv=fail; b=Kek2uCl+9ZvLvJLyJACgI6aoVT04iI2E1mg251Nukn3+YcWX8+wkYBZhPLiARt51i6mIYZKzVc7lTPPaF0/4OkKVlDk3OZhBvtHqneqb3mVL4RtK9PasT2bMLubRIbmvRhqIzXlQOYQRWnMqhUOoA6WtBz2S749IGoWY2l3v1SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985024; c=relaxed/simple;
	bh=GcwfrUGjK3mPkFqwu3jkAbxHnQa8m0fQka5pr1GJeWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YSYV/7Z33COVQsJxrk8lxFt75yLrr8DC/Bwgi+ruweYqs4io8KB55Zax7iofST4RmVt2NJoBQ/xBdlaGB15A8gG079K468eJuIdcwA6ECW/rZWyBFcWVf1ywJW48/6TetQ0rIZgm1Lhi9d7X5TR79qRD0LBP33YYt0Frd8OebxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=Ct5brx8D; arc=fail smtp.client-ip=40.107.6.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdN8LpALDha6ty0zJr4KlDfHDsDAi8p/YMdhx2s5i8N/mQsSML7beOZCj++sHeq+jFNODxBaBgtAjU4TwXHQzsugL0H445daGVD7yeL1RnDjIU2dV0I0ZcqG0X1o76eEa/6pBLZUO+eYDAN2DnJ6r6+nZamf1ThQUogibirp1kgG2VkqanFbAf+wqwV1yuK7DAgnlnuc9MqAsuHNJ7Tgd203rqZJQk7sWPCiZy5OjrGI/N7gOux1coSlqWBegO4Ju9S1qeC+MoRoqFmp8Ofr1SmQyOyfD2UzC6P9nqgHJGjEJv+X2rfs03OGKvlYHySl3xftwEhdnowNvRylnqZ88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omf99T/di9T7JtfjISJ1RuZTEhsVWPeXv/fFA++bSSg=;
 b=GgwBUNRvlsQG9uDIWOjHrwlR0O7x8mYPEzDZIKls5ljihrJbjg5LwELvrz8v/w/TZH5+rzWtOfr38WBqUqhpR9zUGh8+dgXdAQ538vpnniEXYkGyX65U2KiNxZ4RDQ5RRBK0qT8c+9FagF/ahY2ZdfXkyUbWc3ZT+IJ4LJ4cmYvEB17zUgguMb4155hLKYV6TjDLTVSRSovHhgc3urkUtys2cXHa7/e1diXGsNfsDM2tWuPaGTcFkE5f0f+k55btjRzMbWLuRb0tguWaN9FIFuiZdrG8cG1q/mkIFhpLAEa/UukGp5FWYY8TQpWlpi2l2treSx8Z9XXdoJM8E3Ol2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omf99T/di9T7JtfjISJ1RuZTEhsVWPeXv/fFA++bSSg=;
 b=Ct5brx8DiJI4ePAh9KLwT24o2luFHFJEtQINrfdnyQtj5F4qdtAxetgebydSGXTPS4BbWGEfQY68NLi8kJVS9To1KQ0sJp2izJ9R2e5sOJ/Njr+dsjTa4i+UJuWtF58j7Gyx61okueNflLxhBVTSyKFeQxSXsofJM9gKtGrZFCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB9PR02MB7116.eurprd02.prod.outlook.com (2603:10a6:10:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Wed, 29 May
 2024 12:17:00 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 12:17:00 +0000
Message-ID: <ca3a96c2-e4d9-d935-cf1b-114f7a59872e@axentia.se>
Date: Wed, 29 May 2024 14:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] i2c: mux: gpio: Add support for the
 'transition-delay-us' property
Content-Language: sv-SE, en-US
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
 <20240529091739.10808-4-bastien.curutchet@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240529091739.10808-4-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0027.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::26) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB9PR02MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf4e695-de6e-4112-3d47-08dc7fd93ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWtJSnZmWXpiYW1HaUVSZkVqUk5BNXFscTVaek5MVWY1OE5TUThSUjQ5S1ov?=
 =?utf-8?B?cWtqQVZCTDR5cDRvczRFVW9ObVBOTExXNWVwQk9qaHlnNWxzZGVaRTZVSUht?=
 =?utf-8?B?SUxJajMrVUZ4TjdTWDUrRXhIWUhHZG5JWEdVWmpsRTBQclJ3SThVT1R1Qy9D?=
 =?utf-8?B?SE1qbGJxRVl0cENpUG5TeTRGZnQxVlNSenk1bWFaZDFrQ29KWUNOcmF6QmFz?=
 =?utf-8?B?eFlJMWtnU2FvY1JJQjg3b21uME5ETjJ2THdBcjVIZEF1b0ZPRjc3QTJ0aXVT?=
 =?utf-8?B?OUxmV2tsMGk2ZUpzSWxGTjhFZ3UwdmVjM2laTVYzbkthbXJubGQ4cG5RMVJC?=
 =?utf-8?B?QnZITTNmYTh1d29FNTdqZFdwcnl1enNJYjIxZFVoYy9vYWRzK2dFTnpGajZp?=
 =?utf-8?B?SWR5TzVWcWJRd2dWRGtYM2lFVlVuNDVFUVpzcVRjcE1HUmZkMjluZXRNNzR3?=
 =?utf-8?B?WWg0Yis0ZjFFcFVlSVpFM28rMW1ZTTBRK3VTMHljaVlWTWFNRDdTdUk0ME5P?=
 =?utf-8?B?SlVCeGRnR1hrYUNLS1Uva1dTS2JJNW5kaUdzZlcyK3ZLQUtWYlVrNWs5aU5v?=
 =?utf-8?B?eDJqNlIxY3hWc2lnL1BoaFc3SnlUdExObUtVTmRqelY5VjBWTlhqelZZOFow?=
 =?utf-8?B?bndHS2N6ZVdneEMwQTBZOGMrMnpwNDBHTnF1Qmk2S05QbHRQckpiZ0lvUzhk?=
 =?utf-8?B?bGFCSnhQNFlaaW9HZWEyeDZ1L1NlWk04N04xa3JmbG5Qazg3eTZoc3REeUtF?=
 =?utf-8?B?WHl4eDgrb2x0ZXIwTVI4VXFVNFVmaE9sM0FnMk0vOTBROWhiVzI1MEo5Sktu?=
 =?utf-8?B?UThvUDhqTWxtWWNyOFpCNS94bHNLRmNXcHRvQXprT2trZy9ZZXlpOHNlK3lF?=
 =?utf-8?B?a2Z6dmRiTElwQlBWTVc1YS82V0lMOUJNcDlWaUpSbjRoUGVtTTJwRlY1emFR?=
 =?utf-8?B?TVZBQ0NxQmlmUmlrdURXQWoxSmRXSVpiRVFTZy9CeFlYbnQxNEgyTnk0L0FD?=
 =?utf-8?B?OEx3VFIwbnQ3VnpHdVdBZTV1b0ZCYTRnMlJRdEE5RUpHVWlxYm1BYWtzMVpW?=
 =?utf-8?B?WENuVkRmN0JRNnUveHR1aGZuVjNtOWE1bnJ2Z0NsRmF3ZEx3bWZJMkhISU15?=
 =?utf-8?B?SFRUUzFjRGNpUjRyK2U2SHRyTm95elhQSkJmNytNRFZRdStmNmJPeTNKMDl1?=
 =?utf-8?B?Z09TNGl5azlQUHhRNWNkSmlGb2hzUDhMdVJPb1JmTjhGU0tpdkM0bmwxZkM4?=
 =?utf-8?B?NENITVdYQ1AvdUFvY3hXZ1EvZ3lXaHZSVCtkbGwvNmNCclNTaW5acnZZTFFa?=
 =?utf-8?B?bm45bHRjaXkzZHBiam5XT2U4UEVQUisrTXUweWZPMFRVUzh0RWttQXliY1lV?=
 =?utf-8?B?bHc0bTFDejdrVlQ4cGh2KzRHRWJibHduaGt6ZmNZQmltSHNGZXFraTUvbzNX?=
 =?utf-8?B?dktXUjdhUCtQcGNlUVNJRnoyY3RpS0loTFUwd2dEZGlzSnpRNjhjeStrQitU?=
 =?utf-8?B?a1FtV1RYRVMrZlZXSElMTmt5SDhKYTRNL0Y1RjVmWHFLS1ZJNFlaNW91SjRn?=
 =?utf-8?B?VG9jeFFDcjNjd2gwZzFhSmg4aTIyMXFMZklyUWRDcDIvNzRQdHVkSExIY0Zv?=
 =?utf-8?B?QWxReFVtUnVQeWVEZ1FWV3dJLytOS3RtTU1Pc3dIQ3hqM1pseFBsQXV3bFhr?=
 =?utf-8?B?MWhJRGlMaEtkWEtDbUxLUXZLKzlHenFVYXFDK3JkRnFEN2tYMHlvS2NRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVnc2FtQW9ENjVFZUxhbEU5YnJOWTllSUd4ZGxra3hoczdXT29ENllVOWNI?=
 =?utf-8?B?d0U5R0I3NjBUUXZRS04vMG1udXR0a0crNHdmaXNTZ0tsNGdtSDc3dUUrRm8w?=
 =?utf-8?B?eXFscUFpeVNkTlJvQjIrd3JaUjlXZ3FFZXN0SW1MSU9tb2hDV213UUphZllM?=
 =?utf-8?B?aFFaa2dEb3UyV1JFRnFVbS9Cd1A2amlnOU9wdWVhRS94blVra2FzbXlzL0tB?=
 =?utf-8?B?S1o0SDlaaHBpaWFNck4rRFBCWEFRbmw1a3RhcmhnSy81MjBWNDNwUGw3czNK?=
 =?utf-8?B?N25DU3FRaXBiRlZ1Nk5wdHAyaVpHKzU5eTRXQWx3TnB6RGVreWJPc0lCWlVE?=
 =?utf-8?B?UERqbVJ3Mkcvc0J0MWtTbXhLZUZOWWpMUlFPZytIcXhoUlNKTyszL0FqSjhW?=
 =?utf-8?B?dUZsZWJUWDVBWVRvdTkxQ01iY1QxZkhGdUh6R2hyRk1BUlhVWERRMGVCQm9y?=
 =?utf-8?B?SUVqUjU3MlBwZGNEV21DbitZbDBmbkI2SHNVVEhUeS9jU0RjVDM1a2cyMnJ6?=
 =?utf-8?B?MUFDRzhkVXZwT3NabDFpc2R2WlNzVmxXNlh0UGdZeTZabDV0M2ZTWlN4K3o1?=
 =?utf-8?B?VElYV2ZJVWg2Nmg3ayttdENldkFiRUViVnk3dWpjaUdsOUd6NTVPMEdCenBF?=
 =?utf-8?B?eUk4RHFaQWt4R2I1ZmxlamU3a3FGWWxjZEs3L1ZOZUFPMkVhZUFRN2ZBQklo?=
 =?utf-8?B?L1lLYVVFOEZ3U3UxSGZwdks1NGNKV3VLTXZIWWwvVFlicGRubHZEOThNUFp5?=
 =?utf-8?B?ZzFxdXQ5YllTUXNBU1FHTUppd3h5SDQrNUR4Y296c1JldDdqbGt0UFpiV1hE?=
 =?utf-8?B?TVJVclYxa1hCN2EzZTZHTElLNSs1TGtXcjczcWJWS2R6eG9BNzJkbE5LeU1m?=
 =?utf-8?B?eW1pL25GWmFyaFo5NksrblJSRkFjbGtwMlFScDY1WlNNK29Jd3ljTzRwb3pn?=
 =?utf-8?B?bVVEaittSXczZFFwYTRUd3JsaWEwemY4QjgrcFRpblZhVEpwUlA4a2pQdzlG?=
 =?utf-8?B?YXRGMDNnOU9vQlU0MWloT0JhWVo5OFc3QTA1RnFDOEVmTTRsUnBEaC9EQ2pS?=
 =?utf-8?B?dVVLa3l3TklOOVlGdFBKdDgyNVVPWTJIMTI0eVlWRS9PZDdCVWdHSUZkWC9P?=
 =?utf-8?B?NEhNaC9WQXVFN2VGMTZTL21DVTlzWHltaVh1dTBrOHgvL2EyRjQ5QjlnL0hL?=
 =?utf-8?B?dTYra1ZZVWQxK2t1UnRnM1FqRHA4eHlQKzVUeFZ0MnFNMWhoZWxlTFFqVzNF?=
 =?utf-8?B?TXk0UHhkNDRaQ2FpdWx2SFY4OEsweVJyWWRkZE1xdmNoMExIRkFnSWZaZTJ5?=
 =?utf-8?B?SVNDUVVFREE4bERpbVM5WW9hRFJTVG9hYnJzd0RyWjNwczNDYWRwQ3FPb1N3?=
 =?utf-8?B?SFYyaUtBQ0I5UktCM3lQUXNxU1dTNkF5RCs0U25lcStjd0huZm85cGZ5L0JW?=
 =?utf-8?B?S1lsVW0zQnRuNmVlK1ZGbkRvQWxlM1dzYWJORWZmSEtZaXcxczMyVkxjQ3U4?=
 =?utf-8?B?WGF4dlNkOElLVUZwRU9GVlF6YlB3Qlg4cTYzUXY4REJJS3ZMOHpkSnd5cUgw?=
 =?utf-8?B?bVJVd00rVG41UlJsSE1BWExRYXA1MDdlRDRiRzBQV3pGRldJMVlGR3QzWFh6?=
 =?utf-8?B?aFNKWEMzTDNnVGRWK0VLOEFqRDVQTGpBUGhtKzFpQWlWQ2NaQ0NiR0RJYUNz?=
 =?utf-8?B?K01iTFlyanBDNmszQ0pLZEdKejZTQloyR2tVNXFHWWp4MzVCUjliamVoR2lP?=
 =?utf-8?B?YzFkclIzZnpHVnVGTjQ5b2NuQ05vbFQ2S1hHTGtFSGYvdHJUSEhuNG94TEpI?=
 =?utf-8?B?VmRUZ2pCMnZxa3d1RkI4dXN6MXNkLzgrR3pGenZWb1NHN3F1S1BRNTdHcXhs?=
 =?utf-8?B?SkZUQjUrKzZpajBacFlkWUxDVU56WjVWZTB2MDQ5MmVyN0hWT3dvM3hwbWc5?=
 =?utf-8?B?TzAyUG9zelZsa3Bndm9sTEpMWDRMNXl1ZWM3emppT0RyMi9IRU1ia00yVE5Z?=
 =?utf-8?B?ZUVVRHlNYmxTWFExaGx1cklvU2hwYi9WSWpEdjRUZm1EOGRvd0dkamRPQVIz?=
 =?utf-8?B?SWdxUzQ4ZHIxbEovdWtrNFFxVmJ0d2NzRXB3dDMwWVNqUHBiM2Z5WVVGYm1r?=
 =?utf-8?Q?bq7so3QjzWY/h4DBNilnfKkmq?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf4e695-de6e-4112-3d47-08dc7fd93ded
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 12:17:00.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V1zUQ0Pakt2Yk7C4dnga7X/JxLdlGNH2x9+npOmGtvKb1/ZEKqlT7e7m/JGKI9/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7116

Hi!

2024-05-29 at 11:17, Bastien Curutchet wrote:
> Some hardware need some time to switch from a bus to another. This can
> cause the first transfers following the selection of a bus to fail.
> There is no way to configure this kind of waiting time in the driver.
> 
> Add support for the 'transition-delay-us' device-tree property. When set,
> the i2c_mux_gpio_select() applies a delay before returning, leaving
> enough time to the hardware to switch to the new bus.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c           | 6 ++++++
>  include/linux/platform_data/i2c-mux-gpio.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index c61e9d9ea695..b9cfc80660e2 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
> @@ -37,6 +38,9 @@ static int i2c_mux_gpio_select(struct i2c_mux_core *muxc, u32 chan)
>  
>  	i2c_mux_gpio_set(mux, chan);
>  
> +	if (mux->data.transition_delay)
> +		udelay(mux->data.transition_delay);

fsleep() is appropriate here.

Cheers,
Peter

