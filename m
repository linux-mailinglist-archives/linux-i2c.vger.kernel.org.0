Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF02145E7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 10:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfEFITa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 04:19:30 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:12597 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfEFIT3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 04:19:29 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,437,1549954800"; 
   d="scan'208";a="29222845"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 06 May 2019 01:19:16 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 6 May 2019 01:19:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBlhBobYIfYdbvDMBQaROIlc45WK9NdkdCcSbzWWgwM=;
 b=Jg3Phdk73lmsjNOMsUGnv1Q5lFU+PD0k4kb30dVkflBNdE7lWmlPr9WE3O0w2X6TLca2/LtOSQqrS4xW7UqqKlHR6v2BG2RDqiF6XME3e6wBac7/Z49+zE3P0xlwDyops0y3tQ+02lEPeMKRn+AD+CzonaaiQ64n7Ags5GoUhHM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0073.namprd11.prod.outlook.com (10.164.155.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Mon, 6 May 2019 08:19:01 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::e0e3:1d51:9e3e:6dc%3]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 08:19:01 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <raagjadav@gmail.com>, <Ludovic.Desroches@microchip.com>
CC:     <alexandre.belloni@bootlin.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: at91: handle TXRDY interrupt spam
Thread-Topic: [PATCH] i2c: at91: handle TXRDY interrupt spam
Thread-Index: AQHU+afGtB2DltHUaUutNg+MltWZ66ZS4JCAgADjRgCABCfeAIACOUyAgAOvEgA=
Date:   Mon, 6 May 2019 08:19:01 +0000
Message-ID: <408ff580-3633-f510-4223-50064f93024a@microchip.com>
References: <1556005008-6318-1-git-send-email-raagjadav@gmail.com>
 <20190429090005.f6ydghzu5n5yruav@M43218.corp.atmel.com>
 <20190429223332.GA3908@pc>
 <20190502140116.rim72idpgvq4h4vc@M43218.corp.atmel.com>
 <20190503235851.GA4242@pc>
