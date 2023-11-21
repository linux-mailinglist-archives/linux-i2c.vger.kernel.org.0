Return-Path: <linux-i2c+bounces-359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C77F23CB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 03:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCCAC28177B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 02:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120314F86;
	Tue, 21 Nov 2023 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="n7oxoqSL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061.outbound.protection.outlook.com [40.107.215.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C97C8;
	Mon, 20 Nov 2023 18:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0diTEKGYYOaMB5HvJra8jZkiGd64vfBw4b0t9idXl5J/asGr9lsJEwZGFy3ctOHdq3eNZwBRQz58lRM9LOTWuRLJLOEXFban2SEIWXkuGxVZJ39wC/HXzMuSfHL3V/IEnMJ4oHrdKdjuSb4DEVmkUCdlJ+PWWXRzkNo7H0zy7Oqleomv/cE6bmUloi5/9kRqoG2QCNRK0pfCn/12AB793euxcNqTpCs0I/+1ZFJiFu8aCncbNxNcK9RFMarHpFzQcUCn5UMjcFzaoQ5OsT81SYT8BKBnMpxx6QsRlt8QWgE0Lx5OH9IfqiZH/LJMXPRiAj7irYNatjpt3Pqf0DmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88RUVHixzqq1/PAEeBvRhOUTNO2+77fztlVDdv7asII=;
 b=V78udfpXvFOwSuC0Heoc7KOsVzEFkxLqc3it3QvadDclwanyPebBay6WfowjVCARHjIt95uVh3w8k81OPIhFsHIIwRoDJyjSDtd2vkg69TLGv+sH43nIfgqwo3NqW19gP6rlLY3Hffs4MFbSLqSb+lW2nhERBFnEpMs8dHakeACS/ASeJ+LVBoP8Lk+TxFb8nMO/zuQfEp8az7BJzayU0ivc0ysqjpN0EyTq7av3q7Kn0Znb5BtqGAoxKferAhlsskbdraDBfrUjC9RN/uGPo6nV85ejmimyVy3pjFfLA8RacBKHaSSGcELfp4iLGf/pRELOi31YMNXj2rb7h9WUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88RUVHixzqq1/PAEeBvRhOUTNO2+77fztlVDdv7asII=;
 b=n7oxoqSLcyKBdT2+bCHHd3mxOmCe4mfxljEp/C033DE9tKIOM07Y3w22zPW6c3LU8uwD5ewtsLs4iQOBnKPIv0dt4m93sLW3blGx0DxcB8xAnNPHcI8JI1pNGo7uiSHJ652s4nUesqVfTQZYLxmziPJhDe6a4q7g8FwO26TQpsyYy1CV1SH3c0JZD9/U4uGj4o/zM/EpUB8A9jgT/8DgeiSHncvEea9PKfyUOj5EtSM9pVlhv2NKZRfBEv5JE3GOx563tSRxYfd334HPpYYDVxgRxdPGovveyqpy5wvaPcIy6KqXaNvsCkBVbMOIpI2wwQw6UJ+NvZ4umkQqC1ly7w==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEZPR04MB6317.apcprd04.prod.outlook.com (2603:1096:101:a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 02:19:45 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:19:45 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
	"patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v5 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHaGDTpez1VD7NikEeX8eD9egCiarB83FYAgAc1cdA=
Date: Tue, 21 Nov 2023 02:19:45 +0000
Message-ID:
 <SG2PR04MB554330329FBF9AC34F150908A1BBA@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231116023027.24855-2-Delphine_CC_Chiu@Wiwynn.com>
 <caff5743-265f-43ac-83fb-4e0fb23a9ff4@linaro.org>
In-Reply-To: <caff5743-265f-43ac-83fb-4e0fb23a9ff4@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEZPR04MB6317:EE_
x-ms-office365-filtering-correlation-id: e6c5869b-f8d2-40a4-38d7-08dbea385418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LSFI/dnYGiVuqQF0m3VfoJ88x0yN/bGulRtjPqvn+GfKiswBfMyTZ23oGO09+ltvYfqEjbhgKV9xP3JrH9PJ2mYPz0Tuk8nGimGsXclexx1Fw/XSs2wvEk9YfX0uS4aS89pvLIzOyE8e/jYQQ5BUhL7UmEX74/FmGm9zd8rLkO22SpvaIrQR7azC1iuRaUF9APQlnQMortFAckv0unIVRkm6berFNZ8SuhfCX4ydEXRDT5mnJc5MdNYr1BGP11u5iKX+wACOFBY1fJ8t+jNlsXwdgKCaLQ/oOVlfwiqEs99w0/LLJTrd0I+n4jzqk4I20fi6STm8lfsowNNaEVIqpTArRzMPtqrxBeKPrsn/ycVqk4HCKNrPYZFlbqV/zhM3QI9euwJdEjGW9Xu2GTTiCMhUrS85Np1jx+F+M5P7yRLAklzI2tpgYMk3M6+xcvBpsOUKYCsQRRnlu1OM1KvLUoqT+i5oLfWK5eGzlwUHivJAfVPrO1w3mh+DPpMGkxrFvqdMbAZPBI4589zpS2tnsQyJCZvLMQd7PQk/HdAPGqF/Ae2f+srXDHrKpKMSgCVB+YvU5smJW48bMfDtYH61K5xVU1lSvPVsH+YOiQxzWe9xze45OFl/xjIRb6tqpmd7lVxVYpw1mb8KNBEGTgSfumDSAzI8dnSaVBmNy27SJAY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(110136005)(76116006)(122000001)(66476007)(64756008)(54906003)(66446008)(66946007)(66556008)(316002)(478600001)(38070700009)(26005)(33656002)(83380400001)(53546011)(9686003)(71200400001)(7696005)(6506007)(38100700002)(86362001)(55016003)(2906002)(7416002)(5660300002)(8936002)(41300700001)(4326008)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTVJUUhTMDhOWWVUaDV3WDlrUmg2NWJZOGdyOUQ3bTByUzhvTy9UTEtja3N1?=
 =?utf-8?B?dWRuYndiV2NQNFU2YSswZDVhZ1dSbDB1ZjZGS2tUbGRzNmd6eW5WS3pqdEJC?=
 =?utf-8?B?eGx5SzN0L2puQXNZNkFtdWZhVTlScDVjNnJWVkp1aFhXa2p3eDRmTUFOdFV5?=
 =?utf-8?B?bFJ0OWR4NzFXQ3J5MndmOHB1NkRKNHhGNFN5dDc2RUNtN3o2VTNZZUNRbmxG?=
 =?utf-8?B?TWx2QzR6QUNPYmZUUjZndUF2czBCVGwxZ285VkhFalU2alRjdzh6VzZ3YTF0?=
 =?utf-8?B?VnIzMVZaMHA1eEFCcXBGSXlTaVR3LzJHaS9XNjBQRkJ1UkI0Kzk0MVlxNG5r?=
 =?utf-8?B?RSt2MVNUKytHdC9pZEhCbERqcEtWSGlLb3BJdE9CbFhNbjR3SXhTTEF2NXdu?=
 =?utf-8?B?V1FkWjQvT3hFKy8rMXYwb0pPRTgyWGFMenFRZGZwc2RUdHUyV0JIL2xVWng3?=
 =?utf-8?B?a29RUEtReENQam1YT3RtNk5QOStXTEFrZ0R4emxxZGVxN2wwRmtzb0hZUXpK?=
 =?utf-8?B?MURWV0p1ckk1dEFEa3ZzMTlScW5BczAxaVUxMmR1L3Yrc3NiTCtUODhpck9I?=
 =?utf-8?B?VjJ0UFdpTndQbVFESW5PdW05VFV6Rk5tc05UL2FQaFdmKzQzaGp4QXM2YjEy?=
 =?utf-8?B?Rm1rNU9SdkNjSmtuNUdiZUpPblQ2M0poZEVHbDZObVF3eDQ3MjI2YmNyUGJ5?=
 =?utf-8?B?RDZmWG10enRJNEZiSy82azhGMFZRMG5CNmR5bWR4ZHF3VEdGSVJmcE1kVkQv?=
 =?utf-8?B?OE1BNjh2MDZCRXhLNlNMWjlNeUwrYklNQmdlRVlTT1RDdmVxYWg2YjFaYzhG?=
 =?utf-8?B?US8vR0JadFdCcEgvN0NUeU1QZHNrNWwvaWxuM3lkcEdtcmpkVFJQRmdRWC9h?=
 =?utf-8?B?QTFOL1ViNENnSTRneFpFRW5WSXc0aDdkK0JsWHBNWGpwa1NtVHk1dVQ1dkc0?=
 =?utf-8?B?aDhUS1dXWDQ4Kys4MjRzV1M3VldDLzliRnh1R0gvMGhNSktVMTQrSEtXRkZq?=
 =?utf-8?B?Zy92RkVaL0NjWVg5aTVXZVpxMXE3SVRrZTNVUzFCenNQUEFQTFdGdUNsa1A0?=
 =?utf-8?B?YlFoT3BSU2hpVFcrSEdOUGxUQWRtUi83cHZUQkFlL1RZV21UbUlPWHk4QmJs?=
 =?utf-8?B?a1QzeG9qUC9VK3VwaFNTQjBVUC95SkpES2JJemdvZEhnU0pqbjdSeDBTaEt2?=
 =?utf-8?B?NWE5dFZRK1NIQXhEdTNQdjQ5dkljNkI2QTdVZHlBS08xekNyUVZIQml1NE1B?=
 =?utf-8?B?ajRFa1F4bHZsdW82emRZR1dEa0hIR0NhQlhrUWhZU24vVWRqVGRxcTNuVzAv?=
 =?utf-8?B?MkdlV2xRZGVmeVd5TzN5RFh0dWJmL2lHd1doUFF5VUVLNlA0NjQ0UnJWYVV4?=
 =?utf-8?B?OWwzME9XdldXR09XWlNFZjUzTXpvMHpOTEQxc2hLVEw5WnpobEk1b1JwUitF?=
 =?utf-8?B?VGRGVGRqendlbGFhdDhBWWxSb2JPcVlva1pxeGNvL2M3WVp1bDhyYVBTQ0tr?=
 =?utf-8?B?QmlCcnVzcmIrUk9weGxOSjU1MG5vRW5uRWs0UWRWc2ptZDNCV2syVE85bFNY?=
 =?utf-8?B?OWZISWN4bTVvZkM4dzZqRHdNT3lpeFBmaHk5TlRpTnhyWE5KV1AyQ0NFeEhP?=
 =?utf-8?B?aHYrdStkZnc4TWZnUjlUTCs3VGNucCtSWkU0SVVzQXA5V1llMEtZNDhkMkMz?=
 =?utf-8?B?YlFnMTh2b1VGSjcyeWFuQjdpWnQydUhJRHhIZkZ3ek40dnlJOVZ1cU1VMG1o?=
 =?utf-8?B?TlJ6eGs4WHNsaG5qRS9tTXB0QlE1UEpVYytkTmpBUmlmdzlUZVp1RFR4djlt?=
 =?utf-8?B?N0NHWlRHSzhqWmlUWEhpTzRxYVdkSkJ2WUh6MllOanh4Y2NYaDdqbVNCNTFh?=
 =?utf-8?B?VFhEMGpJTkF5UXA2Q3gyd0Z2aWZ5RCtWdUpDRnZQc0JIVHRWZ3d2Ny9pTllz?=
 =?utf-8?B?Sy9mZXNpT3NGNEE5UnpqT0M5bzdUM1NZOU9Jc1RFVTZNQmpzQ2hsbHJCbzhT?=
 =?utf-8?B?Y05DNWhDUHQ3MFNLUWwzc0dQTkVoTlh1MEh6VDRVRjgvbkdCQW5hVEkvWUdZ?=
 =?utf-8?B?Skl1NC82QzVxQ0Vydk92UWpzT0tQYnIvckxuMWtuYlVkUUVycmRwS1Z0R0xK?=
 =?utf-8?Q?ykELjdVNBTL5Ku0giryFIuat/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c5869b-f8d2-40a4-38d7-08dbea385418
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 02:19:45.2845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idXmpLUaJGctNaivIl+M4DBUbKqGkItroE9xYaZfiSS4TaYF4cc2iB1z/whxUqzX8W5/CnNEm4Ahsx1QNgBpXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6317

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3Zl
bWJlciAxNiwgMjAyMyA4OjE0IFBNDQo+IFRvOiBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5u
IDxEZWxwaGluZV9DQ19DaGl1QHdpd3lubi5jb20+Ow0KPiBwYXRyaWNrQHN0d2N4Lnh5ejsgSmVh
biBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmNvbT47IEd1ZW50ZXIgUm9lY2sNCj4gPGxpbnV4QHJv
ZWNrLXVzLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2Yg
S296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25vciBE
b29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJl
dEBsd24ubmV0PjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtaHdtb25Admdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY1IDEvMl0gZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgbGx0YyBsdGM0Mjg2IGRy
aXZlcg0KPiBiaW5kaW5ncw0KPiANCj4gICBTZWN1cml0eSBSZW1pbmRlcjogUGxlYXNlIGJlIGF3
YXJlIHRoYXQgdGhpcyBlbWFpbCBpcyBzZW50IGJ5IGFuIGV4dGVybmFsDQo+IHNlbmRlci4NCj4g
DQo+IE9uIDE2LzExLzIwMjMgMDM6MzAsIERlbHBoaW5lIENDIENoaXUgd3JvdGU6DQo+ID4gQWRk
IGEgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIGx0YzQyODYgZGV2aWNlLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogRGVscGhpbmUgQ0MgQ2hpdSA8RGVscGhpbmVfQ0NfQ2hpdUBXaXd5bm4uY29t
Pg0KPiA+DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiA+IENoYW5nZWxvZzoNCj4gPiAgIHY1IC0gQWRkIGh5cGhlbiB1
bmRlciAiQ2hhbmdlbG9nIiBpbiBjb21taXQgbWVzc2FnZQ0KPiANCj4gQXBwbHkgeW91ciBwYXRj
aCBmcm9tIHRoZSBsaXN0IGFuZCBjaGVjayB0aGUgcmVzdWx0Li4uIFlvdSBjYW4gZWFzaWx5IHNl
ZSBpdCdzDQo+IGJyb2tlbi4gV2UgYXNrZWQgYWJvdXQgLS0tLiBQbGVhc2UgcmVhZCB0aGUgbWVz
c2FnZSBjYXJlZnVsbHkuDQoNCldlIHdpbGwgYWRkIC0tLQ0KVGhhbmtzLg0KDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

