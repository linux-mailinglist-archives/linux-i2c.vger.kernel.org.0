Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B563FB3451
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 07:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbfIPFUO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 01:20:14 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:6672 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfIPFUO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Sep 2019 01:20:14 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: hsZtTv6iLjB/4OqBiGD/FHYumadEXsdR7xFEX3Z/khgLKZm5cLyNhsyZOWlUo6WT1zXnmuwx2Y
 xGWoad3WsbCwtjYhZYO0oSZgu0jPzyZ0d72oDTCYjb+GdUK2KOSMoLYy2r9vvKrHNRn6pkg3a6
 rOGG8Hvyx/khBSQM2XB5sz7n+v6ggbs6uB6GoBupLImLLibsHdZY+uy2i+UpMSwKgk2+c1Fah7
 PTv8GDzjCURaAYheQmvrz0aPsrPGT0nDpn2Gh/dCJKj8yoE7IH5b3l/qhhIV964frYwLjMREH3
 qO8=
X-IronPort-AV: E=Sophos;i="5.64,510,1559545200"; 
   d="scan'208";a="49175969"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2019 22:20:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 15 Sep 2019 22:20:13 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 15 Sep 2019 22:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxJfXxwXyTi5xcPWLiOe+KaDnEGl2iFcEeYKaZAIPtizsNrj5kyUFJ88r3dWMUzxus4wCdycSSliJfmKdx0tCcNy8Q3it2Vy0r0bLvNoLChOjh1HnlO36QgQ0Q2nFHPtEg42kgUo5ntqbq86bVEwXDCV/LCpqVLvN4LJYKSPnlxJkLLj7E4k4prP91bbkB5ZvNYi2wFjd2UfZTxSRZgxtoRU6hjRSar4rn30YwpMCSqNvn/+LA6ZSEAA96jUMnX0Ylyh8oJvQMlVguNJP/rl22kJkwco+Yg+J9PNb9bLDmpucT450wNc2SlmPiPPh78+6ZH/1d4CzIJcJSRIlCLRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K30q7VOGoWQ57c0Zr+XqPpsPRuz/PvxPixG2A4pj1f0=;
 b=dVsFbjjNDLJ8dG2Lpkofgp8qgugAO5AMBKXdIQQxqbOqtVLKsFNJWtLbrBZtwRhV+x2VW2jXU8NjjyESt1NOoGe542c8v8sOBITQJD9kGQYAYV+l96ast7bYEIzUqGmMe2hKNI+xkrD+NLGv5u/8IeTB3szhOpSseQSSaDN8npx7giRKDI11a1U0ysaAVbUOHkh9dhuZwQUchHFHaHPS7sXx4Q19B0VBCdIQ+2FeN8H6wDw3GPjH1moDkum6z8sp1F/o6mKwMISx6GYFvdD1dt7777eMxTPY+l/NJD11gFc8J4uNS+9Z/dE4JebEgNs0S3FO115J0Qq5Nm6oxgtY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K30q7VOGoWQ57c0Zr+XqPpsPRuz/PvxPixG2A4pj1f0=;
 b=IfZARf53+7Xs8YJu9v1QE87a8n9jalgCrGvxnXXLdTMZ9Cmh8jWaWTrIFFurtGHKm++KvLan2q0RrID8ntR35RSbIoKy+eZMA621fKppqReZqc9rgLZJ2AW4n2DVnD9Q/wTw+iM4TR+Qw1MvA5xRoWZsmoshGyVhZLdlAcx0z8U=
Received: from MWHPR11MB1549.namprd11.prod.outlook.com (10.172.54.17) by
 MWHPR11MB1342.namprd11.prod.outlook.com (10.169.231.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Mon, 16 Sep 2019 05:20:11 +0000
Received: from MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::e1f5:745f:84b4:7c7c]) by MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::e1f5:745f:84b4:7c7c%12]) with mapi id 15.20.2263.023; Mon, 16 Sep
 2019 05:20:10 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <Codrin.Ciubotariu@microchip.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Ludovic.Desroches@microchip.com>, <alexandre.belloni@bootlin.com>,
        <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: at91: Send bus clear command if SCL or SDA is down
