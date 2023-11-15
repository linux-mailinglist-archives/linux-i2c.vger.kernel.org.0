Return-Path: <linux-i2c+bounces-165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F47EBEB8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 09:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EB5AB20B9A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092445239;
	Wed, 15 Nov 2023 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="vI7GLj55"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457147E;
	Wed, 15 Nov 2023 08:42:30 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2081.outbound.protection.outlook.com [40.107.215.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A81510D;
	Wed, 15 Nov 2023 00:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIESzAhBl5Hd0hRXel1K8T6JmZ6hFX4hSV+SiOk8CLztfIg8NHVLq+U8UpLd+ve95vG4OPA5PktHeJggN6D+xeGEwtpSdsWTj++DkiLVw2gaws+CjtagwK+4+QQSK3y0WODAptdKWRZhaOEBwTNs2tIF3L040aB1Y4u1UbEpny8/lDhZL/8nrTwTgTAdWcPnn7K7tN88IZAbRlWH+C6xojNuCFzRx5age048vVR1JT42AehBPZ831dbAd7mnDn5XxfW4fckVWm9bzDKE+VLlrYJqWiujPKG4YVItKfsh3II6nV75nU8LRp8OGR1WNFXzSWYkz1AZ0hLKYw6qEbZgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkctziEbfGt+oRTTzQ1lmt6UCZH97Jq/ZAAA8Q0KICc=;
 b=iQD+yoPIYOiFFJdfkKkurcgL81Enx+M+VjL/He+VwbplFHLbw/y/oxfU1td/Z7K1tqaECDjlhd0tzo3QAvg778qlb40ywQwm3j3cDCMKgtUMv/EfQINO3z3NgYqmVKws05fs+aKdXanMsh6wpOWMdQ6soDrLZLgHDUMH3VwiNRh0gYaaRYxPBeniqOTfEtpu/8wIKo9M57tU98Pwan/PzPwnWfOyF1iMKJB1V+s7/pMBD6pEd1Kanh/1YEEud0i1BqpvBrQfJJ0XeFxgjPbBUKKdWaPhe/yPKtFol304RSuf1mhPWJlpQzLoUtU3mp77KPwIGGgfVuo6+3FTknKC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkctziEbfGt+oRTTzQ1lmt6UCZH97Jq/ZAAA8Q0KICc=;
 b=vI7GLj55B46oDakNEbWqUjkcGaiBoEAA+f9DZAuz1ZDuYJypcTCvzIf8kQKGiH++vcdC5XTTBxakRAk7Mmzk5StsVCNdS1QaTyQKKp4Ol9un/sWfROqFLt4rjHhnjBhbMl+BGtw1yDStGs0HJuJiIrQsA4sulBxrYJcd9xoqyPHI4GAOy8L6PPc/1Jqe7po2N/4rEkk5Aosg2PBFPWZnDKe2S5PtDHi9+i5zFD37k7csFDKrXDtrBGZGtrxyYbAYAR10QnIZaoKcwLpMVI87hxhHvZsayxLt0mNaNNXlkVM8SnEwhmUcluFY3EiX0tKJof04l0dd1PIJZVI5qOAn9A==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by SEYPR04MB5786.apcprd04.prod.outlook.com (2603:1096:101:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 08:42:22 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 08:42:22 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Guenter Roeck <linux@roeck-us.net>, Delphine_CC_Chiu/WYHQ/Wiwynn
	<Delphine_CC_Chiu@wiwynn.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean
 Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index:
 AQHaB+TGZscXMUpHJES8eSDx4MdG9LBcQtiAgAczeDCAAHtcAIAKS76ggAAIJwCADOl6kA==
Date: Wed, 15 Nov 2023 08:42:22 +0000
Message-ID:
 <SG2PR04MB55430E53CC7229B5BB5592E7A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
 <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
 <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <4b73a239-c90e-4515-b89d-65de15a1e9a9@roeck-us.net>
In-Reply-To: <4b73a239-c90e-4515-b89d-65de15a1e9a9@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|SEYPR04MB5786:EE_
x-ms-office365-filtering-correlation-id: db5bce0d-454a-4d5f-b14c-08dbe5b6c914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pzK4E3xd94RrRujp8vnF6iHPTyu+BpbbljQ6BPstzyffSA7NTjVb2a1zkDLVyEY+qsK0zfK2ZPgmAdaNCfdBEZ0zO04hds5+xR/LXtsTA+7JivPKHR/BepGwV2AWsH9B82GAGdmgodHUsPZAV6wSS5NhGD1+mMimJMaDeaOR50DoAUH67OXEadHjmMfdPjX/BktV2pLmVJy/fhP1cxiZa4fG3jGM6YmUIuQvUMEAJAE3GqQKputFC/tcM8tWoQGwVl3Nuko4MH+h2bLaEenPul4dZYqjwIrGgIv+yQnZhv4EiQn6YaIxcxSQ9EjNqT4k/5jcz9wnii3AAIhrx51VPhaj02EKj2x+ZrWiibx/YdQz7VdclTFl+C35ZFbzUSrCpkt43O5zv00BrjFY21fCLOcbTTgTny7RhhFcaZzLpPjyaiGmb/Q3zsUGlNYRVvPHMYCOx8iQRKlR3+sHBe8PzJioz8YQ22CJMZieis0/g1CR2zotkXTSZggs9wSVlX4/6Tga21qrUZIvUalXtDcaz+xtWuvmf3++S6iEemmUjXe0eeKlqgaO6VbaEQ0FI0kAEzESrSFqQLXcPgShaeZU3ZhlDSXFMaD2OTtpvrHipUvW0r94c+OBlgyjuot2S3dpXitbx9lbxvpxUkhittPObvy6+DpVgwMW+ba25kF4Iuo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(451199024)(186009)(64100799003)(7696005)(71200400001)(9686003)(53546011)(6506007)(26005)(83380400001)(8676002)(8936002)(5660300002)(41300700001)(4326008)(7416002)(2906002)(52536014)(478600001)(76116006)(66556008)(66446008)(54906003)(110136005)(122000001)(64756008)(86362001)(66476007)(66946007)(316002)(33656002)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2lNbGFkQnNhZldPb1IyNTZYVmxSTTBEM3l3di9SSFptdmdKd3BJczBBUFR1?=
 =?utf-8?B?by85UjUzMTc1Yml5MFppeTEyaGJYcjNzRDdaK1VHY05vSFAxSFFvcVF2MXI4?=
 =?utf-8?B?cTlVZVA2Mmg2RlQxazNUMWE4ZVA0U1E3alY2bE5lWVozM0NHTGZONWl0UjJp?=
 =?utf-8?B?WlliNWRVMHlZS25aRWIrSW1ZTmVJSm5sV1RILzU3L1ROY1h5V3FqbCtKQTh0?=
 =?utf-8?B?SmVHR3BXZm9BSEZYU3dMdG9RYTY2NDh5RGZuR1BRbVdHbTFJNENRK2tRWmZh?=
 =?utf-8?B?WlJKdFU3Vk95NXlJR2wxalVuM0RmamhQOUxPa0xWVDhlcjVaMFh4VHluN3Bo?=
 =?utf-8?B?Q2swSjQ5YXQveXdjRjk1ZVpLcUcrdlRkL2IrbnFRTTdPWHUxdjlmWEN6S0Np?=
 =?utf-8?B?Z1NpQXZmL21tU2VRa2dBZEdZRHRCeGxTQlZzL1E1NzJFN242RHZtY2tqK1dQ?=
 =?utf-8?B?WnFFTFA1emZiRjArOE1Zei9ETnZPSkxQdFk3S0tnSlp1aGJPd1dyK1g5NUR6?=
 =?utf-8?B?YzVVelFsdDNPbTJrY0lxSTRRdm5EUUxYcGkzbDdYY2xUTDNDQm9vWVdFeEdB?=
 =?utf-8?B?VEt1RCs2clJ1VzBWZmY4SXBFUXNxL25VWDRnYUNRTzhnS2RyMjNzREVadjNy?=
 =?utf-8?B?eW5RVklGTGF3QkFIeGZRRkVSOGI0ZWs1L1p0bGlrZzZTaEI3NTdpZ3ZBMTBq?=
 =?utf-8?B?dDRBazZPZkNHNlRFdWMvTnR4WFo0VkMvMnFkNkMvNkJKY1IyY3U5cTFOSytG?=
 =?utf-8?B?Vzl6b2hiTGV1aFhhN01FUmZPTm5CYWg5a2gvbXZPMTlkNFJuYXp6S2szd3g0?=
 =?utf-8?B?TzYzVXVUMmZXQ2JxQXRUaThndEFIY3JFVDEzSERiVjJCc1oxOGJXckNqNFVH?=
 =?utf-8?B?RkFXMVBQVm53VmhCWjhsUlc1SllqNTlVdk1Yc2U3dWxVZU56aWt1Z29TNjlt?=
 =?utf-8?B?aUNUcTZHWkhmRHMxV08yaFl5WFNJb05mOFlyNUdWR1lCVE12T2ROWXRZVkZR?=
 =?utf-8?B?eG5PTW9DQVErRXpIV2dPTWRsQzhWaXZpVGJ6Ri9rMTNaWU1MTnJpWlJ2QUxK?=
 =?utf-8?B?aE5aUHJpbUp0TWFBZU8vZmZEc09GZTd1MHdER3ZsOEpXQkRWd0EvY3VrdERX?=
 =?utf-8?B?b3FEYXV3Tlh4N3NnL0pPOERRNWVnb2pjQU1kV05nUXByUHpGYUpxeUd0SFk4?=
 =?utf-8?B?Sk0xVm96dEZvWC9jSVFOVXExZEljcTJtMm0rQ3BNUDdOMEdrdXF1aUt6aWts?=
 =?utf-8?B?ZzJjRllLMUU0SzRCMzhTdFE0bW40cVViT0l5VVpvcU41bi85ZlNWZFhycXQ5?=
 =?utf-8?B?cnRtcGExVEx6WlBrNWhybXFDdFNXRmk0cFBUM0ZFUGdwZXoxMXphOFRPUEJp?=
 =?utf-8?B?bVowbXdYdVBQenorRnlhWjdIWFh3T0dvVUgvNC85Yld3eit6M295VmdvTzJo?=
 =?utf-8?B?WjRVSnFMQ2tqN0x2SEVUTTlZTFE1bEZPd1Rsb1FkZHptZkRvdXRBK0s0QTY1?=
 =?utf-8?B?Z29ScWYwRHQxOWVaUmV5TnRDZEtJV1hYOFNWQnI1Mml0RHVJUmJXd1h4NVcr?=
 =?utf-8?B?TXBWR05xV3QyRkZwa2c3RnRZcWhIc1QzSjF3U3Y5VnRiZlpkcEZjZHFUdFhN?=
 =?utf-8?B?NTlTZkRYcTVZTGRKcW9Zdkcra2NOc1dsZmNpU2tqbVJzczlvdHpJMzZkcEdl?=
 =?utf-8?B?VG5Xekt2SE9RWjlYT1pxWFZiS0UzMm9UcHhGUmJoUENPSnYyME4xZS9pTnB1?=
 =?utf-8?B?Z3N4NHJxY1R6czZKc2RzWjBUbWszeTQreENjNThXTjh1YjZxbVlsZlZDUFFX?=
 =?utf-8?B?YjhKbVNiZGJIVy8rdWlqTXRuZ0pLczhPcExXQWJOVlR1UUZmeXRwNGNaZlpT?=
 =?utf-8?B?VnRsTU9KVTNPR2U5WXFIc3l1SGFvUGVjaXQxNFBMUytDVmhVeVVZK0s4VERu?=
 =?utf-8?B?RmtDUlhqU2VqMmJ0dVo3K3ZxR1RoK3RYbnkxa0I2cDBCbk11eEpJMUFYV0VB?=
 =?utf-8?B?S3BIeHlSdlZqTy9WUkVDdllLMTBPdlRLQTMvZUtoVDNIcmxHVkxId3FpZ0lj?=
 =?utf-8?B?eUhVYUh0T0J3L3d5d0VTSTRHSUtzdldzZnIxbHVSRG9kYlZ5dytFZlZvTG5M?=
 =?utf-8?Q?CrnucoJ3+o7w7bCiJC+nQ8W1p?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db5bce0d-454a-4d5f-b14c-08dbe5b6c914
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 08:42:22.3058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CnZ4jaHumfiHiMHv6czLUhW76F0EqyzexAHL4Jd3ueYLAdlfW8q57E31w1SXHqglg9EkRW+bI5482rXEpOQkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5786

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgNywgMjAyMyAxMTozMCBBTQ0KPiBUbzogRGVscGhpbmVfQ0NfQ2hpdS9XWUhR
L1dpd3lubiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4gcGF0cmlja0BzdHdjeC54
eXo7IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5jb20+OyBKb25hdGhhbiBDb3JiZXQNCj4g
PGNvcmJldEBsd24ubmV0Pg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47
IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9y
Zz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47DQo+IGxpbnV4LWkyY0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWRv
Y0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGh3bW9uOiBw
bWJ1czogQWRkIGx0YzQyODYgZHJpdmVyDQo+IA0KPiAgIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVh
c2UgYmUgYXdhcmUgdGhhdCB0aGlzIGVtYWlsIGlzIHNlbnQgYnkgYW4gZXh0ZXJuYWwNCj4gc2Vu
ZGVyLg0KPiANCj4gT24gMTEvNi8yMyAxOTowOCwgRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lu
biB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogR3Vl
bnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNr
DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEsIDIwMjMgOTo0NyBQTQ0KPiA+PiBUbzog
RGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lubiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29t
PjsNCj4gPj4gcGF0cmlja0BzdHdjeC54eXo7IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5j
b20+OyBKb25hdGhhbiBDb3JiZXQNCj4gPj4gPGNvcmJldEBsd24ubmV0Pg0KPiA+PiBDYzogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPj4g
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERvb2xleQ0KPiA+PiA8
Y29ub3IrZHRAa2VybmVsLm9yZz47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGxp
bnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+
ID4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5v
cmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGh3bW9uOiBwbWJ1czogQWRkIGx0
YzQyODYgZHJpdmVyDQo+ID4+DQo+ID4+ICAgIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVhc2UgYmUg
YXdhcmUgdGhhdCB0aGlzIGVtYWlsIGlzIHNlbnQgYnkgYW4NCj4gPj4gZXh0ZXJuYWwgc2VuZGVy
Lg0KPiA+Pg0KPiA+PiBPbiAxMC8zMC8yMyAyMzo0NiwgRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dp
d3lubiB3cm90ZToNCj4gPj4gWyAuLi4gXQ0KPiA+Pj4+DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAg
ICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoY2xpZW50LT5kZXYub2Zfbm9kZSwNCj4gPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNodW50LXJlc2lzdG9yLW1pY3Jv
LW9obXMiLA0KPiA+Pj4+ICZyc2Vuc2UpOw0KPiA+Pj4+PiArICAgICBpZiAocmV0IDwgMCkNCj4g
Pj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAg
IGlmIChyc2Vuc2UgPT0gMCkNCj4gPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAgICBpbmZvID0gJmx0YzQyODZfaW5mbzsNCj4gPj4+Pj4g
Kw0KPiA+Pj4+PiArICAgICAvKiBEZWZhdWx0IG9mIFZSQU5HRV9TRUxFQ1QgPSAxLCAxMDIuNFYg
Ki8NCj4gPj4+Pj4gKyAgICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJmNsaWVudC0+
ZGV2LA0KPiA+Pj4+ICJhZGksdnJhbmdlLXNlbGVjdC0yNXA2IikpIHsNCj4gPj4+Pg0KPiA+Pj4+
IFdoYXQgaWYgdGhlIGFkaSx2cmFuZ2Utc2VsZWN0LTI1cDYgcHJvcGVydHkgaXMgbm90IHByb3Zp
ZGVkLCBidXQNCj4gPj4+PiB0aGUgY2hpcCBpcyBwcm9ncmFtbWVkIGZvciB0aGlzIHJhbmdlID8N
Cj4gPj4+IFRoZSBiaW5kaW5nIGRvY3VtZW50IHRlbGxzIHByb2dyYW1tZXJzIGhvdyB0byBmaWxs
IHRoZSBkdHMuDQo+ID4+PiBUaHVzLCBwcm9ncmFtbWVycyBtdXN0IGZpbGwgdGhpcyBwcm9wZXJ0
eSBpZiB0aGVpciBzeXN0ZW0gaXMgMjUuNg0KPiA+Pj4gdm9sdHMgdm9sdGFnZQ0KPiA+PiByYW5n
ZS4NCj4gPj4+DQo+ID4+DQo+ID4+IFN1cmUsIGJ1dCB0aGVyZSBpcyBubyBlbHNlIGNhc2UsIG1l
YW5pbmcgVlJBTkdFX1NFTEVDVCBpcyB1bm1vZGlmaWVkDQo+ID4+IGluIHRoYXQgY2FzZS4gVGhl
cmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgdGhlIGNoaXAgaXMgaW4gaXRzIHBvd2VyLW9uIHN0YXRl
Lg0KPiA+DQo+ID4gVGhlIGVsc2UgY2FzZSBpcyBpbiB2MiBsdGM0Mjg2LmMgbGluZSAxMzMgSXQg
bWVhbnMgdGhhdCB0aGUgdm9sdGFnZQ0KPiA+IHJhbmdlIGZvciBwcm9ncmFtbWVyIGlzIDEwMi40
IHZvbHRzIHdoaWNoIGlzIGRlZmF1bHQgdmFsdWUsIHNvIGRyaXZlcg0KPiA+IGRvZXNuJ3QgbmVl
ZCB0byBkbyBhbnkgY2hhbmdlIGZvciBWUkFOR0VfU0VMRUNUIGJpdC4NCj4gDQo+IFRoZXJlIGlz
IG5vIGd1YXJhbnRlZSB0aGF0IHRoZSB2YWx1ZSB3YXNuJ3QgY2hhbmdlZCBiZWZvcmUgdGhlIGRy
aXZlciB3YXMNCj4gbG9hZGVkLg0KDQpXZSBzdGlsbCBjYW7igJl0IGdldCB5b3VyIHBvaW50Lg0K
Q291bGQgeW91IHRlbGwgdXMgYWJvdXQgeW91ciBjb25jZXJuIGhlcmU/DQpUaGFua3MuDQoNCj4g
DQo+IEd1ZW50ZXINCj4gDQo+ID4gQWRkaXRpb25hbGx5LCB3ZSBoYXZlIGNoZWNrZWQgdGhlIGJl
aGF2aW9yIG9mIFZSQU5HRV9TRUxFQ1QgYml0IHdpdGgNCj4gdmVuZG9yLg0KPiA+IEJlbG93IGlz
IHRoZSByZXBseSBmcm9tIHZlbmRvcjoNCj4gPiBbT3VyIHF1ZXN0aW9uXQ0KPiA+IElmIHdlIGNo
YW5nZSB0aGUgVlJBTkdFX1NFTEVDVCBiaXQgdmFsdWUgdG8gMCwgdGhlIHZhbHVlIHdvdWxkIHJl
dHVybiB0bw0KPiBkZWZhdWx0IGFmdGVyIHdlIHJlc3RhcnQgdGhpcyBkZXZpY2U/DQo+ID4gT3Ig
VlJBTkdFX1NFTEVDVCBiaXQgdmFsdWUgd291bGQgbmV2ZXIgY2hhbmdlIHV0aWwgc29tZW9uZSBj
aGFuZ2UgaXRzDQo+IHZhbHVlPw0KPiA+IFtBREkgcmVwbHldDQo+ID4gY2hpcCByZXNldCB3aWxs
IGdvIGJhY2sgdG8gZGVmYXVsdC4gVGhhbmtzLg0KPiA+DQo+ID4gVGh1cywgd2UgbXVzdCBvdmVy
d3JpdGUgdGhpcyBiaXQgaWYgdGhlIHVzZXIgZmlsbA0KPiA+IGFkaSx2cmFuZ2Utc2VsZWN0LTI1
cDYgaGVyZSB3aGVuZXZlciBkcml2ZXIgcHJvYmVzDQo+ID4NCj4gPj4NCj4gPj4gR3VlbnRlcg0K
PiA+DQoNCg==

