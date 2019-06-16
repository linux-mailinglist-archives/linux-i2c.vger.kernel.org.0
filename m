Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D377473E6
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2019 11:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfFPJDE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jun 2019 05:03:04 -0400
Received: from mail-eopbgr80124.outbound.protection.outlook.com ([40.107.8.124]:36066
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbfFPJDD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jun 2019 05:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlaDaXM8+j6aE5XeTEVciz5yp9afL8oRB+ZiQuq6gq8=;
 b=S9i3Z4e2jzW4y+YFuJCe9xXq3+CuxzPbOI+v2DgYquzqkkmLrYhUohaDJ49K9UlVv2mRI+tIXg6pmKho+SAzJ4G8YaV8kxqv3yfqEcxX17HagE3USvGg8N2QsjjXHSo2/EjJfIHSZEdRQ6zsG8WbZgcDeq/p1qO4IJWmmXqWW7M=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3372.eurprd02.prod.outlook.com (52.134.73.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Sun, 16 Jun 2019 09:02:59 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.014; Sun, 16 Jun 2019
 09:02:59 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Jean Delvare <jdelvare@suse.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux-gpio: Use "mux" con_id to find channel GPIOs
Thread-Topic: [PATCH] i2c: mux-gpio: Use "mux" con_id to find channel GPIOs
Thread-Index: AQHVIvsMA247pC4cl0e/+FehWq9+xqacmQuAgADD2YCAAKGyAA==
Date:   Sun, 16 Jun 2019 09:02:59 +0000
Message-ID: <ed6362c5-4d8a-456b-4e13-0f0531105018@axentia.se>
References: <20190614214748.2389-1-fancer.lancer@gmail.com>
 <CAHp75VcwP8DzhqfOn=cbcRQtd8WrnuoFPT6GCU754drTZePheg@mail.gmail.com>
 <20190615232406.ni3ausfjaz5qowib@mobilestation>
In-Reply-To: <20190615232406.ni3ausfjaz5qowib@mobilestation>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR08CA0056.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::27) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 425e2664-da6d-4c1d-0ade-08d6f2396de9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3372;
x-ms-traffictypediagnostic: DB3PR0202MB3372:
x-microsoft-antispam-prvs: <DB3PR0202MB33729581193BC24C040C3176BCE80@DB3PR0202MB3372.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-forefront-prvs: 0070A8666B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(8676002)(476003)(2906002)(14454004)(256004)(74482002)(53546011)(6506007)(386003)(64126003)(14444005)(81166006)(86362001)(73956011)(53936002)(102836004)(31696002)(65806001)(71200400001)(71190400001)(65956001)(54906003)(58126008)(4326008)(66946007)(110136005)(305945005)(11346002)(316002)(186003)(486006)(3846002)(52116002)(2616005)(66476007)(66556008)(26005)(446003)(7736002)(66446008)(6116002)(6512007)(99286004)(64756008)(508600001)(31686004)(6486002)(25786009)(6436002)(8936002)(5660300002)(65826007)(7416002)(68736007)(36756003)(81156014)(229853002)(66066001)(6246003)(76176011)(37363001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3372;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GKNH3I3rZAbSAcyWzamLSyYb86l5owfeeH/vxskpaZJBLHAYrgXv+20bTSCAcpq8HbHtxcBxkC0ozmlKMXM9AlYmN07wUAMd1VSTKZKWl60LqHqzwNYUFwfelpbe/rCKLvPUB8fZVB0Er40eLTE+jOz1d5ThENFZRgQKVh3cmy76jOd76Il7FsljtnIR16OEllgO/VfuASO+DTjSTunSUy+Q8vfhOjD1/0VdxTxpfQ9GZj68+D9F+QUpNxv0JgAQ2oMba9zRnnyZ+FySGsDLwsy/fpn2VWZk5px6j9mIL1X1PBDJCvK9gK9Y7AevY4+aAA3lq7Id7xHfQheoP5za+Oy3dy06YKMK9CvNUcEERxkVjyD8ErkMjXJAm+PnAVy5GDWrlr8/mRERvxTn0uXjwCod1v2Ma1fDhUOL+3H+YbA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68F8486A23654344898961D93B04DB41@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 425e2664-da6d-4c1d-0ade-08d6f2396de9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2019 09:02:59.4978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3372
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0xNiAwMToyNCwgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IE9uIFNhdCwgSnVuIDE1
LCAyMDE5IGF0IDAyOjQzOjA5UE0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+IE9u
IFNhdCwgSnVuIDE1LCAyMDE5IGF0IDEyOjUxIEFNIFNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2Vy
QGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBSZWNlbnQgcGF0Y2ggLSAoImkyYzogbXV4L2k4
MDE6IFN3aXRjaCB0byB1c2UgZGVzY3JpcHRvciBwYXNzaW5nIikNCj4+PiBhbHRlcmVkIHRoZSBp
MmMtbXV4LWdwaW8gZHJpdmVyIHRvIHVzZSB0aGUgR1BJTy1kZXNjcmlwdG9yDQo+Pj4gYmFzZWQg
aW50ZXJmYWNlIHRvIGZpbmQgYW5kIHJlcXVlc3QgdGhlIEdQSU9zIHRoZW4gYmVpbmcgdXRpbGl6
ZWQNCj4+PiB0byBzZWxlY3QgYW5kIGRlc2VsZWN0IHRoZSBjaGFubmVscyBvZiBHUElPLWRyaXZl
biBpMmMtbXV4ZXMuIEV2ZW4NCj4+PiB0aG91Z2ggdGhlIHByb3Bvc2VkIG1vZGlmaWNhdGlvbiB3
YXMgY29ycmVjdCBmb3IgdGhlIHBsYXRmb3JtX2RhdGEtYmFzZWQNCj4+PiBzeXN0ZW1zLCBpdCB3
YXMgaW52YWxpZCBmb3IgdGhlIE9GLWJhc2VkIG9uZXMgYW5kIGNhdXNlZCB0aGUga2VybmVsDQo+
Pj4gdG8gY3Jhc2ggYXQgdGhlIGRyaXZlciBwcm9iZSBwcm9jZWR1cmUuIFRoZXJlIHdlcmUgdHdv
IHByb2JsZW1zIHdpdGgNCj4+PiB0aGF0IG1vZGlmaWNhdGlvbi4gRmlyc3Qgb2YgYWxsIHRoZSBn
cGlvZF9jb3VudCgpIGFuZCBncGlvZF9nZXRfaW5kZXgoKQ0KPj4+IHdlcmUgY2FsbGVkIHdpdGgg
TlVMTCBjb25faWQuDQo+Pg0KPj4gSSBhbHdheXMgdGhvdWdodCB0aGF0IHRoaXMgbWVhbnMgImNv
dW50IG1lIGFsbCBHUElPJ3MgZm9yIHRoaXMgZGV2aWNlDQo+PiBkZXNwaXRlIHRoZWlyIG5hbWVz
IiBhbmQgImdldCBtZSBHUElPIGJ5IGluZGV4IGRlc3BpdGUgaXQncyBuYW1lIi4NCj4+IFdoYXQn
cyB3ZW50IHdyb25nPw0KPj4NCj4gDQo+IE5vLiBJdCdzIHdyb25nIGFzIGZhciBhcyBJIGNhbiBz
ZWUgZm9yIGtlcm5lbHMgNC40LCA0LjkgYW5kIHRoZSBtb2Rlcm4NCj4gNS4yLjAtcmNYLiBkdF9n
cGlvX2NvdW50KCkvb2ZfZmluZF9ncGlvKCl3aWxsIGFsd2F5cyB0cnkgdG8gY291bnQvcmVxdWVz
dA0KPiBlaXRoZXIgIjxjb25faWQ+LWdwaW8ocykiIG9yICJncGlvKHMpIiBHUElPcyBpbiB0aGUg
ZGV2aWNlIG9mLW5vZGUuIFdoaWxlDQo+IHBsYXRmb3JtX2dwaW9fY291bnQoKS9ncGlvZF9maW5k
KCkgd2lsbCB0YWtlIGludG8gYWNjb3VudCBHUElPcyB3aXRoIG1hdGNoaW5nDQo+IDxjb25faWQ+
J3MgZXZlbiBpZiBpdCBpcyBOVUxMLg0KDQpSaWdodCwgdGhpcyBpcyBteSByZWFkaW5nIHRvLiBG
b3IgdGhlIE9GIGNhc2UsIGdwaW9kX2NvdW50IGNhbGxzIGR0X2dwaW9fY291bnQNCndoaWNoIGhh
cyBubyB3YXkgdG8gZmluZCBncGlvcyB1bmxlc3MgdGhleSBhcmUgZXhwbGljaXRseSBuYW1lZC4g
QW5kIE5VTEwNCnNpbXBseSBtZWFucyB1bm5hbWVkICh3aGljaCBpcyBub3QgdGhlIGNhc2UgaGVy
ZSkuIFRoZSBmdW5jdGlvbiBzaW1wbHkgZG9lcw0Kbm90IGRvIGFueSB0cmF3bGluZyBmb3IgZ3Bp
b3MgaXQgaGFzIG5vdCBiZWVuIHRvbGQgYWJvdXQuDQoNCkxpbnVzLCBjYXJlIHRvIHNxdWFzaCB0
aGlzIGluY3JlbWVudGFsIGludG8geW91ciBwYXRjaCBhbmQgcmVzZW5kIHdpdGggcHJvcGVyDQpj
cmVkaXQgYWRkZWQ/DQoNCkNoZWVycywNClBldGVyDQo=
