Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00B738BF22
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhEUGPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:15:41 -0400
Received: from mail-eopbgr10041.outbound.protection.outlook.com ([40.107.1.41]:2694
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230319AbhEUGPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:15:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V58yGFN8bNoIXE79ipuqPu89je+a7oKQvilEl6eVG8rKc4vuEe021GlRkenvM4AB1MuorbeWIdiNDZzzEGTJwelQuIcMvzcdphi3ziAVN2SzpLe9ATEuL27i8ky7o2tMBYjlt0QEjugyxKioOwCq/wWS0Ejd6avuAKyrrpphtCYeAAUxigathSGZTQyljp3MigjUeBMze8b08eF0im+hQL+qCRxZzYZZodcLBAXPRe01g4De0pHcjTJpcKkdAzyDUuF2eqvqbs1YjCFvk1R9+1iDLVuMw3L09nxYukCo53vqpNL3Fjy15on5FD3BN3ysrQ/UROzY2F+/pVIt0l8kNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw5uqVpqkLCh42wGjEPyWL3X4e+hh7jQ6qIs0Gpsx8g=;
 b=e0uP1YlPUicjl2e8kN9nbj0ugjU6zDXZVqwuQ3UhiNgW8T4RulaIh7Ho2Iz2PLfQk95eJHJASh+Lz4QHQynqkE2rqhGEpqMGT9rT2Z1aRjzt0cXP1QmRw6UQhM/6PeS91aR1/Onkt9IfQQoouwiqB1rxLGpzt6HygqX9nAyca5ScVqMgVsBxBBCfcGzXZG8b2JbKiRgaNvc4OG+SJTiCQTR20SsOZixmgtqfImyz06+ZokaLUSByPKVvhsKV8LJwZUb1fQSRjW2mh8V348WWDe+wtIJRxQlTZS05cLBi8zIXXmJf6ucNextk9Tu3OJv88ED8IuJi1ilGYzbLEK76wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw5uqVpqkLCh42wGjEPyWL3X4e+hh7jQ6qIs0Gpsx8g=;
 b=hI38/GtNKq14b6Ih7pJdLtu5Vd8wgdbzcvePwElQ5gh82WnDV52kZg0s78Mf1qhrdZo28aIhy0/P4oDGrQI8EJvuqWsYuG9rCTaNGw0uNVK5cXGtLVljrixPPkiFqQkvdZR1H3qhG17F8z6Ha90Vf8OnMdTHxPv7w7aP/dPM8xY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 06:14:11 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:14:11 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 02/18] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Topic: [PATCH V2 02/18] i2c: imx-lpi2c: add ipg clk for lpi2c driver
