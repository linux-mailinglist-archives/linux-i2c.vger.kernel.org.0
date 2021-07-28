Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8F53D8B72
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 12:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhG1KL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 06:11:28 -0400
Received: from mail-bn8nam08on2057.outbound.protection.outlook.com ([40.107.100.57]:57559
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231282AbhG1KL1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Jul 2021 06:11:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqQQ5bS/w2msuQVgKcYdTWeK0+mrKXw5rQZxIDrCpzmHbRE+Ud7FpyjSm/ExlppOsd8QRLPUSMAqsR3AwZF19x+0cvXQIp6D7OaGFsK8NaAlUjn9+UjxeBORJutvRUvlICQA/IzBwt3lJa5KwtVjCzH/K4P1+OC60uF01F6W6Ycz1/QLSvViGkXssFFIp2PQzyLtJU03vWGVTBXECHu5NopbGIVztuT+SeZOkFZnLveEEFwWlx0KqPucJziEdvN+Z0V9Qa2jrY3IiW6cqgBgnOHppEu7sWzskhbH+HSE2LAzKM1wkFQkAdR81KDE4YlcqY75PcINcwxMCgaURgDQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ateiqx08mAePK+H3S+RAQEkMtcA/lZy8hNEKIBEpnYA=;
 b=LECze2P7rHpWhzhrVWA6Roa3nD1vSzwngAysmOOqcFhv45kxXd5RCVnKuAEmBuR5I2eAxKKDrOShjsUos/8xRn0pJFqWQeMRQoL5vME7XksZgu4jlgf0oPxgw3b9fAmBn6sJvveq//8jxD26dDnLxRAZXA5tQlyeV9nSe9IosUvmRD58XcfssIA89vie0xW+LpHbdsmXCIAYKykChW75xW13pMQH8/v73r7Q1RQFYXT2Wf0SVyWAjonui0VZTwMyoIqTqIY6BqIQ7e4zTzgROOe+hIV7x7yrleB/JHKzYxF4KZszIvsOyVy8UW4DqwojLCobPHevMnns341NVg0Wug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ateiqx08mAePK+H3S+RAQEkMtcA/lZy8hNEKIBEpnYA=;
 b=HMWgP102qvccjbpOEyuBjusk+grD25kvLMEJXR63vMG7lEr2rAZlBqxG30ExsyNWEQsdWZAp6n262HxDNxjUqI2Adc2zP1xRdTiNnTI4g2I0ENHM9CShppcyCAlJKDHgByqsK24qM9j5ZQtaiTaukoL8ju7Q+qVTH2h1Ke48vUs=
Received: from SN6PR02MB4093.namprd02.prod.outlook.com (2603:10b6:805:31::31)
 by SN6PR02MB4094.namprd02.prod.outlook.com (2603:10b6:805:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:11:22 +0000
Received: from SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601]) by SN6PR02MB4093.namprd02.prod.outlook.com
 ([fe80::c10a:fa45:9f2d:7601%6]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 10:11:22 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>, Michal Simek <michals@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>
Subject: RE: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Topic: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Index: AQHXanX+JNOMVW+1VkKFPhgte5uemqspB/+AgBzauQCABE5f4IAAidyAgADKNnCAAQaWAIAD8YkAgATtowCAAu7oQA==
Date:   Wed, 28 Jul 2021 10:11:22 +0000
Message-ID: <SN6PR02MB4093ACD6E6A349BA9740ABB9CAEA9@SN6PR02MB4093.namprd02.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
 <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
 <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
 <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
 <SN6PR02MB4093E219E0BCE2C3CBCE472CCAE89@SN6PR02MB4093.namprd02.prod.outlook.com>
 <5d49b316-6fcd-e677-578e-64b0ab5520ab@denx.de>
In-Reply-To: <5d49b316-6fcd-e677-578e-64b0ab5520ab@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e98caa68-6a6c-42db-07cc-08d951b00d33
x-ms-traffictypediagnostic: SN6PR02MB4094:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4094F886503B8FFA3DA750A3CAEA9@SN6PR02MB4094.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D5w1IAp0LEzDQ+rvPSuBpxEkQMddVbQFTb2Zp8Mhf4jKOTxDRPXLUQzTCtSBJtlk9yk9ztOpJWNF+PhT6/SHhp/DT8GF5mKYcFpTzj+S2Rq4FtPg4p7+UKkloeEOr3O+WIPW1tTlwFoHAmnZaTC72TAWUYDegYe1UrxtrlzXP+oH3Hqx0FRCkI5ZNR9t+Xk1gLn1QHp8+iV/REiG+Tg2JEJvTYN6J9T+TkY/caNdGeYffX8OETUlTILNabt0piqX7MnJJWVmZeGDLiYkgutYcENzSYNIFbEsxci6F8Cy30i5knfbAmKrieYFEVHU8QkaOEkck9EbrHrCWArJtSjPYcjpMthfqj7IxKNfOZTJBCaCvHEtbtcWe5ufGfPXrNzfB63r7D7oSEW2b8JB1J33eCXeMQquBTGjfKXxa2G7SFuOimfk9sLIZZidN1WtJGNuWoJ8vC6RtzgLyZtT0ZGgRTtKjeSFkgpyF0x5AlbGITPA6BQCxuLuYI7ExTSD2pAPROaCZsDyswNX+EHqEGw4VqFRD1Y245ZE52bTgxOvVA2CACe1Pi7CvVp2i8fNVoK26zDPh7lacT2Bru1M7d0HdZLv4uaz/G7Kozty3BKKyGykvfPXl70L2dyqKmUZtBZeZwUdDlzHO6/pkwkLLLs/ddth6mXz80nnm3YHjIBoS+96GzNCCdc+OfKs7aDjuHo5Z0ZgM8ptjT3hdcKuAfho6PqHPXoZfKwBS3+gtXQQ0S3qh7V8AfyWmEuPxsZ/iGgG/ECanki77ilCAt81eYMhMq+4GfaceGiOwTXCmPNNIGQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4093.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(122000001)(186003)(33656002)(38100700002)(5660300002)(54906003)(8676002)(4326008)(966005)(110136005)(6506007)(66446008)(26005)(7696005)(86362001)(53546011)(66476007)(9686003)(316002)(64756008)(76116006)(55016002)(71200400001)(66556008)(52536014)(66946007)(2906002)(83380400001)(478600001)(8936002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZreExoOEc5RmJjUVFkR01XY1BSS1pKSDh5a0gxcHhwaE1PZUNBclh6Z2FS?=
 =?utf-8?B?OE5wMWZERFFQdEtKTU9NNWlqVmtDeDk0b2ZNaFM5UFJHYWlXeWszYXNIYkVP?=
 =?utf-8?B?WTNHcmxJaG9vVVoyaVo3UENZZkJXejRQMS9FN1ZpMWw4Sk41TG1jTDBiSDhD?=
 =?utf-8?B?M0xpOE9WRGR0cnB5Y3JJMEdyd1YxVUZLUVFMaHhhbzBMT3R4UTZta3ZSWGRi?=
 =?utf-8?B?WUhmS0c5T3lLVytFblZFYTlqVkVKM216a2NrRng1ajhmR3B5SlhsRDBHaloy?=
 =?utf-8?B?Q2xZK3BrVnFuNVFxRlRPeWxOY0ptQ3FxYjNGQWZCVWpqU0E5SGozcVQ5c2pJ?=
 =?utf-8?B?K0JpV0hrcllyMkhtSXY4S1p6ZGNXNkdJKytnbkJtMkNSajg1SjJPRyt1Ty8v?=
 =?utf-8?B?dTJ5M3FaUXlNSGVVSGdmcGgwcTRKdnBFWG9FWW04QUltaXpqU2s0Q08xamsz?=
 =?utf-8?B?NjJ6YmNwOUlhTGJtZGdvam1YT1V3bktzc1VrSjJiZ1BRNnJHZnZvNkRoODQx?=
 =?utf-8?B?R21sOGJNSmlhck9HUU9RSTRzRkJMUmpQT3UvZTRxY3pNYnp5MEUvVnRKL2Nr?=
 =?utf-8?B?UUVNSlJUOVJFUHBNSVc2R1pySU8rZXFvcm1qNW50dmlZNGNKcEZEeG9QR0hu?=
 =?utf-8?B?dlV3VkxVSk9wcnBLSjZHclJDMzdYNG80VGp1RHBvUkcrY0hjTzF6aHNqZ3Ju?=
 =?utf-8?B?b3BNZW5pbXVMYnBlRzFZeFJjUEhnZ0RIekZPdm9GbXZFTENGczJ2YmF4ZUlQ?=
 =?utf-8?B?N1dBczVDTFV6ZVliQi84aGdQWm1raElJOEJsdXhzRVRrZ0JJSDd0K1JtSUZF?=
 =?utf-8?B?S0lFTHdtMVVXWlVjYTJZMEpvektMK0EydVJHVXk1NUlLUEMzeGFQK1RnVzhu?=
 =?utf-8?B?MGQ0MEdTVVVQUFZrZWUzM1A5ekUydHYzOU5XTHJrK3dPOXZwTWlMSXJsSjRL?=
 =?utf-8?B?WEpnYTZHb0QxODhaYWtVUzdPWDN6RlhqZ2ZyVG5lY1NiaDhsTjl3ZTJrd21W?=
 =?utf-8?B?KzNXeTJTQy9BWHFPMlQvNkM5TWcwcERRKzcrVEUwc2VFcmU1NFBBVmNWZzE5?=
 =?utf-8?B?NXRSQkYzL25mUHN3eXEwc1VqeUdjNEp4aXNUSW9ybUZCQnhYK3dKcGV4VWxH?=
 =?utf-8?B?eEZQdEIrc2t1NnVyckpUaGE3c0tpQkNTbGxIY1hMaDk1a1FDbTltM2ZBNFJI?=
 =?utf-8?B?UXQ5NjljeUdMZkRqbmt6MXRPd2xiem5DWFQvRlQ4Z2N2NDc5aUNTQ2JHbnFF?=
 =?utf-8?B?OG5FQnhPTEY3Z0Q4VzdSTVUrc0pSRUw0anBmNjA1U0Z0cU0rRUlrQkxLb09G?=
 =?utf-8?B?Q2xaWEF4NVVNM3VKaUR0d2IvcEk5VEQvN1ljN2dVMzU4ODRNTkVhRmdteFI1?=
 =?utf-8?B?Z2tGVG03UzJrZUpRbVREN1RibHVhbTRvRjZYc0RxTGdzc2ZLUnMrVEJwTnRp?=
 =?utf-8?B?Wk5VSG1CSytPa1Y3TVJ5Q3BPWlpaQjk2RUhLWHJoUjljVkt1NGh4NEdmczZa?=
 =?utf-8?B?U05tbEJWbWJ2NjNuTWlQUlJERll1NGdmV3Z4b1FUVno3YWJ2ZGVUNUY4YXlw?=
 =?utf-8?B?d0RZWmhValByOTdWWE1TbjdUM0kxREYrQklia2NMRmZpTmMxM3gyMXRaQTI4?=
 =?utf-8?B?ZHkyRlVSMTJMSWc3Ry90SENIUys0MVl2NGdCTGR5NlgyU2llL3p6aGNPZmYr?=
 =?utf-8?B?WGNLOG5iaGMxTlhLT2huaGQzYjZKODVOL1YrVmhzcUM4ZHdVZlBtNitMNnZv?=
 =?utf-8?Q?nb+zMACtnpJx3PMIepWRM1q3OniaYQqpNbeiA/y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4093.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98caa68-6a6c-42db-07cc-08d951b00d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 10:11:22.5478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ys7OiISOm5APi2IsY8FUuWTQSSemKlx2rvTYsvBDmtBxs6b49hn/TdGZ5PpG2Fws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4094
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAyNiwgMjAyMSA2OjQzIFBNDQo+IFRv
OiBSYXZpdGVqYSBOYXJheWFuYW0gPHJuYUB4aWxpbnguY29tPjsgTWljaGFsIFNpbWVrDQo+IDxt
aWNoYWxzQHhpbGlueC5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGdpdA0KPiA8Z2l0QHhpbGlueC5jb20+OyBqb2VAcGVyY2hlcy5jb20NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMC8xMF0gaTJjOiB4aWljOiBBZGQgZmVhdHVyZXMsIGJ1ZyBmaXhl
cy4NCj4gDQo+IE9uIDcvMjYvMjEgNzoyNiBBTSwgUmF2aXRlamEgTmFyYXlhbmFtIHdyb3RlOg0K
PiANCj4gSGksDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+Pj4gSSBoYXZlIHRlc3RlZCB0aGlzIGFn
YWluIG9uIG91ciBib2FyZHMgd2l0aCBlZXByb20gYW5kIG90aGVyDQo+ID4+Pj4+IHNlbnNvcnMs
IHRoaXMNCj4gPj4+PiBpcyB3b3JraW5nIGZpbmUgZm9yIHVzLg0KPiA+Pj4+DQo+ID4+Pj4gQ2Fu
IHlvdSBzaGFyZSBkZXRhaWxzIG9mIGhvdyB0aG9zZSB0ZXN0cyB3ZXJlIHBlcmZvcm1lZCA/DQo+
ID4+Pg0KPiA+Pj4gU3RyZXNzIHRlc3QgLSAxOg0KPiA+Pj4gSGVhdnkgZXRoZXJuZXQgdHJhZmZp
YyBydW5uaW5nIGluIHRoZSBiYWNrZ3JvdW5kLg0KPiA+Pj4gSTJjIGNvbW1hbmRzIHNjcmlwdCAo
bGlrZSBiZWxvdykgcnVubmluZy4gV2UgY2FuIHNlZSB2aXNpYmxlIHN0dXR0ZXINCj4gPj4+IGlu
IHRoZQ0KPiA+PiBvdXRwdXQgYXMgZXhwZWN0ZWQsIGJ1dCBub3RoaW5nIGZhaWxlZC4NCj4gPj4+
DQo+ID4+PiBpPTANCj4gPj4+IHdoaWxlIFsgMSBdDQo+ID4+PiBkbw0KPiA+Pj4gCQlpMmN0cmFu
c2ZlciAteSAtZiAyIHcxQDBYNTQgMFgwMCByMzFAMFg1NA0KPiA+Pj4gCQlpMmN0cmFuc2ZlciAt
eSAtZiAyIHcxQDBYNTQgMFgwMCByMzJAMFg1NA0KPiA+Pj4gCQlpMmN0cmFuc2ZlciAteSAtZiAy
IHcxQDBYNTQgMFgwMCByMjU1QDBYNTQNCj4gPj4+IAkJaTJjdHJhbnNmZXIgLXkgLWYgMiB3MUAw
WDU0IDBYMDAgcjI3M0AwWDU0DQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aTJjdHJhbnNmZXIgLXkgLWYgMiB3MUAwWDU0IDBYMDANCj4gPj4+IHIxQDBYNTQNCj4gPj4NCj4g
Pj4gQ291bGQgaXQgYmUgdGhhdCB5b3UgbmV2ZXIgc2VlIHRoZSBwcm9ibGVtIGJlY2F1c2UgeW91
IGFsd2F5cyB0YWxrIHRvDQo+ID4+IG9uZSBzaW5nbGUgZGV2aWNlID8NCj4gPg0KPiA+IFRoZXJl
IGFyZSB0cmFuc2ZlcnMgdG8gb3RoZXIgZGV2aWNlcyBhcyB3ZWxsLg0KPiANCj4gVGhlIGFib3Zl
IHRlc3Qgb25seSBhY2Nlc3NlcyBkZXZpY2UgYXQgYWRkcmVzcyAweDU0LCByaWdodCA/DQoNCkFi
b3ZlIGNvZGUgaXMganVzdCBvbmUgcGFydC4NCldlIGFyZSBkb2luZyByZWFkL3dyaXRlcyB0byBh
bGwgZGV2aWNlcyBwcmVzZW50IG9uIHRoaXMgYm9hcmQgaHR0cHM6Ly93d3cueGlsaW54LmNvbS9z
dXBwb3J0L2RvY3VtZW50YXRpb24vYm9hcmRzX2FuZF9raXRzL3pjdTEwMi91ZzExODItemN1MTAy
LWV2YWwtYmQucGRmIA0KDQo+IA0KPiA+IE91ciBib2FyZCBoYXMgbXVsdGlwbGUgcG93ZXIgbW9u
aXRvcnMsIGVlcHJvbSBhbmQgb3RoZXIgbWlzYyBkZXZpY2VzDQo+ID4gdGhhdCBhcmUgYWNjZXNz
ZWQgdGhyb3VnaCB0aGUgc2FtZSBkcml2ZXIgYW5kIGFyZSB3b3JraW5nIGZpbmUuDQo+IA0KPiBU
aGF0IGRvZXMgbm90IHNlZW0gdG8gYmUgd2hhdCB0aGUgdGVzdCBhYm92ZSBkb2VzIC4NCj4gDQo+
ID4+IERvIHlvdSBhbHNvIHRlc3Qgd3JpdGVzIHdoaWNoIGFyZSBub3QgMSBieXRlIGxvbmcgPw0K
PiA+Pg0KPiA+DQo+ID4gWWVzLCBsaWtlIGZvciBlZXByb20gMSBwYWdlICgxNiBieXRlcykgIGlz
IHdyaXR0ZW4uDQo+IA0KPiBJIHN1c3BlY3QgdGhlIGF0bWVsIG14dCBkb2VzIG11Y2ggbG9uZ2Vy
IHdyaXRlcywgdHJ5IDI1NSBieXRlcyBvciBzby4NCg0KT2ssIEkgd2lsbCBkbyBsb25nZXIgd3Jp
dGVzIChpbiB0aGUgcmFuZ2Ugb2YgMjU1KSBvbiBzdXBwb3J0ZWQgc2xhdmUgZGV2aWNlcy4NCg0K
PiANCj4gPj4+ICAgICAgICAgICBpPSQoZXhwciAkaSArIDEpDQo+ID4+PiAgICAgICAgICAgZWNo
byAiJGkiDQo+ID4+PiBkb25lDQo+ID4+Pg0KPiA+Pj4gU3RyZXNzIHRlc3QgLSAyOg0KPiA+Pj4g
VHdvIGkyYyBzY3JpcHRzIHJ1bm5pbmcgaW4gcGFyYWxsZWwgd2l0aCBjb21tYW5kcyBhcyBzaG93
biBhYm92ZQ0KPiA+Pj4gd2l0aA0KPiA+PiBkaWZmZXJlbnQgYnVzIG51bWJlcnMgKGFzIGEgcmVz
dWx0IG9mIG11eCksIGJ1dCBnb2luZyBpbnRvIHNhbWUgWElJQw0KPiBhZGFwdGVyLg0KPiA+Pj4g
VGhpcyBpcyBhbHNvIHdvcmtpbmcgZmluZS4NCj4gPj4NCj4gPj4gQ291bGQgaXQgYmUgdGhlIGky
Yy1kZXYgc2VyaWFsaXplcyBlYWNoIG9mIHRob3NlIHRyYW5zZmVycyAsIHNvIG5vDQo+ID4+IHJh
Y2UgY2FuIGJlIHRyaWdnZXJlZCA/DQo+ID4+DQo+ID4NCj4gPiBZZXMsIHRoYXQgaXMgdHJ1ZSBi
ZWNhdXNlIGFsbCBvdXIgdGVzdHMgYXJlIGdvaW5nIHRocm91Z2ggdGhlIGkyYy1jb3JlDQo+ID4g
b25seSBhbmQgdGhlcmUgaXMgYSBsb2NrIGF0IGFkYXB0ZXIgbGV2ZWwgaW4gdGhlIGNvcmUuDQo+
ID4gSXQgaGFzIHRvIGJlIHJlcHJvZHVjaWJsZSB0aHJvdWdoIHRoZSBpMmMgc3RhbmRhcmQgaW50
ZXJmYWNlLCB3aGljaCBpcw0KPiA+IG5vdCBoYXBwZW5pbmcgYXQgb3VyIHNldHVwLg0KPiA+DQo+
ID4gSSBjYW4gdGFrZSB5b3VyIHBhdGNoZXMgdGhhdCBhcmUgdGFyZ2V0ZWQgZm9yIHRoaXMgaXNz
dWUsIHJlYmFzZSwgdGVzdA0KPiA+IGFuZCBzZW5kIHRoZW0uDQo+IA0KPiBJIHRoaW5rIHlvdSBh
bmQgTWljaGFsIHRhbGtlZCBhYm91dCBnZXR0aW5nIHRoZSBhdG1lbCBteHQgdG91Y2hzY3JlZW4s
IHNvDQo+IHlvdSBjYW4gdGVzdCB0aGF0IHlvdXJzZWxmIGFzIHdlbGwuDQoNClllcywgdGhhdCBp
cyB0aGUgcGxhbiwgd2UgYXJlIHRyeWluZyB0byBnZXQgdGhlIHBhcnQuIE9ubHkgcHJvYmxlbSBp
cyBpdCBpcyBzdWJqZWN0IHRvDQphdmFpbGFiaWxpdHkgYW5kIG1heSB0YWtlIG1vcmUgdGltZSB0
byBnZXQgaXQgZGVsaXZlcmVkIHRvIG91ciBwbGFjZS4NCg0KUmVnYXJkcywNClJhdml0ZWphIE4N
Cg0K
