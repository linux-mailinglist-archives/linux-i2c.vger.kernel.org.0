Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8128DB7F04
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2019 18:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404292AbfISQZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Sep 2019 12:25:36 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:30307 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404291AbfISQZg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Sep 2019 12:25:36 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Q1XwrhEX3GMlcMGaGJeUKoZVURFaVDmMXjlV0pB33APj0+0NYOpKzs4+SlSICepAmdUBxGxEWO
 hzmGhOe3QLE752HVi0rPXx/MEfA/JIYyLYwmcimQR7Qs4ezuRn2zDJNPa569sqxV4O7tlCgMfy
 ScjcqklgSQWJ/t9lrm5DK1D32JXffHjwEaAe0sUSBYFqvhsPOptjo1npM/T8sCvutWsw+Ts36i
 KWscymcwjBspRvC4P64qKi58JfKIjRNS4pjEcLaSMHJYfqyFDMtplG3GxaKkgK6JzSWIETjWLp
 UsE=
X-IronPort-AV: E=Sophos;i="5.64,524,1559545200"; 
   d="scan'208";a="49566631"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Sep 2019 09:25:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Sep 2019 09:25:34 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 19 Sep 2019 09:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTVSbG7m2wu3lPb+UAfG+ZaNKQRPzu40mhaZnIGNF5dT+xM2o/shKn3P51F6lXCAlEdZJ4jv93WFj28BH4PZROeUIJ5dHQcBXuBr2cn8abD03eYu1qPsC5tutcgLWfLak2NrKWs6l6UcsI2oQIWxgNql1zCSquDhbaQ/y+5CSuRnAn2OrY1p0Pf4mWQLYgFzYEc7aTFDbs+qzBRIn6xbBUWxwBiRZ49TOhenFGADts2/VdgurQmfaax6ujICOrS79gnVgttBjnefDEqBY+qhhgNqikhx2ave+4R56mcJfwvDL8PNsLfP26yCoDQXiGy54xAXFu1XiuAVWIzy9VRKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMUEfJsk9pjwVhXCMLHWKHc41K/itFbtMtAWeMZ00sk=;
 b=WBEruDgEEZEMyCCMjDGUbtS3WrFQVY7tpmjm/wTm6kk+hIzhgHZq0T87kJzmoY3SsWtMu7qjIEG0iqdND9EX8fc8WsNz/KXerUU6LZiM+ywFgCVR5DBL3AnIFX+CTa+G9GkAGYFyanZe1S2u5y5b96tnfJTDyIwMOxqACE+B2HLmfiMylDJxVYSIgwkPjnMMwUdNpdshyOZamaSYkQgk6jCtTwivFOakFpiYeR1EW2E5F6p5QPti+IzsmuH/Xea0CuKN/mW+4V/CUJquvaAKJS+jrXikWuQ9G+K5GPN4NZeKsf/hYVFz0wleVY3ihAl5Mfcd8aOd9H5mj9xhlGi3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMUEfJsk9pjwVhXCMLHWKHc41K/itFbtMtAWeMZ00sk=;
 b=hcPwvtHA6WPobqsLFv5CYoxBn9x7pQ3P9Na+3EkPMY/H/J28Cw3I7WzdCCUh8/CJIby8/gYg1S9oyyo9yaHx1ahR03BmrIjV109DRnsQMEkf3DZMHk1rJl4itLRluA9sa4TC5iXhfTQwaMLLuyKRfat67FPXrlQllfUiQ8coRkI=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4433.namprd11.prod.outlook.com (52.132.255.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Thu, 19 Sep 2019 16:25:32 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::acc6:9f49:c974:93b4]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::acc6:9f49:c974:93b4%5]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 16:25:32 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <kamel.bouhara@bootlin.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: at91: Send bus clear command if SCL or SDA is down
Thread-Topic: [PATCH] i2c: at91: Send bus clear command if SCL or SDA is down
Thread-Index: AQHVaIebKOCwzWWM9UelAunkToehwaczJoQAgAAWGgA=
Date:   Thu, 19 Sep 2019 16:25:32 +0000
Message-ID: <d0820574-e677-d261-ac5c-e29bae600b3b@microchip.com>
References: <20190911095854.5141-1-codrin.ciubotariu@microchip.com>
 <1ed845e5-3835-f1aa-099a-b67c3bc16076@bootlin.com>
