Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF58D66C8
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 18:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387788AbfJNQDP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 12:03:15 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com ([40.107.4.97]:62382
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731121AbfJNQDP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 12:03:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXKPFz9wn+140mkvmGoJcuKbX1E7g3DwjoY/4GJ6tri5nHZuhkcG8Ydhdj1F4ReevyV4MsAwdLas1FvWBQJp8uUfDClC/Vl7BymqG6+DazPhAAtbqO7BuEwNX0FyzY1cHfuIsoOYRa0IB+Z/++/hSVPjJHffYxJmyehe7CyQttN0g/wNjjyx4EpYvr+u+93ip1bQzNzIWnm96FvHeRXW/2l80gh9/7mWz+Q8xUiUlpfKFHeGDmf2qmuzm3tRFxukkqzSJIivQjSnnnMzeZwds49n9++OGVE2P93YT5//RY6JJch38egEMWA08U6gesev4I16NWmGxo2oW2mE0+9+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zucszaihl+GbUVBc57PKGKMU0qGBvYb3O+EmxZBoi8o=;
 b=IkmaV1YsgK0wUAo2xbflEw72DLCPM8uYVxv4eSkU/iUa7H5znqaXcarGE2ZAlhqop24fbNA/qNDQNL0oMFp2jVXzZTfoqcB7vana2MXkGSp4VaDC3NHQSMTsLVImd116h5bX09sD5+RwUssfmrxbXZkQ6e30cYZ/no1eAtMYYtZHBNlE4awgB4Cp1vULcINPeJmDydbGUgivXYEb71C4muDnl2xdEILTGdzczpvA/WRzSCTXJRl0B9npOT+1lBZ1r1hUlEPipEp1SfGpqzKzQL5ZOl0lDEYPXp+cv+G7ZH3OEL8lS8yMYn8iUvJMDvXLa0UNOnAfFal9kUX5BgUANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zucszaihl+GbUVBc57PKGKMU0qGBvYb3O+EmxZBoi8o=;
 b=e52IMIdSKe5/3Ov9QlgQf0PYOEzF6SB/O2MHaRV4WoO//sp7mIQ+roYmrXWBeKTEZ5mH/cLU/H8ovY29Tg+pZoeuw+UppW7PeZZxPvJHj8+XSMHVDMgEdkxi8njkKEMAxguNTgitVEMPHfYxH0l4BhKiq7sClELHUgSi9RtcH5s=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3420.eurprd02.prod.outlook.com (52.134.67.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Mon, 14 Oct 2019 16:03:08 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 16:03:08 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: mux: pca954x: replace property
 i2c-mux-idle-disconnect
Thread-Topic: [PATCH 2/2] i2c: mux: pca954x: replace property
 i2c-mux-idle-disconnect
Thread-Index: AQHVgoOwuGwiZvbWgkysXvGwIem+86daTLCA
Date:   Mon, 14 Oct 2019 16:03:08 +0000
Message-ID: <f3d1e68e-dfb0-b820-7797-1f0d95fa72dd@axentia.se>
References: <20191014112558.3881-1-biwen.li@nxp.com>
 <20191014112558.3881-2-biwen.li@nxp.com>
In-Reply-To: <20191014112558.3881-2-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0278.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::30) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d2446e-eebf-405b-09b0-08d750c0015b
x-ms-traffictypediagnostic: DB3PR0202MB3420:
x-microsoft-antispam-prvs: <DB3PR0202MB34204929A8C6B19DEED855EDBC900@DB3PR0202MB3420.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(14444005)(81166006)(8676002)(81156014)(14454004)(31686004)(8936002)(64756008)(66476007)(66946007)(256004)(65956001)(65806001)(66066001)(2501003)(66556008)(66446008)(4001150100001)(71190400001)(71200400001)(36756003)(7736002)(99286004)(305945005)(4326008)(186003)(26005)(76176011)(52116002)(102836004)(6506007)(6512007)(5660300002)(25786009)(6436002)(386003)(486006)(6246003)(229853002)(6486002)(476003)(53546011)(446003)(3846002)(2906002)(11346002)(6116002)(2616005)(316002)(54906003)(58126008)(110136005)(31696002)(86362001)(508600001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3420;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H6Sxe1o0kaJGmx+8gDySHQQdWeRiTRg2b25cMvS+3QnkakM7tzvqPwrCmHUoDg1djjcRxJ9cphU36NemNwnb7BgtEQZuYCfS0gvKxGmApzfAHsIEL2fgFBitCxKNHmaa3XwmdFRoiNNTq9BV9kYSdnb7yCdKJzPI8zAi6fIpk2k6afVEvp9vmfv9+8qycfOB4ptokpZCDCDfxV5SLmd+8+1W1cPpt531jdvfXWtcUDm7jJMiji+d8DNy1c5ghVwdIP8+a/KujiQhZnQaxPWtXfHxmrd14CIf0DU756Sx4oWV7TqYi/gLMK9PiELPOwSiM50q5YbkhfjZ2NEO9+6EWDzv35UAk3W4f1XdIpKsfpjqQbYOO64VKrUUBddTNhKzAsevU1IBaebr4rhew3lW0NnmmAw7ILTkSy2Sj0x23rc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B1EEB71A60CDE4BB57CD775493845DE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d2446e-eebf-405b-09b0-08d750c0015b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 16:03:08.5489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ba8kxxngNaJO3wKRHhjbBtiHEswvwuvBW4mMfNYz6xFsKsDo+gZo7pbNbXjdD5ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3420
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNCAxMzoyNSwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgcmVwbGFjZXMgcHJv
cGVydHkgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3Qgd2l0aCBpZGxlLXN0YXRlDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4
LmMgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiBpbmRleCA5MjNhYTNh
NWEzZGMuLmEzMzA5MjljNGQ2NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1wY2E5NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4
LmMNCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RydWN0IHBjYTk1NHggew0KPiAgDQo+ICAJdTggbGFz
dF9jaGFuOwkJLyogbGFzdCByZWdpc3RlciB2YWx1ZSAqLw0KPiAgCS8qIE1VWF9JRExFX0FTX0lT
LCBNVVhfSURMRV9ESVNDT05ORUNUIG9yID49IDAgZm9yIGNoYW5uZWwgKi8NCj4gLQlzOCBpZGxl
X3N0YXRlOw0KPiArCXMzMiBpZGxlX3N0YXRlOw0KPiAgDQo+ICAJc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudDsNCj4gIA0KPiBAQCAtMjU2LDcgKzI1Niw3IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9k
ZXNlbGVjdF9tdXgoc3RydWN0IGkyY19tdXhfY29yZSAqbXV4YywgdTMyIGNoYW4pDQo+ICB7DQo+
ICAJc3RydWN0IHBjYTk1NHggKmRhdGEgPSBpMmNfbXV4X3ByaXYobXV4Yyk7DQo+ICAJc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCA9IGRhdGEtPmNsaWVudDsNCj4gLQlzOCBpZGxlX3N0YXRlOw0K
PiArCXMzMiBpZGxlX3N0YXRlOw0KPiAgDQo+ICAJaWRsZV9zdGF0ZSA9IFJFQURfT05DRShkYXRh
LT5pZGxlX3N0YXRlKTsNCj4gIAlpZiAoaWRsZV9zdGF0ZSA+PSAwKQ0KPiBAQCAtNDExLDcgKzQx
MSw2IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LA0KPiAgCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCj4gIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2Rl
ICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLQlib29sIGlkbGVfZGlzY29ubmVjdF9kdDsNCj4gIAlz
dHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0KPiAgCXN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGM7DQo+
ICAJc3RydWN0IHBjYTk1NHggKmRhdGE7DQo+IEBAIC00NjIsMjIgKzQ2MSwzMSBAQCBzdGF0aWMg
aW50IHBjYTk1NHhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gIAkJfQ0KPiAg
CX0NCj4gIA0KPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImlkbGUtc3RhdGUiLCAm
ZGF0YS0+aWRsZV9zdGF0ZSkpDQo+ICsJCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9BU19J
UzsNCj4gKw0KPiAgCS8qIFdyaXRlIHRoZSBtdXggcmVnaXN0ZXIgYXQgYWRkciB0byB2ZXJpZnkN
Cj4gIAkgKiB0aGF0IHRoZSBtdXggaXMgaW4gZmFjdCBwcmVzZW50LiBUaGlzIGFsc28NCj4gIAkg
KiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGRpc2Nvbm5lY3RlZCBzdGF0ZS4NCj4gIAkgKi8NCj4g
LQlpZiAoaTJjX3NtYnVzX3dyaXRlX2J5dGUoY2xpZW50LCAwKSA8IDApIHsNCj4gKwlpZiAoZGF0
YS0+aWRsZV9zdGF0ZSA+PSAwKXsNCg0KU3BhY2UgYmVmb3JlIHsNCg0KPiArCQlkYXRhLT5sYXN0
X2NoYW4gPSBkYXRhLT5pZGxlX3N0YXRlOw0KDQpkYXRhLT5sYXN0X2NoYW4gc2hvdWxkIGhhdmUg
dGhlIGFjdHVhbCByZWdpc3RlciB2YWx1ZSwgaS5lLiAodW50ZXN0ZWQpDQoNCgkJaWYgKGRhdGEt
PmNoaXAtPm11eHR5cGUgPT0gcGNhOTU0eF9pc211eCkNCgkJCWRhdGEtPmxhc3RfY2hhbiA9IGRh
dGEtPmlkbGVfc3RhdGUgfCBkYXRhLT5jaGlwLT5lbmFibGU7DQoJCWVsc2UNCgkJCWRhdGEtPmxh
c3RfY2hhbiA9IDEgPDwgZGF0YS0+aWRsZV9zdGF0ZTsNCg0KCQlyZXQgPSBpMmNfc21idXNfd3Jp
dGVfYnl0ZShjbGllbnQsIGRhdGEtPmxhc3RfY2hhbik7DQoNCkJ1dCBzaW5jZSB0aGlzIHJlZ3Zh
bCBjYWxjdWxhdGlvbiBpcyBub3cgbmVlZGVkIGluIHRocmVlIHBsYWNlcywgaXQgc2hvdWxkDQpi
ZSBtb3ZlZCB0byBhIGhlbHBlciBmdW5jdGlvbi4NCg0KPiArCQkvKiBBbHdheXMgZW5hYmxlIG11
bHRpcGxleGVyICovDQo+ICsJCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwgZGF0
YS0+bGFzdF9jaGFuIHwNCj4gKwkJCQkoZGF0YS0+Y2hpcC0+bXV4dHlwZSA9PSBwY2E5NTR4X2lz
bXV4ID8NCj4gKwkJCQkgZGF0YS0+Y2hpcC0+ZW5hYmxlIDogMCkpOw0KPiArCX0NCj4gKwllbHNl
ew0KDQpTcGFjZSBiZWZvcmUgew0KDQpOYXR1cmFsbHksIHlvdSBoYXZlIHRoZSBleGFjdCBzYW1l
IGlzc3VlcyBpbiB0aGUgcGNhOTU0eF9yZXN1bWUgaHVuaywgYmVsb3cuDQoNCj4gKwkJZGF0YS0+
bGFzdF9jaGFuID0gMDsJCSAgIC8qIGZvcmNlIHRoZSBmaXJzdCBzZWxlY3Rpb24gKi8NCj4gKwkJ
LyogRGlzY29ubmVjdCBtdWx0aXBsZXhlciAqLw0KPiArCQlyZXQgPSBpMmNfc21idXNfd3JpdGVf
Ynl0ZShjbGllbnQsIGRhdGEtPmxhc3RfY2hhbik7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHJldCA8
IDApIHsNCj4gIAkJZGV2X3dhcm4oZGV2LCAicHJvYmUgZmFpbGVkXG4iKTsNCj4gIAkJcmV0dXJu
IC1FTk9ERVY7DQo+ICAJfQ0KPiAgDQo+IC0JZGF0YS0+bGFzdF9jaGFuID0gMDsJCSAgIC8qIGZv
cmNlIHRoZSBmaXJzdCBzZWxlY3Rpb24gKi8NCj4gLQlkYXRhLT5pZGxlX3N0YXRlID0gTVVYX0lE
TEVfQVNfSVM7DQo+IC0NCj4gLQlpZGxlX2Rpc2Nvbm5lY3RfZHQgPSBucCAmJg0KPiAtCQlvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJpMmMtbXV4LWlkbGUtZGlzY29ubmVjdCIpOw0KPiAtCWlm
IChpZGxlX2Rpc2Nvbm5lY3RfZHQpDQo+IC0JCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9E
SVNDT05ORUNUOw0KDQpJbiBjYXNlIHRoZSBpZGxlLXN0YXRlIHByb3BlcnR5IGlzIG1pc3Npbmcs
IHlvdSBuZWVkIHRvIGZhbGwgYmFjayB0byB0aGUNCm9sZCBiZWhhdmlvciBhbmQgaGFuZGxlIGky
Yy1tdXgtaWRsZS1kaXNjb25uZWN0IGFzIGJlZm9yZS4NCg0KQ2hlZXJzLA0KUGV0ZXINCg0KPiAg
DQo+ICAJcmV0ID0gcGNhOTU0eF9pcnFfc2V0dXAobXV4Yyk7DQo+ICAJaWYgKHJldCkNCj4gQEAg
LTUzMSw4ICs1MzksMTggQEAgc3RhdGljIGludCBwY2E5NTR4X3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQo+ICAJc3RydWN0IGkyY19tdXhfY29yZSAqbXV4YyA9IGkyY19nZXRfY2xpZW50ZGF0
YShjbGllbnQpOw0KPiAgCXN0cnVjdCBwY2E5NTR4ICpkYXRhID0gaTJjX211eF9wcml2KG11eGMp
Ow0KPiAgDQo+IC0JZGF0YS0+bGFzdF9jaGFuID0gMDsNCj4gLQlyZXR1cm4gaTJjX3NtYnVzX3dy
aXRlX2J5dGUoY2xpZW50LCAwKTsNCj4gKwlpZiAoZGF0YS0+aWRsZV9zdGF0ZSA+PSAwKXsNCj4g
KwkJZGF0YS0+bGFzdF9jaGFuID0gZGF0YS0+aWRsZV9zdGF0ZTsNCj4gKwkJLyogQWx3YXlzIGVu
YWJsZSBtdWx0aXBsZXhlciAqLw0KPiArCQlyZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGUoY2xp
ZW50LCBkYXRhLT5sYXN0X2NoYW4gfA0KPiArCQkJCShkYXRhLT5jaGlwLT5tdXh0eXBlID09IHBj
YTk1NHhfaXNtdXggPw0KPiArCQkJCSBkYXRhLT5jaGlwLT5lbmFibGUgOiAwKSk7DQo+ICsJfQ0K
PiArCWVsc2V7DQo+ICsJCWRhdGEtPmxhc3RfY2hhbiA9IDA7DQo+ICsJCS8qIERpc2Nvbm5lY3Qg
bXVsdGlwbGV4ZXIgKi8NCj4gKwkJcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlKGNsaWVudCwg
ZGF0YS0+bGFzdF9jaGFuKTsNCj4gKwl9DQo+ICB9DQo+ICAjZW5kaWYNCj4gIA0KPiANCg0K