In-Reply-To: <20190503235851.GA4242@pc>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0085.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::29) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190506111414120
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cec940af-5dc7-4b9b-555c-08d6d1fb7e62
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:DM5PR11MB0073;
x-ms-traffictypediagnostic: DM5PR11MB0073:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB007389977600C95281287B33E8300@DM5PR11MB0073.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(376002)(366004)(136003)(396003)(39860400002)(346002)(129404003)(199004)(189003)(14454004)(54906003)(53936002)(72206003)(110136005)(5660300002)(966005)(6306002)(6246003)(6512007)(256004)(14444005)(8936002)(6436002)(99286004)(76176011)(71200400001)(71190400001)(66066001)(52116002)(68736007)(31686004)(229853002)(478600001)(36756003)(6486002)(31696002)(8676002)(81156014)(81166006)(86362001)(6636002)(476003)(11346002)(2616005)(486006)(4326008)(446003)(3846002)(6116002)(2906002)(7736002)(305945005)(6506007)(73956011)(66476007)(66556008)(64756008)(66446008)(53546011)(186003)(26005)(316002)(25786009)(102836004)(386003)(66946007)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0073;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5mkIm/M7mX1VyrvPdi9ugSfWWXVc80FpDfBhXxAYIeb1LhQSStlrEAIdQ/bWU0X8aLLAXmcOLdBhAqJOQyI9O6RXcHyXj45NpZ/EHdg641PImjKhYmlLpVAv18lIdwsQZuYv+rz92l4BP4duhJrHYqb5RX2gT7Mi/pQczL+nrjpl4NWfHnrRc1Vxw02NFOyVP3NPR8UbiNroEK15GIb1POBVdwAGM35UG8+w2S8I2GWaG28RGZj4HDz9BGg/yBbW4RYpJQGZbyqSyMcAx8ZtGQ/MonFsOYxuiM8SFzFxKlLN4ogcSHLM3J4O6mzwXC1+0ae20BhM86yeA9CGOBWTGKlI6pO/gwHV+bGP2o96pvkvfvkuqXer6lh2aj9JUAzQsbsnSeBYUWjV80K+oOilSpVThfcMvAOaCXMsfDSOrkQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2241B9E8772E5F4287F8CB6B00D5A453@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cec940af-5dc7-4b9b-555c-08d6d1fb7e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 08:19:01.0436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
X-OriginatorOrg: microchip.com
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDA0LjA1LjIwMTkgMDI6NTgsIFJhYWcgSmFkYXYgd3JvdGU6DQoNCj4gT24gVGh1LCBN
YXkgMDIsIDIwMTkgYXQgMDQ6MDE6MTZQTSArMDIwMCwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6
DQo+PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAwNDowMzozMkFNICswNTMwLCBSYWFnIEphZGF2
IHdyb3RlOg0KPj4+IEV4dGVybmFsIEUtTWFpbA0KPj4+DQo+Pj4NCj4+PiBPbiBNb24sIEFwciAy
OSwgMjAxOSBhdCAxMTowMDowNUFNICswMjAwLCBMdWRvdmljIERlc3JvY2hlcyB3cm90ZToNCj4+
Pj4gSGVsbG8gUmFhZywNCj4+Pj4NCj4+Pj4gT24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDE6MDY6
NDhQTSArMDUzMCwgUmFhZyBKYWRhdiB3cm90ZToNCj4+Pj4+IEV4dGVybmFsIEUtTWFpbA0KPj4+
Pj4NCj4+Pj4+DQo+Pj4+PiBQZXJmb3JtaW5nIGkyYyB3cml0ZSBvcGVyYXRpb24gd2hpbGUgU0RB
IG9yIFNDTCBsaW5lIGlzIGhlbGQNCj4+Pj4+IG9yIGdyb3VuZGVkIGJ5IHNsYXZlIGRldmljZSwg
d2UgZ28gaW50byBpbmZpbml0ZSBhdDkxX3R3aV93cml0ZV9uZXh0X2J5dGUNCj4+Pj4+IGxvb3Ag
d2l0aCBUWFJEWSBpbnRlcnJ1cHQgc3BhbS4NCj4+Pj4NCj4+Pj4gU29ycnkgYnV0IEkgYW0gbm90
IHN1cmUgdG8gaGF2ZSB0aGUgZnVsbCBwaWN0dXJlLCB0aGUgY29udHJvbGxlciBpcyBpbg0KPj4+
PiBzbGF2ZSBvciBtYXN0ZXIgbW9kZT8NCj4+Pj4NCj4+Pj4gU1ZSRUFEIGlzIG9ubHkgdXNlZCBp
biBzbGF2ZSBtb2RlLiBXaGVuIFNWUkVBRCBpcyBzZXQsIGl0IG1lYW5zIHRoYXQgYSByZWFkDQo+
Pj4+IGFjY2VzcyBpcyBwZXJmb3JtZWQgYW5kIHlvdXIgaXNzdWUgY29uY2VybnMgdGhlIHdyaXRl
IG9wZXJhdGlvbi4NCj4+Pj4NCj4+Pj4gUmVnYXJkcw0KPj4+Pg0KPj4+PiBMdWRvdmljDQo+Pj4N
Cj4+PiBZZXMsIGV2ZW4gdGhvdWdoIHRoZSBkYXRhc2hlZXQgc3VnZ2VzdHMgdGhhdCBTVlJFQUQg
aXMgaXJyZWxldmFudCBpbiBtYXN0ZXIgbW9kZSwNCj4+PiBUWFJEWSBhbmQgU1ZSRUFEIGFyZSB0
aGUgb25seSBvbmVzIGJlaW5nIHNldCBpbiBzdGF0dXMgcmVnaXN0ZXIgdXBvbiByZXByb2R1Y2lu
ZyB0aGUgaXNzdWUuDQo+Pj4gQ291bGRuJ3QgdGhpbmsgb2YgYSBiZXR0ZXIgd2F5IHRvIGhhbmRs
ZSBzdWNoIHN0cmFuZ2UgYmVoYXZpb3VyLg0KPj4+IEFueSBzdWdnZXN0aW9ucyB3b3VsZCBiZSBh
cHByZWNpYXRlZC4NCj4+DQo+PiBJIGhhdmUgdGhlIGNvbmZpcm1hdGlvbiB0aGF0IHlvdSBjYW4n
dCByZWx5IG9uIHRoZSBTVlJFQUQgZmxhZyB3aGVuIGluDQo+PiBtYXN0ZXIgbW9kZS4gVGhpcyBm
bGFnIHNob3VsZCBhbHdheXMgaGF2ZSB0aGUgc2FtZSB2YWx1ZS4NCj4+DQo+PiBJIGFtIHRyeWlu
ZyB0byB1bmRlcnN0YW5kIHdoYXQgY291bGQgbGVhZCB0byB5b3VyIHNpdHVhdGlvbi4gQ2FuIHlv
dQ0KPj4gZ2l2ZSBtZSBtb3JlIGRldGFpbHMuIFdoYXQga2luZCBvZiBkZXZpY2UgaXQgaXM/IFdo
YXQgZG9lcyBsZWFkIHRvIHRoaXMNCj4+IHNpdHVhdGlvbj8gRG9lcyBpdCBoYXBwZW4gcmFuZG9t
bHkgb3Igbm90Pw0KPiANCj4gT25lIG9mIHRoZSBzYW1hNWQyIGJhc2VkIGJvYXJkIEkgd29ya2Vk
IG9uLCB3YXMgaGF2aW5nIHRyb3VibGUgY29tcGxldGUgaXRzIGJvb3QNCj4gYmVjYXVzZSBvZiBh
IGZhdWx0eSBpMmMgZGV2aWNlLCB3aGljaCB3YXMgcmFuZG9tbHkgaG9sZGluZyBkb3duIHRoZSBT
REEgbGluZQ0KPiBvbiBpMmMgd3JpdGUgb3BlcmF0aW9uLCBub3QgYWxsb3dpbmcgdGhlIGNvbnRy
b2xsZXIgdG8gY29tcGxldGUgaXRzIHRyYW5zbWlzc2lvbiwNCj4gY2F1c2luZyBhIG1hc3NpdmUg
VFhSRFkgaW50ZXJydXB0IHNwYW0sIHVsdGltYXRlbHkgaGFuZ2luZyB0aGUgcHJvY2Vzc29yLg0K
PiANCj4gQW5vdGhlciBzdHJhbmdlIG9ic2VydmF0aW9uIHdhcyB0aGF0IFNWUkVBRCB3YXMgYmVp
bmcgc2V0IGluIHRoZSBzdGF0dXMgcmVnaXN0ZXINCj4gYWxvbmcgd2l0aCBUWFJEWSwgZXZlcnkg
dGltZSBJIHJlcHJvZHVjZWQgdGhlIGlzc3VlLg0KPiBZb3UgY2FuIHJlcHJvZHVjZSBpdCBieSBz
aW1wbHkgZ3JvdW5kaW5nIHRoZSBTREEgbGluZSBhbmQgcGVyZm9ybWluZyBpMmMgd3JpdGUNCj4g
b24gdGhlIGJ1cy4NCj4gDQo+IE5vdGUgdGhhdCBOQUNLLCBMT0NLIG9yIFRYQ09NUCBhcmUgbmV2
ZXIgc2V0IGFzIHRoZSB0cmFuc21pc3Npb24gbmV2ZXIgY29tcGxldGVzLg0KPiBJJ20gbm90IHN1
cmUgd2h5IHNsYXZlIGJpdHMgYXJlIGJlaW5nIHNldCBpbiBtYXN0ZXIgbW9kZSwNCj4gYnV0IGl0
J3MgYmVlbiB3b3JraW5nIHJlbGlhYmx5IGZvciBtZS4NCj4gDQo+IFRoaXMgcGF0Y2ggZG9lc24n
dCByZWNvdmVyIHRoZSBTREEgbGluZS4gSXQganVzdCBwcmV2ZW50cyB0aGUgcHJvY2Vzc29yIGZy
b20NCj4gZ2V0dGluZyBoYW5nZWQgaW4gY2FzZSBvZiBpMmMgYnVzIGxvY2t1cC4NCg0KSGVsbG8s
DQoNCkkgaGF2ZSBub3RpY2VkIHRoZSBzYW1lIGhhbmdpbmcgYXQgc29tZSBwb2ludHMuLi4gSW4g
bXkgY2FzZSBpdCBpcyANCmJlY2F1c2Ugb2YgdGhpcyBwYXRjaDoNCg0KY29tbWl0IGU4ZjM5ZTlm
YzBlMGI3YmNlMjQ5MjJkYTkyNWFmODIwYmFjYjhlZjgNCkF1dGhvcjogRGF2aWQgRW5ncmFmIDxk
YXZpZC5lbmdyYWZAc3lzZ28uY29tPg0KRGF0ZTogICBUaHUgQXByIDI2IDExOjUzOjE0IDIwMTgg
KzAyMDANCg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmMgYi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuYw0KaW5kZXggYmZkMWZkZi4uM2YzZThiMyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5jDQorKysgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWF0OTEuYw0KQEAgLTUxOCw4ICs1MTgsMTYgQEAgc3RhdGljIGlycXJldHVy
bl90IGF0bWVsX3R3aV9pbnRlcnJ1cHQoaW50IGlycSwgDQp2b2lkICpkZXZfaWQpDQogICAgICAg
ICAgKiB0aGUgUlhSRFkgaW50ZXJydXB0IGZpcnN0IGluIG9yZGVyIHRvIG5vdCBrZWVwIGdhcmJh
Z2UgZGF0YSANCmluIHRoZQ0KICAgICAgICAgICogUmVjZWl2ZSBIb2xkaW5nIFJlZ2lzdGVyIGZv
ciB0aGUgbmV4dCB0cmFuc2Zlci4NCiAgICAgICAgICAqLw0KLSAgICAgICBpZiAoaXJxc3RhdHVz
ICYgQVQ5MV9UV0lfUlhSRFkpDQotICAgICAgICAgICAgICAgYXQ5MV90d2lfcmVhZF9uZXh0X2J5
dGUoZGV2KTsNCisgICAgICAgaWYgKGlycXN0YXR1cyAmIEFUOTFfVFdJX1JYUkRZKSB7DQorICAg
ICAgICAgICAgICAgLyoNCisgICAgICAgICAgICAgICAgKiBSZWFkIGFsbCBhdmFpbGFibGUgYnl0
ZXMgYXQgb25jZSBieSBwb2xsaW5nIFJYUkRZIA0KdXNhYmxlIHcvDQorICAgICAgICAgICAgICAg
ICogYW5kIHcvbyBGSUZPLiBXaXRoIEZJRk8gZW5hYmxlZCB3ZSBjb3VsZCBhbHNvIHJlYWQgDQpS
WEZMIGFuZA0KKyAgICAgICAgICAgICAgICAqIGF2b2lkIHBvbGxpbmcgUlhSRFkuDQorICAgICAg
ICAgICAgICAgICovDQorICAgICAgICAgICAgICAgZG8gew0KKyAgICAgICAgICAgICAgICAgICAg
ICAgYXQ5MV90d2lfcmVhZF9uZXh0X2J5dGUoZGV2KTsNCisgICAgICAgICAgICAgICB9IHdoaWxl
IChhdDkxX3R3aV9yZWFkKGRldiwgQVQ5MV9UV0lfU1IpICYgQVQ5MV9UV0lfUlhSRFkpOw0KKyAg
ICAgICB9DQoNCg0KSW4gbXkgb3BpbmlvbiBoYXZpbmcgYSBkby93aGlsZSB3aXRoIGFuIGV4aXQg
Y29uZGl0aW9uIHJlbHlpbmcgc29sZWx5IG9uIA0KYSBiaXQgcmVhZCBmcm9tIGhhcmR3YXJlIGlz
IHVuYWNjZXB0YWJsZSBpbiBJUlEgY29udGV4dCAtIGtlcm5lbCBjYW4gDQpoYW5nIGhlcmUuDQpB
IHRpbWVvdXQgd291bGQgYmUgYSBzb2x1dGlvbi4uLg0KDQpGb3IgbWUsIHJldmVydGluZyB0aGlz
IHBhdGNoIHNvbHZlcyBoYW5naW5nIGlzc3Vlcy4NCg0KSG9wZSB0aGlzIGhlbHBzLA0KDQpFdWdl
bg0KDQo+IA0KPiBDaGVlcnMsDQo+IFJhYWcNCj4gDQo+Pg0KPj4gUmVnYXJkcw0KPj4NCj4+IEx1
ZG92aWMNCj4+DQo+Pj4NCj4+PiBDaGVlcnMsDQo+Pj4gUmFhZw0KPj4+DQo+Pj4+DQo+Pj4+Pg0K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFhZyBKYWRhdiA8cmFhZ2phZGF2QGdtYWlsLmNvbT4NCj4+
Pj4+IC0tLQ0KPj4+Pj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuYyB8IDYgKysrKyst
DQo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmMg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuYw0KPj4+Pj4gaW5kZXggM2YzZThiMy4uYjJm
NWZkYiAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5jDQo+
Pj4+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuYw0KPj4+Pj4gQEAgLTcyLDYg
KzcyLDcgQEANCj4+Pj4+ICAgI2RlZmluZQlBVDkxX1RXSV9UWENPTVAJCUJJVCgwKQkvKiBUcmFu
c21pc3Npb24gQ29tcGxldGUgKi8NCj4+Pj4+ICAgI2RlZmluZQlBVDkxX1RXSV9SWFJEWQkJQklU
KDEpCS8qIFJlY2VpdmUgSG9sZGluZyBSZWdpc3RlciBSZWFkeSAqLw0KPj4+Pj4gICAjZGVmaW5l
CUFUOTFfVFdJX1RYUkRZCQlCSVQoMikJLyogVHJhbnNtaXQgSG9sZGluZyBSZWdpc3RlciBSZWFk
eSAqLw0KPj4+Pj4gKyNkZWZpbmUJQVQ5MV9UV0lfU1ZSRUFECQlCSVQoMykJLyogU2xhdmUgUmVh
ZCAqLw0KPj4+Pj4gICAjZGVmaW5lCUFUOTFfVFdJX09WUkUJCUJJVCg2KQkvKiBPdmVycnVuIEVy
cm9yICovDQo+Pj4+PiAgICNkZWZpbmUJQVQ5MV9UV0lfVU5SRQkJQklUKDcpCS8qIFVuZGVycnVu
IEVycm9yICovDQo+Pj4+PiAgICNkZWZpbmUJQVQ5MV9UV0lfTkFDSwkJQklUKDgpCS8qIE5vdCBB
Y2tub3dsZWRnZWQgKi8NCj4+Pj4+IEBAIC01NzEsNyArNTcyLDEwIEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBhdG1lbF90d2lfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4+Pj4+ICAg
CQlhdDkxX2Rpc2FibGVfdHdpX2ludGVycnVwdHMoZGV2KTsNCj4+Pj4+ICAgCQljb21wbGV0ZSgm
ZGV2LT5jbWRfY29tcGxldGUpOw0KPj4+Pj4gICAJfSBlbHNlIGlmIChpcnFzdGF0dXMgJiBBVDkx
X1RXSV9UWFJEWSkgew0KPj4+Pj4gLQkJYXQ5MV90d2lfd3JpdGVfbmV4dF9ieXRlKGRldik7DQo+
Pj4+PiArCQlpZiAoKHN0YXR1cyAmIEFUOTFfVFdJX1NWUkVBRCkgJiYgKGRldi0+YnVmX2xlbiA9
PSAwKSkNCj4+Pj4+ICsJCQlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0lEUiwgQVQ5MV9U
V0lfVFhSRFkpOw0KPj4+Pj4gKwkJZWxzZQ0KPj4+Pj4gKwkJCWF0OTFfdHdpX3dyaXRlX25leHRf
Ynl0ZShkZXYpOw0KPj4+Pj4gICAJfQ0KPj4+Pj4gICANCj4+Pj4+ICAgCS8qIGNhdGNoIGVycm9y
IGZsYWdzICovDQo+Pj4+PiAtLSANCj4+Pj4+IDIuNy40DQo+Pj4+Pg0KPj4+Pj4NCj4+Pg0KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4gbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QNCj4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcNCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwNCj4+Pg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QN
Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbA0KPiANCj4gDQo=
