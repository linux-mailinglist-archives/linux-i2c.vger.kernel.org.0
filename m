Return-Path: <linux-i2c+bounces-4959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14B92F68C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021E31F228C2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6AB13F454;
	Fri, 12 Jul 2024 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SNn2kRq8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803113B2BB;
	Fri, 12 Jul 2024 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770813; cv=fail; b=joPOTUvxz58+cSNkxX9qGVVBxE6eQ7qSMG1HvLx4irbLBubavy8W6pHs/xlq2RGYIpRODDjcmTtw0ZYoKO7WyhjTpa+UWBlh7w4bO/LWREwIsFb3Kf+fzdJqXx2+VQJ/CLagxytJL0eqfpenQsMXKZH6MkJ5SwHtYz0w/qRLvkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770813; c=relaxed/simple;
	bh=QQKKucxZ4AWOAIV29y0F0bfOks/YqM3IG8kHpm+/N5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cIueCTI4IRsBxbG+qRPYDO462n8BAkkAvzcwfcwLmKBtnIaqxe5k+pQQQ6XwbvUItVgAmvwXdgnYDsyt5cy2i+fj+63UqDd/pAsSnKGpn7SGqKqzCjfu4Sw5E4XhVTJeLfCKosNyQjl8A1oCMbtaBH3g2T/LKcV8JPE4CudCmXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SNn2kRq8; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSqFRlU6RkyWXVe557Ho0ZILMA/zk8C1PZjlO09QdwGrMAjIuG1Wy1OL8tgpp8vdUi1FfrMDDAHihyYeQLxNv+qtmwA0KhvYKi0w+T49H2bnjHG71O0XA8sM9JtwPF+f9uCJcdcOsFTQfVxYnnqnVzMu7UO9KzQgWycPbFogbWB4p3vdoB7hVTJYeKjcTrMzhDxlmjQ8BgKnAfrXPoE8azzLsI4VmcYqWbD7Up95IyBzLazwagqCxu/pKKIe33MONs3eWnDMP1JNeBzAWXzSFrnalBl66WkH56H07PEKpkp5+6biEFPSvZvZuqPradacpgvSQ1cJqWzmoGOtx6qz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQKKucxZ4AWOAIV29y0F0bfOks/YqM3IG8kHpm+/N5Q=;
 b=pNIMCtq5G6xXG8sDdnrWXOEMg96/jsM9etSLuWmIlaUKPbdhd2ZTs13pBdn1cQxxyDUx7UbFxxu3KXP50Y7bA/rCIlK3PbN9cC5BYJdmEgALGsijkeMbXzK+WfHnR/0yrjDA+gs/Kq3d3wzc3eVPbc45vCXR1sBVAqZ4QSN13ASEOYATe+qC7vTehDYTKv6gdesWSb/9OopvOy1fmkmZDC9ruezbKAJsrjH6UKCuDJg1NrIpKz7F8INSL5vhVlstNIkEwMf1XWFlya3WDAITP+gUd8jN/cTlK146nzvX2+EzY8UaU9RDFWTJ2JtQUBDyTFMiKMZijqprpHRLFsa0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQKKucxZ4AWOAIV29y0F0bfOks/YqM3IG8kHpm+/N5Q=;
 b=SNn2kRq8RgsH4ZroeswcsRs1pafpAdv+nqrfVo8AY/Jf79EIuRhaoUwI8js/taOxXjblmvczZxSbHKtF3z3z67E+f4fRrYqWRbr83FN+ukfDz76gpVBh+g32n9ZDmlssTdXYx4BROpf4bvtCfUkC9b9EWQVIeQ0NyXBJQ2jJuIc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9988.jpnprd01.prod.outlook.com (2603:1096:400:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 07:53:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 07:53:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Thread-Topic: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend
 support
Thread-Index: AQHa04j2mz4Dz3PEykickJkh+EMpYrHyrpZQgAAH7gCAAAC8wIAAAaCAgAAAP9A=
Date: Fri, 12 Jul 2024 07:53:26 +0000
Message-ID:
 <TY3PR01MB11346200C5A3DC24A3773EF7886A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e574e2a6-b231-4737-9501-342445923542@tuxon.dev>
 <TY3PR01MB1134611DB941585B340D09B7186A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5dd19d3-9a08-4187-b976-c197a2c0d9d7@tuxon.dev>
In-Reply-To: <b5dd19d3-9a08-4187-b976-c197a2c0d9d7@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9988:EE_
x-ms-office365-filtering-correlation-id: 2b8ee16e-fd00-4963-80ba-08dca247b63e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MG52VU54NitRa1hvTFh1T1hKV2VOekgzQVcrQ1cxLzFDaHoxOHpydkxNSytw?=
 =?utf-8?B?aXJ5Mm9wTEh1TWFqNkdBK2ZkQmVtSlRZUm54dUprVzJBV2NndldpdjVZbndi?=
 =?utf-8?B?MVhweHRhc1FjY1IwenNmV1JmOTUzZWJiV3Y3ZXRXbWx5OCtjRWZPMk5kOVpn?=
 =?utf-8?B?YlFFbndrVjBvcmtZZC9nUFRQWUN6bjlrRGlubkxydUV1ZXRFZ1Z0djdJcktj?=
 =?utf-8?B?VG03akM2cW9WNHVVKytWSURGV1FvVjNIYTRDQm12U3ZGSnNmQ2RXZnJHT1ha?=
 =?utf-8?B?aENjTnBtMnp2OWNEWDRtVkpBUlBJVGI2S2FjUXhpZmVObWxmOU1mdGtKY0pB?=
 =?utf-8?B?Tk40SFdwQm03QTBNdjQ2Yk5DTEcvblRwK1Z6Z3hIV0RsR2xWTmlsT0c3MjhB?=
 =?utf-8?B?RENzRGsvaDk1cFA1RHhsSDkvRFpKVTlDM0tFMW56Z0I2MU9wTUFHUzR5dmhv?=
 =?utf-8?B?UVNzQ3BnZm1hcnhvMElRUlRzUk0xZXExUEkvMXkvVGd0blFQcVZYUFVlbkZ1?=
 =?utf-8?B?RzdjZ2hxWHk3RUZsUm9lbGdTM05MOFZiYkVSUGlrVWQ3cmVYSVVKUGJXYnhL?=
 =?utf-8?B?cVd3RzVYRGNZbzJoU253WjhuVTFFaW1TdFpjVEdDYWc0NkFZRWlHZU1UTDRv?=
 =?utf-8?B?N2xiZDQ2a1R2SWZJVGZ6aC9ieHNWMXQvRTlHdmp1UVhJdkxZbWwyanYyTE84?=
 =?utf-8?B?T2pSMWxoQzl6WmJvdHRtME1zZ3BhMGoyTXZtdWJuNys2SGtLMmNHRUkxZSsw?=
 =?utf-8?B?bENiT2E4VFJqQThUVDVkRWl0cUFhaEx6c0JpYy9oSnFUNGREVGJ2S2Zqdk5k?=
 =?utf-8?B?L285QkI2c0ZjTWF4c1h4WkRpWDE0a1RIVHh2ZGNxWTY0WWRjMFQyZ2JwNXJK?=
 =?utf-8?B?dXBtNkVmcnplYzNzZTM4Y3BKMjVubmkwTFZwUmNOZ2NYZ1VGTjRXWHJxTGtJ?=
 =?utf-8?B?dXV1Qm56SVpndWZUWnRnQVphWkRlbVdLaHZBVXRneHNDMDJKTUVENzN5alRm?=
 =?utf-8?B?R0x4Vk9GUEdoTTlNdjZ5WEJiUzVubWRaQ1NnWC95SERQWVhNa1ladURiRVFR?=
 =?utf-8?B?OFd1ZXpBWStCQWo2KzZSZDVDN2hnMUVPazZSeHZXczd0MVZDbGE5UVZVaWdr?=
 =?utf-8?B?K1E1UHlKcHk2ZlhVWWVKNXFVNmdwbHJFRDRjdy9VUzhBREwvUFFTUG1UQk8w?=
 =?utf-8?B?TklGZzhvVmNEbkIxcTRlSDRrVTVPcU0wQUVSSkhUQlkwNzBYSFVEbnN2UmtL?=
 =?utf-8?B?TjJoM0VOTTBoZWtVbWdzZ2p1b01aYzNoazdwVm1td1RxQ1MzKzBKVFRwUEZX?=
 =?utf-8?B?dEY3QmxSOVJ2eVRVYmorMEZhck9HNHpta1VidWdkOVAyakRJQ2NjVCtyQTZY?=
 =?utf-8?B?aEoybEMyZk9CRFo4WUNJMjZIZ0M1bEhzWWs3cEszRjhzMk0zU1AzcnpyVVBQ?=
 =?utf-8?B?QTRiWFZjQ2lvL1FOeUdDVHVUU3pNUDc3WGlodHlwb2dobzFvWkJxTGxHME1X?=
 =?utf-8?B?aXA5Zm1uKzZuUVZFUUpUVEIzR2oxVGVBV2p2L3VVWE0xRnVlUk5xdys5WGgv?=
 =?utf-8?B?a21UM3ZwRUxyZE1WUlllWmo4dXR5clpDVVNlZFFWc1JRN0lKOFN6TEJrUGJh?=
 =?utf-8?B?WVMzQWNTMUR3TTJId1lTVmtiSVhONHVwNXc3dUQyZkhwOFlLajVoMXlOYWZO?=
 =?utf-8?B?NnVuTXUyRklKMUhnamNndEtDUTJxUzdpOXM5QWdTRUt3a0dubUJxdS8zWDVT?=
 =?utf-8?B?enppUUI4ekRNSUFkTmVrRmFpdVlmSFlENUVTVVp0Q3hrNlVMb0tVNml0Tjcz?=
 =?utf-8?B?TFk3VXdQSmJ1aTAyeUthYUlacTFZdS9Xb2ZUWndSTC9Db0YrVzROdi9wTlNj?=
 =?utf-8?B?dFAvS3hJek1idStkZ2pTSDJ5WHd5ckFITzdZQ1BRYmRCbFpXSm1mdlVnWE54?=
 =?utf-8?Q?EvQGPQn8ZWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vm5SR0lMbU8zSFNNTnd3UER5QnpzbWJEcG5ERnlkWkFyVENpME5kNUJkb0pi?=
 =?utf-8?B?Ri9GMjJydjNGajRaZGFWTVNRZXJyV216Q0R2aUV2UEZGbEl1TmhUSFB2NFdN?=
 =?utf-8?B?dmVnUE52RTliME1md0swU2tmQjlxYnJ0OU5wN1ZtOXVPZFdkZUMzZmhYT2xK?=
 =?utf-8?B?WTZrOXY1N2M3d3I5NGxPa2ljRVpyRWxGNlhoNVZnVk4vbHZSWCtkYkRsOFNh?=
 =?utf-8?B?RFo4TnF4cWtUdE9EQi9lS2FKU1lobFlWR20xaUNBOVJGVDhhR0ZxUjJvSzZX?=
 =?utf-8?B?VW5OUVJEc3JZSzBqeTIvMXBTZlE4bXhDNW1DNWxja3JkNllVNVB6bzhCWlkz?=
 =?utf-8?B?YWtNd1pTdGdoVmhMbEIxVm5zdTJ0eDduUTVlaU5vWWt5T3NhdVE5dUFuUzBN?=
 =?utf-8?B?ZG5lbGZOWW93cTM2bzJ0bk9yeFJxRWVVTUlHWTdWRlFkSURMc1lVOHlKVi9L?=
 =?utf-8?B?aHJleGJ5VERRU2thYUI2ckMxVUlScFJtS29wbDlNTHhVS29vcEpQVXE4VFRp?=
 =?utf-8?B?cEd3SExrd1g0aWt0dlM3TWZsYnZRUUk5TTdHVTZ0TE96RmpHV3daNE9kTlc4?=
 =?utf-8?B?UFEvQWhGcVZROHNhYmdYc3V5Q2IyMzFPc1ZsM2k4YjBLdllRQUNOVW1XUXds?=
 =?utf-8?B?eDVYZUI1VmdEbFNrcVF2UTBlVGVLNldlL1FRVms3V1plVi9nTVhCK1V1TU5a?=
 =?utf-8?B?VWtrZlpjampyRjNxWWZtZnBLSmhsOSs5SUJvNGwzWUpXSUN6Y3ZhR0NwMnJN?=
 =?utf-8?B?QmZQWTdyMEd1YWJad2hIQ21TK2NzU3ltTDNCRzUvZmVVOHBCdDRWQjMrZHVh?=
 =?utf-8?B?bld1N1NqdjFlaFZuVDh5YkNXaDRmQzR4KzMrRzBDSVkvaFI2ZkQ5azdGZ212?=
 =?utf-8?B?K0prOU5ueFpVRlRIRTNVbFJsbnpPVTdoNHJZcHVZcFBMSlFBMkxaUmlDK3lE?=
 =?utf-8?B?cmhRQUh1SzE0MXdMK0wrWXJReGF5MzNHN3lEKzFFZnV0clBnQXA4Y0dMVU81?=
 =?utf-8?B?ZzBleDFFRER3czRRakFJK0tzNnRxSFptbDJxRElxdW8rUWI0QSszaXprT3kv?=
 =?utf-8?B?bEpJWTUwVUlKbEh2NVROMWJ6dkoyeCtQYkNxSXBCbnhqUk5EdG44U00yZCt0?=
 =?utf-8?B?ZU84eWJ0NEh3MlZ1TU9pQVhFT3lmbUF5L3I3RlBFNEZCbWdmTk9kdm40Qzdt?=
 =?utf-8?B?TFZzbGVJVERxMmhaUkFZRWw1a2hsTFd1d1VCTzBIeTFqRk85L1RMWGVEVGs5?=
 =?utf-8?B?ZnJaQVIrMW9aRkdCcUtMc0Q1WjhnMFlaWXFHOEZtOHc0dWRjQk8wNUE2aEIv?=
 =?utf-8?B?eWVrVGx2WVNzUjFpcUhsVStDbEVjd25zdEVMQWVGdENxdTg3TEhHMGMvUGFJ?=
 =?utf-8?B?cmd5d0dFOTlpb3NiN1VxM0gxQVM5N09JMkk1azlUaDNyT2xPaGR4T0JhcktX?=
 =?utf-8?B?bTlhMGhFbEJ2MS9EWERXZTVidTYvaGlObGZHUGJCZ0lwdnVnRE82c3BES2FQ?=
 =?utf-8?B?Z3dVbVIyYTJoTjljeENXN2J2ZVF3WnVZVXVGalRrOWRGMnQ4STFaZ1BFTUVG?=
 =?utf-8?B?cXlvTkVlSUVaZEJhZy9RV3pZOEc2cUEwWWJrWHRWa1hGT0FCbGJpU25SYVpP?=
 =?utf-8?B?LzRjb0Y0b0tWbjBIOHZkZ1JpcmdDZlFhRlJxc3FhV0YxV0lhaFoxNms0ODNa?=
 =?utf-8?B?cFdYeTlOYjJvN1NKVEJocXArNWZoYVlTRGlDU2xTV2pXQy9WVWI2dE5XRjdo?=
 =?utf-8?B?K3R3bnEvL2oraEFtZmpiVTAyaTRrVkNBVW5ucHY5Mm9xQTc0cXdka3Y5cHVS?=
 =?utf-8?B?YzIxbGRJVEpicWdBUG5ZTlRJc3l2VUtqcnlQMWY3MkdVRm1ZaklmUVluWTVL?=
 =?utf-8?B?QUFDRFQxQVB5VGRoN3FITmVQbFlOeHI4dVZ5MVZYcWlWdXo4NGJzUmZGOWFy?=
 =?utf-8?B?cEhpeWVkWmtnNCtPU3RLVS9lNm5VSVVtWUV6d0YvbmNDZHZSQStNd1QrNjdV?=
 =?utf-8?B?alYvbGNqM084ZUxYcnB4K1RRZnNjdFJ1R2J1TUZjdVdrTEtBOERjdUVEbkJQ?=
 =?utf-8?B?ZlMrRXB3amVJTFEwdFp1OWpyYTRqdkl5NGFhQkZpUFpRSldHdFZVV0RGRHJF?=
 =?utf-8?B?WmdwelJuY0psVFdiemNOWlBzdHpyY3A5VVA2T3hBa3lncGNGU1M1R1B6cTlF?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8ee16e-fd00-4963-80ba-08dca247b63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 07:53:26.3249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klhckIHIpJ2WH4vShEGibDJ1/67cLDKDrRljwlJ28lUcpe8BS2w4VztfUl4+p3Y0No5SDYyuj7CSvIkXBBOkPYOWlNkYiVLyVwJ+oxOKp5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9988

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bHkgMTIsIDIwMjQgODo0OSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA0LzExXSBpMmM6
IHJpaWM6IEVuYWJsZSBydW50aW1lIFBNIGF1dG9zdXNwZW5kIHN1cHBvcnQNCj4gDQo+IA0KPiAN
Cj4gT24gMTIuMDcuMjAyNCAxMDo0NSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQ2xhdWRpdSwN
Cj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBjbGF1ZGl1
IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiBGcmlkYXksIEp1
bHkgMTIsIDIwMjQgODo0MSBBTQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA0LzExXSBp
MmM6IHJpaWM6IEVuYWJsZSBydW50aW1lIFBNDQo+ID4+IGF1dG9zdXNwZW5kIHN1cHBvcnQNCj4g
Pj4NCj4gPj4gSGksIEJpanUsDQo+ID4+DQo+ID4+IE9uIDEyLjA3LjIwMjQgMTA6MTUsIEJpanUg
RGFzIHdyb3RlOg0KPiA+Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhv
bi5kZXY+DQo+ID4+Pj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTEsIDIwMjQgMTI6NTIgUE0NCj4g
Pj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDQvMTFdIGkyYzogcmlpYzogRW5hYmxlIHJ1bnRpbWUg
UE0gYXV0b3N1c3BlbmQNCj4gPj4+PiBzdXBwb3J0DQo+ID4+Pj4NCj4gPj4+PiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4NCj4g
Pj4+PiBFbmFibGUgcnVudGltZSBQTSBhdXRvc3VzcGVuZCBzdXBwb3J0IGZvciB0aGUgUklJQyBk
cml2ZXIuIFdpdGgNCj4gPj4+PiB0aGlzLCBpbiBjYXNlIHRoZXJlIGFyZSBjb25zZWN1dGl2ZSB4
ZmVyIHJlcXVlc3RzIHRoZSBkZXZpY2UNCj4gPj4+PiB3b3VsZG4ndCBiZSBydW50aW1lIGVuYWJs
ZWQvZGlzYWJsZWQgYWZ0ZXIgZWFjaCBjb25zZWN1dGl2ZSB4ZmVyDQo+ID4+Pj4gYnV0IGFmdGVy
IHRoZSB0aGUgZGVsYXkgY29uZmlndXJlZCBieSB1c2VyLiBXaXRoIHRoaXMsIHdlIGNhbiBhdm9p
ZA0KPiA+Pj4+IHRvdWNoaW5nIGhhcmR3YXJlIHJlZ2lzdGVycyBpbnZvbHZlZCBpbiBydW50aW1l
IFBNIHN1c3BlbmQvcmVzdW1lDQo+ID4+Pj4gc2F2aW5nIGluIHRoaXMgd2F5IHNvbWUgY3ljbGVz
LiBUaGUNCj4gPj4gZGVmYXVsdCBjaG9zZW4gYXV0b3N1c3BlbmQgZGVsYXkgaXMgemVybyB0byBr
ZWVwIHRoZSBwcmV2aW91cyBkcml2ZXIgYmVoYXZpb3IuDQo+ID4+Pg0KPiA+Pj4gT24gdGhlIG90
aGVyIGhhbmQsIHlvdSBhcmUgc2F2aW5nIHBvd2VyLiBDdXJyZW50bHkgdGhlIGRyaXZlciBpcw0K
PiA+Pj4gaGlnaGx5IG9wdGltaXplZCBmb3IgUG93ZXIgdXNhZ2UuDQo+ID4+Pg0KPiA+Pj4gQmVm
b3JlIHRyYW5zZmVyIHR1cm4gb24gdGhlIGNsb2NrDQo+ID4+PiBBZnRlciB0cmFuc2ZlciB0dXJu
IG9mZiB0aGUgY2xvY2ssIHRoaXMgaXMgdGhlIG9wdGltYWwgcG93ZXIgdXNhZ2UgY29ycmVzcG9u
ZCB0byBzdXNwZW5kIGRlbGF5Lg0KPiA+Pj4NCj4gPj4+IEJ5IGFkZGluZyBzdXNwZW5kIGRlbGF5
LCB5b3UgYXJlIGNvbnN1bWluZyBwb3dlciBjb3JyZXNwb25kaW5nIHRvDQo+ID4+PiB0aGF0IGRl
bGF5Lg0KPiA+Pg0KPiA+PiBUaGUgZGVmYXVsdCBkZWxheSBpcyB6ZXJvLCBzZWUgdGhlIGZvbGxv
d2luZyBkaWZmIGluIHRoaXMgcGF0Y2g6DQo+ID4+DQo+ID4+IEBAIC00NzksNiArNDgxLDggQEAg
c3RhdGljIGludCByaWljX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4+ICpw
ZGV2KQ0KPiA+Pg0KPiA+PiAgCWkyY19wYXJzZV9md190aW1pbmdzKGRldiwgJmkyY190LCB0cnVl
KTsNCj4gPj4NCj4gPj4gKwlwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheShkZXYsIDAp
Ow0KPiA+DQo+ID4gSSBqdXN0IHByb3ZpZGVkIGp1c3RpZmljYXRpb24sIHdoeSB5b3UgYWRkZXMg
MCAgbXNlYyBoZXJlLCBjb21wYXJlZCB0bw0KPiA+IHh4IG1zZWMgaW4gdGhlIG9yaWdpbmFsIGlu
dGVybmFsIHZlcnNpb24uDQo+IA0KPiBJc24ndCBpdCBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9u
IGFscmVhZHk/DQo+IA0KPiAiVGhlIGRlZmF1bHQgY2hvc2VuIGF1dG9zdXNwZW5kIGRlbGF5IGlz
IHplcm8gdG8ga2VlcCB0aGUgcHJldmlvdXMgZHJpdmVyIGJlaGF2aW9yLiINCg0KVGhhdCBpcyBj
b3JyZWN0LiBTb21lIHBlb3BsZSBtYXkgaGF2ZSBkaWZmZXJlbnQgb3BpbmlvbiBsaWtlIG90aGVy
IGRyaXZlcg0KaGF2ZSBub24gemVybyBkZWxheXMuICBKdXN0IHRvIGdldCB3aWRlciBvcGluaW9u
Lg0KDQpOb3RlOg0KRXZlbiB0aGUgb3JpZ2luYWwgaW50ZXJuYWwgcGF0Y2ggaGFzIG5vbiB6ZXJv
IGRlbGF5IGFuZCB0aGVuIEkgc3VnZ2VzdGVkIHlvdSB0bw0KcHV0IDAuIEl0IGlzIHRyYWRlIG9m
ZiBiZXR3ZWVuIGZyZXF1ZW50IHRyYW5zZmVyIHZzIHBvd2VyIHVzYWdlLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCg0K

