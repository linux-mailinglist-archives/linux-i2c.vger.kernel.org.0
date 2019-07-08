Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78AC862A01
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 21:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731817AbfGHT6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 15:58:07 -0400
Received: from mail-eopbgr70130.outbound.protection.outlook.com ([40.107.7.130]:43012
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727663AbfGHT6G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jul 2019 15:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do5tchcgQqrhAd0gndHcHpjuoKMSQNn75mRRQmTtDQ8=;
 b=dndaIGp6Mi5szT+wfR/nq9Nz1e/AcdwlVzPpeRjqcxkTjur/11JB6Eega7fUBMJQq6MxKFJCg4pXj35bOL3pDyKopoF3x1it0VWt/52nNV29NwYWch88oijVmza7Sbb+ntJ++n94fqcQh/ojMX1YBUlnYaN2VFWQT9XZVui1pAY=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.10.143) by
 AM6PR0202MB3558.eurprd02.prod.outlook.com (52.133.11.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Mon, 8 Jul 2019 19:58:00 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::a5ae:7e54:4baf:5614]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::a5ae:7e54:4baf:5614%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 19:58:00 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?B?Sm9uYXRoYW4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
Thread-Topic: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
Thread-Index: AQHVNX2EygZRmX9hhEelw/IUg3pXeqbBI+SA
Date:   Mon, 8 Jul 2019 19:58:00 +0000
Message-ID: <7d47a978-5307-a2c8-acc2-f29ce7567bd5@axentia.se>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
In-Reply-To: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0401CA0072.eurprd04.prod.outlook.com
 (2603:10a6:3:19::40) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:25::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2778f7e-2872-4815-6e73-08d703de9454
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM6PR0202MB3558;
x-ms-traffictypediagnostic: AM6PR0202MB3558:
x-microsoft-antispam-prvs: <AM6PR0202MB3558DE72F62B6DEA541078D1BCF60@AM6PR0202MB3558.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(366004)(346002)(376002)(136003)(53754006)(51444003)(199004)(189003)(53546011)(71190400001)(386003)(71200400001)(52116002)(99286004)(6246003)(68736007)(14454004)(2906002)(76176011)(6506007)(66066001)(65956001)(65806001)(31686004)(486006)(7736002)(64126003)(256004)(446003)(476003)(305945005)(4326008)(54906003)(110136005)(25786009)(11346002)(2616005)(74482002)(3846002)(36756003)(102836004)(316002)(229853002)(8676002)(53936002)(26005)(73956011)(81156014)(7416002)(65826007)(66946007)(66476007)(66556008)(64756008)(66446008)(86362001)(6486002)(6512007)(5660300002)(186003)(6436002)(81166006)(6116002)(58126008)(31696002)(8936002)(508600001);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3558;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: evuHRH3FobKhca0Q9TKfyXlml0ayD5H+0l+dQxRXovpjovlXU13rHGYnw05bWAmKGbMxMOBQ6X7Nbpr2gr3k3O5bkcFp7vVwMEtx3FrqdSpEKbduIucP8KTrAxZjkdeHBP/heChXZqVl9cQjkeLZgW3FI6Z2z+Yvkt33/FhLyZmCQr1wxSAEXfd/+TbNcThfZCCOqX7JG5u+y6SbSW/Eds2y4F+2fuijlH9QFOVO+6AEOhnkhiwiLR+xHePnr+kNWrbM0vaqw+0Y25U+WZbnZfvn81PUKyLKJLZB2aotNz1zC8nBjpezBukC4N+w9y1s0Qdq7lGeSUFfgN3FYPAM5Etd6MPMZ9Oenx051cvsDjlrTK+jITu5XcKqe45BQ4eujQgfAJtMwevrLayqvzsYgEVrAY6PTTtHUt+i7/Cq1+A=
Content-Type: text/plain; charset="utf-8"
Content-ID: <244EAA9C120ED040B960C66140CF270D@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b2778f7e-2872-4815-6e73-08d703de9454
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 19:58:00.3957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3558
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNy0wOCAxMzowOCwgTWFyYyBHb256YWxleiB3cm90ZToNCj4gSGVsbG8gZXZlcnlv
bmUsDQoNCipzbmlwKg0KDQpGb2N1c2luZyBvbiAjMi4uLg0KDQo+IFBST0JMRU0gIzINCj4gDQo+
IFRoZSB0dW5lciAoc2kyMTU3KSBpcyBub3Qgb24gdGhlIGkyYzUgYnVzLCBpbnN0ZWFkIGl0IGlz
IG9uIGEgcHJpdmF0ZQ0KPiBpMmMgYnVzICpiZWhpbmQqIHNpMjE2OCwgd2hpY2ggcm91dGVzIHJl
cXVlc3RzIHRvIHRoZSBwcm9wZXIgY2xpZW50Lg0KPiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgZG9u
J3Qga25vdyBob3cgdG8gbW9kZWwgdGhpcyByZWxhdGlvbnNoaXAgaW4gRFQuDQo+IChUT0RPOiBj
aGVjayBpMmNfc2xhdmVfY2JfdCBzbGF2ZV9jYiBpbiBzdHJ1Y3QgaTJjX2NsaWVudCkNCj4gSSBo
YXZlIGluaXRpYWxpemVkIHNpMjE1NyBpbiB0aGUgc2kyMTY4IGRyaXZlciwgYnV0IHRoaXMgZG9l
c24ndCBmZWVsDQo+IHJpZ2h0LiAoVGhvdWdoIGl0IHNlZW1zIGFsbCg/KSB1c2VycyBwYWlyIDIx
Njggd2l0aCAyMTU3LikNCj4gDQo+IA0KPiBJdCB3b3VsZCByZWFsbHkgaGVscCBpZiBJIGNvdWxk
IGdldCBzb21lIGd1aWRhbmNlIGZyb20gbWVkaWEgYW5kIGkyYw0KPiBwZW9wbGUgZm9yIHRoZXNl
IHR3byBpc3N1ZXMuIChJJ2QgbGlrZSB0byB1cHN0cmVhbSB0aGUgZHJpdmVyIGluIHRpbWUNCj4g
Zm9yIDUuMykNCj4gDQo+IFJlZ2FyZHMuDQo+IA0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3Fjb20vYXBxODA5OC1iYXRmaXNoLmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcWNvbS9hcHE4MDk4LWJhdGZpc2guZHRzDQo+IGluZGV4IDI5ZDU5ZWNhZDEzOC4uOTM1
M2U2MjM3NWE3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vYXBxODA5
OC1iYXRmaXNoLmR0cw0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vYXBxODA5OC1i
YXRmaXNoLmR0cw0KPiBAQCAtMzAsNiArMzAsMjggQEANCj4gIAlzdGF0dXMgPSAib2siOw0KPiAg
fTsNCj4gIA0KPiArJmJsc3AxX2kyYzUgew0KPiArCXN0YXR1cyA9ICJvayI7DQo+ICsJY2xvY2st
ZnJlcXVlbmN5ID0gPDEwMDAwMD47DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4g
KwlwaW5jdHJsLTAgPSA8JmkyYzVfZGVmYXVsdD47DQo+ICsNCj4gKwlkdmJfZGVtb2Q6IHNpMjE2
OEA2NCB7DQo+ICsJCWNvbXBhdGlibGUgPSAic2lsYWJzLHNpMjE2OCI7DQo+ICsJCXJlZyA9IDww
eDY0PjsNCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRsbW0gODQgR1BJT19BQ1RJVkVfTE9XPjsNCg0K
DQpJbiBwcmluY2lwbGUsIEkgdGhpbmsgeW91IHNob3VsZCBiZSBhYmxlIHRvIGFkZCBzb21ldGhp
bmcgbGlrZSB0aGlzIGhlcmU6DQoNCgkJaTJjLWdhdGUgew0KCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQoJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCg0KCQkJdHVuZXJANjAgew0KCQkJCWNvbXBhdGli
bGUgPSAic2lsYWJzLHNpMjE1NyI7DQoJCQkJcmVnID0gPDB4NjA+Ow0KCQkJCS8qIHdoYXRldmVy
IGVsc2UgaXMgbmVlZGVkICovDQoJCQl9Ow0KCQl9Ow0KDQpCdXQgaW4gcHJhY3RpY2UsIEkgZG9u
J3Qga25vdyBpZiB0aGUgc2kyMTU3IGRyaXZlciB1bmRlcnN0YW5kcyB0aGF0IG9yDQppZiB0aGVy
ZSBpcyBhbnl0aGluZyBlbHNlIHRoYXQgZ2V0cyBpbiB0aGUgd2F5LiBUb3RhbGx5IHVudGVzdGVk
Li4uDQoNClRoZSBpMmMtZ2F0ZSBjaGlsZCBub2RlIGlzIGV4YW1pbmVkIHdoZW4geW91IGNhbGwg
aTJjX211eF9hZGRfYWRhcHRlcg0KaWYgeW91IGhhdmUgcHJvdmlkZWQgdGhlIGNvcnJlY3Qgc3Ry
dWN0IGRldmljZSBpbiB0aGUgc2Vjb25kIGFyZ3VtZW50DQp3aGVuIHlvdSBjYWxsZWQgaTJjX211
eF9hbGxvYyAoSSB0aGluayB0aGF0IGlzIGFscmVhZHkgdGhlIGNhc2UpLiBZb3UNCmFsc28gbmVl
ZCB0byBzZXQgdGhlIEkyQ19NVVhfR0FURSBmbGFnIGluIHRoZSBpMmNfbXV4X2FsbG9jIGNhbGws
IGJ1dA0KSSBkbyBub3Qgc2VlIGEgcHJvYmxlbSB3aXRoIHRoYXQgc2luY2UgSSB0aGluayBvbmx5
IG9uZSBjaGlsZCBhZGFwdGVyDQppcyBhZGRlZC4gSWYgaXQgaXMgYSBwcm9ibGVtIHRvIGFkZCB0
aGUgSTJDX01VWF9HQVRFIGZsYWcsIHRoZW4geW91DQpjYW4ganVzdCBhZGp1c3QgdGhlIGFib3Zl
IGkyYy1nYXRlIG5vZGUgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBpbg0KRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LnR4dC4gSS5lLiBhZGQgdGhpcw0KaW5z
dGVhZCBvZiB0aGUgYWJvdmUgaTJjLWdhdGUgbm9kZToNCg0KCQlpMmMtbXV4IHsNCgkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KCQkJI3NpemUtY2VsbHMgPSA8MD47DQoNCgkJCWkyY0AwIHsNCgkg
ICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICAgICAgCSAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCiAgICAgICAgICAgICAgICAJICAgICAg
ICByZWcgPSA8MD47DQoNCgkJCQl0dW5lckA2MCB7DQoJCQkJCWNvbXBhdGlibGUgPSAic2lsYWJz
LHNpMjE1NyI7DQoJCQkJCXJlZyA9IDwweDYwPjsNCgkJCQkJLyogd2hhdGV2ZXIgZWxzZSBpcyBu
ZWVkZWQgKi8NCgkJCQl9Ow0KCQkJfTsNCgkJfTsNCg0KQnV0IGl0IGZlZWxzICpyaWdodCogdG8g
YWRkIHRoZSBJMkNfTVVYX0dBVEUgZmxhZywgYmVjYXVzZSBhIGdhdGUgaXMNCndoYXQgeW91IGhh
dmUuIEkgdGhpbms/DQoNCkNoZWVycywNClBldGVyDQoNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiAr
JnRzaWYgew0KPiArCWRlbW9kID0gPCZkdmJfZGVtb2Q+Ow0KPiArfTsNCj4gKw0KPiArJmkyYzVf
ZGVmYXVsdCB7DQo+ICsJZHJpdmUtc3RyZW5ndGggPSA8Mj47DQo+ICsJYmlhcy1kaXNhYmxlOw0K
PiArfTsNCj4gKw0KPiAgJnF1c2IycGh5IHsNCj4gIAlzdGF0dXMgPSAib2siOw0KPiAgCXZkZGEt
cGxsLXN1cHBseSA9IDwmdnJlZ19sMTJhXzFwOD47DQoNCg==
