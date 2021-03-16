Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112EE33D02E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 09:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCPI4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 04:56:50 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3479 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhCPI4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 04:56:40 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F06YT4xNqzR9t6;
        Tue, 16 Mar 2021 16:54:53 +0800 (CST)
Received: from dggemm753-chm.china.huawei.com (10.1.198.59) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 16 Mar 2021 16:56:36 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemm753-chm.china.huawei.com (10.1.198.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 16:56:37 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Tue, 16 Mar 2021 16:56:37 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     yangyicong <yangyicong@huawei.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        "Zengtao (B)" <prime.zeng@hisilicon.com>,
        yangyicong <yangyicong@huawei.com>
Subject: RE: [Linuxarm]  [PATCH v2 1/3] i2c: core: add managed function for
 adding i2c adapters
Thread-Topic: [Linuxarm]  [PATCH v2 1/3] i2c: core: add managed function for
 adding i2c adapters
Thread-Index: AQHXFOevM6gfspJ8+EmcIJeYgz03daqGV8DQ
Date:   Tue, 16 Mar 2021 08:56:36 +0000
Message-ID: <8369a924a36b4a16873cacff5177677f@hisilicon.com>
References: <1615296137-14558-1-git-send-email-yangyicong@hisilicon.com>
 <1615296137-14558-2-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1615296137-14558-2-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.32]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWljb25nIFlhbmcgW21h