Thread-Index: AQHXKticx0qJ5yaS/k2HkkC/0NtXCartubDA
Date:   Fri, 21 May 2021 06:14:11 +0000
Message-ID: <AM6PR04MB496646B173420B26DD3D8D8380299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-3-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-3-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1f12a34-e909-46d6-b640-08d91c1fa6ba
x-ms-traffictypediagnostic: AM7PR04MB7062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB70621EFBC1403B0A6966F30280299@AM7PR04MB7062.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6PK0I9knT6C2OiqhRuP1h3x7vV3ygZu8xUaXU9E8hk9226rZ2JwPdRN2bcmEt25Y024j+dSfXwsBCEW/RA1n1ide2Ijxg751pOFShTtGpFniaqyuLqpVZi4BpKr03OHyNz9W5uEQj5NAjCK2UP7PsDPwKf6n7TDMQNAHqUFM9fzXMNuhYZd4eISxRicOnO4D2TGZKMEjhVrTMRkD3+Hlx2sNtISGyZzRrvQEnphy7y9TUEXJasTZax+j/JBHlZezRPedLhCPLHasxEKbphe2B2aBBkKE1IBGOrd+ZrU1DFe7flV88iAgRHWx6l/9p1DPQo6s7FW07xox1r/L6XqBo9P9Ou0iqM6d1AvyXCeYPr1vz7MKKxuLjqX1/ZNijLnfRI5nFtmmoyj+Hafo/wB8Cck5yTkz4MWkmvh+zE6ZU2vSdHNZf0KAw5TiFXGBcw1ygWjHJvaoaUlWK85mqTj2lJQJcZlCyKlHNKP55AE2srs8PapNj5K6vVqPCmDfx2G6dSQ4CkNzhP2ij3bU4QSRTXgQn4F95ycHshUpNOmWh6bhim0PKjVQqzT8ciAL4TyaMHErQRnlHNapbbqD7BPOrXQD4SHSMXg1dIT6bJsplEg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(66946007)(33656002)(66476007)(76116006)(55016002)(66446008)(64756008)(186003)(71200400001)(2906002)(66556008)(44832011)(6506007)(110136005)(5660300002)(122000001)(8676002)(9686003)(52536014)(38100700002)(83380400001)(8936002)(478600001)(4326008)(7696005)(26005)(54906003)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R2gycng3Q0N1RWYrS0JZNUJIdDZRbExOOXZYUXpSa2JzY1liTS9DaGFTOWxj?=
 =?utf-8?B?UjlyWVgxV1h0Z2NyV2Q1bTRCSi9ZUndqTkFlS1JqaGxseml1UWM1MlltTFZX?=
 =?utf-8?B?RTZyZ0s2L2Z5aVUzZ2x2VVU4b1BueFZQdVBiT3NZdlZEUXBKRDBqamg4b1Rp?=
 =?utf-8?B?NDJpaXNWU016eEQ3a1VVR21SbFc0cWVKVmhOM2VrR0JvYlVramdINHB0Vjh4?=
 =?utf-8?B?UUVOd1YrTWtOUUN5ZFZYTVNFdVAxUkJVM1FUSEFHbW9nN0VrK3ZHQ2tCaElw?=
 =?utf-8?B?MnNYM1pRYmIrS2xteGErd3NZZXlvbVpqZFVqYTQ2Q2tjWFpZdm9qNVd6d1hi?=
 =?utf-8?B?ejl0VGJGL2JIbzd0MG02eEJwMklnaHRwbGs3Qm9JekJuUnhXbDBBLzRxdUNt?=
 =?utf-8?B?THcrQ3RMN0xicnJ0WHlPK3BTZUdTc0l6aW40aTVjeHM2ZUhGOVVibkI0aXRE?=
 =?utf-8?B?OUVSMDExS1pKZ1huNHNNSFRwQWVWMGFVd3JSVUpNNVRBWmFTcHU1VFJoWDFt?=
 =?utf-8?B?Q3dPMG9NNWpSekZGSjErbC93dHgyTlRhaHlySC9iWGJkdksyQUgrUUJwNmpV?=
 =?utf-8?B?OGxxUDZ4aEVkMVFoWjFJUU1ha3lEWXBrQkN3bXJtMkltdVhPbSthTVM4ZExE?=
 =?utf-8?B?b3FoR0JDOElHRTV6dzZiSzlnS3dwaTN1Um1BUWNpcUdyU0xxYWxkb3l6d3Ns?=
 =?utf-8?B?RHM2eGVKR1dzYW42bFkyRlpVNkt1ZTJjRmE1UHY1OXg3ZWVoSVFBbmRrbXl2?=
 =?utf-8?B?WkFYbGxqQ1pKWjN2MGJ3Vk1SV20vYlVGMUUwN2Q3QkFnSFM0QXlZUHNRZTVW?=
 =?utf-8?B?STlNRGhlNGs3Uk0rZmtKMXQ4dGFHQkc3SDhsdGF6YU1qQlVZZHlEM1hFbGZi?=
 =?utf-8?B?NHlORXcwcjFHUnpsUE1wWFlmV0xTZ1RwMlludWxzaVpWREFDM3ZQMnhMSkt1?=
 =?utf-8?B?RWhXdTJxME9FbVByRHBocytHZm1La3dDWHZmZFhZU2FtdDhRMFQyaFBIRy9E?=
 =?utf-8?B?dS96ZDBkYWZBMkhMR1BVUmZ4NDk4eE5iOTg5NFRxVDF5OGJ4OTdpVThzZngy?=
 =?utf-8?B?NWNSdkdKUTBPZjlJNnlZd1dsbkZoeHJubHkrbGpNUHEzWWRpdUZEQXlDS2xi?=
 =?utf-8?B?NlVINEtsU1ZhTkNWTkpSZzVzamJZMkxuQ0ZlLzdiN1hnMmxxSmg0TWNDTFVP?=
 =?utf-8?B?MlFJSjNMZ05oMnBqVkZ1bGFhakNrM3V5bCt4cTZKSU51UlBoWnZTOHU2NGtE?=
 =?utf-8?B?VVNCRTYycC9tdGg5eENrQ3lPVFFBUGtJeDhQSXZRcXFzK0dpc2RhRkVsTitk?=
 =?utf-8?B?S0t1Ynlsd3RDcnJKOTk3cTNVR2FPbGpxR1I5QWZXTGFwejEra0dlajl1b3NF?=
 =?utf-8?B?eWI4a3dNR2NZLzRJd1gzSndHNGlKajdyZ1l3RGttY2dsaktuVkdDTVVRTEJH?=
 =?utf-8?B?dVdhVFJ2cEJWYjBqN0VDNWRIYitCZjlzTDNwUlNFQ3RxWDQwWjV0QU0yTkJl?=
 =?utf-8?B?S1VlNmFJWm1wSFR4SHVncEdaNVFtWGlOQ2l2WE5lYVVNcGRKRjl6K2RSdWZ0?=
 =?utf-8?B?dTFteElGYjRPcnJYblpxUjFTdzV1dWlHTy8zb0RhQ1IxY3J2Sy92ZEF2ckwr?=
 =?utf-8?B?ZTV5WnllZHh0aG5xc2ZLN2JYbDh1Q3RManQ1NXJ3Q3kzZVY4L1ZwbEtETnpQ?=
 =?utf-8?B?UHhkZncyL2gzNi83MmYrTk9FKzdJWm94d0szazFqRW1lVnRML3lPSWRnOEpz?=
 =?utf-8?Q?KRt+H4kSLOBdgZXIR7zfKU8ojeFniqd9W/QjSPD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f12a34-e909-46d6-b640-08d91c1fa6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:14:11.5804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PfjuL0rlP5jl9YyHP2ttQem1oCjm94FrxmNyKzPttdXlo2cvy1NZYicm7c0Egby/7YAutKGrUD/RKptBAa5Dbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gVGhlIGxwaTJjIElQIG5lZWRzIHR3byBj
