Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBC122A494
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 03:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733169AbgGWB3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 21:29:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55566 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728607AbgGWB3X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 21:29:23 -0400
X-UUID: 1764c80b3e4d4e459de8dbae5a349029-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=oycTkft2mwefXZk5AYB5xFnKDtMkFEialikk/qYIZMc=;
        b=OCOu6FnJuSgfzcOFdFbHVJn8UyTUGpEZq8J1kf2Z+UE16JDIQG4nFkA13eXpNH0LqHoC3IcJmNABZyYfHqBHG+d339MNNF83l4XBzkoSfk/3iCmtaF9lh0YIALrW3KeDgLFmnCNispXdq3tM9nGRf++iOf83phYMACgQpfSP0/I=;
X-UUID: 1764c80b3e4d4e459de8dbae5a349029-20200723
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2074606877; Thu, 23 Jul 2020 09:29:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 09:29:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 09:29:12 +0800
Message-ID: <1595467756.7332.7.camel@mtksdaap41>
Subject: Re: [PATCH 1/4] i2c: mediatek: Add apdma sync in i2c driver
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qii Wang <qii.wang@mediatek.com>
CC:     <wsa@the-dreams.de>, <qiangming.xia@mediatek.com>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 23 Jul 2020 09:29:16 +0800
In-Reply-To: <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
         <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTIyIGF0IDIwOjMxICswODAwLCBRaWkgV2FuZyB3cm90ZToNCj4gV2l0