In-Reply-To: <1ed845e5-3835-f1aa-099a-b67c3bc16076@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0f4976f-5e91-450b-87d6-08d73d1dfdfb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BY5PR11MB4433;
x-ms-traffictypediagnostic: BY5PR11MB4433:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4433269BA6E17BBBDF4378CDE7890@BY5PR11MB4433.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(346002)(376002)(366004)(136003)(189003)(199004)(186003)(6486002)(6436002)(52116002)(2201001)(2501003)(66556008)(64756008)(66446008)(36756003)(229853002)(66946007)(66476007)(6246003)(6512007)(305945005)(31686004)(54906003)(71190400001)(71200400001)(478600001)(99286004)(76176011)(6506007)(386003)(110136005)(31696002)(53546011)(66066001)(7736002)(446003)(256004)(14444005)(102836004)(11346002)(2616005)(26005)(476003)(2906002)(486006)(81166006)(81156014)(8676002)(8936002)(6116002)(14454004)(3846002)(25786009)(86362001)(5660300002)(316002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4433;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 37cosASPjiJxXr5VRYetWr15SNZpNFj2ac0f3y2t/E4TvltLDabGy5BtQrvAUogd3TvxUvAi6n4Q5oP8UNicgxyrBmPVI2Di1DDDukIUstsiMsHfKQChif1TNYOX7AuqhwpOy4apRXKmkOLiKTwY6a9MY4k5ug5v264fFRLQqt1x3x7Mi1dQfWTStsfsi88SldSWLgCvs9Ob8eSx6+0ziNCxmPYG7UWO/7mmJISBHlAtPePKv4QoXPQzODcIY2QjH+4lyg/C7iOLG2Rbdp6y1pVDaS0UthDOC2Ovm/ACyVnQ74XtGMDJMQHwjJVMwqylnNvgcrZL+BhjxJHbooi+LZGoOmTjeBEhMZpxCxT0QX82f735Khw7aLVD8czUl8rPl9EUmWAtaF0e/+hduWuWbohbjQDSogZS4WGXIR/q5AQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB34E13450DD284088DEB23122EC935E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f4976f-5e91-450b-87d6-08d73d1dfdfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 16:25:32.2559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyZ3ds2qrvuTja2fouXw8si5HwXcbKfHK8a+q/nUUf45JeabvpMgomA907K9NUbKu6rQuFopGaMW8XC+GUQjHI6S8Ibhkq5uU+htHY2pVH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4433
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTkuMDkuMjAxOSAxODowNiwga2JvdWhhcmEgd3JvdGU6DQo+IA0KPiBPbiA5LzExLzE5IDEx
OjU4IEFNLCBDb2RyaW4gQ2l1Ym90YXJpdSB3cm90ZToNCj4+IEFmdGVyIGEgdHJhbnNmZXIgdGlt
ZW91dCwgc29tZSBmYXVsdHkgSTJDIHNsYXZlIGRldmljZXMgbWlnaHQgaG9sZCBkb3duDQo+PiB0
aGUgU0NMIG9yIHRoZSBTREEgcGlucy4gV2UgY2FuIGdlbmVyYXRlIGEgYnVzIGNsZWFyIGNvbW1h
bmQsIGhvcGluZyB0aGF0DQo+PiB0aGUgc2xhdmUgbWlnaHQgcmVsZWFzZSB0aGUgcGlucy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVA
bWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkx
LW1hc3Rlci5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS5owqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrKystDQo+PiDCoCAyIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jIA0KPj4gYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCj4+IGluZGV4IGEzZmNjMzVmZmQzYi4uNWY1
NDRhMTZkYjk2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1h
c3Rlci5jDQo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCj4+
IEBAIC01OTksNiArNTk5LDI2IEBAIHN0YXRpYyBpbnQgYXQ5MV9kb190d2lfdHJhbnNmZXIoc3Ry
dWN0IA0KPj4gYXQ5MV90d2lfZGV2ICpkZXYpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXQ5MV90
d2lfd3JpdGUoZGV2LCBBVDkxX1RXSV9DUiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgQVQ5MV9UV0lfVEhSQ0xSIHwgQVQ5MV9UV0lfTE9DS0NMUik7DQo+PiDC
oMKgwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIEFmdGVyIHRp
bWVvdXQsIHNvbWUgZmF1bHR5IEkyQyBzbGF2ZSBkZXZpY2VzIG1pZ2h0IGhvbGQgDQo+PiBTQ0wv
U0RBIGRvd247DQo+PiArwqDCoMKgwqAgKiB3ZSBjYW4gc2VuZCBhIGJ1cyBjbGVhciBjb21tYW5k
LCBob3BpbmcgdGhhdCB0aGUgcGlucyB3aWxsIGJlDQo+PiArwqDCoMKgwqAgKiByZWxlYXNlZA0K
Pj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGlmICghKGRldi0+dHJhbnNmZXJfc3RhdHVzICYg
QVQ5MV9UV0lfU0RBKSB8fA0KPj4gK8KgwqDCoMKgwqDCoMKgICEoZGV2LT50cmFuc2Zlcl9zdGF0
dXMgJiBBVDkxX1RXSV9TQ0wpKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYtPmRl
diwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJTREEvU0NMIGFyZSBkb3duOyBzZW5kaW5n
IGJ1cyBjbGVhciBjb21tYW5kXG4iKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZGV2LT51c2Vf
YWx0X2NtZCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGFjcjsN
Cj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjciA9IGF0OTFfdHdpX3JlYWQoZGV2
LCBBVDkxX1RXSV9BQ1IpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNyICY9IH5BVDkx
X1RXSV9BQ1JfREFUQUxfTUFTSzsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF0OTFfdHdp
X3dyaXRlKGRldiwgQVQ5MV9UV0lfQUNSLCBhY3IpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+
ICvCoMKgwqDCoMKgwqDCoCBhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0NSLCBBVDkxX1RX
SV9DTEVBUik7DQo+IA0KPiBUaGlzIGJpdCBpcyBub3QgZG9jdW1lbnRlZCBvbiBTb0NzIGJlZm9y
ZSBTQU1BNUQyL0Q0LCB0aGlzIHdyaXRlIA0KPiBzaG91bGRuJ3QgYmUgZG9uZSB1bmNvbmRpdGlv
bmFsbHkuDQo+IA0KPiANCg0KSW5kZWVkLCB0aGV5IGFyZSBub3QgcHJlc2VudCBvbiBTQU1BNUQ0
IG9yIGVhcmxpZXIgU29Dcy4gSXQgaXMgc3VwcG9ydGVkIA0Kb24gU0FNQTVEMiB0aG91Z2guIEkg
d2lsbCBtYWtlIGEgbmV3IHZlcnNpb24gYW5kIGltcGxlbWVudCB0aGUgQ0xFQVIgDQpjb21tYW5k
IG9ubHkgZm9yIHRoZSBTb0NzIHRoYXQgc3VwcG9ydCBpdC4NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHJldmlldy4NCg0KQmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
