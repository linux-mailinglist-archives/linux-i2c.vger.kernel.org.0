Return-Path: <linux-i2c+bounces-3607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF608CA870
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F852846EB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A94AEE5;
	Tue, 21 May 2024 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="dNur10BG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2115.outbound.protection.outlook.com [40.107.8.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225D7F;
	Tue, 21 May 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275300; cv=fail; b=eFQCr3TUbgwZqPgyIBV1tBkhI/txysHCijneXW3X0XTYxnnuI9IfpM80nvy8z0TlsFz1gn7JodDK6/R8DB27G9Jmj9HpnKH9cfDyYGGqf7JhyLC/p9YW9KFbSV/tr+Xr9ZH6j4oLw+IwKCoHNWiqARoRozsZIaqtMJoSkDHNnyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275300; c=relaxed/simple;
	bh=nL59oiV1SmVOLldUPuZCY6oOZeGNiQntyNZ3M+xsGBI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TC6qERwbb5quLp8Z5v7duA9p9a9JvrMJPBRGQAXNAVLNwktWEh+jmhzyctyUWtgFoAqhBLUr2AplwoQMfAZLMOGfvrPHBiT2uwuuKnXivVJQ8wpEuOWVeEdA3/8NFZS7cldW2RBuSn2nsMNn/KCFZHDuNz8agPFW/ozsw1zBwJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=dNur10BG; arc=fail smtp.client-ip=40.107.8.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJA/zP4CCS80GsxGvrS1zMGLXrfFzTe1aCXEQwBGz6GsknwUdyMiKqzbV7nPZLNHuhvIC3PhsOuQ3Yqft7ETYTZtd1mhaA/0MjcTNNcQLphJNhaMqbVy94ESJhNO7wK82RWhTfIDpztt/kaRA3AwsHQrEmIzc5jHPCYesEByr3rtqSRlDdxxNFm/zpSelAj3BQRQq6WV6rlNpNYgJUuUtmTDbnGfzjxpUs15OuRzy4nxIJqZBCrusQrWH52EzNoCWCndvT4duuJEFPjAGMqPC9blRmPT4yCF9TAwsvgJCa83TOToscPVPpFa1FFmY6p1bYIOLqpVS6r/ImdwvXggQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL59oiV1SmVOLldUPuZCY6oOZeGNiQntyNZ3M+xsGBI=;
 b=b8zUAwDDtj+AYa/DrNmmU0tjWa3c88xf3Pek5aISRQO7LUap2Hkc6u0u5+WsmDAhuReE2n2cIeqId6/FAwSEABJWlpge5XenJTqRFWL0Uxvo46NvPR8LyuAqwv5SDckdERvEDQkcaj5Exs6d2MHUw8K7010PDGQ/o4Jy8tfPjmCJuLs4CA0VhHRk8yCunpgZA+LZG0QilS/9u1nXKOH36mhSEKCnAFdlnNh77af/MER8WkM1vM5ilSF6TVLsL804Q6xc9QsCkKjKqT/Pblwbix8cIH15Q8cPsAu21uT9xWGmAopr3gTWf2lLFf0YB4m5YgtQRvSOxAvnb5F98GCFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL59oiV1SmVOLldUPuZCY6oOZeGNiQntyNZ3M+xsGBI=;
 b=dNur10BGatf2K8zaVNEWThIbPq8yzi/i5OHFwZSEbGnOzVMWuE6/fcYMQw28U8gFLjk3MrtTUis9kV1gtbjiPBIFg+/znfbDNyyhklVsQRpaB2a0rjbInpjg8tbFx3q247ucOJvRDJ2ncGHrjmrmYNV4BYpU35Rc0bo6maGpxXk=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by DU0PR03MB8463.eurprd03.prod.outlook.com (2603:10a6:10:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Tue, 21 May
 2024 07:08:14 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 07:08:14 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>, Mark Brown
	<broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, Emil
 Abildgaard Svendsen <EMAS@bang-olufsen.dk>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?=
	<ALSI@bang-olufsen.dk>
Subject: Re: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Thread-Topic: [PATCH 00/13] Analog Devices Inc. Automotive Audio Bus (A2B)
 support
Thread-Index: AQHaqFn5FxIWgsVFfEO7DwW8qJ0yErGbhICAgAXGFoA=
Date: Tue, 21 May 2024 07:08:14 +0000
Message-ID: <4w7ad3sy3gf7apijn7kdo2rpwkp3qvmyfg6p24lm6rnr4igjyz@vmphrn4rkugm>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <ucrnnveh2n3nhonbhvpxy7sl3ffaj3cdcx7pnb2h4dj5cwsznh@gfssqshjortk>
In-Reply-To: <ucrnnveh2n3nhonbhvpxy7sl3ffaj3cdcx7pnb2h4dj5cwsznh@gfssqshjortk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|DU0PR03MB8463:EE_
x-ms-office365-filtering-correlation-id: 7d3232d2-d9ee-49c2-11b4-08dc7964c827
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|366007|7416005|376005|38070700009|921011;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWRWcWxxbEprR0dtei9mNTZjSDRObmw1WXR6SytSSkRKTkF4YTJEcUxmUkxZ?=
 =?utf-8?B?WC9kc1BXTXQ4bGNPWXpoQ2FTT3M3VzMvbUVsdWtkSkZnZDQxRDFWay9Xb0tY?=
 =?utf-8?B?UFFQb3ZkWE1jZ01wc1dyNkt2b2ZXK0VUemx6dU55K0NZakl2QjlaUi95ak1R?=
 =?utf-8?B?cGt2VWRtQjM3dnV1U3VsVlZYYk9laTFkQ1ljc2hJcTJpQU4vdFRpYmxXU2Zv?=
 =?utf-8?B?dVJVTGhZOTNtRVNjaWtVK1ozVFdMY3FBeS83U0U1RE1rK2RaRDBFNnlnTWdr?=
 =?utf-8?B?VEJjejBtU3ZKbk1rVXFlTmJhRmJ6c2FtWGlQL0lwbXh5ZWJpOW9iNkFBcnVn?=
 =?utf-8?B?TlV1MEJuV0o2WXpmcER5VmhpRHBYNWgwZXdEM1J5cmN6ZkZEYVRtWS9GVSt3?=
 =?utf-8?B?aWhjMEIvTWpJdExmMmFPc1JoY1ozN3dBYi9GZFVGNE1HQ3lmVVBiR1c1Q0hV?=
 =?utf-8?B?YTVHRjIycGFrb2lVODUyV1d3V2tKZFJKM1RybFEzOXVkUE00ZG9oMFpadXZF?=
 =?utf-8?B?bGpPbGwxbmsvaTBaZ0FZR2sxS0lUQnM5SDY1UzI1Qm03ajRFR3NHdkZ3TTFJ?=
 =?utf-8?B?SDN6RWZvM1NYcmVmR2tnclJCN1JkeDJPRGUxYThMRSt0WkFuUDhTYzNodDVr?=
 =?utf-8?B?RytVVHE5YTF1WXZVems3UTVLV0pkWmhaSjMvUHI4TWZ3cU1GTEJETFVoNWlh?=
 =?utf-8?B?RmtOTXBzL1pqekdTZ2x6VTVIZjlyaFNZWGpFQlVEMFNKajM1cTFrVjNzbzhY?=
 =?utf-8?B?aGh1Zk9sTDY5eVZxeG1LaXVkT0tKNTU3UHBHanlWaFpwNS9rWmZrdmhsK2lE?=
 =?utf-8?B?OUlHYlNNVjdmbCtjT0syYVRVUjhZOVpheURWRE41ckttc2pjS2lHT2d2ZzVh?=
 =?utf-8?B?NW55RDVsWktqRUwxS3VxazIyekhjRi94U1NwcFRaeHpibG4vSWRyMlFVNzY0?=
 =?utf-8?B?MHc5REYzcTBaeGoreldIdlFnR2EzWGwwblJFSXhwMGp4K21TQWp2TktGVnYx?=
 =?utf-8?B?UVM5UGFmYmVwRFV3NEErNWxhNXpqL3RkQ1V1RlBURHdQYmZveEpBQ0F6eUw3?=
 =?utf-8?B?RnIrcXJiNTNtODFZUXpPbUVYSEdnOG0rU20vajBhcEFUSEhjRUpxcnhKMkpS?=
 =?utf-8?B?d0g0andlWHl6anQvc1ByQU13cG8zdkx4NEM4SDVUbjV1eVBSa0p1bWxnVCtY?=
 =?utf-8?B?NjV1LzJWWXZqVks5RzBEaEFIVjViZmJLcXdrQ3dqTStoZWorSEJPTGQzSmp3?=
 =?utf-8?B?Q2pwREo2ODN0VGZnZlRWMHY5bTJVSWpYOUNidlkxR28yK2RwdVRhTkN0Um5X?=
 =?utf-8?B?QnluSEZFVVozSFZPRklhTlBKQ3Z5RllzdC9tdk5GYnZQaVlyT2pjeWJ4anJK?=
 =?utf-8?B?NmNNeDRTZDM4dm5mZUhNUkhUc284OU04NmhUVnNZazVRNkp0bmt6ZTU3M090?=
 =?utf-8?B?cjUwU0orT3RwZzVON2k4WEdOdDNBNHdtaEwzU2VwMEI2UjNnUXBoeTdvaHFK?=
 =?utf-8?B?R0xEaGYrLzVJQkMxRllXVDU2TklFWlZ5dldIM2JDWWY0U2dPSTJGQTYweE1E?=
 =?utf-8?B?eUVXbUEwVXlsTUtTaGFubmFiVUFMVHV4M0llZlZYSEQyWXpVa1dGeVhmOVlh?=
 =?utf-8?B?YlIvUERaT0tKSVZ1c0FabGtLWkhlK1BKNU85c0VnT01OZXZDbXBETmNFZzd2?=
 =?utf-8?B?dzUzVEVOb041RWpZdnpEcXJsOFdVckJldHloRFo5VFRZSVFZNDEvdkxBT2Vo?=
 =?utf-8?Q?2xKiRV7tfoThiavzz4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2ZyQklMeVYvSUM2RXg0WmpwUmNOM09LSkF1UmJhWWd6c09JbGRScUNnMlVk?=
 =?utf-8?B?cmdIcWtzQnNValhaQjhIK25uSmU3Z1UwcXdydktQUS9TazNzam1Qd05xVzVz?=
 =?utf-8?B?aE9TKytnUDRtN3o5SXVEQXJLbDZNUGZDbDNCNC9RM3pXZUNRZ1VYSkZjYk05?=
 =?utf-8?B?cVZMbmJxMGJ1b2dzdWMrT2wzZXVzR2Y0SGJubnNPWmJkMHY4UUZhZDBQRjQ4?=
 =?utf-8?B?elcwWlkrZzg2aE5Fanlnb2xZL2hQUlhGNzN1TU1KU3hhRU5GUW1wdjlicThn?=
 =?utf-8?B?R3k0OUFmZ1VtZjRYY1FsQ24ybW5ScWxUeDhZOU92WkRFRlRPWHBjUnovWmtt?=
 =?utf-8?B?SFFxa2duajd3NS82am45WFJMWUc0ejJqWXZpNUl6N285VHBHR2FyMFNDcGlj?=
 =?utf-8?B?Y0RvVEloV05SUVlWL2pESXlRQW56UGpYd2k3VStaWlBuVmpybG1DVUIzOEs0?=
 =?utf-8?B?UVJlOHhOUTVtN0IyUjkvVnNMYTRFMkJpYUt3VDJnVHUyOHVhSVdSTStxd1Aw?=
 =?utf-8?B?OHVOVmM3Tko1bzg1NVNUWkVtVExhaEtxTnlxQkdiMUg5Q0ZzZnUwRjdMZXZu?=
 =?utf-8?B?ZGQva0tScDhrNUNZVUp3MXNNMjZTU1lhd2pLMTlHeFRKcFRuWXoxUkcwRmlM?=
 =?utf-8?B?Sll5b2U1WEd5NFFYSk5mbUVuVEZ2RWhzVlZ1a2FPMEtzT3lGbGlVb0YwM0dj?=
 =?utf-8?B?UGpFWkJENjQyRk52ODZNeFpNaXJKVWt1Y3hpS3hPNTdGeFFmU1YrY0Q4MFhF?=
 =?utf-8?B?cW9GcEFqOTJTSVdzdHRieWFERWRyTENQd1N1dHRSNGZHdlJUNlE3aHNCRnBy?=
 =?utf-8?B?R2VIaXFQWWlFbXppVjF2d2ZxNmdHUE1xc0lRWitDQy9qZm85WlRrZ3RHTDhl?=
 =?utf-8?B?UitoVkpGSHRUbjRHajFuMStPeXRzUFNNTDcwL2lJSW9XQlNNU0ZTWTdzMitZ?=
 =?utf-8?B?YkVUTHRGK2s4QmYrSEtsRDdUeUlHRWF4QW1sUEIrZ2EwQnJtZ2xHeWZzVWt5?=
 =?utf-8?B?NDlIR1JWNkUvbFNENjBxQW0wd0pUV3R1bTQ5TDlaTU5VYTdzc0oxZk1Kejl1?=
 =?utf-8?B?QUxRM1dUVWl3eFg2MUZUQ0wrM3FrQ1NQN0lKZFlYMmJVbnFuWC85cXpkVDg4?=
 =?utf-8?B?S0x3ZzhPZU1tVnFUL1FNVDNjRVhzTmpxQ1Brb0kzeU1LVXU4MHZNUGVlTkcx?=
 =?utf-8?B?WTROa0hzaGxXcXgvc04vemcvYUNZMTkzWjJGeW42UDNESkZMMzBKMmNidW9r?=
 =?utf-8?B?ZEJubUE3M3IvQnp6V0RvY3RDeExlemExK3NGakdVSjBWNzNsRS9WN3puVi9Y?=
 =?utf-8?B?UmxRWG00WVY2RkZKdUYyZktDTDkvVkV2M3BXaGdTYXNhQlVzM3JTaXI1MnRh?=
 =?utf-8?B?NE1zTWgwWFZFSG1Lc2FJUUNqdFNnZWkvaHhkRzZPblllakg5d01XRjBUZC9H?=
 =?utf-8?B?L1M1L3ZkVXZtdG50Q1FtM0MvQWxva3FNMkQ3RTFMeTl2d0N5T2J3U3ZzRzhm?=
 =?utf-8?B?OFVFT1BybXNKNEg1Mkd0am4wb1liVmUyRHBkNkx1aXZndkxqbzJnODFObnFC?=
 =?utf-8?B?VGZ1Szl0UVIwU1ZPQ3RHSXpuaDArVHpDOXVVT01SbXpERlQxRWhRT1NkNUp0?=
 =?utf-8?B?VlBaL1B6dWcyamFvbTE1eDI5YklYTUJtZnA5a3Btekk2RDR6WndqWktjdjJm?=
 =?utf-8?B?VEUxTXlYeUs5a2JycTA1UmJtODJLRGJjdkVnSEhEWCsyVUppZFRNME1FTCtC?=
 =?utf-8?B?bzhobGRHdkFmakk3TlZLN2FYZnNBc1JEMVZSZ2srRHQ1VkVCcVlWbWdOejhB?=
 =?utf-8?B?RjZ2d05BZkZQdW4va0hqNG0xSjRxakRsRmp0YjRBU2xGbE44SWRDdlJBTjJ6?=
 =?utf-8?B?UWFYZGtBYWY1ODI0M1NCd2VDb01HcGZyYlpiaUt0Y3d0TVV0RTJaREFkbDQw?=
 =?utf-8?B?VmhqWWxiYmVvYmdjbGRjMW8wSm9kUVFmZllRUHBSVWNYNUdmLytiOHRaVWEz?=
 =?utf-8?B?eCsvTi80aXdkekw0aWttQmJnb09oVmxOeHJ2SXQrY3ljSVVianROUHoraFVU?=
 =?utf-8?B?ajJ6UCtVajhQVGIvUTR4bFRIZlpSOEJSdWVxUjNBQ3hmUUQxT2p6R0JGMUpN?=
 =?utf-8?B?OWxtcGRHYW5BUnU2Q2JvUFl1cUdpNUxjWmw5amtIOWhlVTZyb2F6UFZDRk9q?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4A47A60BEC72944B5BF0CC506047E62@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8805.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3232d2-d9ee-49c2-11b4-08dc7964c827
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:08:14.1389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QiqK1cZbb5Utf8yWVtU0Yqk+7D7Ri+dY6kVeqK17eW10qlMAfPoaPrFIkvugRbkSrn+pP0Ia/unaiP8NqnXglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8463

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDQ6NTc6NTdQTSBHTVQsIFdvbGZyYW0gU2FuZyB3cm90
ZToNCj4gDQo+ID4gICBPbiBzdWJvcmRpbmF0ZSBub2RlcyB0aGUgSTJDIGludGVyZmFjZSBmdW5j
dGlvbnMgaW4gY29udHJvbGxlcg0KPiA+ICAgKG1hc3RlcikgbW9kZSwgcHJvdmlkaW5nIGFuIGFk
ZGl0aW9uYWwgSTJDIGFkYXB0ZXIgdG8gdGhlIGhvc3QgZm9yDQo+ID4gICBlYWNoIHN1Ym9yZGlu
YXRlIG5vZGUgY29ubmVjdGVkIHRvIHRoZSBBMkIgYnVzLg0KPiANCj4gSSBhbSBub3Qgc3VyZSBJ
IGdvdCB0aGlzIHJpZ2h0PyBUaGF0IHdvdWxkIG1lYW4gZm9yIGFuIEkyQyBhZGFwdGVyIG9uIGEN
Cj4gc3Vib3JkaW5hdGUgbm9kZSwgdGhhdCB0aGVyZSBtaWdodCBiZSB0YXJnZXRzIGNvbm5lY3Rl
ZCB0byBvbmx5IHRoYXQNCj4gc3Vib3JkaW5hdGUgbm9kZT8gSG93IGRvIGl0cyBtZXNzYWdlcyBn
byB0byB0aGUgaG9zdCBtYWNoaW5lPyBJcyBJMkMNCj4gZW5jYXBzdWxhdGVkIG92ZXIgSTJDPyBJ
IHByb2JhYmx5IG1pc3NlZCBzb21ldGhpbmcuDQo+DQoNClllcywgZWFjaCBzdWJvcmRpbmF0ZSBu
b2RlIGV4cG9zZXMgYSB3aG9sZSBkaXNjcmV0ZSBJMkMgc2VnbWVudCwgc28geW91DQpjYW4gaGF2
ZSB0d28gdGFyZ2V0cyB3aXRoIHRoZSBzYW1lIGFkZHJlc3MgY29ubmVjdGVkIHRvIHR3byBkaWZm
ZXJlbnQNCnN1Ym9yZGluYXRlIG5vZGVzIHJlc3BlY3RpdmVseS4gSGVuY2UgYSBuZXcgaTJjX2Fk
YXB0ZXIgZm9yIGVhY2gNCnN1Ym9yZGluYXRlIG5vZGUuDQoNClRoZSB3YXkgaXQgd29ya3MgaXMg
dGhhdCB0aGUgbWFpbiBub2RlIHJlc3BvbmRzIG9uIHR3byBJMkMgYWRkcmVzc2VzLA0KdHlwaWNh
bGx5IDB4NjggYW5kIDB4NjksIGxhYmVsbGVkICJCQVNFIiBhbmQgIkJVUyIgcmVzcGVjdGl2ZWx5
LiBCQVNFDQphbHdheXMgYWRkcmVzc2VzIHRoZSByZWdpc3RlciBtYXAgb2YgdGhlIG1haW4gbm9k
ZS4gQlVTIGlzIGEgInByb3h5IiBhbmQNCmFkZHJlc3NlcyBlaXRoZXIgdGhlIHJlZ2lzdGVyIG1h
cCBvZiBhIHN1Ym9yZGluYXRlIG5vZGUsIG9yIGEgZ2l2ZW4NCnBlcmlwaGVyYWwgY29ubmVjdGVk
IHRvIHRoZSB0YXJnZXR0ZWQgc3Vib3JkaW5hdGUgbm9kZS4gVGhpcyBpcw0KY29uZmlndXJlZCBp
biBzb21lIHJlZ2lzdGVyIGZpZWxkcyBvZiB0aGUgbWFpbi9zdWJvcmRpbmF0ZSBub2Rlcy4NCg0K
V2hlbiBhZGRyZXNzaW5nIGEgdGFyZ2V0IGNvbm5lY3RlZCB0byB0aGUgSTJDIGNvbnRyb2xsZXIg
b2YgYQ0Kc3Vib3JkaW5hdGUgbm9kZSwgYSByZWdpc3RlciBmaWVsZCBvZiB0aGUgZ2l2ZW4gc3Vi
b3JkaW5hdGUgbm9kZSBtdXN0IGJlDQpwb3B1bGF0ZWQgd2l0aCB0aGUgdGFyZ2V0J3MgSTJDIGFk
ZHJlc3MuIFRoZSBoYXJkd2FyZSB3aWxsIHRoZW4gcHJveHkNCkkyQyBtZXNzYWdlcyB0b3dhcmRz
IHRoZSBtYWluIG5vZGUncyBCVVMgYWRkcmVzcyBvdmVyIHRoZSBBMkIgYnVzDQp0aHJvdWdoIHRv
IHRoZSBzZWxlY3RlZCBzdWJvcmRpbmF0ZSBub2RlJ3MgSTJDIGNvbnRyb2xsZXIgaW50ZXJmYWNl
LCBhbmQNCndpbGwgcmV3cml0ZSB0aGUgYWRkcmVzcyAoQlVTLCAweDY5KSB0byB3aGF0ZXZlciB0
YXJnZXQgYWRkcmVzcyB3YXMNCnByb2dyYW1tZWQgaW50byB0aGF0IHN1Ym9yZGluYXRlIG5vZGUu
IFRoZSBJMkMgaW50ZXJmYWNlIG9mIHRoZSBtYWluDQpub2RlIHBlcmZvcm1zIGNsb2NrIHN0cmV0
Y2hpbmcgc28gdGhhdCB0aGUgdHJhbnNmZXIgaXMgc3luY2hyb25vdXMgYW5kDQp0cmFuc3BhcmVu
dCB0byB0aGUgaG9zdC4NCg0KWW91IGNhbiBzZWUgdGhlIGltcGxlbWVudGF0aW9uIGRldGFpbHMg
aW4gdGhlIGFkMjR4eC1pMmMuYyAiaW50ZXJmYWNlDQpkcml2ZXIiOg0KDQogKGEpIG1haW4vc3Vi
b3JkaW5hdGUgbm9kZSByZWdpc3RlciBtYXAgYWNjZXNzOiBfX2FkMjR4eF9pMmNfcmVhZCgpIGFu
ZA0KICAgICBfX2FkMjR4eF9pMmNfd3JpdGUoKQ0KIA0KIChiKSBzdWJvcmRpbmF0ZSBub2RlIEky
QyB0YXJnZXQgYWNjZXNzOiBfX2FkMjR4eF9pMmNfeGZlcigpDQoNCkEgbW9yZSBkZXRhaWxlZCBk
ZXNjcmlwdGlvbiBvZiB0aGUgbG9naWMgY2FuIGJlIGZvdW5kIGluIFsxXSBzZWN0aW9uIDMtMQ0K
IkkyQyBQb3J0IFByb2dyYW1taW5nIENvbmNlcHRzIjoNCg0KWzFdIGh0dHBzOi8vd3d3LmFuYWxv
Zy5jb20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vdXNlci1ndWlkZXMvYWQyNDJ4
LXRybS5wZGYNCg0KSG9wZSB0aGF0IGNsZWFycyBpdCB1cC4=