bGtzOiBpcGcgY2xrIGFuZCBwZXIgY2xrLiBUaGUgb2xkIGxwaTJjIGRyaXZlciBtaXNzZWQgaXBn
DQo+IGNsay4gVGhpcyBwYXRjaCBhZGRzIGlwZyBjbGsgZm9yIGxwaTJjIGRyaXZlci4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEdhbyBQYW4gPHBhbmR5Lmdhb0BueHAuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IEFja2VkLWJ5OiBGdWdh
bmcgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCg0KWW91IGNhbiBkcm9wIHRoZSBvcmlnaW5h
bCBBY2sgb3Igc2lnbmVkLW9mZiBpZiB0aGVyZSdyZSBzaWduaWZpY2FudCBjaGFuZ2VzDQoNCkJU
VywgcGxlYXNlIG1vdmUgdGhlIGJpbmRpbmcgZG9jIGNoYW5nZSBiZWZvcmUgdGhpcyBwYXRjaC4N
Cg0KPiAtLS0NCj4gVjIgY2hhbmdlczoNCj4gIC0gTWVyZ2UgdHdvIGNsb2NrcycgcHJlcGFyZSBm
dW50aW9ucyB0byBscGkyY19pbXhfY2xvY2tzX3ByZXBhcmUoKS4NCj4gLS0tDQo+ICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMu
Yw0KPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gaW5kZXggYmJmNDRh
Yzk1MDIxLi44OWI3YjA3OTVmNTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtaW14LWxwaTJjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMu
Yw0KPiBAQCAtOTQsNyArOTQsOCBAQCBlbnVtIGxwaTJjX2lteF9waW5jZmcgew0KPiANCj4gIHN0
cnVjdCBscGkyY19pbXhfc3RydWN0IHsNCj4gIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIJYWRhcHRlcjsN
Cj4gLQlzdHJ1Y3QgY2xrCQkqY2xrOw0KPiArCXN0cnVjdCBjbGsJCSpjbGtfcGVyOw0KPiArCXN0
cnVjdCBjbGsJCSpjbGtfaXBnOw0KPiAgCXZvaWQgX19pb21lbQkJKmJhc2U7DQo+ICAJX191OAkJ
CSpyeF9idWY7DQo+ICAJX191OAkJCSp0eF9idWY7DQo+IEBAIC0yMDcsNyArMjA4LDcgQEAgc3Rh
dGljIGludCBscGkyY19pbXhfY29uZmlnKHN0cnVjdCBscGkyY19pbXhfc3RydWN0DQo+ICpscGky
Y19pbXgpDQo+IA0KPiAgCWxwaTJjX2lteF9zZXRfbW9kZShscGkyY19pbXgpOw0KPiANCj4gLQlj
bGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShscGkyY19pbXgtPmNsayk7DQo+ICsJY2xrX3JhdGUgPSBj
bGtfZ2V0X3JhdGUobHBpMmNfaW14LT5jbGtfcGVyKTsNCj4gIAlpZiAobHBpMmNfaW14LT5tb2Rl
ID09IEhTIHx8IGxwaTJjX2lteC0+bW9kZSA9PSBVTFRSQV9GQVNUKQ0KPiAgCQlmaWx0ID0gMDsN
Cj4gIAllbHNlDQo+IEBAIC01MzgsNiArNTM5LDM0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGxwaTJjX2lteF9vZl9tYXRjaFtdDQo+ID0geyAgfTsgIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIGxwaTJjX2lteF9vZl9tYXRjaCk7DQo+IA0KPiArc3RhdGljIGludCBscGkyY19p
bXhfY2xvY2tzX3ByZXBhcmUoc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteCkNCj4g
K3sNCj4gKwlpbnQgcmV0ID0gMDsNCg0KVW5uZWNlc3NhcnkgaW5pdGlhbGl6YXRpb24NCg0KPiAr
DQo+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGxwaTJjX2lteC0+Y2xrX3Blcik7DQo+ICsJ
aWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGxwaTJjX2lteC0+YWRhcHRlci5kZXYucGFyZW50LA0K
PiArCQkJCSJjYW4ndCBlbmFibGUgSTJDIHBlciBjbG9jaywgcmV0PSVkXG4iLCByZXQpOw0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShs
cGkyY19pbXgtPmNsa19pcGcpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGxwaTJjX2lteC0+Y2xrX3Blcik7DQo+ICsJCWRldl9lcnIobHBpMmNfaW14LT5hZGFw
dGVyLmRldi5wYXJlbnQsDQo+ICsJCQkJImNhbid0IGVuYWJsZSBJMkMgaXBnIGNsb2NrLCByZXQ9
JWRcbiIsIHJldCk7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHJl
dDsNCg0KUmV0dXJuIDANCg0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBscGkyY19pbXhfY2xv
Y2tzX3VucHJlcGFyZShzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdA0KPiArKmxwaTJjX2lteCkgew0K
PiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShscGkyY19pbXgtPmNsa19pcGcpOw0KPiArCWNsa19k
aXNhYmxlX3VucHJlcGFyZShscGkyY19pbXgtPmNsa19wZXIpOw0KPiArfQ0KPiArDQo+ICBzdGF0
aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0K
PiAgCXN0cnVjdCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXg7DQo+IEBAIC01NjMsMTAgKzU5
MiwxNiBAQCBzdGF0aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
DQo+ICpwZGV2KQ0KPiAgCXN0cmxjcHkobHBpMmNfaW14LT5hZGFwdGVyLm5hbWUsIHBkZXYtPm5h
bWUsDQo+ICAJCXNpemVvZihscGkyY19pbXgtPmFkYXB0ZXIubmFtZSkpOw0KPiANCj4gLQlscGky
Y19pbXgtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCBOVUxMKTsNCj4gLQlpZiAoSVNf
RVJSKGxwaTJjX2lteC0+Y2xrKSkgew0KPiArCWxwaTJjX2lteC0+Y2xrX3BlciA9IGRldm1fY2xr
X2dldCgmcGRldi0+ZGV2LCAicGVyIik7DQo+ICsJaWYgKElTX0VSUihscGkyY19pbXgtPmNsa19w
ZXIpKSB7DQo+ICAJCWRldl9lcnIoJnBkZXYtPmRldiwgImNhbid0IGdldCBJMkMgcGVyaXBoZXJh
bCBjbG9ja1xuIik7DQo+IC0JCXJldHVybiBQVFJfRVJSKGxwaTJjX2lteC0+Y2xrKTsNCj4gKwkJ
cmV0dXJuIFBUUl9FUlIobHBpMmNfaW14LT5jbGtfcGVyKTsNCj4gKwl9DQoNCldpbGwgdGhpcyBw
YXRjaCBicmVhayBpbXg3dWxwIHdoaWNoIGRvZXNuJ3QgaGF2ZSBwZXIgY2xvY2s/DQoNCj4gKw0K
PiArCWxwaTJjX2lteC0+Y2xrX2lwZyA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiaXBnIik7
DQo+ICsJaWYgKElTX0VSUihscGkyY19pbXgtPmNsa19pcGcpKSB7DQo+ICsJCWRldl9lcnIoJnBk
ZXYtPmRldiwgImNhbid0IGdldCBJMkMgaXBnIGNsb2NrXG4iKTsNCj4gKwkJcmV0dXJuIFBUUl9F
UlIobHBpMmNfaW14LT5jbGtfaXBnKTsNCj4gIAl9DQo+IA0KPiAgCXJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLA0KPiBAQCAtNTg0LDExICs2MTksOSBAQCBzdGF0
aWMgaW50IGxwaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0K
PiAgCWkyY19zZXRfYWRhcGRhdGEoJmxwaTJjX2lteC0+YWRhcHRlciwgbHBpMmNfaW14KTsNCj4g
IAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBscGkyY19pbXgpOw0KPiANCj4gLQlyZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUobHBpMmNfaW14LT5jbGspOw0KPiAtCWlmIChyZXQpIHsNCj4gLQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiY2xrIGVuYWJsZSBmYWlsZWQgJWRcbiIsIHJldCk7DQo+ICsJ
cmV0ID0gbHBpMmNfaW14X2Nsb2Nrc19wcmVwYXJlKGxwaTJjX2lteCk7DQo+ICsJaWYgKHJldCkN
Cj4gIAkJcmV0dXJuIHJldDsNCj4gLQl9DQo+IA0KPiAgCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNw
ZW5kX2RlbGF5KCZwZGV2LT5kZXYsIEkyQ19QTV9USU1FT1VUKTsNCj4gIAlwbV9ydW50aW1lX3Vz
ZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsNCj4gQEAgLTYzNSw3ICs2NjgsNyBAQCBzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkDQo+IGxwaTJjX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpICB7DQo+ICAJc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiANCj4gLQljbGtfZGlzYWJsZV91bnByZXBhcmUobHBpMmNfaW14
LT5jbGspOw0KPiArCWxwaTJjX2lteF9jbG9ja3NfdW5wcmVwYXJlKGxwaTJjX2lteCk7DQo+ICAJ
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGV2KTsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+
IEBAIC02NDQsMTYgKzY3NywxMCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IGxwaTJj
X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpICBzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkDQo+IGxwaTJjX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgIHsNCj4g
IAlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14ID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+IC0JaW50IHJldDsNCj4gDQo+ICAJcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0
ZShkZXYpOw0KPiAtCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscGkyY19pbXgtPmNsayk7DQo+
IC0JaWYgKHJldCkgew0KPiAtCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgSTJDIGNs
b2NrLCByZXQ9JWRcbiIsIHJldCk7DQo+IC0JCXJldHVybiByZXQ7DQo+IC0JfQ0KPiANCj4gLQly
ZXR1cm4gMDsNCj4gKwlyZXR1cm4gbHBpMmNfaW14X2Nsb2Nrc19wcmVwYXJlKGxwaTJjX2lteCk7
DQo+ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGxwaTJjX3BtX29w
cyA9IHsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
