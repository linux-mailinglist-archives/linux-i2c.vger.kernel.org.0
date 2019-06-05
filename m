Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09533631A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfFESIc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 14:08:32 -0400
Received: from mail-eopbgr60048.outbound.protection.outlook.com ([40.107.6.48]:33878
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725950AbfFESIc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 14:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJd06eHRmA4bkgOOjtkKP/nYjWTpF0Sh+AD0XPkeHiQ=;
 b=q50MpOHHDN/weE5nzS670fgkH7nxnDIazVxmxTdlAaKCOHFiNKCHgZ3Qe9IkCWH+zPj58GYUBo4Xz2XXB+mmSlTmYZ6WzyAhKGb7tr2+pVoC1NNMxl4f6sZSuX9ynPVRQ5TdzbTvFierf/iLiaYaU+MJ09mdI9yJYiV4R86+FkQ=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB4349.eurprd05.prod.outlook.com (52.133.12.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 18:08:26 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::9db8:5404:48e4:d7f2%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 18:08:26 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "minyard@acm.org" <minyard@acm.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v9 1/1] Add support for IPMB driver
Thread-Topic: [PATCH v9 1/1] Add support for IPMB driver
Thread-Index: AQHVBaaYimkGU61+4kmPqA0HiOujuqZyi7KAgAGRdiCAFmklAIACtVYg
Date:   Wed, 5 Jun 2019 18:08:26 +0000
Message-ID: <VI1PR05MB62395CD09037E588E20E30EADA160@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1557322882.git.Asmaa@mellanox.com>
 <a4d9fe418013b604e7224bf3038c294da42d5534.1557322882.git.Asmaa@mellanox.com>
 <20190519140231.GA7291@kunai>
 <VI1PR05MB623971FF6F956A091840716DDA060@VI1PR05MB6239.eurprd05.prod.outlook.com>
 <20190603201325.GC2383@kunai>
In-Reply-To: <20190603201325.GC2383@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e55b3d67-adbf-4b91-29f7-08d6e9e0ce7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR05MB4349;
x-ms-traffictypediagnostic: VI1PR05MB4349:
x-microsoft-antispam-prvs: <VI1PR05MB4349C1FD3115772160375F5FDA160@VI1PR05MB4349.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(13464003)(8936002)(2906002)(81166006)(7696005)(4326008)(76116006)(66476007)(81156014)(66446008)(64756008)(66556008)(6506007)(86362001)(102836004)(3846002)(66946007)(68736007)(33656002)(6916009)(71190400001)(6116002)(73956011)(25786009)(74316002)(6246003)(71200400001)(6436002)(26005)(256004)(14444005)(14454004)(72206003)(186003)(5660300002)(66066001)(229853002)(53936002)(8676002)(476003)(446003)(11346002)(305945005)(9686003)(55016002)(53546011)(99286004)(7736002)(80792005)(316002)(54906003)(76176011)(478600001)(52536014)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4349;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kX7gNCROuRv1JxfRfDxtmwRSKEdOTbUbdv/JsUIBf7mj1D30ySmcLo4wsR2GLhCQ5L+ESjzoxNQHglma4ZmsAOz3NmUNtuzsebN3OeQqxB6oRC04nxU8nLNzgvV9RH0iAiX5YUw9Y6IphPQPBsuPsxqs7y2vp1UdqOv1varo/uhNsbTTxawvlt7Hg4R5kjOsf0Daue3FZ3P9AfDZ01RaTT+sazsIpHYQPzR1kL3Jh0Zp5NnSZxVLSYmFBsfFc1nNV943ihtlp1nTGvBdvdj2l58exkEoHOL9Y0XLSQuPjnhBQcHycbXTWv6ArzS5YmWFZCRoBg3QqzfbmFS/ag9RlipKOs53AYTh1964hXGGHb/+Ahq6DlGrvG7O6Pp58uw0xEEvn4fJe6J+0z7uydZY6M/KJiCSyUX1JhBSBnBTwLs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55b3d67-adbf-4b91-29f7-08d6e9e0ce7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 18:08:26.5104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Asmaa@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4349
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBQbGVhc2Ugc2VlIG15
IGlubGluZSByZXNwb25zZS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdv
bGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+IA0KU2VudDogTW9uZGF5LCBKdW5lIDMsIDIw
MTkgNDoxMyBQTQ0KVG86IEFzbWFhIE1uZWJoaSA8QXNtYWFAbWVsbGFub3guY29tPg0KQ2M6IG1p
bnlhcmRAYWNtLm9yZzsgVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPjsgTWlj
aGFlbCBTaHljaCA8bWljaGFlbHNoQG1lbGxhbm94LmNvbT47IHJkdW5sYXBAaW5mcmFkZWFkLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9y
Zw0KU3ViamVjdDogUmU6IFtQQVRDSCB2OSAxLzFdIEFkZCBzdXBwb3J0IGZvciBJUE1CIGRyaXZl
cg0KDQpIaSBBc21hYSwNCg0Kc29ycnkgZm9yIHRoZSBsb25nIHdhaXQuIEkgbWlzc2VkIHRoaXMg
bWFpbCB3YXMgc3RpbGwgc2l0dGluZyBpbiBteSBEcmFmdHMgZm9sZGVyIDooDQoNCj4gPj4gQW0g
SSBvdmVybG9va2luZyBzb21ldGhpbmc/IFdoeSBhcmUgeW91IHByb3RlY3RpbmcgYW4gYXRvbWlj
X3JlYWQgd2l0aCBhIHNwaW5sb2NrPw0KPiANCj4gQSB0aHJlYWQgd291bGQgbG9jayB0aGUgaXBt
Yl9kZXYtPmxvY2sgc3BpbmxvY2sgKGFib3ZlKSBmb3IgYWxsIHRoZSBjb2RlIGJlbG93IE9OTFkg
SUYgdGhlIGF0b21pY19yZWFkIGZvciB0aGUgcmVxdWVzdF9xdWV1ZV9sZW4gcmVwb3J0cyBhIHZh
bHVlIGRpZmZlcmVudCBmcm9tIDA6DQoNCldlbGwsIG5vdCByZWFsbHkuIFRoZSBzcGlubG9jayBp
cyB0YWtlbiBfYmVmb3JlXyB0aGUgYXRvbWljIHJlYWQuIEJ1dCB0aGUgcmVhZCBpcyBhdG9taWMs
IHNvIHRoZXJlIHNob3VsZCBiZSBubyBuZWVkLiBJIGFtIGFza2luZyBpZiB0aGUgY29kZSBjb3Vs
ZCBsb29rIGxpa2UgdGhpcz8NCg0KKwl3aGlsZSAoIWF0b21pY19yZWFkKCZpcG1iX2Rldi0+cmVx
dWVzdF9xdWV1ZV9sZW4pKSB7DQorCQlpZiAobm9uX2Jsb2NraW5nKQ0KKwkJCXJldHVybiAtRUFH
QUlOOw0KKw0KKwkJcmVzID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKGlwbWJfZGV2LT53YWl0
X3F1ZXVlLA0KKwkJCQlhdG9taWNfcmVhZCgmaXBtYl9kZXYtPnJlcXVlc3RfcXVldWVfbGVuKSk7
DQorCQlpZiAocmVzKQ0KKwkJCXJldHVybiByZXM7DQorCX0NCisNCisJc3Bpbl9sb2NrX2lycXNh
dmUoJmlwbWJfZGV2LT5sb2NrLCBmbGFncyk7DQorCWlmIChsaXN0X2VtcHR5KCZpcG1iX2Rldi0+
cmVxdWVzdF9xdWV1ZSkpIHsNCg0KPiBpZiAobGlzdF9lbXB0eSgmaXBtYl9kZXYtPnJlcXVlc3Rf
cXVldWUpKSB7DQo+IDI2MCArICAgICAgICAgICAgICAgZGV2X2VycigmaXBtYl9kZXYtPmNsaWVu
dC0+ZGV2LCAicmVxdWVzdF9xdWV1ZSBpcyBlbXB0eVxuIik7DQo+IDI2MSArICAgICAgICAgICAg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaXBtYl9kZXYtPmxvY2ssIGZsYWdzKTsNCg0KVGhl
IHVubG9jayBvcGVyYXRpb24gY291bGQgY29tZSBiZWZvcmUgdGhlIGRldl9lcnIuIFdlIGRvbid0
IG5lZWQgdG8gcHJvdGVjdCB0aGUgcHJpbnRvdXQgYW5kIHNhdmUgdGltZSB3aXRoIHRoZSBzcGlu
bG9jayBoZWxkLg0KDQpTb3VuZHMgZ29vZCB0byBtZS4gSSB3aWxsIHBvc3QgYSBuZXcgcGF0Y2gg
c2hvcnRseS4NCg0KPiA+ICsJcnFfc2EgPSBtc2dbUlFfU0FfOEJJVF9JRFhdID4+IDE7DQo+ID4g
KwluZXRmX3JxX2x1biA9IG1zZ1tORVRGTl9MVU5fSURYXTsNCj4gPiArCS8qDQo+ID4gKwkgKiBz
dWJ0cmFjdCBycV9zYSBhbmQgbmV0Zl9ycV9sdW4gZnJvbSB0aGUgbGVuZ3RoIG9mIHRoZSBtc2cg
cGFzc2VkIHRvDQo+ID4gKwkgKiBpMmNfc21idXNfd3JpdGVfYmxvY2tfZGF0YV9sb2NhbA0KPiA+
ICsJICovDQo+ID4gKwltc2dfbGVuID0gbXNnW0lQTUJfTVNHX0xFTl9JRFhdIC0gU01CVVNfTVNH
X0hFQURFUl9MRU5HVEg7DQo+ID4gKw0KPiA+ICsJc3RyY3B5KHJxX2NsaWVudC5uYW1lLCAiaXBt
Yl9yZXF1ZXN0ZXIiKTsNCj4gPiArCXJxX2NsaWVudC5hZGFwdGVyID0gaXBtYl9kZXYtPmNsaWVu
dC0+YWRhcHRlcjsNCj4gPiArCXJxX2NsaWVudC5mbGFncyA9IGlwbWJfZGV2LT5jbGllbnQtPmZs
YWdzOw0KPiA+ICsJcnFfY2xpZW50LmFkZHIgPSBycV9zYTsNCj4gDQo+ID4+IElzIGl0IHBvc3Np
YmxlIHRvIGRldGVybWluZSBpbiBhIHJhY2UtZnJlZSB3YXkgaWYgcnFfc2EgKHdoaWNoIGNhbWUg
DQo+ID4+IGZyb20gdXNlcnNwYWNlIEFGQUlVKSBpcyByZWFsbHkgdGhlIGFkZHJlc3MgZnJvbSB3
aGljaCB0aGUgcmVxdWVzdCANCj4gPj4gY2FtZSBpbiAoYWdhaW4gaWYgSSB1bmRlcnN0b29kIGFs
bCB0aGlzIGNvcnJlY3RseSk/DQo+IFllcyB0aGVyZSBpcy4gSSBzZWUgMiBvcHRpb25zOg0KPiAN
Cj4gMSkgVGhpcyBpcyBsZXNzIGV4cGxpY2l0IHRoYW4gb3B0aW9uIDIgYnV0IHVzZXMgZXhpc3Rp
bmcgY29kZSBhbmQgaXMgDQo+IHNpbXBsZXIuIHdlIGNhbiB1c2UgdGhlIGlwbWJfdmVyaWZ5X2No
ZWNrc3VtMSBmdW5jdGlvbiBzaW5jZSB0aGUgSVBNQiANCj4gcmVzcG9uc2UgZm9ybWF0IGlzIGFz
IGZvbGxvd3M6DQo+IEJ5dGUgMTogcnFfc2ENCj4gQnl0ZSAyOiBuZXRmdW5jdGlvbi9ycUxVTg0K
PiBCeXRlIDM6IGNoZWNrc3VtMQ0KDQpIbW1tLCBkb2VzIHRoYXQgcmVhbGx5IHByb3ZlIHRoYXQg
cnFfc2EgaXMgdGhlIHNhbWUgYWRkcmVzcyB0aGUgcmVxdWVzdCBjYW1lIGZyb20/IE9yIGRvZXMg
aXQgb25seSBwcm92ZSB0aGF0IHRoZSByZXNwb25zZSBwYWNrZXQgaXMgbm90IG1hbmdsZWQ/DQpZ
b3UgYXJlIGNvcnJlY3QuIFRoaXMgbWFpbmx5IHByb3ZlcyB0aGF0IHRoZSByZXNwb25zZSBwYWNr
ZXQgaXMgbm90IG1hbmdsZWQuDQoNCj4gU28gaWYgY2hlY2tzdW0xIGlzIHZlcmlmaWVkLCBpdCBt
ZWFucyBycV9zYSBpcyBjb3JyZWN0Lg0KPiANCj4gMikgSSBhbSBub3Qgc3VyZSB3ZSB3YW50IHRo
aXMgYnV0IGhhdmUgYSBnbG9iYWwgdmFyaWFibGUgd2hpY2ggc3RvcmVzIA0KPiB0aGUgYWRkcmVz
cyBvZiB0aGUgcmVxdWVzdGVyIG9uY2UgdGhlIGZpcnN0IHJlcXVlc3QgaXMgcmVjZWl2ZWQuIFdl
IA0KPiB3b3VsZCBjb21wYXJlIHRoYXQgYWRkcmVzcyB3aXRoIHRoZSBvbmUgcmVjZWl2ZWQgZnJv
bSB1c2Vyc3BhY2UgaW4gdGhlIA0KPiBjb2RlIGFib3ZlLg0KDQpDYW4gdGhlcmUgYmUgb25seSBv
bmUgcmVxdWVzdGVyIGluIHRoZSBzeXN0ZW0/DQoNClRoZXJlIGNhbiBiZSBtdWx0aXBsZSByZXF1
ZXN0ZXJzIGluIHRoZSBzeXN0ZW0gYnV0IHRoaXMgZHJpdmVyIHdhcyBkZXNpZ25lZCBpbiBhIHdh
eSB0aGF0IGl0IGNyZWF0ZXMgYSBzZXBhcmF0ZSBkZXZpY2UgZmlsZSBjYWxsZWQgImlwbWItPHNt
YnVzIG51bWJlcj4iIGZvciBlYWNoIEkyQyBtYXN0ZXIgY29ubmVjdGVkIHRvIHRoaXMgc2xhdmUg
ZGV2aWNlLg0KU28gZm9yIGV4YW1wbGUsIGlmIHdlIGhhdmUgQk1DIzAgY29ubmVjdGVkIHRvIHRo
aXMgc2xhdmUgZGV2aWNlIHZpYSBidXMgMSBhbmQgQk1DIzEgY29ubmVjdGVkIHRvIHRoaXMgc2xh
dmUgZGV2aWNlIHZpYSBidXMgMTIsDQpUaGVuIHdlIHdvdWxkIGhhdmUgMiBkZXZpY2UgZmlsZXM6
DQovZGV2L2lwbWItMSBmb3IgQk1DIzANCi9kZXYvaXBtYi0xMiBmb3IgQk1DIzENClNvIHdlIHdv
dWxkIGhhdmUgMiBkZXZpY2UgaW5zdGFuY2VzIG9mIGlwbWJfZGV2X2ludC4NCk9mIGNvdXJzZSwg
d2UgYXNzdW1lZCBmcm9tIHRoZSBiZWdpbm5pbmcgdGhhdCBub3QgbWFueSBwZW9wbGUgd2FudCB0
byBoYXZlIHN1Y2ggcG9vciBkZXNpZ24gd2hlcmUgdGhleSB3b3VsZCBoYXZlIGFuIGkyYyBzbGF2
ZSAocmVzcG9uZGVyKSB3aGljaCBoYXMgMiBtYXN0ZXJzIChyZXF1ZXN0ZXJzKSBvbiB0aGUgc2Ft
ZSBidXMuIPCfmJ0NCg0KQW55d2F5cywgSSB3aWxsIGNyZWF0ZSBhICBnbG9iYWwgdmFyaWFibGUg
dTggcmVmZXJlbmNlX3JxX3NhW01BWF9CVVNfTlVNQkVSXSAgd2hpY2ggaG9sZHMgdGhlIGFkZHJl
c3Mgb2YgdGhlIHJlcXVlc3RlciBkZXBlbmRpbmcgb24gdGhlIEkyQyBidXMgbnVtYmVyLg0KDQpU
aGFua3MuDQpBc21hZQ0KDQpUaGFua3MsDQoNCiAgIFdvbGZyYW0NCg==
