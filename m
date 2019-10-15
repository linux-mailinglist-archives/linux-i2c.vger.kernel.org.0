Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47010D77D4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 16:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbfJOOAA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 10:00:00 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com ([40.107.6.105]:49281
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728880AbfJOOAA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 10:00:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NITWrvDSrUGBU7NIHE2TX6PtxWV60a6r+EclZi5NqTA+MvurARfPfdR922Dq37Bwb4FTd3k24t/NkvBQmVsDpiNxlBw4VcP+vleviqLftVDICIal3IfyYKwGD2qoSKb+mdoT820FrLhQ6B+ZX8BCAxAnXgh8obNadj4Kz2xy0isHOarv0F5++uAmPoHOVkHk8huIRUPumr/G7r/63xIYGZ56ww1Y9NrJnmBqPNDKTWMxSqvxf8UUjGvmDbBSF7oeDvRBvB4Dx0kkWtJDmwOFPmJ1MWm21g2EO5/rSLyJB7xFg8JXugIagWIQxKb1e0X+uC9J/wYFPY3Q7fEQXGqWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEF7+rGQ67REk8xtrz3d7lHKUnND1ZbWIqoZWuta03A=;
 b=WgJvKnGhmBelwj0ChdNeQB6+6WG0KoNO4z72CvM/yj2lyXA1lXXZirwumJxPLdb5QLvURYdaxR9rULWxbWMIDplROSFQHw61BaOF0xib67sXVOPANrFyUU7z6y5jz4j7zR4/C3Hv379pBWrxrpUfPs/zIlR9pn+izEXMKSKqjkDivFaUK7vMJ3LnDxXedkuVthutxgFCiT6XSTESlIMP5JZiLZuZn+Jx0u1XfLNcySFHKbCN6qltGjbKR4QJzKuq7k4hZe+e3jkfL0+428um6b/NXaUJQArzvglNrCwSNvaUiTIIIEUhK/lcq28hkvfsd0QO/r2Xsr5rt789CoAI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEF7+rGQ67REk8xtrz3d7lHKUnND1ZbWIqoZWuta03A=;
 b=B7gY8kMkBNrX/TgQAHBJ2hNU2mnZZHHZ624QT7mx+jZ1YPIf29rQO93MJzTb66Ohml+LXNV74ANR0Qk1XIU/6HNeZi5QipxN0/4f/XcU7xTUTrJzGo0gz0qIWhSy8Cab2MaZHrfFXnRL0sZUmmTiG4WWLvt8yjIcqRWBg+/PIFM=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3452.eurprd02.prod.outlook.com (52.134.66.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 13:59:55 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 13:59:55 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v2,2/2] i2c: mux: pca954x: add property idle-state
Thread-Topic: [v2,2/2] i2c: mux: pca954x: add property idle-state
Thread-Index: AQHVgxVZDNsxE5fsrEiL2fduIKm/fKdbuvMA
Date:   Tue, 15 Oct 2019 13:59:54 +0000
Message-ID: <e53f0a07-eaae-7f84-8e87-da4e99f0105a@axentia.se>
References: <20191015044839.23746-1-biwen.li@nxp.com>
 <20191015044839.23746-2-biwen.li@nxp.com>
In-Reply-To: <20191015044839.23746-2-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0356.eurprd05.prod.outlook.com
 (2603:10a6:7:94::15) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfc69402-c1fc-4882-2176-08d75177f4db
x-ms-traffictypediagnostic: DB3PR0202MB3452:
x-microsoft-antispam-prvs: <DB3PR0202MB3452E0F3C2AF0A47E82C6E3EBC930@DB3PR0202MB3452.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39830400003)(189003)(199004)(11346002)(3846002)(71190400001)(2616005)(65956001)(66066001)(476003)(76176011)(316002)(486006)(186003)(58126008)(25786009)(14454004)(508600001)(99286004)(26005)(110136005)(256004)(54906003)(14444005)(6116002)(5660300002)(71200400001)(446003)(4001150100001)(52116002)(65806001)(102836004)(386003)(6506007)(53546011)(2906002)(66946007)(31686004)(66556008)(4326008)(64756008)(66446008)(6436002)(6486002)(31696002)(36756003)(6246003)(86362001)(6512007)(229853002)(305945005)(7736002)(81156014)(8676002)(2501003)(81166006)(8936002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3452;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bb8JASySfStftO1k3lpzU3Rl04naWO5H02DtkgHm8fffGxEnM9gvUfBfG25mP1Mheo/h7cOMfc9YpdMKrgxq2STD14WUK39fOP6nCQ0D1WywE0OCrCGgg4EGLyoC3NkB1jkzGqPTsfgJUUN6v2pEW6Q/B8wgYgvVfPDjRimhZzScoK19Ka0qy0e74DmumgQnkkOA7vVxQrKU0m2qKXWcFPGEktakVgBvC5qrrGYKAHHNUadBKLXTQb3xdS3Sus/5lWyBftkbOECq2UuR2xLb/P+H5pPezKttND6G8kFrItSMyN7Dw2XEHloeYgUR3pfuaW2su07MluWdJGwGDrE6HIngsveaTr2gJIbiZDbkZevpaMF2T/jP0tX+OhJlWc8TWCt2nsQsK1wiiWkjogqIcA9v3aQyOhHEile2PyPQyZA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <90997459E3708A4DBB33589DD78BB078@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc69402-c1fc-4882-2176-08d75177f4db
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 13:59:55.0502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aoJKmjg5a9twAWA8FyYPS2y/Vgv8vduqarzE/GdZ8GCChp8OkFCovdlFNq/6mrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNSAwNjo0OCwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgYWRkcyBwcm9wZXJ0
eSBpZGxlLXN0YXRlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhw
LmNvbT4NCj4gLS0tDQo+IENoYW5nZSBpbiB2MjoNCj4gCS0gdXBkYXRlIHN1YmplY3QgYW5kIGRl
c2NyaXB0aW9uDQo+IAktIGFkZCBwcm9wZXJ0eSBpZGxlLXN0YXRlDQo+IA0KPiAgZHJpdmVycy9p
MmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMgfCA0NyArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5j
IGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gaW5kZXggOTIzYWEzYTVh
M2RjLi44ZWM1ODYzNDJiOTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1t
dXgtcGNhOTU0eC5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5j
DQo+IEBAIC04Niw3ICs4Niw3IEBAIHN0cnVjdCBwY2E5NTR4IHsNCj4gIA0KPiAgCXU4IGxhc3Rf
Y2hhbjsJCS8qIGxhc3QgcmVnaXN0ZXIgdmFsdWUgKi8NCj4gIAkvKiBNVVhfSURMRV9BU19JUywg
TVVYX0lETEVfRElTQ09OTkVDVCBvciA+PSAwIGZvciBjaGFubmVsICovDQo+IC0JczggaWRsZV9z
dGF0ZTsNCj4gKwlzMzIgaWRsZV9zdGF0ZTsNCj4gIA0KPiAgCXN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQ7DQo+ICANCj4gQEAgLTI1Niw3ICsyNTYsNyBAQCBzdGF0aWMgaW50IHBjYTk1NHhfZGVz
ZWxlY3RfbXV4KHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGMsIHUzMiBjaGFuKQ0KPiAgew0KPiAg
CXN0cnVjdCBwY2E5NTR4ICpkYXRhID0gaTJjX211eF9wcml2KG11eGMpOw0KPiAgCXN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQgPSBkYXRhLT5jbGllbnQ7DQo+IC0JczggaWRsZV9zdGF0ZTsNCj4g
KwlzMzIgaWRsZV9zdGF0ZTsNCj4gIA0KPiAgCWlkbGVfc3RhdGUgPSBSRUFEX09OQ0UoZGF0YS0+
aWRsZV9zdGF0ZSk7DQo+ICAJaWYgKGlkbGVfc3RhdGUgPj0gMCkNCj4gQEAgLTQwMiw2ICs0MDIs
MjUgQEAgc3RhdGljIHZvaWQgcGNhOTU0eF9jbGVhbnVwKHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11
eGMpDQo+ICAJaTJjX211eF9kZWxfYWRhcHRlcnMobXV4Yyk7DQo+ICB9DQo+ICANCj4gK3N0YXRp
YyBpbnQgcGNhOTU0eF9pbml0KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBwY2E5
NTR4ICpkYXRhKQ0KPiArew0KPiArCS8qDQo+ICsJICogV3JpdGUgdGhlIG11eCByZWdpc3RlciBh
dCBhZGRyIHRvIHZlcmlmeQ0KPiArCSAqIHRoYXQgdGhlIG11eCBpcyBpbiBmYWN0IHByZXNlbnQu
IFRoaXMgYWxzbw0KPiArCSAqIGluaXRpYWxpemVzIHRoZSBtdXggdG8gZGlzY29ubmVjdGVkIHN0
YXRlLg0KPiArCSAqLw0KDQpUaGlzIGNvbW1lbnQgYmVsb25ncyBpbiBwY2E5NTR4X3Byb2JlLCBi
ZWZvcmUgdGhlIGNhbGwgdG8gdGhpcyBmdW5jdGlvbi4NCkhvd2V2ZXIsIHRoZSBjb21tZW50IG1h
eSBub3cgYmUgYmUgd3Jvbmcgc2luY2UgdGhlIG11eCBpcyBub3QgYWx3YXlzDQppbml0aWFsaXpl
ZCB0byB0aGUgZGlzY29ubmVjdGVkIHN0YXRlLg0KDQo+ICsJaWYgKGRhdGEtPmlkbGVfc3RhdGUg
Pj0gMCkgew0KPiArCQkvKiBBbHdheXMgZW5hYmxlIG11bHRpcGxleGVyICovDQoNCldoaWxlIEkg
dW5kZXJzdGFuZCB0aGF0IGl0IGlzIGltcG9ydGFudCBmb3IgeW91ciBjYXNlIHRoYXQgdGhlIG11
eCBpcw0KYWx3YXlzIGVuYWJsZWQsIHRoaXMgaXMganVzdCBhIHNpZGUgZWZmZWN0IG9mIGhhdmlu
ZyBhIHNwZWNpZmljDQppZGxlLXN0YXRlLiBJIHN1Z2dlc3QgdGhhdCB5b3UgcmVtb3ZlIHRoaXMg
Y29tbWVudC4NCg0KPiArCQlpZiAoZGF0YS0+Y2hpcC0+bXV4dHlwZSA9PSBwY2E5NTR4X2lzbXV4
KQ0KPiArCQkJZGF0YS0+bGFzdF9jaGFuID0gZGF0YS0+aWRsZV9zdGF0ZSB8IGRhdGEtPmNoaXAt
PmVuYWJsZTsNCj4gKwkJZWxzZQ0KPiArCQkJZGF0YS0+bGFzdF9jaGFuID0gMSA8PCBkYXRhLT5p
ZGxlX3N0YXRlOw0KDQpUaGUgbWVhdCBvZiB0aGlzICJpZiIgaXMgc3RpbGwgZHVwbGljYXRlZCwg
SSB3YXMgc3VnZ2VzdGluZyBhIGhlbHBlcg0KdGhhdCBvbmx5IGRpZCB0aGUgcmVndmFsIGNhbGN1
bGF0aW9uIHNvIHRoYXQgdGhlIG5ldyBoZWxwZXIgY291bGQNCmFsc28gYmUgdXNlZCBmcm9tIHBj
YTk1NHhfc2VsZWN0X2NoYW4uDQoNCj4gKwl9IGVsc2Ugew0KPiArCQkvKiBEaXNjb25uZWN0IG11
bHRpcGxleGVyICovDQo+ICsJCWRhdGEtPmxhc3RfY2hhbiA9IDA7IC8qIGZvcmNlIHRoZSBmaXJz
dCBzZWxlY3Rpb24gKi8NCg0KVGhlc2UgdHdvIGNvbW1lbnRzIHNob3VsZCBiZSBjb21iaW5lZC4N
Cg0KPiArCX0NCj4gKwlyZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGUoY2xpZW50LCBkYXRhLT5s
YXN0X2NoYW4pOw0KPiArfQ0KPiAgLyoNCj4gICAqIEkyQyBpbml0L3Byb2JpbmcvZXhpdCBmdW5j
dGlvbnMNCj4gICAqLw0KPiBAQCAtNDExLDcgKzQzMCw2IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAgCXN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50
LT5kZXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLQli
b29sIGlkbGVfZGlzY29ubmVjdF9kdDsNCj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0KPiAg
CXN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGM7DQo+ICAJc3RydWN0IHBjYTk1NHggKmRhdGE7DQo+
IEBAIC00NjIsMjIgKzQ4MCwxOCBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcHJvYmUoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiAtCS8qIFdyaXRlIHRoZSBt
dXggcmVnaXN0ZXIgYXQgYWRkciB0byB2ZXJpZnkNCj4gLQkgKiB0aGF0IHRoZSBtdXggaXMgaW4g
ZmFjdCBwcmVzZW50LiBUaGlzIGFsc28NCj4gLQkgKiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGRp
c2Nvbm5lY3RlZCBzdGF0ZS4NCj4gLQkgKi8NCj4gLQlpZiAoaTJjX3NtYnVzX3dyaXRlX2J5dGUo
Y2xpZW50LCAwKSA8IDApIHsNCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJpZGxl
LXN0YXRlIiwgJmRhdGEtPmlkbGVfc3RhdGUpKQ0KPiArCQlkYXRhLT5pZGxlX3N0YXRlID0gTVVY
X0lETEVfQVNfSVM7DQo+ICsNCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJj
LW11eC1pZGxlLWRpc2Nvbm5lY3QiKSkNCj4gKwkJZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExF
X0RJU0NPTk5FQ1Q7DQoNCkkgdGhpbmsgeW91IHNob3VsZCBpZ25vcmUgaTJjLW11eC1pZGxlLWRp
c2Nvbm5lY3QgaWYgaWRsZS1zdGF0ZSBpcyBwcmVzZW50Lg0KSS5lLiBtb3ZlIHRoaXMgImlmIiBz
dGF0ZW1lbnQgaW50byB0aGUgYm9keSBvZiB0aGUgZm9ybWVyICJpZiIuIEFsc28sIHlvdSBoYXZl
DQpicm9rZW4gdGhpbmdzIGlmIG5wIGlzIE5VTEwuDQoNCkNoZWVycywNClBldGVyDQoNCj4gKw0K
PiArCXJldCA9IHBjYTk1NHhfaW5pdChjbGllbnQsIGRhdGEpOw0KPiArCWlmIChyZXQgPCAwKSB7
DQo+ICAJCWRldl93YXJuKGRldiwgInByb2JlIGZhaWxlZFxuIik7DQo+ICAJCXJldHVybiAtRU5P
REVWOw0KPiAgCX0NCj4gIA0KPiAtCWRhdGEtPmxhc3RfY2hhbiA9IDA7CQkgICAvKiBmb3JjZSB0
aGUgZmlyc3Qgc2VsZWN0aW9uICovDQo+IC0JZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FT
X0lTOw0KPiAtDQo+IC0JaWRsZV9kaXNjb25uZWN0X2R0ID0gbnAgJiYNCj4gLQkJb2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5wLCAiaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QiKTsNCj4gLQlpZiAoaWRs
ZV9kaXNjb25uZWN0X2R0KQ0KPiAtCQlkYXRhLT5pZGxlX3N0YXRlID0gTVVYX0lETEVfRElTQ09O
TkVDVDsNCj4gIA0KPiAgCXJldCA9IHBjYTk1NHhfaXJxX3NldHVwKG11eGMpOw0KPiAgCWlmIChy
ZXQpDQo+IEBAIC01MzEsOCArNTQ1LDcgQEAgc3RhdGljIGludCBwY2E5NTR4X3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ICAJc3RydWN0IGkyY19tdXhfY29yZSAqbXV4YyA9IGkyY19nZXRf
Y2xpZW50ZGF0YShjbGllbnQpOw0KPiAgCXN0cnVjdCBwY2E5NTR4ICpkYXRhID0gaTJjX211eF9w
cml2KG11eGMpOw0KPiAgDQo+IC0JZGF0YS0+bGFzdF9jaGFuID0gMDsNCj4gLQlyZXR1cm4gaTJj
X3NtYnVzX3dyaXRlX2J5dGUoY2xpZW50LCAwKTsNCj4gKwlyZXR1cm4gcGNhOTU0eF9pbml0KGNs
aWVudCwgZGF0YSk7DQo+ICB9DQo+ICAjZW5kaWYNCj4gIA0KPiANCg0K
