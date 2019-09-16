Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864C9B3724
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2019 11:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbfIPJ3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Sep 2019 05:29:31 -0400
Received: from mail-eopbgr20113.outbound.protection.outlook.com ([40.107.2.113]:59552
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730020AbfIPJ3b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Sep 2019 05:29:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNqBa5+a/jtceRrkyKvkwDuLGXLuYKmGSi+Azp4vJDn78DK4Pr6at+2JEbjfoC3cftiJEZ4cr8wbdfpkKJTFtg6htguu2ug0BrtgUjwTaM8gw/XRa7kf7+0jyt/kdz8mFGsDg9jRPYwwNi30mKFRgmpac80/Qbvc+xDZTC9rgnDcnogOybA8/nnZgfgSqknxlbWlzrYYrKN5oXjrM26/ZkcWkHKJ49hL56njO2QgsKHvikL14J2hJo9QeokL4cNF5mwKei97fvWlyzOKwSu0PK2IUJhWw34oUE4NWbyv51Hm/b29GAzYgEhzsBiE6f1DNVO0Gyp0mzHbOwWek0v4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYb9NywJ0l4v2lplIUW/TeVRy/kB0HFQFrLJ6w8slxQ=;
 b=AG6avP4seCILB4TjDzRTvScdt8zxcdTnH7h1bWxQYz1yLFWjXdx+Ndnc1aMIQRQAPNHaKFBy/lZthnIM1WB5eaA1sgLjyd0VwNOr8rz8UquhFbqjApKn0rsjREtYhXAE6I/TgmVw/giKgFdrM6ph3fszTanUAoyTAFoX0c54JkuUR510p+rq0uYAPvSVmU9iVOMSSzlbNGDd1gGXPxL1YHQ31gLM2/WMNC8fZC5CcQKGp51spn5Fmz0d4BcCRQFJldE5mnCZuoZnG5GqF5OLRKrO7LLMmY/dbfW4FJdVlzDRJqbx6KOuL9vgKvRgyFVbXimR1/rG41HjEkE0ixIwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYb9NywJ0l4v2lplIUW/TeVRy/kB0HFQFrLJ6w8slxQ=;
 b=BDFW/DHxxe6YprSbzDC3lOcEuG8c+0U6Y0y9zt+k2lSW7oErfaSepi9A31lUV5pRT2wo0lGtltwWTdSzjqtjhPrFmYupK4ltiLth06G+vm8iV8GdKbaRrlu87DCbnsnFhz580C9nC0btHd39fEGBq89hHKGkUnGNLyTry7eyO1U=
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com (52.133.24.149) by
 AM6PR0702MB3799.eurprd07.prod.outlook.com (52.133.23.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.17; Mon, 16 Sep 2019 09:29:28 +0000
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::892c:2b90:e54f:ab56]) by AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::892c:2b90:e54f:ab56%3]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 09:29:28 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>
CC:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Topic: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Index: AQHVYf2CtQ6bNeFFV0qdOS3acGbEtQ==
Date:   Mon, 16 Sep 2019 09:29:27 +0000
Message-ID: <d7dce94a-d857-dc1e-1917-d715940bc356@nokia.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
 <20190828155822.7cb13a7b@endymion>
 <a6cd1872effd46c7ba088f28402b32b8@nokia-sbell.com>
 <20190905145716.137e155a@endymion>