aWx0bzp5YW5neWljb25nQGhpc2lsaWNvbi5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2gg
MTAsIDIwMjEgMjoyMiBBTQ0KPiBUbzogd3NhQGtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtl
cm5lbC5vcmcNCj4gQ2M6IGxpbnV4YXJtQG9wZW5ldWxlci5vcmc7IFplbmd0YW8gKEIpIDxwcmlt
ZS56ZW5nQGhpc2lsaWNvbi5jb20+Ow0KPiB5YW5neWljb25nIDx5YW5neWljb25nQGh1YXdlaS5j
b20+DQo+IFN1YmplY3Q6IFtMaW51eGFybV0gW1BBVENIIHYyIDEvM10gaTJjOiBjb3JlOiBhZGQg
bWFuYWdlZCBmdW5jdGlvbiBmb3IgYWRkaW5nDQo+IGkyYyBhZGFwdGVycw0KPiANCj4gU29tZSBJ
MkMgY29udHJvbGxlciBkcml2ZXJzIHdpbGwgb25seSB1bnJlZ2lzdGVyIHRoZSBJMkMNCj4gYWRh
cHRlciBpbiB0aGVpciAucmVtb3ZlKCkgY2FsbGJhY2ssIHdoaWNoIGNhbiBiZSBkb25lDQo+IGJ5
IHNpbXBseSB1c2luZyBhIG1hbmFnZWQgdmFyaWFudCB0byBhZGQgdGhlIEkyQyBhZGFwdGVyLg0K
PiANCj4gU28gYWRkIHRoZSBtYW5hZ2VkIGZ1bmN0aW9ucyBmb3IgYWRkaW5nIHRoZSBJMkMgYWRh
cHRlci4NCg0KU291bmRzIGxpa2UgYSB2ZXJ5IHVzZWZ1bCB3cmFwcGVyLiBXZSBhcmUgYWJsZSB0
byByZW1vdmUNCnNvbWUgICJyZW1vdmUiIGNhbGxiYWNrcyBhZnRlcndhcmRzLg0KV2UgaGF2ZSBz
b21lIHNpbWlsYXIgd3JhcHBlcnMgbGlrZSBkZXZtX2h3cm5nX3JlZ2lzdGVyDQp3aGljaCBpcyBh
bHdheXMgaGVscGZ1bC4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWljb25nIFlhbmcgPHlhbmd5
aWNvbmdAaGlzaWxpY29uLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNl
LmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGluY2x1
ZGUvbGludXgvaTJjLmggICAgICAgICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2Uu
YyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiBpbmRleCA2M2ViZjcyLi42MTQ4NmRj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gKysrIGIvZHJp
dmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+IEBAIC0xNTUwLDYgKzE1NTAsMzggQEAgaW50IGky
Y19hZGRfYWRhcHRlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIpDQo+ICB9DQo+ICBFWFBP
UlRfU1lNQk9MKGkyY19hZGRfYWRhcHRlcik7DQo+IA0KPiArc3RhdGljIHZvaWQgZGV2bV9pMmNf
ZGVsX2FkYXB0ZXIoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpwdHIpOw0KPiArDQo+ICsvKioN
Cj4gKyAqIGRldm1faTJjX2FkZF9hZGFwdGVyIC0gZGV2aWNlLW1hbmFnZWQgdmFyaWFudCBvZiBp
MmNfYWRkX2FkYXB0ZXIoKQ0KPiArICogQGRldjogbWFuYWdpbmcgZGV2aWNlIGZvciBhZGRpbmcg
dGhpcyBJMkMgYWRhcHRlcg0KPiArICogQGFkYXB0ZXI6IHRoZSBhZGFwdGVyIHRvIGFkZA0KPiAr
ICogQ29udGV4dDogY2FuIHNsZWVwDQo+ICsgKg0KPiArICogQWRkIGFkYXB0ZXIgd2l0aCBkeW5h
bWljIGJ1cyBudW1iZXIsIHNhbWUgd2l0aCBpMmNfYWRkX2FkYXB0ZXIoKQ0KPiArICogYnV0IHRo
ZSBhZGFwdGVyIHdpbGwgYmUgYXV0byBkZWxldGVkIG9uIGRyaXZlciBkZXRhY2guDQo+ICsgKi8N
Cj4gK2ludCBkZXZtX2kyY19hZGRfYWRhcHRlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcHRlcikNCj4gK3sNCj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKipwdHI7
DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCXB0ciA9IGRldnJlc19hbGxvYyhkZXZtX2kyY19kZWxf
YWRhcHRlciwgc2l6ZW9mKCpwdHIpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXB0cikNCj4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlyZXQgPSBpMmNfYWRkX2FkYXB0ZXIoYWRhcHRlcik7
DQo+ICsJaWYgKCFyZXQpIHsNCj4gKwkJKnB0ciA9IGFkYXB0ZXI7DQo+ICsJCWRldnJlc19hZGQo
ZGV2LCBwdHIpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWRldnJlc19mcmVlKHB0cik7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZGV2bV9pMmNfYWRk
X2FkYXB0ZXIpOw0KPiArDQo+ICAvKioNCj4gICAqIGkyY19hZGRfbnVtYmVyZWRfYWRhcHRlciAt
IGRlY2xhcmUgaTJjIGFkYXB0ZXIsIHVzZSBzdGF0aWMgYnVzIG51bWJlcg0KPiAgICogQGFkYXA6
IHRoZSBhZGFwdGVyIHRvIHJlZ2lzdGVyICh3aXRoIGFkYXAtPm5yIGluaXRpYWxpemVkKQ0KPiBA
QCAtMTcwMyw2ICsxNzM1LDEzIEBAIHZvaWQgaTJjX2RlbF9hZGFwdGVyKHN0cnVjdCBpMmNfYWRh
cHRlciAqYWRhcCkNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woaTJjX2RlbF9hZGFwdGVyKTsNCj4g
DQo+ICtzdGF0aWMgdm9pZCBkZXZtX2kyY19kZWxfYWRhcHRlcihzdHJ1Y3QgZGV2aWNlICpkZXYs
IHZvaWQgKnB0cikNCj4gK3sNCj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIgPSAqKChz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKiopcHRyKTsNCj4gKw0KPiArCWkyY19kZWxfYWRhcHRlcihhZGFw
dGVyKTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgaTJjX3BhcnNlX3RpbWluZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGNoYXIgKnByb3BfbmFtZSwgdTMyDQo+ICpjdXJfdmFsX3AsDQo+ICAJCQkg
ICAgdTMyIGRlZl92YWwsIGJvb2wgdXNlX2RlZikNCj4gIHsNCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvaTJjLmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oDQo+IGluZGV4IDU2NjIyNjUuLjEw
YmQwYjAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9pMmMuaA0KPiBAQCAtODQ0LDYgKzg0NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBp
MmNfbWFya19hZGFwdGVyX3Jlc3VtZWQoc3RydWN0DQo+IGkyY19hZGFwdGVyICphZGFwKQ0KPiAg
ICovDQo+ICAjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDKQ0KPiAgaW50IGkyY19hZGRfYWRhcHRl
cihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOw0KPiAraW50IGRldm1faTJjX2FkZF9hZGFwdGVy
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyKTsNCj4gIHZv
aWQgaTJjX2RlbF9hZGFwdGVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCk7DQo+ICBpbnQgaTJj
X2FkZF9udW1iZXJlZF9hZGFwdGVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCk7DQo+IA0KPiAt
LQ0KPiAyLjguMQ0KDQpUaGFua3MNCkJhcnJ5DQoNCg==
