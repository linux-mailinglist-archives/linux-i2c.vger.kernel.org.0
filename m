Return-Path: <linux-i2c+bounces-360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470127F23F6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 03:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56E0281B05
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 02:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220FF1549C;
	Tue, 21 Nov 2023 02:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="C9phjr2Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2079.outbound.protection.outlook.com [40.107.255.79])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E127171D;
	Mon, 20 Nov 2023 18:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eccMrkWSHNWVDifNZUoDLdD8tt9Kc607nFwBEzHTPdGNSg75kAJa4eWK5f/71vv9eGqkxbNa6AkrGPcsdohpml2MYIar+q6ELrJ0X0+5Q4qrDmZXtEMRELgiApjwTIpdX0C/46G4cuoeTbjy49eab5lghVkA7zZlWpCIEE+jTHmQTayvi5fP6Hn1A0vzAROIQfwKEuFuvUnPUpBqLKKaskhC+Yqp0MGBJBs8Lt7W04r+a10Qlc3Y/kcOlJI0pG417aj68xZvXHZdyZN6ED5RBm2E30MMvOpX4MSlEdSV0iFzWUkLnG15iARNeXAE1wiRUAgtreV06worq7t92unNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTZ/zBmE7sz8Ve+qxohauZKKcgOU6DRX1d/ZWPA5fgw=;
 b=G8tZJP16JV5Zm4h1PVlmQJUUES/DKm1AfCLU2/lPi06OwDBjBC9vDIFFORiVulOhGH+4Yt1PfCuUDPfc6N2CsvebJEUvduFTPY8W2K1Ym+KaIJUpezDkMLqzvYiY3F6GjDbZsJYC1kwI1orqpDa9djaNG5W8fJcyw12Y7U/hvrck5MhC/+7J7ktCzXN20LzKWb0JLHJ/LhHjVlWJtQNXybO3NF7+A3QHQuCJ8c2PXsvzjp6O9L8NoX/hGBvHYv5HjtNSiU4763BuS0F8sK5vmLBxJm8T4kTqK2F501oh5dAdz3ZEKWjW3tJoxQIihY4kjRKOKvsZwsRgSvgqWZ6xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTZ/zBmE7sz8Ve+qxohauZKKcgOU6DRX1d/ZWPA5fgw=;
 b=C9phjr2QloFHhO+ATemjU40N47B83a7HkLB6rtZEV7UFVs1Yn7x6QNXcjzXH74IMNDMLIXGRGSk6rOhy6uZyIEpxuJJ3g6XKRdcKbIO5OFQugsUI8OV+EL65xaLY+z9lajdXI691MKpvFhiyZH0HhxCANXpbXpQdOeOw0TobvE31u6boQn6IhSBOs4CZ09WoN5IpN7Wtu/Kn6prneXG4JjDJiqtEdmahgMBddPFiD+9t7/xW1oNMPxvYe8Y9lORftadbL4E3KZ2S5yJcWsYr63lW7wjsHGxo6eqVkVQHPk6WWcrOTMtxKer6d8evXM4XY/zenULlh+CrQfhBUSaL3A==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEZPR04MB6317.apcprd04.prod.outlook.com (2603:1096:101:a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 02:27:04 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:27:04 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, Conor Dooley
	<conor@kernel.org>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaEq8NCeC65w2qLE2sHA7PlL1AHLByObgAgAje/MCAAD1bAIAIyMfw
Date: Tue, 21 Nov 2023 02:27:04 +0000
Message-ID:
 <SG2PR04MB5543BE4152A8D36D6570B146A1BBA@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231109-obscurity-dress-4d1d3370ea56@spud>
 <SG2PR04MB5543AB6AB419CA76DBD5E023A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <4f431cc6-4f13-47bb-ba35-44bddf047e02@linaro.org>
In-Reply-To: <4f431cc6-4f13-47bb-ba35-44bddf047e02@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEZPR04MB6317:EE_
x-ms-office365-filtering-correlation-id: 98cb41e8-b078-4084-5a63-08dbea3959e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J1A8NEGDg2SZRg/2aGJIo9L2VQpbP3Ar9gScTeX9T25E2f3ogL6+9HX3SIP2pTHvS2MmG6CdaIFa3EPB2qD/imcxZ6ROyny9V0b8PceN6+5cv9UCaYGJqyZn5elUOINdL8j3l3qt1WeAujYV1Aub/biqJ78QI48PhQXB52yEDb6F8d7erasxEtofOK/AjWIisTwCKIRckcgcNKh5KqrFV1glQA346wI0tWCADfDjg3HvYFlO1gUlgvlS0UtsAcFOCMT6151jHCr/vOJuihzJT53COK0k76az0csml6A2agfohG5067vVjzgLhiUv95/qo+znVB/oGO9Y5aIqE539ffzV2xwKvNqbMHJZ/NyXOqVrdOg9+xNGgkjEPXV4qfze1j4aZ9HFXeMzYWO0HiXWJNpUj9uxEr2Hjr6LNrjvOmFKZPTqxkMrQo2D8hZEtAhgV0QwtpnL01NZg+GRLWqvD1kO6TSEJyUu6GNDIWCXUpvPw7CvUq7GnsXygehvJQvcqfEilE9WJGe4go35v8nflzueyjWiTzNBNRUu7rhJq0+XQWTXAZpMAnMabkn+MClzudvet6rbEkj3Md4FwcH0Vez+/mFmmak886NfP19DS2NGWTa4ToyFznU9ovDZzmqNuJecbo3MDCpCnkJVgDkAt5y6fwYO4Fac/X8j1R2P3x0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(110136005)(76116006)(122000001)(66476007)(64756008)(54906003)(66446008)(66946007)(66556008)(316002)(478600001)(38070700009)(26005)(33656002)(83380400001)(53546011)(9686003)(71200400001)(7696005)(6506007)(38100700002)(86362001)(55016003)(2906002)(7416002)(5660300002)(8936002)(41300700001)(4326008)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDQ2NUszcmxwd2drTkJJSCt3YXYxbVIyMzIxZURmWHNOOVN3TDhKdDJWbXFB?=
 =?utf-8?B?VU9hcFdMN2p6YmQ0ZHhucVo5ekJqRWE4NXVmQUozZVFhNU9idUd4VjV2NFJr?=
 =?utf-8?B?blU2YnZWVXcyTm9Jbk9mWWJZQW5pRUVxd1dKL1NrR0ZGYitpZFBSSGw1MTdO?=
 =?utf-8?B?VHQwUVlMb2hkb081SiszVTJTQktieDNlZytVVXdUV2FXclJ2QXkyWXBZU0J4?=
 =?utf-8?B?V2pBcXk2eXZTdXBaUHYxM2F4Y2pLSXMzbzRPd2Z5WnJLTmkxRit3eHhWSlZR?=
 =?utf-8?B?RGFCS21IRkd1ZG5XZlJCRmY1aUs0Z0lXR2p5aGZzQVovQ3VVTG02TFovZzJY?=
 =?utf-8?B?ZHdIN1hBMXJXcFhvU2IyYVhDNjVQZkw0K1BpSUdRU2xEUTF0UC81Q1J6TjNj?=
 =?utf-8?B?RUtQVmgzR1cxb2Y0eHNlMlk3QzMxUThpRGdPOWxzN0xydnZIcmtma1NscXVV?=
 =?utf-8?B?TTRqNzVMVE5NdTN5SFprM0dVV3hJRExJUmk3VE8rSktVelRSaEloaGFad08w?=
 =?utf-8?B?QkxiaDlPcm1NcEpGSE01QVNKdUpLUXE1Nm4va0ZRaTlINit3QzFMSHVJV3hx?=
 =?utf-8?B?NDhUUE9nckRVTU1KdVlOVGRrUGRUbGRsNlQ2K0xmU29ZMkora3NkTE1ENjVk?=
 =?utf-8?B?ZWUvNXEra3lDZDREU1BZMlk5cFVObkhaWGU3Z0VxdmgvR3BtbnE0Y1ZyRVNj?=
 =?utf-8?B?THJMeUwwWDY2dnh4VGNzNWhDa3ZJSVd6VHFqZkNZL3NTNyt3VzVRampKK3dJ?=
 =?utf-8?B?aHdUNC9LUG1FNTZvTWJqVk10U1hTb2t6bExMNGtWaGxvNzlxaFZSaGhVSmc0?=
 =?utf-8?B?SWFhb3VXWkJTb0RzWStndE9yaEI0MFVxOERQclZ1MDRDMHpyVHJYVGRVYzFO?=
 =?utf-8?B?VnNHSDJiM2RTWitlV2tkelMweDhheGNTcVJkYm9OeS9yazRYRy9MUXhiL0No?=
 =?utf-8?B?dWNaSXBaK1Q0eURJT1N5Q2hNSUgzbWFmdnN2b3dZWDI0d054U0tkeERpUzJs?=
 =?utf-8?B?UFNEMHNGa0poeFZiODUwK2xQOSsrWjI4b09RMGJUQW1sVk1XOTZEUHlORWJT?=
 =?utf-8?B?ZWZCNXFNMWtIVnUvNU5qQW9idmhpTkZCNUlrVTBGNTgreW9jTkRvTzBHbmMy?=
 =?utf-8?B?Q1p1OEwyUjRubmZ1alpkUUg5YUhENmlhei8xcWRMRHp4WlNZcy9jMUVUOENn?=
 =?utf-8?B?cEtNNjRySktNWk1YNmROMjcrcnFET2xrVVJraEFpZ0o1Q00zTkF6WEdJbG1N?=
 =?utf-8?B?dUNDTjRNdkJNZkllTFVjZWN4V2ZpQzVkdEZoQkVJeW5GVDJPZ3A5Wmw4bnJQ?=
 =?utf-8?B?VTAwWmovWGE4ejQzNGgwWStyNmdKWW4wdFpYSy9VZUJTa0hkOXE2K01DcjFC?=
 =?utf-8?B?U253TDgrSGJoOSsvR2RsS2pUdnhjVUd2cTl3eWN0TTNHN2Jac1JUcm1ocjg5?=
 =?utf-8?B?emJSU1RuQTV3alJpMm9MV0JIWVV1dTN4ZlloTGY3c2ZVZWxKcUdDQm41WnRG?=
 =?utf-8?B?Nms4bVVNRGo2eU9ubG5XMjN2bFp2QUY0QjF1WmRkbU9IdVUzekVTMS9RTytv?=
 =?utf-8?B?THphL3lCUWt5UHJuN1JzWTR6cFZMVm1sNnBQdHo5b0pERFpIZ0VtazFRRWRF?=
 =?utf-8?B?ZDBDN3M0UjZMRU9uNTRnOGxvQnN0VDR6WUdGZy9ML00yc1F6V1NsSWRWYUc5?=
 =?utf-8?B?MHdEZHlySnprZmdrYTJUVmwzcjdmOGNYaWlsblo2QXJ1ZkEwZ0lOVmR0cDFj?=
 =?utf-8?B?RGVITEwvOGkxV1NNdFczVTJ6L0NkZ2w2VjRja1hlRUdVNkFUV3NDTk13M2pX?=
 =?utf-8?B?S1lIUzRWdlBISkhCZ0t6dXhIKzllUDlTcnlnTS9FUnUzQ1JmdWM4bk8xcDBs?=
 =?utf-8?B?RHlMUGlKQzJZTmxLUi9ZNkd5UWhVaXMwL2pQNVhYMVd1aFNMYzcyWlcya3RM?=
 =?utf-8?B?SmhQT0FKRE52VkV0MEM5eTNWMDQ1NTI5WEJFc0p1QVpaSGhjc1BQdlZRdXZR?=
 =?utf-8?B?OSs3czVzVkl1NG55SEhsalg2UWpIdGJQZXZYeGRNTU1lOGZqaWNGSHh3cSth?=
 =?utf-8?B?NUtERHhValUyT0I3MWNnV1ZEbnUrUEVYNmliOTBQUGdwWVJkRFpmZGNlS2tD?=
 =?utf-8?Q?X6MFtgnVN8EaiDTL0sEYtSri0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cb41e8-b078-4084-5a63-08dbea3959e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 02:27:04.4625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GNG1xdM0YffIIuGMqskp3IT7CVZ5tilK6+4MEqWuI1tHqw3BNE1e4U/1cGCGdSXA2fw6d8NUWn9bMKhxj4lbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6317

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92
ZW1iZXIgMTUsIDIwMjMgODoxOCBQTQ0KPiBUbzogRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lu
biA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4gQ29ub3IgRG9vbGV5IDxjb25vckBr
ZXJuZWwub3JnPg0KPiBDYzogcGF0cmlja0BzdHdjeC54eXo7IEplYW4gRGVsdmFyZSA8amRlbHZh
cmVAc3VzZS5jb20+OyBHdWVudGVyIFJvZWNrDQo+IDxsaW51eEByb2Vjay11cy5uZXQ+OyBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6
eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBr
ZXJuZWwub3JnPjsNCj4gSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47IGxpbnV4LWky
Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzJdIGR0
LWJpbmRpbmdzOiBod21vbjogQWRkIGxsdGMgbHRjNDI4NiBkcml2ZXINCj4gYmluZGluZ3MNCj4g
DQo+ICAgU2VjdXJpdHkgUmVtaW5kZXI6IFBsZWFzZSBiZSBhd2FyZSB0aGF0IHRoaXMgZW1haWwg
aXMgc2VudCBieSBhbiBleHRlcm5hbA0KPiBzZW5kZXIuDQo+IA0KPiBPbiAxNS8xMS8yMDIzIDA5
OjM4LCBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5uIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+DQo+ID4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTAsIDIwMjMgMToxMCBBTQ0KPiA+PiBU
bzogRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lubg0KPiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5
bm4uY29tPg0KPiA+PiBDYzogcGF0cmlja0BzdHdjeC54eXo7IEplYW4gRGVsdmFyZSA8amRlbHZh
cmVAc3VzZS5jb20+OyBHdWVudGVyDQo+ID4+IFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+OyBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gPj4gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5DQo+ID4+
IDxjb25vcitkdEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47
DQo+ID4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWh3bW9uQHZnZXIua2VybmVs
Lm9yZzsNCj4gPj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+ID4+IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAxLzJdIGR0LWJpbmRpbmdzOiBod21vbjogQWRkIGxsdGMgbHRjNDI4
Ng0KPiA+PiBkcml2ZXIgYmluZGluZ3MNCj4gPj4NCj4gPj4gT24gVGh1LCBOb3YgMDksIDIwMjMg
YXQgMDk6NDk6NDVBTSArMDgwMCwgRGVscGhpbmUgQ0MgQ2hpdSB3cm90ZToNCj4gPj4+IEFkZCBh
IGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBsdGM0Mjg2IGRldmljZS4NCj4gPj4+DQo+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBEZWxwaGluZSBDQyBDaGl1IDxEZWxwaGluZV9DQ19DaGl1QFdpd3lubi5j
b20+DQo+ID4+Pg0KPiA+Pj4gQ2hhbmdlbG9nOg0KPiA+Pj4gICB2NCAtIFJldmlzZSBzb21lIGlu
YXBwcm9wcmlhdGUgd3JpdGluZyBpbiB5YW1sIGZpbGUNCj4gPj4+ICAgdjMgLSBSZXZpc2UgYWRp
LHZyYW5nZS1zZWxlY3QtMjVwNiB0byBhZGksdnJhbmdlLWxvdy1lbmFibGUNCj4gPj4+ICAgdjIg
LSBSZXZpc2UgdnJhbmdlX3NlbGVjdF8yNXA2IHRvIGFkaSx2cmFuZ2Utc2VsZWN0LTI1cDYNCj4g
Pj4+ICAgICAgLSBBZGQgdHlwZSBmb3IgYWRpLHZyYW5nZS1zZWxlY3QtMjVwNg0KPiA+Pj4gICAg
ICAtIFJldmlzZSByc2Vuc2UtbWljcm8tb2htcyB0byBzaHVudC1yZXNpc3Rvci1taWNyby1vaG1z
DQo+ID4+DQo+ID4+IFlvdXIgY2hhbmdlbG9nIHNob3VsZCBiZSBiZWxvdyB0aGUgLS0tIGxpbmUu
DQo+ID4NCj4gPiBXZSB3aWxsIGFkZCAtLS0gbGluZSBvbiBvdXIgY2hhbmdlbG9nLg0KPiA+DQo+
ID4+IFlvdSBhbHNvIG9taXR0ZWQgdGhlIHRhZyBJIGxlZnQgb24gdGhlIHByZXZpb3VzIHZlcnNp
b24uDQo+ID4NCj4gPiBDb3VsZCB5b3UgcG9pbnQgb3V0IHRoZSBleGFjdCBwbGFjZXMgdGhhdCB3
ZSBvbWl0Pw0KPiANCj4gT3BlbiB0aGUgcHJldmlvdXMgZW1haWwgYW5kIHJlYWQgaXQgZnVsbHku
IERpZCB5b3Ugb3IgZGlkIHlvdSBub3QgZ2V0IGEgdGFnPw0KDQpXZSByZWFsaXplIHRoZSBtZWFu
aW5nIG9mIHRhZyBhZnRlciBzdXJ2ZXkuDQpXZSB3aWxsIGFkZCB0YWcgaW4gY29tbWl0IG1lc3Nh
Z2UuDQpUaGFua3MuDQoNCj4gDQo+ID4gVGhhbmtzLg0KPiA+DQo+ID4+IFdpdGggdGhlIGNoYW5n
ZWxvZyBmaXhlZDoNCj4gPj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