Thread-Topic: [PATCH] i2c: at91: Send bus clear command if SCL or SDA is down
Thread-Index: AQHVbE5pEIol6mz2t0SkZ2v6ztaQGw==
Date:   Mon, 16 Sep 2019 05:20:10 +0000
Message-ID: <1d634b5d-c71b-bc75-0e77-1823db084eab@microchip.com>
References: <20190911095854.5141-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20190911095854.5141-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::48) To MWHPR11MB1549.namprd11.prod.outlook.com
 (2603:10b6:301:c::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190916082001241
x-originating-ip: [86.120.236.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b25927b-b4ec-43ad-7c43-08d73a658b56
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR11MB1342;
x-ms-traffictypediagnostic: MWHPR11MB1342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB13420B3EA6DAEEC3E83477F0878C0@MWHPR11MB1342.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(53936002)(66066001)(31696002)(86362001)(81156014)(81166006)(256004)(2201001)(14444005)(14454004)(54906003)(25786009)(316002)(5660300002)(31686004)(4326008)(8936002)(110136005)(478600001)(64756008)(446003)(11346002)(486006)(66556008)(66476007)(6246003)(66446008)(66946007)(2501003)(229853002)(52116002)(2906002)(476003)(2616005)(99286004)(386003)(6506007)(6512007)(3846002)(6116002)(53546011)(102836004)(7736002)(6436002)(71190400001)(186003)(6486002)(305945005)(26005)(71200400001)(76176011)(8676002)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1342;H:MWHPR11MB1549.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jdVASLg54L0QTHx6oPq7sjnoj5IQAz3Y1ihj86fYIMeQE6xYnz/+vK2SY+pZhUc//E+qbzyxr/R1DLvGkNbRDSbS7GCMFNK2KAt1eJgCep6fdQ9tpRjweSAJVcfLpBI5YhHIi5+HqyhJ+zuy+rWzrmdgoHn1hSMTFGx5P6uBK6Ld6HPdJ7xbk+ffPbjKnylwD4T69qJM0z53a7N1nyTpBJ1b8vX4Yk4+zGYRLXb+YwldWpe0TYinj4Pp+vZiKlAdT9nCH2jkRRb2SIkz7GH911DgVTfsF7g6GiGvmnmeTKU7fHIINxwQj4zWyFtVKX2t5CE8VB8J/8GjJkXXhBppOmg0S9Sq02QoRt32z5/HnzHFKehcS0r1WEYxXPWW7QIhogBH6SKvtz1tpKUmkS+G6T8DiCqtmzUd9clDT/bWQ+8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65345012C46F634D92545244C8ACDE72@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b25927b-b4ec-43ad-7c43-08d73a658b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 05:20:10.6490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zV3Uig03meuY3JLX7sljp7w1Wwx8OD8+xuqUGGzKP2fXfV90dXYH+2GjaSjUPTnNWtIaSnUCmrA/FJVu0QyeBtOztTFnAAppEYR9ueDG7xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1342
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDExLjA5LjIwMTkgMTI6NTgsIENvZHJpbiBDaXVib3Rhcml1IHdyb3RlOg0KPiBFeHRl
cm5hbCBFLU1haWwNCj4gDQo+IA0KPiBBZnRlciBhIHRyYW5zZmVyIHRpbWVvdXQsIHNvbWUgZmF1
bHR5IEkyQyBzbGF2ZSBkZXZpY2VzIG1pZ2h0IGhvbGQgZG93bg0KPiB0aGUgU0NMIG9yIHRoZSBT
REEgcGlucy4gV2UgY2FuIGdlbmVyYXRlIGEgYnVzIGNsZWFyIGNvbW1hbmQsIGhvcGluZyB0aGF0
DQo+IHRoZSBzbGF2ZSBtaWdodCByZWxlYXNlIHRoZSBwaW5zLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5jb20+DQoN
ClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNv
bT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDIw
ICsrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuaCAg
ICAgICAgfCAgNiArKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
YXQ5MS1tYXN0ZXIuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KPiBp
bmRleCBhM2ZjYzM1ZmZkM2IuLjVmNTQ0YTE2ZGI5NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtYXQ5MS1tYXN0ZXIuYw0KPiBAQCAtNTk5LDYgKzU5OSwyNiBAQCBzdGF0aWMgaW50IGF0OTFf
ZG9fdHdpX3RyYW5zZmVyKHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldikNCj4gIAkJYXQ5MV90d2lf
d3JpdGUoZGV2LCBBVDkxX1RXSV9DUiwNCj4gIAkJCSAgICAgICBBVDkxX1RXSV9USFJDTFIgfCBB
VDkxX1RXSV9MT0NLQ0xSKTsNCj4gIAl9DQo+ICsNCj4gKwkvKg0KPiArCSAqIEFmdGVyIHRpbWVv
dXQsIHNvbWUgZmF1bHR5IEkyQyBzbGF2ZSBkZXZpY2VzIG1pZ2h0IGhvbGQgU0NML1NEQSBkb3du
Ow0KPiArCSAqIHdlIGNhbiBzZW5kIGEgYnVzIGNsZWFyIGNvbW1hbmQsIGhvcGluZyB0aGF0IHRo
ZSBwaW5zIHdpbGwgYmUNCj4gKwkgKiByZWxlYXNlZA0KPiArCSAqLw0KPiArCWlmICghKGRldi0+
dHJhbnNmZXJfc3RhdHVzICYgQVQ5MV9UV0lfU0RBKSB8fA0KPiArCSAgICAhKGRldi0+dHJhbnNm
ZXJfc3RhdHVzICYgQVQ5MV9UV0lfU0NMKSkgew0KPiArCQlkZXZfZGJnKGRldi0+ZGV2LA0KPiAr
CQkJIlNEQS9TQ0wgYXJlIGRvd247IHNlbmRpbmcgYnVzIGNsZWFyIGNvbW1hbmRcbiIpOw0KPiAr
CQlpZiAoZGV2LT51c2VfYWx0X2NtZCkgew0KPiArCQkJdW5zaWduZWQgaW50IGFjcjsNCj4gKw0K
PiArCQkJYWNyID0gYXQ5MV90d2lfcmVhZChkZXYsIEFUOTFfVFdJX0FDUik7DQo+ICsJCQlhY3Ig
Jj0gfkFUOTFfVFdJX0FDUl9EQVRBTF9NQVNLOw0KPiArCQkJYXQ5MV90d2lfd3JpdGUoZGV2LCBB
VDkxX1RXSV9BQ1IsIGFjcik7DQo+ICsJCX0NCj4gKwkJYXQ5MV90d2lfd3JpdGUoZGV2LCBBVDkx
X1RXSV9DUiwgQVQ5MV9UV0lfQ0xFQVIpOw0KPiArCX0NCj4gKw0KPiAgCXJldHVybiByZXQ7DQo+
ICB9DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmgNCj4gaW5kZXggNDk5YjUwNmY2MTI4Li5mZmI4
NzBmM2ZmYzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQo+
ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQo+IEBAIC0zNiw2ICszNiw3IEBA
DQo+ICAjZGVmaW5lCUFUOTFfVFdJX1NWRElTCQlCSVQoNSkJLyogU2xhdmUgVHJhbnNmZXIgRGlz
YWJsZSAqLw0KPiAgI2RlZmluZQlBVDkxX1RXSV9RVUlDSwkJQklUKDYpCS8qIFNNQnVzIHF1aWNr
IGNvbW1hbmQgKi8NCj4gICNkZWZpbmUJQVQ5MV9UV0lfU1dSU1QJCUJJVCg3KQkvKiBTb2Z0d2Fy
ZSBSZXNldCAqLw0KPiArI2RlZmluZQlBVDkxX1RXSV9DTEVBUgkJQklUKDE1KSAvKiBCdXMgY2xl
YXIgY29tbWFuZCAqLw0KPiAgI2RlZmluZQlBVDkxX1RXSV9BQ01FTgkJQklUKDE2KSAvKiBBbHRl
cm5hdGl2ZSBDb21tYW5kIE1vZGUgRW5hYmxlICovDQo+ICAjZGVmaW5lCUFUOTFfVFdJX0FDTURJ
UwkJQklUKDE3KSAvKiBBbHRlcm5hdGl2ZSBDb21tYW5kIE1vZGUgRGlzYWJsZSAqLw0KPiAgI2Rl
ZmluZQlBVDkxX1RXSV9USFJDTFIJCUJJVCgyNCkgLyogVHJhbnNtaXQgSG9sZGluZyBSZWdpc3Rl
ciBDbGVhciAqLw0KPiBAQCAtNjksNiArNzAsOCBAQA0KPiAgI2RlZmluZQlBVDkxX1RXSV9OQUNL
CQlCSVQoOCkJLyogTm90IEFja25vd2xlZGdlZCAqLw0KPiAgI2RlZmluZQlBVDkxX1RXSV9FT1NB
Q0MJCUJJVCgxMSkJLyogRW5kIE9mIFNsYXZlIEFjY2VzcyAqLw0KPiAgI2RlZmluZQlBVDkxX1RX
SV9MT0NLCQlCSVQoMjMpIC8qIFRXSSBMb2NrIGR1ZSB0byBGcmFtZSBFcnJvcnMgKi8NCj4gKyNk
ZWZpbmUJQVQ5MV9UV0lfU0NMCQlCSVQoMjQpIC8qIFRXSSBTQ0wgc3RhdHVzICovDQo+ICsjZGVm
aW5lCUFUOTFfVFdJX1NEQQkJQklUKDI1KSAvKiBUV0kgU0RBIHN0YXR1cyAqLw0KPiAgDQo+ICAj
ZGVmaW5lCUFUOTFfVFdJX0lOVF9NQVNLIFwNCj4gIAkoQVQ5MV9UV0lfVFhDT01QIHwgQVQ5MV9U
V0lfUlhSRFkgfCBBVDkxX1RXSV9UWFJEWSB8IEFUOTFfVFdJX05BQ0sgXA0KPiBAQCAtODEsNyAr
ODQsOCBAQA0KPiAgI2RlZmluZQlBVDkxX1RXSV9USFIJCTB4MDAzNAkvKiBUcmFuc21pdCBIb2xk
aW5nIFJlZ2lzdGVyICovDQo+ICANCj4gICNkZWZpbmUJQVQ5MV9UV0lfQUNSCQkweDAwNDAJLyog
QWx0ZXJuYXRpdmUgQ29tbWFuZCBSZWdpc3RlciAqLw0KPiAtI2RlZmluZQlBVDkxX1RXSV9BQ1Jf
REFUQUwobGVuKQkoKGxlbikgJiAweGZmKQ0KPiArI2RlZmluZQlBVDkxX1RXSV9BQ1JfREFUQUxf
TUFTSwlHRU5NQVNLKDE1LCAwKQ0KPiArI2RlZmluZQlBVDkxX1RXSV9BQ1JfREFUQUwobGVuKQko
KGxlbikgJiBBVDkxX1RXSV9BQ1JfREFUQUxfTUFTSykNCj4gICNkZWZpbmUJQVQ5MV9UV0lfQUNS
X0RJUglCSVQoOCkNCj4gIA0KPiAgI2RlZmluZQlBVDkxX1RXSV9GTVIJCTB4MDA1MAkvKiBGSUZP
IE1vZGUgUmVnaXN0ZXIgKi8NCj4gDQo=
