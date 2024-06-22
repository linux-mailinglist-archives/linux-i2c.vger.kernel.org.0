Return-Path: <linux-i2c+bounces-4239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DE9132AF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 10:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F187284770
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D07114C587;
	Sat, 22 Jun 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QQit+tPN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2051.outbound.protection.outlook.com [40.107.114.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CFF149E01;
	Sat, 22 Jun 2024 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719043736; cv=fail; b=q8hyD3U731CIpZlkfhXv07pD1DIV7WYMZrVlm4MZb4eSDj7tFfEqZkBp3l9Nz72GFJDrKUYPkWmZCtYNSWbD/FpIhqWX37Us8BCYiCkRAw5E0D/qHU0j1y40dnqVj2JtuR3heNPsKp6J5oeigW6K6njCu/ofMmuC1fhL/CE7PDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719043736; c=relaxed/simple;
	bh=YbVt4R3EfJALgBvCB4sWliNvow7S5pi361Z+HEpeJAE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CbwoULp4jf/dhkAq/0jLvOtsRWbKy1SPVxVJ1L/EeAxw/OeXl0XvXetok5KqG7PXaGKClp40lwJnxEcdO+1QcogLnshcgx0shQS1wnHcUdLo3i+YTObK+bxTQ/0jWIcv+xE4/RDjQwxa4aYZ5zkPsrSVP2cviR/Jp9BlZukYRF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QQit+tPN; arc=fail smtp.client-ip=40.107.114.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLWYZyC42hSm6pby7WwNwxm4XU8TAViwYAcUblb4sgPS0pcUjj1XBrUGP6/AFdYNBoawpC5Fe9z91+RGeLNqEjJl0WYk/G4AHd93PrffSZKAuIiOGpwibwKxAvxfOsku57xzIgsic3/xQk3BxzaIyCx//t4nLuyLFckYqWJ9KyBeT8iMMYdan94GniNCxvuKvSSYW757cZcCFZUkBw3SkFoVTftHWqkCWv+S4uXbJryN908Hl1Pm2a5v3KSJu+BhBWpEHIiNICVsh2DXDx8bpM6C0LQtOheMYIBqnrVZQVwEwziEiWOxTXbbLjXhBMF3YaVcUo8ZFd56XHdzme2XwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbVt4R3EfJALgBvCB4sWliNvow7S5pi361Z+HEpeJAE=;
 b=B4LCbCx1GcbIlp+r0N50DEj3iNA+zchwNgF3w6kR2Kzyzis5fUGHkIGPFCXoxKkAsGBpGnE0qCtnz0jX6o9lso2xavtBLj/y+z3jTphq7ABsJtjy3HddopjGEJU4oxc4h3lXicqh43SHZuiq/8BTPDKIz9zjxIJ8fhVHqJv+tKGD4ArOoMjtSYQ8RuCMC39mP7Z9uV47xONtk+RWGzf65A7Sx6hosQZSKxbBYIt0SPj/22+vuGrUEv7gIRHwJKex639m8oZ4syQqiI+mtJV//i9Bo69V70EBDhyXKuVR69LKLWdhhrmmOBq/KRo9MK3thY2ETBiLQX+NC2SSLl3zIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbVt4R3EfJALgBvCB4sWliNvow7S5pi361Z+HEpeJAE=;
 b=QQit+tPNinI2WkzTmz3qOpcHniTpMmkzr5qRgcMuBUWsSVfPC/vAXez6L/dRa06EV4uemF1Kpa2CmY+isbDuJMUT8//Z9pH1BOytW4lkVDJMjbZpnqw1DjHuzF5ZmQq5uuaXZSsVpE1qqdcF83j3HSk8IeggJE/293h4kvTwlEU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5474.jpnprd01.prod.outlook.com (2603:1096:604:a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Sat, 22 Jun
 2024 08:08:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Sat, 22 Jun 2024
 08:08:47 +0000
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
Subject: RE: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Topic: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Thread-Index:
 AQHaw83CoDfPceNxD0KOSNXxIs1DTLHSJmsggAAGUYCAAAAcwIAAAxiAgAAAHECAAAZ8gIAACYPggAAHhoCAAAGPAIAABnaAgAEc6VA=
Date: Sat, 22 Jun 2024 08:08:46 +0000
Message-ID:
 <TY3PR01MB113461D937846D1D03F5033E386CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
 <TY3PR01MB113462C6C427DD4581086430D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <86843e15-6791-4214-8eca-720142820973@tuxon.dev>
In-Reply-To: <86843e15-6791-4214-8eca-720142820973@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5474:EE_
x-ms-office365-filtering-correlation-id: 24bc0d40-a1b2-4d4f-5f95-08dc92928abb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|7416011|366013|1800799021|921017|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckpzcS9SZHlDQVZicm14MS9FRktZK0lDK01TMm1VL0pQa0JsclQ4bnIrMVNp?=
 =?utf-8?B?dHZIblhmNGNBZW0wZ0dRN1ZwbllKRHdHQ01USXU4a0JJMGc4OENwSU9SdmFZ?=
 =?utf-8?B?T2MzT0M5NUxCc0x5azl4SUJ5eEhPc2VDSU1Xb05qMW4yK1pjMGJLUkdkNFJ1?=
 =?utf-8?B?ckNLU1RJNnJoTkZTQnF0aXR6RnFYUURHcGtkZSs5V1dlUHAwTEY1MXlYZjBt?=
 =?utf-8?B?NWRRMTV1OERFV1RNcENvNkpaU3BTN0lQTmlGZjcrbHEyMWM2RU5Bandpc204?=
 =?utf-8?B?YU5wekJWWVBYRXJqWEt3R1p1QVM1aVhrWTc4aHZVL2lhNzZYOHM4TE05VmZE?=
 =?utf-8?B?V2Vhei9Hd0Z0WHlqb0YrVmYrZVFlR2p6M2hlRFF6eTBERXFRb001Vi9LbzVM?=
 =?utf-8?B?Q2dqdkVTWlIvVnRuTnp4ZU1SRjBqK3E4OGxLdjNROEhpU01FZ3F3bUw0ODJm?=
 =?utf-8?B?U0JwUmZ1NTE4NEFZNzluSkp2UHlqSEZUekM1STFUdHh2WmFJbW9MdURyM1ZV?=
 =?utf-8?B?ckRjT3NnOHZodVpoQ3QzTi9YZENtcU5wcHVVOEhEbnNGRjk3UGVkWW8zN2h0?=
 =?utf-8?B?a2lsenQ1ZHc5dDdxV1JxeUxxbmJNL1djT0h4MFdCcW8yQ0NOeGQvSldna1FI?=
 =?utf-8?B?VVRwRUFYOVo5aGQxTmM4QVJ3TXJ0UGFOMXloTjdKaWVEYnRIZGIzZG1vdVBq?=
 =?utf-8?B?SCtqM3AxRCt6eFM1Vmt3Q20wdDNSVGRtMGFETzFYRlYrQzkrQ2hMNlBrNit3?=
 =?utf-8?B?dmhxcjdnR0hPR2U1c29MaFFtNFdDV3cxUVBqajZaOE9oelFRbmRUZ1Z0QW1W?=
 =?utf-8?B?Y0lQMUFzU0R5amY1bnFIckdMeDhoS1VpTzNwazhpSU5SS1N4MmVCTGUwVVN3?=
 =?utf-8?B?b3lWNmp5djlKQ2xYMTVoSnNnbHkzMFpwQzZiRmVwTVpHMXpscGoxV29QYTJT?=
 =?utf-8?B?d2tDQnpKY21SanJUQ3FQbDdqZFIzUzBybktmQk1FU1NCNlYyZUx0MjIzSGxL?=
 =?utf-8?B?OHpvcDNwRDBJMWdtRWp3cUM4czVRQzg4NzU1NGJWUzZHbDQ5TVNJcy9kaGNY?=
 =?utf-8?B?UkRNQ2Q4bEFIVDVWUndRc0dxN3FvdnZCWlVzeWRiTUhaNmNUc2dUMFlsRVEw?=
 =?utf-8?B?em5ydFFqc3hKTkhLK3dqLytjUUpJSzB4blBVQnhQQW1MdUhUQXcvR0FPSG13?=
 =?utf-8?B?eU9vY2pUaFZ6akQraW9CZWJDZDRhZGNGZkJ5U1l4OE14elViZ3BCWi9zN0dW?=
 =?utf-8?B?LzlMQlFvN05lMDlTNk1VSmJBU1JwZ0dwTk5QSUtMMm00RlVlUzBvQWV0QjFS?=
 =?utf-8?B?a0I2aXZXZmphUU9vRFI2M0VyVTE2bWo4L2ZhUWdoMWhjM2gzSXg2U0k2Nko4?=
 =?utf-8?B?c3h3S1hnVWV1SWxCelhySjRxSU9PSi91ZWFWQVgxOTVzNjdEemVNSVhDbldq?=
 =?utf-8?B?TGxtWTFZSkRUdGIwWktSKzhvT3Y1UUlubTZPVks0eS9mNUNQQnExSTVMYlUz?=
 =?utf-8?B?ZWVSWkFFc3VicGFUT1pDT3BNMGhidHV3ak1EZzVUVG1jMkJBeGtsdTlmMkNH?=
 =?utf-8?B?TWl6VE1qbnJ0d0l1ekJlS2JUTjBKano4Wi9udjBzYW5BWm03VnJET1J3eU9n?=
 =?utf-8?B?K1loYXgyREsxblV4YUc4UlFaSzIvbFRUM0ZFdi96aTFPTnBNTzNvS00wemlX?=
 =?utf-8?B?ekNLZFg4UFU5MnI4VmxNOCtud082eEVFYlk0L3hkSVJWRFpiUHVKQytuSzdC?=
 =?utf-8?B?ZEVnK3lkY2FSUFNZVXVIcm1mOVlmR1hSWEpvbE4vNnV4ZVE2eFRURE9mSzl2?=
 =?utf-8?B?aStNaWNLZ0REcFd4SUZKUHhZWnhNRW5lUTYrN29ZSG80elZoRlhPT29sMDEr?=
 =?utf-8?Q?yTGzUaaAwqkXz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(366013)(1800799021)(921017)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHh5WDZtM0FWeUJmd1EzRlZUSjNRMHZwMHUxVUVaUGZ3R2tLSUR4WXVOcnVo?=
 =?utf-8?B?U3pobElyRTJhYk5kcFlqVGJrN2Evb095ZFloenYxVlhHcFJ0dXgxVUE2ZjJC?=
 =?utf-8?B?ZGV4N3Uwa24vYWJxL0pYNEUwTEp5SGJXYjVDbVdzdFhFVmNQMDdsNmpoaUVB?=
 =?utf-8?B?NHIwL1J4MklIWjdRNnZ6YVZYcUxEcWtUTVcrbEdvK240d1BudFpucGQzNDJk?=
 =?utf-8?B?d2I5WmFDSTVBeUZKOXpZV0tHTDNrUDV3L3ZqYTFabyttVVVWNjVvQXo5SEFT?=
 =?utf-8?B?YlNheFR5VFQydlNGdGRNd2hKVkd3dmV3bEF4OFFEOC9objhzVEI4dS9valdD?=
 =?utf-8?B?L0dWVm1Db1lUdGt4MUNUOTlMQjFBNTlPeGNvbFNaT3VuT0NwWGYydDY2WHp1?=
 =?utf-8?B?UGNPUjdlM0pUdU9CQzlIb2NUMERnVGdmT29yTWEvMWdJR2dvR2tVamIwbU9V?=
 =?utf-8?B?aHRoT0w0VEF5SzA3cjhrNU9rWmI2dzJ1WWNqSWJ1TXNsclBUR1NyWGlnYVM2?=
 =?utf-8?B?OGxYM1VVZkp1aWhWTDRIdkZUem10Z0VhbWhHT0lDZHVvMUpacmo0M3ZHODQ2?=
 =?utf-8?B?OG5yWEVpRUxmVnNWT0dEenJnbmxGZTk5ZXBpNnBKS3dIc2N5K1FMR2xVY0JC?=
 =?utf-8?B?SmRQK0p0ZjlrcGsva3VkSzh1R0NPY1YyY1VUUFBCdFhqMjF6RnFydTEybzBN?=
 =?utf-8?B?V1RpZHZPZG9sUjduTytqdUJ2NFozVzNodEdVVmFVRHlBTEJsNHI0OWFtMDdt?=
 =?utf-8?B?Um04ZFdNMGVPakE5Sk9nZlFIYTRIeXRXMGVCVVczWVo0QjRlQWg0bzV6aGVE?=
 =?utf-8?B?TjRSb3hGclIrOUhLSC83MThnT284bWZzbTRqVHFuNHpmWDg5bjZsYThaRE5h?=
 =?utf-8?B?aEVSaXZSWG1IT3NldWtwbHpCT2tQdmgvdVZCb0ZHZURnRXRIZ0xQUTYzTk5P?=
 =?utf-8?B?MHFYOUEveSswNEIzUXA5MGZlL05pMDlKbFU0Z1h0QnR4YlVrYkdnVW1sSGl2?=
 =?utf-8?B?ZFovdHIxdVhMSThqMnJBNGo5RzZJVTA2NTV2OXlyMWdXWmQxMFZlVlQ3V1ZC?=
 =?utf-8?B?UlU5TGUxT3R6NytUeHVpSVVhd2M1cVk0UVhsMXNPTmV5VytmNkJNYk1mOG9s?=
 =?utf-8?B?RmRGcUpxU1hHSGRoZ3JnWm1jSy9INWRRaDJpdnY4VXo2b2hyR2U4cnNldTla?=
 =?utf-8?B?VENBTmRQU1JlQ2VFNXkxdHlPOGNXUWZ1TVNqSlhnWVRaS1Fja3RaeHJZaUQ3?=
 =?utf-8?B?eGVGczdWdzRGcTdiRnNhdHlydFN5S0hab2R3VEZVZzVrazBVQzBrbzFaazRY?=
 =?utf-8?B?SW9QRExUd0pnVU8wSmtRRDF1TjBIMW5WcE9qYUV2S2VlMEpMZy9NbmFDRDFp?=
 =?utf-8?B?RUhhTzhpUUgwVUt2c0xqSTlpK1BkTWR4YkcxZmthR09NbmIxYVpGQW1McStv?=
 =?utf-8?B?dDZiV1BGZnBPZEl5aDdHVVVVMkRVQUFPaFUyTFZRbHdJMldCay9rSjJaL0hl?=
 =?utf-8?B?ejhmMWgyeTZxa3BjNHVwQUVPcEhUdE1McGVHRDRRM1hLRkcwbnR0VFNEUnFD?=
 =?utf-8?B?WnoxRGE0S3ZwY29mcDVCeHpENDhxQ0xRQVBaVnRYeXNiakhkWXJ5c1pCczJB?=
 =?utf-8?B?YWwrOUZJZ2NSWnZobmtkc01VbHRMVHNJMGdaQ2pmOHpld3lXQStWUi9CQmZk?=
 =?utf-8?B?QlhWTHREYjRQU3R4ck9BbHBCazJybm1yS0ViVXQ5MjJjTk0zeHMzekpHUUlQ?=
 =?utf-8?B?eHVsQlgwK29oMzRtTHVBdEdWdHZpa2l5cGtqb292NmJ0b1ZKUFhxTkorUlRk?=
 =?utf-8?B?T2U0OUdWTEdTRmJROGRudWFXZXcrbHlkYUluaERkZjhCNk1SZ1EwSGg1VWhF?=
 =?utf-8?B?TFR0Y21aMkxJbGw0QkpHb0E2NVBKVkVOWWRFWVNobkNLVS9pVjZVRWUzNHdo?=
 =?utf-8?B?Z0luZXlRNTMvZ050OENOVm82UkhZTTl0dDhHR2lTSUdXb0FtVEk0bVNZQTNm?=
 =?utf-8?B?bGRFQ1l5REJkM1MwODVYWk14SG9kNGZjb3NjaGZCOERBSWdOQ1I5K3p2dXhh?=
 =?utf-8?B?dzVHOUxOaXN0NG9wV21Penk3UlRlZ05DdmZZNWpGS0xJN3pxbUJKWUVyNzVt?=
 =?utf-8?B?R0IvdkFoZ3A3TE9VU3dEOHB6ZGFqWHh0SU9reU90VlZBYXhpTUlJVmM1eXg3?=
 =?utf-8?B?eWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc0d40-a1b2-4d4f-5f95-08dc92928abb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2024 08:08:46.9713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ6QY/i0CP6iOWwNddmqkDlzLccyDb8Ig5jNvwC9Wik0NgAeT6E9VfcgLahQkS9/f+xI4bdgezuioxGWcjIK8AzGKPWPjqjPQH3IVBfEVBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5474

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjEsIDIwMjQgMzo1OSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzEyXSBkdC1iaW5k
aW5nczogaTJjOiByZW5lc2FzLHJpaWM6IERvY3VtZW50IHRoZSBSOUEwOEcwNDUgc3VwcG9ydA0K
PiANCj4gDQo+IA0KPiBPbiAyMS4wNi4yMDI0IDE3OjM3LCBCaWp1IERhcyB3cm90ZToNCj4gPg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGNsYXVkaXUg
YmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+IFNlbnQ6IEZyaWRheSwgSnVu
ZSAyMSwgMjAyNCAzOjMxIFBNDQo+ID4+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+OyBDaHJpcyBCcmFuZHQNCj4gPj4gPENocmlzLkJyYW5kdEByZW5lc2FzLmNvbT47
IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiA+PiBrcnprK2R0QGtl
cm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+ID4+IGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlOyBtYWdudXMuZGFtbUBnbWFpbC5jb207DQo+ID4+IGdlZXJ0K210dXJxdWV0dGVAYmF5bGli
cmUuY29tOyBzYm95ZEBrZXJuZWwub3JnOw0KPiA+PiBwLnphYmVsQHBlbmd1dHJvbml4LmRlOyB3
c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbQ0KPiA+PiBDYzogbGludXgtcmVuZXNhcy1z
b2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4g
Pj4gbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgQ2xhdWRpdSBCZXpuZWENCj4gPj4gPGNsYXVk
aXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDA4
LzEyXSBkdC1iaW5kaW5nczogaTJjOiByZW5lc2FzLHJpaWM6IERvY3VtZW50DQo+ID4+IHRoZSBS
OUEwOEcwNDUgc3VwcG9ydA0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMS4wNi4yMDI0IDE3
OjA2LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+IEhpIENsYXVkaXUsDQo+ID4+Pg0KPiA+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+PiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIw
MjQgMjozMCBQTQ0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMTJdIGR0LWJpbmRpbmdz
OiBpMmM6IHJlbmVzYXMscmlpYzogRG9jdW1lbnQNCj4gPj4+PiB0aGUgUjlBMDhHMDQ1IHN1cHBv
cnQNCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBPbiAyMS4wNi4yMDI0IDE2OjEwLCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBjbGF1ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWFAdHV4b24uZGV2Pg0KPiA+Pj4+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0IDI6MDYg
UE0NCj4gPj4+Pj4gIFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMTJdIGR0LWJpbmRpbmdzOiBpMmM6
IHJlbmVzYXMscmlpYzoNCj4gPj4+Pj4gRG9jdW1lbnQgdGhlIFI5QTA4RzA0NSBzdXBwb3J0DQo+
ID4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiAyMS4wNi4yMDI0IDE1OjU2
LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IEhpIGNsYXVkaXUsDQo+ID4+
Pj4+Pj4NCj4gPj4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+Pj4g
RnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4+
Pj4gU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDI0IDE6NTUgUE0NCj4gPj4+Pj4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCAwOC8xMl0gZHQtYmluZGluZ3M6IGkyYzogcmVuZXNhcyxyaWljOg0KPiA+
Pj4+Pj4+PiBEb2N1bWVudCB0aGUgUjlBMDhHMDQ1IHN1cHBvcnQNCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gT24gMjEuMDYuMjAyNCAxNTozNCwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4+Pj4+Pj4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+
Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4+Pj4+IEZyb206IENsYXVk
aXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4+Pj4+PiBTZW50OiBGcmlkYXks
IEp1bmUgMjEsIDIwMjQgMTI6MjMgUE0NCj4gPj4+Pj4+Pj4+PiBTdWJqZWN0OiBbUEFUQ0ggMDgv
MTJdIGR0LWJpbmRpbmdzOiBpMmM6IHJlbmVzYXMscmlpYzoNCj4gPj4+Pj4+Pj4+PiBEb2N1bWVu
dCB0aGUNCj4gPj4+Pj4+Pj4+PiBSOUEwOEcwNDUgc3VwcG9ydA0KPiA+Pj4+Pj4+Pj4+DQo+ID4+
Pj4+Pj4+Pj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVz
YXMuY29tPg0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gRG9jdW1lbnQgdGhlIFJlbmVzYXMg
UlovRzNTIChSOUEwOEcwNDUpIFJJSUMgSVAuIFRoaXMgaXMNCj4gPj4+Pj4+Pj4+PiBjb21wYXRp
YmxlIHdpdGggdGhlIHZlcnNpb24gYXZhaWxhYmxlIG9uIFJlbmVzYXMgUlovVjJIDQo+ID4+Pj4+
Pj4+Pj4gKFI5QTA5RzA3NSkuIE1vc3Qgb2YgdGhlIElQIHZhcmlhbnRzIHRoYXQgdGhlIFJJSUMg
ZHJpdmVyIGlzDQo+ID4+Pj4+Pj4+Pj4gd29ya2luZyB3aXRoIHN1cHBvcnRzIGZhc3QgbW9kZQ0K
PiA+Pj4+IHBsdXMuDQo+ID4+Pj4+Pj4+Pj4gSG93ZXZlciwgaXQgaGFwcGVucyB0aGF0IG9uIHRo
ZSBzYW1lIFNvQyB0byBoYXZlIElQDQo+ID4+Pj4+Pj4+Pj4gaW5zdGF0aWF0aW9ucyB0aGF0IHN1
cHBvcnQgZmFzdCBtb2RlIHBsdXMgYXMgd2VsbCBhcyBJUA0KPiA+Pj4+Pj4+Pj4+IGluc3RhbnRp
YXRpb24gdGhhdCBkb2Vzbid0IHN1cHBvcnQgaXQuIEZvciB0aGlzLCBpbnRyb2R1Y2VkDQo+ID4+
Pj4+Pj4+Pj4gdGhlIHJlbmVzYXMscmlpYy1uby1mYXN0LQ0KPiA+PiBtb2RlLXBsdXMgcHJvcGVy
dHkuDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJl
em5lYQ0KPiA+Pj4+Pj4+Pj4+IDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
Pj4+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9yZW5lc2FzLHJpaWMueWFtbCB8IDgNCj4gPj4+Pj4+Pj4+PiArKysrKysrKw0K
PiA+Pj4+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4+Pj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0DQo+ID4+Pj4+Pj4+Pj4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1sDQo+ID4+Pj4+Pj4+Pj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlbmVzYXMscmlpYy55YW1s
DQo+ID4+Pj4+Pj4+Pj4gaW5kZXggOTFlY2YxN2I3YTgxLi5jMDk2NGVkYmNhNjkgMTAwNjQ0DQo+
ID4+Pj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9y
ZW5lc2FzLHJpaWMueWFtbA0KPiA+Pj4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxyaWljLnlhbWwNCj4gPj4+Pj4+Pj4+PiBAQCAtMjUs
NiArMjUsMTAgQEAgcHJvcGVydGllczoNCj4gPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAtIHJl
bmVzYXMscmlpYy1yOWEwN2cwNTQgICMgUlovVjJMDQo+ID4+Pj4+Pj4+Pj4gICAgICAgICAgICAt
IGNvbnN0OiByZW5lc2FzLHJpaWMtcnogICAgICAjIFJaL0Egb3IgUlovRzJMDQo+ID4+Pj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4+PiArICAgICAgLSBpdGVtczoNCj4gPj4+Pj4+Pj4+PiArICAgICAgICAg
IC0gY29uc3Q6IHJlbmVzYXMscmlpYy1yOWEwOGcwNDUgICAjIFJaL0czUw0KPiA+Pj4+Pj4+Pj4+
ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5YTA5ZzA1Nw0KPiA+Pj4+Pj4+Pj4+
ICsNCj4gPj4+Pj4+Pj4+PiAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyaWljLXI5YTA5ZzA1NyAg
ICMgUlovVjJIKFApDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiAgICByZWc6DQo+ID4+Pj4+
Pj4+Pj4gQEAgLTY2LDYgKzcwLDEwIEBAIHByb3BlcnRpZXM6DQo+ID4+Pj4+Pj4+Pj4gICAgcmVz
ZXRzOg0KPiA+Pj4+Pj4+Pj4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+
Pj4+Pj4+ICsgIHJlbmVzYXMscmlpYy1uby1mYXN0LW1vZGUtcGx1czoNCj4gPj4+Pj4+Pj4+PiAr
ICAgIGRlc2NyaXB0aW9uOiBzcGVjaWZpZXMgaWYgZmFzdCBtb2RlIHBsdXMgaXMgbm90IHN1cHBv
cnRlZA0KPiA+Pj4+Pj4+Pj4+ICsgICAgdHlwZTogQm9vbGVhbg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4+IENhbid0IHRoaXMgaW5mbywgYXMgcGFydCBvZiBkZXZpY2UgZGF0YT8/IEJhc2VkIG9u
IGZyZXF1ZW5jeQ0KPiA+Pj4+Pj4+Pj4gYW5kIGRldmljZSBkYXRhIGlzIGVub3VnaCB0byBkZXJp
dmUgdGhpcyBpbmZvPz8NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gV2UgY2FuJ3QgcmVseSBjb21w
bGV0ZWx5IG9uIGRldmljZSBkYXRhIGJlY2F1c2Ugb24gUlovRzNTIHdlDQo+ID4+Pj4+Pj4+IGhh
dmUNCj4gPj4+Pj4+Pj4gMiBSSUlDIGNoYW5uZWxzIHRoYXQgc3VwcG9ydCBmYXN0IG1vZGUgcGx1
cyBhbmQgMiB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBpdC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IENh
bid0IGFycmF5IG9mIGJpdHMgZm9yIHRoaXMgY2hhbm5lbHMgd29uJ3QgaGVscD8/DQo+ID4+Pj4+
Pg0KPiA+Pj4+Pj4gQ2FuIHlvdSBnaXZlIGFuIGV4YW1wbGU/IEknbSBub3Qgc3VyZSBJIHVuZGVy
c3RhbmQgaG93IHlvdSB3b3VsZA0KPiA+Pj4+Pj4gcHJlZmVyIG1lIHRvIHVzZSB0aGUgYXJyYXkg
b2YgYml0cy4NCj4gPj4+Pj4NCj4gPj4+Pj4gc3RydWN0IHJpaWNfb2ZfZGF0YSB7DQo+ID4+Pj4+
IAl1OCByZWdzW1JJSUNfUkVHX0VORF07DQo+ID4+Pj4+IAl1MTYgZmFzdF9tb2RlX2luZm8gaW5m
bzsgLyogMSBtZWFucyBmYXN0IG1vZGUgcGx1cyBzdXBwb3J0ZWQsDQo+ID4+Pj4+IHN0YXJ0aW5n
IHdpdGggY2hhbm5lbCAwKi8gfTsNCj4gPj4+Pj4NCj4gPj4+Pj4gLmluZm8gPSAweDMsIG1lYW5z
IGNoYW5uZWwgMCBhbmQgMSBoYXMgZmFzdCBtb2RlIHBsdXMgc3VwcG9ydGVkDQo+ID4+Pj4+IC5p
bmZvID0gMHgwLCBub25lIG9mIHRoZSBjaGFubmVsIHN1cHBvcnRlZCBmYXN0IG1vZGUgcGx1cy4N
Cj4gPj4+Pg0KPiA+Pj4+IElmIEkgdW5kZXJzdGFuZCB0aGUgcHJvcG9zYWwgY29ycmVjdGx5LCBh
IG1hdGNoIGIvdyBzdHJ1Y3QNCj4gPj4+PiByaWljX29mX2RhdGE6OmluZm8gYml0ICsgZnJlcXVl
bmN5IGFuZCB0aGUgbm9kZXMgaW4gZGV2aWNlIHRyZWUgaXMNCj4gPj4+PiBzdGlsbCBuZWVkZWQs
IHJpZ2h0PyBBcyB0aGUgUlovRzNTIFJJSUMgY2hhbm5lbHMgYXJlIHVzaW5nIHRoZSBzYW1lIGNv
bXBhdGlibGUuDQo+ID4+Pj4gVy9vIGEgbWF0Y2ggaG93IEkgY2Fubm90IGRldGVjdCBpbiB0aGUg
ZHJpdmVyIHdobyBpcywgZS5nLiwgY2hhbm5lbA0KPiA+Pj4+IDEgdGhhdCBzdXBwb3J0cyBGTVAg
dy9vIGhhcmRjb2Rpbmcgc29tZSBSSUlDIGNoYW5uZWwgZGF0YSBpbiB0aGUNCj4gPj4+PiBkcml2
ZXIgKGUuZy4gUklJQyBjaGFubmVsDQo+ID4+IGFkZHJlc3MpPw0KPiA+Pj4NCj4gPj4+IGJpdCBh
cnJheSBnaXZlcyB0aGUgY2FwYWJpbGl0eSBpbmZvIG9uIHZhcmlvdXMgY2hhbm5lbHMuDQo+ID4+
Pg0KPiA+Pj4gSWYgc29tZW9uZSBkZWZpbmUgZmFzdF9tb2RlX3BsdXMgZnJlcXVlbmN5IGluIERU
IG5vZGUgYW5kIGNoYW5uZWwgaXMNCj4gPj4+IG5vdCBmYXN0X21vZGVfcGx1cyhmcm9tIHRoZSBj
YXBhYmlsaXR5IGluZm8pIHRoZW4geW91IHNob3VsZCByZXR1cm4gZXJyb3IuDQo+ID4+Pg0KPiA+
Pj4gSGVyZSB5b3UgbmVlZCB0byB1c2UgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgYXMgZWFjaCBT
b0MgaGFzIGRpZmZlcmVudCBjYXBhYmlsaXRpZXMuDQo+ID4+DQo+ID4+IEFuZCBJIHdvdWxkIGFk
ZCwgYXMgaXQgaXMgaW4gdGhpcyBjYXNlOiB0aGVyZSBhcmUgbXVsdGlwbGUgaW5zdGFudGlhdGlv
biBvZiB0aGUgUklJQyBpbiBSWi9HM1MNCj4gU29DLg0KPiA+PiBSSUlDIDAgYW5kIDEgc3VwcG9y
dHMgRk1QLCBSSUlDIDIgYW5kIDMgZG9lcyBub3QuDQo+ID4+DQo+ID4+IEZvciBhbGwgUklJQ3Mg
KDAsIDEsIDIsIDMpIHdlIHVzZSB0aGUgc2FtZSBjb21wYXRpYmxlIChhcyBhbGwgYXJlDQo+ID4+
IHBhcnQgb2YgdGhlIHNhbWUgU29DKS4gSG93IHRvIGRvIHRoZSBtYXRjaCBiL3cgRFQgUklJQyBj
aGFubmVsIGFuZA0KPiA+PiBkcml2ZXIgd2l0aCB0aGUgc29sdXRpb24geW91IHByb3Bvc2Ugdy9v
IGhhcmRjb2Rpbmcgc29tZSBSSUlDIGNoYW5uZWwgZGF0YSBpbiB0aGUgZHJpdmVyPw0KPiA+DQo+
ID4gLmluZm8gPTB4Mywgc28geW91IGtub3cgZnJvbSB0aGUgY2FwYWJpbGl0eSwgZm9yIHRoaXMg
c29jLCBidXMgMCBhbmQgMSBzdXBwb3J0cyBGTVAuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhpcyBw
YXJ0LiBXaGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpczogd2hlbiBwcm9iaW5nIHRoZSBkcml2ZXIg
Zm9yLCBlLmcuLCBidXMgMCwgaG93DQo+IGRvIEkga25vdyBJIHByb2JlIHRoZSBkcml2ZXIgZm9y
IGJ1cyAwPyBjb21wYXRpYmxlIGlzIHRoZSBzYW1lIGZvciBhbGwgYnVzZXMuDQoNCkkgYW0gbm90
IGEgRFQgZXhwZXJ0Lg0KDQpBbm90aGVyIG9wdGlvbiBpcyBtYXliZSBhIGRpZmZlcmVudCBjb21w
YXRpYmxlIGZvciAicmVuZXNhcyxyaWljLSByOWEwOGcwNDUtZm1wIg0KdG8gZGVzY3JpYmUgYnVz
ZXMgd2l0aCBmbXAgYW5kICJyZW5lc2FzLHJpaWMtIHI5YTA4ZzA0NSIgZm9yIGJ1c2VzIHRoYXQg
ZG9uJ3Qgc3VwcG9ydCBmbXANCg0KYW5kIG1heWJlIHlvdSBjYW4gdmFsaWRhdGUgYXQgZHQtYmlu
ZGluZyBsZXZlbCB0byBjaGVjayBhZ2FpbnN0IGZyZXF1ZW5jaWVzPz8NCg0KSWYgbm9uLWZtcCBi
dXMsIGR0LWJpbmRpbmcgY2hlY2sgc2hvdWxkIGNoZWNrIHRoZSBmcmVxdWVuY3kgYW5kIGlmIGl0
IGlzIGdyZWF0ZXIgdGhlIGZhc3QgbW9kZSBmcmVxdWVuY3kNClRoZW4gdGhlIGNoZWNrIHNob3Vs
ZCBmYWlsLCBub3Qgc3VyZSB0aGUgZHQtYmluZGluZyBjaGVjayBhbGxvd3MgKHggPiB5KSBjb21w
YXJpc29uID8/DQoNCkNoZWVycywNCkJpanUNCg==