In-Reply-To: <20190905145716.137e155a@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.167]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: HE1PR0402CA0006.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::16) To AM6PR0702MB3527.eurprd07.prod.outlook.com
 (2603:10a6:209:11::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 317dbf5b-68e8-4fa9-af47-08d73a885edf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM6PR0702MB3799;
x-ms-traffictypediagnostic: AM6PR0702MB3799:
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0702MB379919EDCA55FB4CCFAA11BF888C0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(189003)(58126008)(14444005)(2906002)(66446008)(64756008)(66556008)(66476007)(66946007)(8936002)(81166006)(8676002)(81156014)(6116002)(31686004)(256004)(486006)(3846002)(7736002)(305945005)(31696002)(86362001)(65806001)(65956001)(66066001)(53936002)(6512007)(6246003)(14454004)(6506007)(53546011)(25786009)(478600001)(386003)(6486002)(229853002)(36756003)(6436002)(76176011)(71190400001)(71200400001)(26005)(5660300002)(99286004)(102836004)(52116002)(4744005)(186003)(54906003)(446003)(2616005)(476003)(11346002)(110136005)(316002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0702MB3799;H:AM6PR0702MB3527.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7M8mwm7q3PSv0kT3l7ZQy/3+RUNLj9+e01z6t0CaWf3WMBhT7NYxY1bp/3TmSvVrdyfrKe14yBAyVRpLJ/YFoK+qyVg1IKJRVB80cpW8tmQQjS7UDCQIVnExM3YYH0uIk9DpFPrtNkZw69zqzrCEyx8ja7mLJOKjG/SA3lGgnEXsuLuFyacYQSHZft8YGs3qOjs1evKNlCAmdqAFh54Vr8XC3GbKIvSW0GuBTJi5MmXY3J2HFL2/Ota3NktkP1mRhA9jftHKRzKhKWvyxy9SOZdacW+bZJgaHJocbV9pnGc9rZmI/XH88+1ek1Cb1hVO9neOfTwyiSx64Mq1/+Et5LUb7rizIq0axh6Ratc2a5pnV+PqXI6xqok1JlskCOYn68cXkBfO8SRE8tAfws6njWiqyGnw0hiEZT3HbKEIFz8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21C9BBA62CE96C4F957140A2A0952C3E@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317dbf5b-68e8-4fa9-af47-08d73a885edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 09:29:27.9514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sVi3afV+8eKhA8Mx7P/ki86y5y2+60OY7u6BERebAQTnI3uyjPexcutFwqvkB0XjBmf7Xe9orudrDPNRnzwy5V8Gk3rWRXPJNhSR1pk2RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3799
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgSmVhbiwNCg0KT24gMDUvMDkvMjAxOSAxNDo1NywgSmVhbiBEZWx2YXJlIHdyb3RlOg0KPiBJ
ZiB0aGlzIGlzIG9mIGFueSB2YWx1ZSB0byB5b3UsIEkgdHJpZWQgaW1wbGVtZW50aW5nIGl0IGlu
IGkyYy1pODAxIGENCj4gZmV3IGRheXMgYWdvLiBJIGNhbid0IHJlYWxseSB0ZXN0IGl0IHRob3Vn
aCBhcyBJIGRvbid0IGhhdmUgYW55IGRldmljZQ0KPiB3aGljaCB0cmlnZ2VycyBhbiBhbGVydCBv
biBteSBzeXN0ZW0sIGJ1dCBJIGFtIHNoYXJpbmcgaXQgd2l0aCB5b3UgaWYNCj4geW91IHdhbnQg
dG8gZ2l2ZSBpdCBhIHRyeS4gWW91IHdvdWxkIHN0aWxsIG5lZWQgdG8gd3JpdGUgdGhlIGNvZGUg
aW4NCj4gdGhlIHNsYXZlIGRyaXZlci4NCg0KYW5kIEkgZm9yZ290IGFub3RoZXIgaXNzdWU6DQoN
Cj4gQEAgLTE4OTcsOCArMTk1NiwxMCBAQCBzdGF0aWMgdm9pZCBpODAxX3JlbW92ZShzdHJ1Y3Qg
cGNpX2RldiAqDQo+ICAJcG1fcnVudGltZV9mb3JiaWQoJmRldi0+ZGV2KTsNCj4gIAlwbV9ydW50
aW1lX2dldF9ub3Jlc3VtZSgmZGV2LT5kZXYpOw0KPiAgDQo+IC0JaTgwMV9kaXNhYmxlX2hvc3Rf
bm90aWZ5KHByaXYpOw0KPiArCWk4MDFfcmVzdG9yZV9zbHZjbWQocHJpdik7DQo+ICAJaTgwMV9k
ZWxfbXV4KHByaXYpOw0KPiArCWlmIChwcml2LT5hcmEpDQo+ICsJCWkyY191bnJlZ2lzdGVyX2Rl
dmljZShwcml2LT5hcmEpOw0KDQp0byBtZSBpdCBsb29rcyBsaWtlIGEgcmFjZSB3aXRoIElSUSBo
YW5kbGVyIChJUlEgaXMgb25seSBkaXNhYmxlZCAqYWZ0ZXIqDQpyZW1vdmUoKSksIGl0IGNhbiBz
dGlsbCBhdHRlbXB0IHRvIHVzZSBmcmVlZCBBUkEgZGV2aWNlIGFmdGVyIHRoaXMgbGluZS4gDQoN
Cj4gIAlpMmNfZGVsX2FkYXB0ZXIoJnByaXYtPmFkYXB0ZXIpOw0KPiAgCWk4MDFfYWNwaV9yZW1v
dmUocHJpdik7DQo+ICAJcGNpX3dyaXRlX2NvbmZpZ19ieXRlKGRldiwgU01CSFNUQ0ZHLCBwcml2
LT5vcmlnaW5hbF9oc3RjZmcpOw0KDQotLSANCkJlc3QgcmVnYXJkcywNCkFsZXhhbmRlciBTdmVy
ZGxpbi4NCg==