aCB0aGUgYXBkbWEgcmVtb3ZlIGhhbmQtc2hha2Ugc2lnbmFsLCBpdCBuZWVkIHRvIGtlZXAgaTJj
IGFuZA0KPiBhcGRtYSBpbiBzeW5jIG1hbnVhbGx5Lg0KPiANCg0KTG9va3MgZ29vZCB0byBtZSwN
Cg0KUmV2aWV3ZWQtYnk6IFlpbmdqb2UgQ2hlbiA8eWluZ2pvZS5jaGVuQG1lZGlhdGVrLmNvbT4N
Cg0KDQpKdXN0IGEgcmVtaW5kZXIsIHdlIGhhdmUgYW5vdGhlciBwYXRjaCAnaTJjOiBtZWRpYXRl
azogQWRkIHRvIHN1cHBvcnQNCmNvbnRpbnVvdXMgbW9kZScgdW5kZXIgcmV2aWV3IG5vdy4gUGxl
YXNlIHJlbWVtYmVyIHRvIHVwZGF0ZSBPRkZTRVRfQ09ODQphY2Nlc3MgY29kZSBpbiB0aGF0IHBh
dGNoLg0KDQpKb2UuQw0KDQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdA
bWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMg
fCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4g
aW5kZXggZGVlZjY5ZS4uZTZiOTg0YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+
IEBAIC00OCw2ICs0OCw5IEBADQo+ICANCj4gICNkZWZpbmUgSTJDX0RNQV9DT05fVFgJCQkweDAw
MDANCj4gICNkZWZpbmUgSTJDX0RNQV9DT05fUlgJCQkweDAwMDENCj4gKyNkZWZpbmUgSTJDX0RN
QV9BU1lOQ19NT0RFCQkweDAwMDQNCj4gKyNkZWZpbmUgSTJDX0RNQV9TS0lQX0NPTkZJRwkJMHgw
MDEwDQo+ICsjZGVmaW5lIEkyQ19ETUFfRElSX0NIQU5HRQkJMHgwMjAwDQo+ICAjZGVmaW5lIEky
Q19ETUFfU1RBUlRfRU4JCTB4MDAwMQ0KPiAgI2RlZmluZSBJMkNfRE1BX0lOVF9GTEFHX05PTkUJ
CTB4MDAwMA0KPiAgI2RlZmluZSBJMkNfRE1BX0NMUl9GTEFHCQkweDAwMDANCj4gQEAgLTIwNSw2
ICsyMDgsNyBAQCBzdHJ1Y3QgbXRrX2kyY19jb21wYXRpYmxlIHsNCj4gIAl1bnNpZ25lZCBjaGFy
IHRpbWluZ19hZGp1c3Q6IDE7DQo+ICAJdW5zaWduZWQgY2hhciBkbWFfc3luYzogMTsNCj4gIAl1
bnNpZ25lZCBjaGFyIGx0aW1pbmdfYWRqdXN0OiAxOw0KPiArCXVuc2lnbmVkIGNoYXIgYXBkbWFf
c3luYzogMTsNCj4gIH07DQo+ICANCj4gIHN0cnVjdCBtdGtfaTJjX2FjX3RpbWluZyB7DQo+IEBA
IC0zMTEsNiArMzE1LDcgQEAgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyB7DQo+ICAJLnRpbWluZ19h
ZGp1c3QgPSAxLA0KPiAgCS5kbWFfc3luYyA9IDAsDQo+ICAJLmx0aW1pbmdfYWRqdXN0ID0gMCwN
Cj4gKwkuYXBkbWFfc3luYyA9IDAsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19pMmNfY29tcGF0aWJsZSBtdDY1NzdfY29tcGF0ID0gew0KPiBAQCAtMzI0LDYgKzMyOSw3
IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KPiAgCS50aW1pbmdfYWRqdXN0ID0gMCwNCj4g
IAkuZG1hX3N5bmMgPSAwLA0KPiAgCS5sdGltaW5nX2FkanVzdCA9IDAsDQo+ICsJLmFwZG1hX3N5
bmMgPSAwLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaTJjX2NvbXBh
dGlibGUgbXQ2NTg5X2NvbXBhdCA9IHsNCj4gQEAgLTMzNyw2ICszNDMsNyBAQCBzdHJ1Y3QgaTJj
X3NwZWNfdmFsdWVzIHsNCj4gIAkudGltaW5nX2FkanVzdCA9IDAsDQo+ICAJLmRtYV9zeW5jID0g
MCwNCj4gIAkubHRpbWluZ19hZGp1c3QgPSAwLA0KPiArCS5hcGRtYV9zeW5jID0gMCwNCj4gIH07
DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2kyY19jb21wYXRpYmxlIG10NzYyMl9j
b21wYXQgPSB7DQo+IEBAIC0zNTAsNiArMzU3LDcgQEAgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyB7
DQo+ICAJLnRpbWluZ19hZGp1c3QgPSAwLA0KPiAgCS5kbWFfc3luYyA9IDAsDQo+ICAJLmx0aW1p
bmdfYWRqdXN0ID0gMCwNCj4gKwkuYXBkbWFfc3luYyA9IDAsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19pMmNfY29tcGF0aWJsZSBtdDgxNzNfY29tcGF0ID0gew0KPiBA
QCAtMzYyLDYgKzM3MCw3IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KPiAgCS50aW1pbmdf
YWRqdXN0ID0gMCwNCj4gIAkuZG1hX3N5bmMgPSAwLA0KPiAgCS5sdGltaW5nX2FkanVzdCA9IDAs
DQo+ICsJLmFwZG1hX3N5bmMgPSAwLA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfaTJjX2NvbXBhdGlibGUgbXQ4MTgzX2NvbXBhdCA9IHsNCj4gQEAgLTM3NSw2ICszODQs
NyBAQCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzIHsNCj4gIAkudGltaW5nX2FkanVzdCA9IDEsDQo+
ICAJLmRtYV9zeW5jID0gMSwNCj4gIAkubHRpbWluZ19hZGp1c3QgPSAxLA0KPiArCS5hcGRtYV9z
eW5jID0gMCwNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG10a19pMmNfb2ZfbWF0Y2hbXSA9IHsNCj4gQEAgLTc5OCw2ICs4MDgsNyBAQCBzdGF0aWMgaW50
IG10a19pMmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMgKmkyYywgc3RydWN0IGkyY19tc2cg
Km1zZ3MsDQo+ICAJdTE2IHN0YXJ0X3JlZzsNCj4gIAl1MTYgY29udHJvbF9yZWc7DQo+ICAJdTE2
IHJlc3RhcnRfZmxhZyA9IDA7DQo+ICsJdTE2IGRtYV9zeW5jID0gMDsNCj4gIAl1MzIgcmVnXzRn
X21vZGU7DQo+ICAJdTggKmRtYV9yZF9idWYgPSBOVUxMOw0KPiAgCXU4ICpkbWFfd3JfYnVmID0g
TlVMTDsNCj4gQEAgLTg1MSwxMCArODYyLDE2IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19kb190cmFu
c2ZlcihzdHJ1Y3QgbXRrX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywNCj4gIAkJbXRr
X2kyY193cml0ZXcoaTJjLCBudW0sIE9GRlNFVF9UUkFOU0FDX0xFTik7DQo+ICAJfQ0KPiAgDQo+
ICsJaWYgKGkyYy0+ZGV2X2NvbXAtPmFwZG1hX3N5bmMpIHsNCj4gKwkJZG1hX3N5bmMgPSBJMkNf
RE1BX1NLSVBfQ09ORklHIHwgSTJDX0RNQV9BU1lOQ19NT0RFOw0KPiArCQlpZiAoaTJjLT5vcCA9
PSBJMkNfTUFTVEVSX1dSUkQpDQo+ICsJCQlkbWFfc3luYyB8PSBJMkNfRE1BX0RJUl9DSEFOR0U7
DQo+ICsJfQ0KPiArDQo+ICAJLyogUHJlcGFyZSBidWZmZXIgZGF0YSB0byBzdGFydCB0cmFuc2Zl
ciAqLw0KPiAgCWlmIChpMmMtPm9wID09IEkyQ19NQVNURVJfUkQpIHsNCj4gIAkJd3JpdGVsKEky
Q19ETUFfSU5UX0ZMQUdfTk9ORSwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9JTlRfRkxBRyk7DQo+
IC0JCXdyaXRlbChJMkNfRE1BX0NPTl9SWCwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9DT04pOw0K
PiArCQl3cml0ZWwoSTJDX0RNQV9DT05fUlggfCBkbWFfc3luYywgaTJjLT5wZG1hYmFzZSArIE9G
RlNFVF9DT04pOw0KPiAgDQo+ICAJCWRtYV9yZF9idWYgPSBpMmNfZ2V0X2RtYV9zYWZlX21zZ19i
dWYobXNncywgMSk7DQo+ICAJCWlmICghZG1hX3JkX2J1ZikNCj4gQEAgLTg3Nyw3ICs4OTQsNyBA
QCBzdGF0aWMgaW50IG10a19pMmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMgKmkyYywgc3Ry
dWN0IGkyY19tc2cgKm1zZ3MsDQo+ICAJCXdyaXRlbChtc2dzLT5sZW4sIGkyYy0+cGRtYWJhc2Ug
KyBPRkZTRVRfUlhfTEVOKTsNCj4gIAl9IGVsc2UgaWYgKGkyYy0+b3AgPT0gSTJDX01BU1RFUl9X
Uikgew0KPiAgCQl3cml0ZWwoSTJDX0RNQV9JTlRfRkxBR19OT05FLCBpMmMtPnBkbWFiYXNlICsg
T0ZGU0VUX0lOVF9GTEFHKTsNCj4gLQkJd3JpdGVsKEkyQ19ETUFfQ09OX1RYLCBpMmMtPnBkbWFi
YXNlICsgT0ZGU0VUX0NPTik7DQo+ICsJCXdyaXRlbChJMkNfRE1BX0NPTl9UWCB8IGRtYV9zeW5j
LCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0NPTik7DQo+ICANCj4gIAkJZG1hX3dyX2J1ZiA9IGky
Y19nZXRfZG1hX3NhZmVfbXNnX2J1Zihtc2dzLCAxKTsNCj4gIAkJaWYgKCFkbWFfd3JfYnVmKQ0K
PiBAQCAtOTAwLDcgKzkxNyw3IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19kb190cmFuc2ZlcihzdHJ1
Y3QgbXRrX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywNCj4gIAkJd3JpdGVsKG1zZ3Mt
PmxlbiwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9UWF9MRU4pOw0KPiAgCX0gZWxzZSB7DQo+ICAJ
CXdyaXRlbChJMkNfRE1BX0NMUl9GTEFHLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0lOVF9GTEFH
KTsNCj4gLQkJd3JpdGVsKEkyQ19ETUFfQ0xSX0ZMQUcsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRf
Q09OKTsNCj4gKwkJd3JpdGVsKEkyQ19ETUFfQ0xSX0ZMQUcgfCBkbWFfc3luYywgaTJjLT5wZG1h
YmFzZSArIE9GRlNFVF9DT04pOw0KPiAgDQo+ICAJCWRtYV93cl9idWYgPSBpMmNfZ2V0X2RtYV9z
YWZlX21zZ19idWYobXNncywgMSk7DQo+ICAJCWlmICghZG1hX3dyX2J1ZikNCg0K

