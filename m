Return-Path: <linux-i2c+bounces-4464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8F91BCD7
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 12:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A4AB1F231B3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92B0155747;
	Fri, 28 Jun 2024 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gfSpSDuI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2076.outbound.protection.outlook.com [40.107.113.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DD2139A8;
	Fri, 28 Jun 2024 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571766; cv=fail; b=REHkBqLT5Hv8byOd1UtbCLtTZhkcAd26zBANHd3N1QgGP+gYqMyW9SypuxZZ82uuJngLo+Mc8TqlSrtviNQxMQPZ85oGWGymyvw3izOx+DNIebnRXoWIlZmRceIJlqNeSrbEkGKGCQsd2lnxy6HMl+cRsoiibfTRssFmrZeDxVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571766; c=relaxed/simple;
	bh=vo1stoEZ7ElGFkZQbrY/6XuZOGiocCEGLCjc+6GyK34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UImKsxA+OCsWZqC7Iqnynnd+y2okNIyRm3R9i+WwlvCvzHwfUinu3NjNn4/l4pyDH/A6RyMdVkfe4Zb9DurI+6Z6sPQIBtNSJ/jBqKW1+hnrmPSy3U8GuH3KRcFpH5kqXvDKmiH6cvOsaTIug7Cjiexdron/I2O4KGBTnyavJLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gfSpSDuI; arc=fail smtp.client-ip=40.107.113.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr0nN1SdlWqiGzysQN5cMiCbNOQAPsbpdmrnG1vH160MF1Zqn43XjsaIS/DuIUP/wwR4K/yU7uJ6raQpnX0rm4brNGX1wvLjvXzndw41bYVVht853w0u3CpvlHdp7V0jb6FfN/wTrM6LnnRBgpetclOdIhp3n8BCpETl8RVJ3NB+xRxivl1k5JM+KFVAnCVAxLt3S7J/jUu6RA/D2VAajdoSDxsVEMDSpkI22ulEWYhHT7Cvg+A4zhhojxI2KVfHNiPvM5fxLEAAzjwXvkGRpCsGNQZ3HR+uGkMM+9YFCSZQgjQL0lZdAWX5gbWEb0IBC7DrDityumF1z3QuFDLwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo1stoEZ7ElGFkZQbrY/6XuZOGiocCEGLCjc+6GyK34=;
 b=MlAqKRF7RjuFoXo3tbeFmUdUrPvCqCa+cF9B4q/NQBCOtxSBlqWbTuUwi3AaZr16Dk/8F51pzEz44FGcsAZf3FYJlKLmPUX0WQMCluJh5R1QUqN7vaxhOdObzmllnVh5VtV8R0ri5f+ZfSbS+10CW0BrPubugmBi1Be4q0VeUa/XQDJASwB6R+WLwvb1yYrgnAcSWy2Sc+tTwZOiyRo4bm/RmHA7MTKu71YuauQT08+O9dW06NHClkOfzenhtY9PFDRxMyQLAD5oAd6FFc+M1M0cKDZADmQ05XyUXY/Qc9JMpMaz/2/6BuKu3XrQEcdc/y68FpE1hAEBVl1v1+Zobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vo1stoEZ7ElGFkZQbrY/6XuZOGiocCEGLCjc+6GyK34=;
 b=gfSpSDuIIQHMhUOLJKF3nlFBUyhMwBRFAQ/verAjC5GJUdoKwR0sEQEbnX4/paxtt9rrYcdN5rei2Av1CQt1PyirSNbOoKiPZkYdnQLewI7XW30pHVQaE0C2dreXtwoZNdebQkap7+fQYIEiS1eUPT9Et7YdfQTfvmnHRe2I5+I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11808.jpnprd01.prod.outlook.com (2603:1096:604:22e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 10:49:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 10:49:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index:
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAAAI1gIAAAhDQgAAi5QCAAAElIA==
Date: Fri, 28 Jun 2024 10:49:16 +0000
Message-ID:
 <TY3PR01MB1134678E3A8485DB152BD66D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20ff64a8-e619-4281-894f-1aa08ea67f18@tuxon.dev>
In-Reply-To: <20ff64a8-e619-4281-894f-1aa08ea67f18@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11808:EE_
x-ms-office365-filtering-correlation-id: 1675c819-196b-4573-64be-08dc975ff49c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?blZEa1pUdllaVlArenpPWWlKMlFDanNSbnFlNTA4d3UvbGxIcUhCSkdEWU5r?=
 =?utf-8?B?VEI2VnkwbGNRblF3bjJUNFBkSEFkdnF3MlhRdm5HUWMzdTBFWThwRE5MRnQr?=
 =?utf-8?B?bW5LTDQ1aWVJY09ZNDRyaVE4VkhsL0ZMdUZVSjFNZWJWK0ZrajN1QjMrbUlL?=
 =?utf-8?B?RHYwZExySU1weElFSTcwSTNTRi9wL05VcisyZ0lDa1NvV1ZtbExWUmo4V0RV?=
 =?utf-8?B?NHdiVXhMWlhjeWRQbXFSZit3T0VUUk1yZmtpc0VEMk9Xek5kUmR2N3JJenlD?=
 =?utf-8?B?dVhMblduUUJzRTNmbXc5Tm45S2pBVStJc1ZFZnNNK3QzcXRnSUhsajcrUzhP?=
 =?utf-8?B?aFlqd2JYa2JRamZHbXJzaTkwNStOVDBuc0tsejdrbGtVQ1RwaExnREE0TWN3?=
 =?utf-8?B?K3hIM1AvMTUzZllDVm5kNVJEYmNQSGNLWmlXZWlnMXpsWjViMFFaUHZvbWlG?=
 =?utf-8?B?dXhyWHg0U0kxc0I0SkRPQUhYeG1TWlY1TEEzSVhzTGFjVEs4UVJzWktvOUhB?=
 =?utf-8?B?QmxYWTAvTVAxOGJKaytRQnZQSG9iWk90Zi9mT25MQU8xMit4d2dlOVU3K1pU?=
 =?utf-8?B?WU96cFR2ZFpra0FJcGNvV05GcHc4Y0YwM2hDVW5QQ1EzSys3SEZ5dENMK2Rm?=
 =?utf-8?B?K3QzWThSNmFwUE91T29WelBNdVV4L3h6bnZDK2ZkZjAwLzNZUEtncEZ6Mk9Z?=
 =?utf-8?B?aVF1eG81Rzc4Y1FncHhiTXlWRFZjM0VxTEtuQXJRbStDNWRwWFBoSFFGOTdp?=
 =?utf-8?B?c2xBdTNZWnU1WklUbnlEMzcwc0kvMjRwTHNBTDllakM1aGEvc1ZFQXdMeHVt?=
 =?utf-8?B?S1U3WFVVYzJLM0JPU2hEYUcvbnYxekZscGJDTTVnMkh6dXVodlFlb2tQdmZN?=
 =?utf-8?B?MFM5TERWU3JzWVBraXJlYk5iQU9xMDNIOVNMRGZFTTlCbmxrbTlzMTZ4N1VH?=
 =?utf-8?B?V3BUT2tFSmZtOEZLcjF4U3UzUW8yUHlkbEs2MGkvSWRLaW1ORjRwcWVsTk1P?=
 =?utf-8?B?QTNzTXgzb1VxSGJBZWttenczVE11K2t6dG95eE90amNWdnlBVkVDSDZES0hD?=
 =?utf-8?B?SkxGQ2t5Z29IR0FpNTBlY1pkRXNUSXV4UkFLR3BsMzNibVlNb295aG9aY2JD?=
 =?utf-8?B?OCsvZGcvbEMxS1ZlOXhob01UY0hzOWxadVdsbG9GUDQ1T1EybmhXVTdiQjNj?=
 =?utf-8?B?L2JRWjdLNDI5eHJZOFZ0U0NadWJUV3NKc0lpZTBsUTg0dzgzOTBkKzJLcFhz?=
 =?utf-8?B?SmxMc1JZcGNrSmdGWFZDSEY2R1ROTy9peFdGU2tKK3M1bEN2cFYrdGFKWDNG?=
 =?utf-8?B?dExEWE41UWtJODd2K3p5Nk5OK1htY0dWVGZib1BVdE9adkZodzJSQzl5Z3BM?=
 =?utf-8?B?NHlmTjN1SDg0RTdmTkcwS3Uwc3J4ODU5MlVKT2lHeEJzWHRsdEF3YitDU1ZC?=
 =?utf-8?B?d3lLMkZ3QTM5QlEyY0duSDBYN3JUUmUxbG5jQk1MYk5xdG5XaU5XQ0hjSVo2?=
 =?utf-8?B?MmZnRGNOdWJNdkxFWjhHTDlabDh6U1hKZ2Fla0RtTG1oSEIxRW1lTGQwUE03?=
 =?utf-8?B?R2VrR0ZZdmNqVmFlaDVZNGhoM2p4TXMwb1huc1I5U3FYaUVuNXhlRDY4MzBG?=
 =?utf-8?B?S1l0Z1I4OG5KVkJDNmZzdERKdHk1c0RPSE9YU203VUFXaSswYU1VQzRjbmFw?=
 =?utf-8?B?OWFOUHZUNktiYjlsR0VPaVZkR21pOUswd3ZET3BhU3hxS3RvaStFOU9QQ1lY?=
 =?utf-8?B?WjdRWlM3K1kyTUlmNGpvWjBnMHlDUW1jQnJMTDVzRVFqbnFvNHM4K2ZtMVpk?=
 =?utf-8?B?bGUrK2lBQ0UyU2VSTWRjQXhybTk0dHpYSk5ocm1FMS9rWEZvdXUyKzJ5Y3Z5?=
 =?utf-8?B?Q2kveFV6WjM2VFRyL3lpY0h0TDQ3NTFManJ4OUNLT3gyWmNXVExSdHdXajRr?=
 =?utf-8?Q?4l7iJkbBT14=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHZaN0pNQVhGK2lWa2gyMUdIVnRjRmVrdm9kc3BEUFVuN3RUNDhYUCtvbkhr?=
 =?utf-8?B?eFUvRk8xL2JtVHdTTGVrd2RZMGxkQkFVRS9UeXFqamlWVzdXbHdvRFRsbmRp?=
 =?utf-8?B?d2JSeFF2SWNGVmI5UlpCVENPTE5tYTVMV2xGZVYrakIrL0thRkcrSGJkQm9H?=
 =?utf-8?B?UklFRnRkS3psMGh2dzdmRlZUWWJKUkNsMm1pczYzYmhLVTJoa2JNTFhiSUhQ?=
 =?utf-8?B?c1VDZUttbnd3VlFNWUVpK0JLdlBJTXZ6OUxSWWloQUtTd0FPYU1lTTlUYkFs?=
 =?utf-8?B?ZWRCdjRrY2ZVQno5dHhiNW9ra1lScm9ObjZZT0FOVFdHZDRzdFAwaVVmQWlI?=
 =?utf-8?B?Nksvam9mNThUT1F5RFBlamNsUFVvYkJXcXFYY2FhaXQxTWtMUnFDRjkwcE9Q?=
 =?utf-8?B?S1VHQ3FWT2hLajR2SjhHRDBXVURWR1pxMjdQWms0SysvT1pXc2M5TzlqNTNn?=
 =?utf-8?B?MXpXTi84KzRqZlhOSEc4Nktjb3loSlg4UHd0SEk4Zi9pQnRUcHQ2dHgxb0dH?=
 =?utf-8?B?QkFHVE0zcktoV0xYZTdHeU8zc0R3QjhRV0tZMXRJbm5ORzI4di91Yml6UEVN?=
 =?utf-8?B?ejA0WTVJVnpTZ0ErS3NGOWhJQnNNclpWZGQ1OHQ4clV0UWFSSkZnY1BNYzNU?=
 =?utf-8?B?VzJ1dDFWQ2xTZlU1cEJFTDhPVmZtSUp5TnptM2FINDlWSjFDUEFBMDBRd05i?=
 =?utf-8?B?bHY0Sm0ydktCYXJDbE5qeVZ5c25WaVhkaXVzT3JhRmRqYlk3N0MvY29VUnFr?=
 =?utf-8?B?c2Z1MzhuN3hHNDBIbEo2UVE1Y3V6S3lSQUxvQlVhSUo2UkxPSVhZc3FtOU5E?=
 =?utf-8?B?bEp1a3NMTGV5SDl5N3hKM1A2QlRkMmpmYmNCazBOdHJLWEJCUkJwV3ZYVFU5?=
 =?utf-8?B?L2NJQUhWL3Q0blNvWldQRTdFeStRZHJaamp2MUcwdzdmQTVvT3BwcSt2dHFL?=
 =?utf-8?B?N1RQSUlNZ3ljbzdUNmJDVnlEbXV4WGpPMlZITzJRK1Bmdk55d0gweWg0ZU5q?=
 =?utf-8?B?L2tSMjdFVTIydGVrTVh0bzBiaE94eThpT0IxQStKdGJGTlJLUDlDNlpjVVFr?=
 =?utf-8?B?SmFYM1pNVG9NdXN5OWlnRGc4bFkxTUliNUNKcXhCUUNTRlJFcHJuZ3ZqWEQ3?=
 =?utf-8?B?TERkRW1iVkt6b1oxUThxUTV6SkQ2NnkzaE9ocnY3S1N4eTRtYkJ4aDdiRWZ0?=
 =?utf-8?B?aXBxWXV6VEt0Z3JUUWhzMVpEUExFN01kOE9CaVo5YzUzc3NocVRaNU0zenla?=
 =?utf-8?B?T1lxcnV2WWwwS2k4MjBpUGdIaHNuTkt5cXRiTlhNRGpIdXRHUTFBQVVGQnpH?=
 =?utf-8?B?RTR2MGRiaHBXc1ZUSXpxZTJYOS82Q0pyVmlrZUJHRmFrU0M2Y3dsVisvSWtX?=
 =?utf-8?B?aDdyWUZRM2IwM21nYVlpUTAxaVhVN3hUL1VVVHZJRjlOZ3dQckhaeE8vcnBo?=
 =?utf-8?B?SXVOMGUvbFVDMjcvbGlpSEhGSjdrTllhNE9oenBjQzdhbkthNkNTNDNBc1Nh?=
 =?utf-8?B?dGo3UjdjaE5IT1c1WDRWaFVzWHVUSGIwV29Sc1RUWG82QVNMWjRWVmN3REt4?=
 =?utf-8?B?TEJGUzYwWTFUbnUveER4dXJjTHVQREtNaForVVhWeXR6b2pwVFgyWnFoRS9P?=
 =?utf-8?B?bjVOcjFKK3pxVXJobEVicml1NXhJTWp2bTJHS1NhMzFNTnRmQm5SVGkrWEhQ?=
 =?utf-8?B?WnBrM1BjbklaUWtndVk0LzYzMXkvaDRibFN4V25MVW1LbEtvWUQxVUEvcnRy?=
 =?utf-8?B?bWdqV2kzUWEwVXptUHVpUnBWb2NBY25Wb0dPOWYrT2tPQlY4WHh1ZWZ4S3Vm?=
 =?utf-8?B?WEUyNVdBeUh5b1FDU3d6VjNVVjJ3UWp2UXVnODJORVpYVjlkblpQZy91WW9a?=
 =?utf-8?B?NFJsUldnK3dMc0FPNmF5L2Y2RXdaNzhKYWRmcitGeFFNbXZ2OWJpSFluQmxZ?=
 =?utf-8?B?MDhWNjJiRG1NanI0eUt5aVY2Y0dsM2JMS2MycFVDelIzeEhvSFVHQU9peFdX?=
 =?utf-8?B?TWhBOEp5UUxtSUtTUUlKQlAvVEQxZGFPRUFmeEtLRlpyQXpzSW0xUUowQkVl?=
 =?utf-8?B?RGJnQzVVZ3F6R3dMR1J3Q2pQdWlVRWFWTGxocS9mMEZrTTNwSVcwYnFtZDlY?=
 =?utf-8?Q?W/x7Um33VV+/GLoDHLWSxy+e/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1675c819-196b-4573-64be-08dc975ff49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 10:49:16.0994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLb10UByU6elDEHxAeATARyh5DmRnHSNP4eG+hC4S4823JSP9ywJJ1rY6haVeGaZ99BwJ0ImCYT2LlgmVdN2hMZQ9JNu+yz8t4If4GvlLAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11808

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjgsIDIwMjQgMTE6MjUgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJj
OiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVy
IG9mZnNldHMNCj4gDQo+IA0KPiANCj4gT24gMjguMDYuMjAyNCAxMToyNCwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4gSGkgQ2xhdWRpdSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0K
PiA+PiBTZW50OiBGcmlkYXksIEp1bmUgMjgsIDIwMjQgOToxMyBBTQ0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cyB0
bw0KPiA+PiBkZXNjcmliZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0cw0KPiA+Pg0KPiA+Pg0KPiA+Pg0K
PiA+PiBPbiAyOC4wNi4yMDI0IDExOjA5LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+DQo+ID4+PiBI
aSBDbGF1ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
Pj4+IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+
Pj4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDk6MDMgQU0NCj4gPj4+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0K
PiA+Pj4+IHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4+Pj4NCj4gPj4+Pg0K
PiA+Pj4+DQo+ID4+Pj4gT24gMjguMDYuMjAyNCAxMDo1NSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+
Pj4+IEhpIENsYXVkaXUsDQo+ID4+Pj4+DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4+Pj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9u
LmRldj4NCj4gPj4+Pj4+IFNlbnQ6IEZyaWRheSwgSnVuZSAyOCwgMjAyNCA4OjMyIEFNDQo+ID4+
Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRp
dmlkdWFsIGFycmF5cw0KPiA+Pj4+Pj4gdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBIaSwgQmlqdSwNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiAyOC4w
Ni4yMDI0IDA4OjU5LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+Pj4+PiBIaSBDbGF1ZGl1LA0KPiA+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+Pj4+
IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4+Pj4gU2Vu
dDogVHVlc2RheSwgSnVuZSAyNSwgMjAyNCAxOjE0IFBNDQo+ID4+Pj4+Pj4+IFN1YmplY3Q6IFtQ
QVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMNCj4gPj4+
Pj4+Pj4gdG8gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMu
Y29tPg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJheXMgdG8g
ZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMuIEluDQo+ID4+Pj4+Pj4+IHRoaXMgd2F5IHdl
IGNhbiBkZXNjcmliZSBkaWZmZXJlbnQgSVAgdmFyaWFudHMgdGhhdCBzaGFyZSB0aGUNCj4gPj4+
Pj4+Pj4gc2FtZSByZWdpc3RlciBvZmZzZXRzIGJ1dCBoYXZlIGRpZmZlcmVuY2VzIGluIG90aGVy
IGNoYXJhY3RlcmlzdGljcy4NCj4gPj4+Pj4+Pj4gQ29tbWl0IHByZXBhcmVzIGZvciB0aGUgYWRk
aXRpb24NCj4gPj4+Pj4+IG9mIGZhc3QgbW9kZSBwbHVzLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYQ0KPiA+Pj4+Pj4+PiA8Y2xhdWRpdS5iZXpu
ZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+
Pj4+PiBDaGFuZ2VzIGluIHYyOg0KPiA+Pj4+Pj4+PiAtIG5vbmUNCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jIHwgNTgNCj4gPj4+Pj4+Pj4gKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gPj4+Pj4+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jDQo+ID4+Pj4+
Pj4+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgaW5kZXgNCj4gPj4+Pj4+Pj4gOWZl
MDA3NjA5MDc2Li44ZmZiZWFkOTU0OTIgMTAwNjQ0DQo+ID4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtcmlpYy5jDQo+ID4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtcmlpYy5jDQo+ID4+Pj4+Pj4+IEBAIC05MSw3ICs5MSw3IEBAIGVudW0gcmlpY19yZWdf
bGlzdCB7ICB9Ow0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiAgc3RydWN0IHJpaWNfb2ZfZGF0YSB7
DQo+ID4+Pj4+Pj4+IC0JdTggcmVnc1tSSUlDX1JFR19FTkRdOw0KPiA+Pj4+Pj4+PiArCWNvbnN0
IHU4ICpyZWdzOw0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBTaW5jZSB5b3UgYXJl
IHRvdWNoaW5nIHRoaXMgcGFydCwgY2FuIHdlIGRyb3Agc3RydWN0IGFuZCBVc2UgdTgqDQo+ID4+
Pj4+Pj4gYXMgZGV2aWNlX2RhdGEgaW5zdGVhZD8NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBQYXRjaCAw
OS8xMiAiaTJjOiByaWljOiBBZGQgc3VwcG9ydCBmb3IgZmFzdCBtb2RlIHBsdXMiIGFkZHMgYQ0K
PiA+Pj4+Pj4gbmV3IG1lbWJlciB0byBzdHJ1Y3QNCj4gPj4+PiByaWljX29mX2RhdGEuDQo+ID4+
Pj4+PiBUaGF0IG5ldyBtZW1iZXIgaXMgbmVlZGVkIHRvIGRpZmZlcmVudGlhdGUgYi93IGhhcmR3
YXJlIHZlcnNpb25zDQo+ID4+Pj4+PiBzdXBwb3J0aW5nIGZhc3QgbW9kZSBwbHVzIGJhc2VkIG9u
IGNvbXBhdGlibGUuDQo+ID4+Pj4+DQo+ID4+Pj4+IEFyZSB3ZSBzdXJlIFJaL0EgZG9lcyBub3Qg
c3VwcG9ydCBmYXN0IG1vZGUgcGx1cz8NCj4gPj4+Pg0KPiA+Pj4+IEZyb20gY29tbWl0IGRlc2Ny
aXB0aW9uIG9mIHBhdGNoIDA5LzEyOg0KPiA+Pj4+DQo+ID4+Pj4gRmFzdCBtb2RlIHBsdXMgaXMg
YXZhaWxhYmxlIG9uIG1vc3Qgb2YgdGhlIElQIHZhcmlhbnRzIHRoYXQgUklJQw0KPiA+Pj4+IGRy
aXZlciBpcyB3b3JraW5nIHdpdGguIFRoZSBleGNlcHRpb24gaXMgKGFjY29yZGluZyB0byBIVyBt
YW51YWxzDQo+ID4+Pj4gb2YgdGhlIFNvQ3Mgd2hlcmUgdGhpcyBJUCBpcw0KPiA+PiBhdmFpbGFi
bGUpIHRoZSBSZW5lc2FzIFJaL0ExSC4NCj4gPj4+PiBGb3IgdGhpcywgcGF0Y2ggaW50cm9kdWNl
cyB0aGUgc3RydWN0IHJpaWNfb2ZfZGF0YTo6ZmFzdF9tb2RlX3BsdXMuDQo+ID4+Pj4NCj4gPj4+
PiBJIGNoZWNrZWQgdGhlIG1hbnVhbHMgb2YgYWxsIHRoZSBTb0NzIHdoZXJlIHRoaXMgZHJpdmVy
IGlzIHVzZWQuDQo+ID4+Pj4NCj4gPj4+PiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgSC9XIG1hbnVh
bD8NCj4gPj4+Pg0KPiA+Pj4+IE9uIHRoZSBtYW51YWwgSSd2ZSBkb3dubG9hZGVkIGZyb20gUmVu
ZXNhcyB3ZWIgc2l0ZSB0aGUgRk1QRSBiaXQgb2YNCj4gPj4+PiBSSUlDbkZFUiBpcyBub3QgYXZh
aWxhYmxlIG9uIFJaL0ExSC4NCj4gPj4+DQo+ID4+PiBJIGp1c3QgZm91bmQgUlovQTJNIG1hbnVh
bCwgaXQgc3VwcG9ydHMgRk1QIGFuZCByZWdpc3RlciBsYXlvdXQgbG9va3Mgc2ltaWxhciB0byBS
Wi9HMkwuDQo+ID4+DQo+ID4+IEkgaW50cm9kdWNlZCBzdHJ1Y3QgcmlpY19vZl9kYXRhOjpmYXN0
X21vZGVfcGx1cyBiZWNhdXNlIG9mIFJaL0ExSC4NCj4gPg0KPiA+IE1heWJlIG1ha2UgdGhlIHJl
Z2lzdGVyIGxheW91dCBhcyBwZXIgU29DDQo+ID4NCj4gPiBSWi9BMSAtLT4gJnJpaWNfcnpfYV9p
bmZvDQo+ID4gUlovQTIgYW5kIFJaL3tHMkwsRzJMQyxWMkwsRzJVTCxGSVZFfSAtLT4gJnJpaWNf
cnpfZzJfaW5mbyBSWi9HM1MgYW5kDQo+ID4gUlovVjJIIC0tPiAmcmlpY19yel92MmhfaW5mbw0K
PiANCj4gU29ycnksIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQuIFBhdGNoIDA5LzEyIGFscmVhZHkg
ZG9lcyB0aGF0IGJ1dCBhIGJpdA0KPiBkaWZmZXJlbnRseToNCg0KTm93IHJlZ2lzdGVyIGxheW91
dCBpcyBhZGRlZCB0byBkaWZmZXJlbnRpYXRlIHRoZSBTb0NzIGZvciBhZGRpbmcgc3VwcG9ydA0K
dG8gUlovRzNTIGFuZCB0aGlzIGxheW91dCBzaG91bGQgbWF0Y2ggd2l0aCB0aGUgaGFyZHdhcmUg
bWFudWFsIGZvciBhbGwgc3VwcG9ydGVkIFNvQ3MuDQpDdXJyZW50bHkgaXQgaXMgd3JvbmcgZm9y
IFJaL0EyIFNvQywgd2hpbGUgeW91IGZpeGVkIGl0IGZvciBhbGwgb3RoZXIgU29Dcy4NCg0KPiAN
Cj4gUlove0cyTCwgRzJMQywgRzJVTCwgVjJMLCBGSVZFfSAtPiByaWljX3J6X2cyX2luZm8gUlov
RzNTIGFuZCBSWi9WMkggLT4gcmlpY19yel92MmhfaW5mbyBFdmVyeXRoaW5nDQo+IGVsc2U6IHJp
aWNfcnpfYV9pbmZvDQo+IA0KPiBJIGRvbid0IGhhdmUgYW55dGhpbmcgYXQgaGFuZCB0byB0ZXN0
IHRoZSAiZXZlcnl0aGluZyBlbHNlIiB0aHVzIEkgZW5hYmxlZCBpdCBmb3IgUlove0cyTCwgRzJM
QywNCj4gRzJVTCwgVjJMLCBGSVZFfSwgUlovRzNTIGFuZCBSWi9WMkguDQoNCllvdSBkb24ndCBu
ZWVkIHRvIHRlc3QsIGFzIHRoZSBleGlzdGluZyBvdGhlciB1c2VycyBkb24ndCBoYXZlIEZNUCsg
ZW5hYmxlZCBpbiBkZXZpY2UgdHJlZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

