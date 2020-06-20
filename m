Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C9620225A
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jun 2020 09:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgFTHaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Jun 2020 03:30:20 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:20656 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727022AbgFTHaU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Jun 2020 03:30:20 -0400
X-UUID: 6003e717073947b0b410684c6cac9b01-20200620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zBsN1Wyck+84Mbm+gBiGCKGBcPWj9Ghj2Dt/tXk8j/4=;
        b=k27ycLrKmA9/8vzoQYhodSiDjJAffxgXh0GQ5WNkFRb3h4L9PkUqWL6mKG5JopoJH2arXhNkU8bCO7s9Xx+Ai/FoJvKHL17ySJf7CFHvMcB5w/M9gG1YAnTQUhm7U1DJ2CBNEqMyPtjQ2xrssZ6p60wMHJrC5ITRxOGs6rRo5zw=;
X-UUID: 6003e717073947b0b410684c6cac9b01-20200620
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1660958606; Sat, 20 Jun 2020 15:30:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 15:30:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:30:11 +0800
Message-ID: <1592638212.4087.5.camel@mtksdaap41>
Subject: Re: [PATCH] i2c: mediatek: Add to support continuous mode
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qiangming Xia <qiangming.xia@mediatek.com>
CC:     <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <devicetree@vger.kernel.org>, Qii Wang <Qii.Wang@mediatek.com>,
        <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Sat, 20 Jun 2020 15:30:12 +0800
In-Reply-To: <20200619080643.25269-1-qiangming.xia@mediatek.com>
References: <20200619080643.25269-1-qiangming.xia@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMDYtMTkgYXQgMTY6MDYgKzA4MDAsIFFpYW5nbWluZyBYaWEgd3JvdGU6
DQo+IEZyb206ICJxaWFuZ21pbmcueGlhIiA8cWlhbmdtaW5nLnhpYUBtZWRpYXRlay5jb20+DQoN
ClBsZWFzZSBtYWtlICdGcm9tOicgdGhlIHNhbWUgdG8gU2lnbmVkLW9mZi1ieS4NCg0KDQoNCj4g
ICAgIE1lZGlhdGVrIGkyYyBjb250cm9sbGVyIHN1cHBvcnQgZm9yIGNvbnRpbnVvdXMgbW9kZSwN
Cj4gaXQgYWxsb3cgdG8gdHJhbnNmZXIgb25jZSBtdWx0aXBsZSB3cml0aW5nIG1lc3NhZ2VzIG9m
IGVxdWFsIGxlbmd0aC4NCg0KU28gdGhlIGxpbWl0YXRpb25zIGFyZSB3cml0aW5nIHRvIHNhbWUg
YWRkcmVzcywgYWxsIGluIHNhbWUgbGVuZ3RoLg0KSSB0aGluayB0aGlzIGlzIHN0cmljdCBsaW1p
dGF0aW9uLiBEbyB3ZSBoYXZlIG1hbnkgdGhpcyBraW5kIG9mIHVzYWdlPw0KSG93IGFib3V0IGNo
YW5nZSB0aGlzIHRvOg0KDQpNZWRpYVRlayBpMmMgY29udHJvbGxlciBzdXBwb3J0IGNvbnRpbnVv
dXMgbW9kZS4gVGhpcyBhbGxvd3MgdG8gd3JpdGUNCm11bHRpcGxlIHNhbWUgbGVuZ3RoIG1lc3Nh
Z2VzIHRvIHNpbmdsZSBhZGRyZXNzIHdpdGggb25seSBvbmUgc2V0dXAuDQoNCg0KPiAgICAgRm9y
IGV4YW1wbGUsIGEgc2xhdmUgbmVlZCB3cml0ZSBhIHNlcmlhbCBvZiBub24tY29udGludW91cw0K
PiBvZmZzZXQgcmFuZ2UgaW4gY2hpcCxlLmcuIHdyaXRpbmcgb2Zmc2V0IDAsb2Zmc2V0IDIgYW5k
IG9mZnNldCA0Lg0KPiBOb3JtYWxseSwgaXQgbmVlZCB0aHJlZSB0aW1lcyBpMmMgd3JpdGUgb3Bl
cmF0aW9uLiBIb3dldmVyLGl0IGNhbg0KPiB1c2Ugb25jZSB0cmFuc2ZlciB0byBmaW5pc2ggaXQg
YnkgdXNpbmcgY29udGludW91cyBtb2RlLg0KPiANCj4gQ2hhbmdlLUlkOiBJZjA2OTkxZTNmZDMy
ODY3YmRlYWFjZjE1YmIyNDg2NGQ1YzU5MDRkMA0KDQpQbGVhc2UgZHJvcCBDaGFuZ2UtSWQ6DQoN
Cg0KPiBTaWduZWQtb2ZmLWJ5OiBRaWFuZ21pbmcgWGlhIDxxaWFuZ21pbmcueGlhQG1lZGlhdGVr
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgNjcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjcgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2
NXh4LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+IGluZGV4IGRlZWY2OWU1
NjkwNi4uNzZlYzY1ZDg2OWY2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gQEAg
LTk3LDYgKzk3LDcgQEAgZW51bSBtdGtfdHJhbnNfb3Agew0KPiAgCUkyQ19NQVNURVJfV1IgPSAx
LA0KPiAgCUkyQ19NQVNURVJfUkQsDQo+ICAJSTJDX01BU1RFUl9XUlJELA0KPiArCUkyQ19NQVNU
RVJfQ09OVElOVU9VU19XUiwNCj4gIH07DQo+ICANCj4gIGVudW0gSTJDX1JFR1NfT0ZGU0VUIHsN
Cj4gQEAgLTg0Niw2ICs4NDcsOSBAQCBzdGF0aWMgaW50IG10a19pMmNfZG9fdHJhbnNmZXIoc3Ry
dWN0IG10a19pMmMgKmkyYywgc3RydWN0IGkyY19tc2cgKm1zZ3MsDQo+ICAJCQkJCSAgICBPRkZT
RVRfVFJBTlNGRVJfTEVOKTsNCj4gIAkJfQ0KPiAgCQltdGtfaTJjX3dyaXRldyhpMmMsIEkyQ19X
UlJEX1RSQU5BQ19WQUxVRSwgT0ZGU0VUX1RSQU5TQUNfTEVOKTsNCj4gKwl9IGVsc2UgaWYgKGky
Yy0+b3AgPT0gSTJDX01BU1RFUl9DT05USU5VT1VTX1dSKSB7DQo+ICsJCW10a19pMmNfd3JpdGV3
KGkyYywgbXNncy0+bGVuIC8gbnVtLCBPRkZTRVRfVFJBTlNGRVJfTEVOKTsNCj4gKwkJbXRrX2ky
Y193cml0ZXcoaTJjLCBudW0sIE9GRlNFVF9UUkFOU0FDX0xFTik7DQo+ICAJfSBlbHNlIHsNCj4g
IAkJbXRrX2kyY193cml0ZXcoaTJjLCBtc2dzLT5sZW4sIE9GRlNFVF9UUkFOU0ZFUl9MRU4pOw0K
PiAgCQltdGtfaTJjX3dyaXRldyhpMmMsIG51bSwgT0ZGU0VUX1RSQU5TQUNfTEVOKTsNCj4gQEAg
LTg5Niw2ICs5MDAsMjMgQEAgc3RhdGljIGludCBtdGtfaTJjX2RvX3RyYW5zZmVyKHN0cnVjdCBt
dGtfaTJjICppMmMsIHN0cnVjdCBpMmNfbXNnICptc2dzLA0KPiAgCQkJd3JpdGVsKHJlZ180Z19t
b2RlLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX1RYXzRHX01PREUpOw0KPiAgCQl9DQo+ICANCj4g
KwkJd3JpdGVsKCh1MzIpd3BhZGRyLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX1RYX01FTV9BRERS
KTsNCj4gKwkJd3JpdGVsKG1zZ3MtPmxlbiwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9UWF9MRU4p
Ow0KPiArCX0gZWxzZSBpZiAoaTJjLT5vcCA9PSBJMkNfTUFTVEVSX0NPTlRJTlVPVVNfV1IpIHsN
Cj4gKwkJd3JpdGVsKEkyQ19ETUFfSU5UX0ZMQUdfTk9ORSwgaTJjLT5wZG1hYmFzZSArIE9GRlNF
VF9JTlRfRkxBRyk7DQo+ICsJCXdyaXRlbChJMkNfRE1BX0NPTl9UWCwgaTJjLT5wZG1hYmFzZSAr
IE9GRlNFVF9DT04pOw0KPiArCQl3cGFkZHIgPSBkbWFfbWFwX3NpbmdsZShpMmMtPmRldiwgbXNn
cy0+YnVmLA0KPiArCQkJCQltc2dzLT5sZW4sIERNQV9UT19ERVZJQ0UpOw0KPiArCQlpZiAoZG1h
X21hcHBpbmdfZXJyb3IoaTJjLT5kZXYsIHdwYWRkcikpIHsNCj4gKwkJCWtmcmVlKG1zZ3MtPmJ1
Zik7DQo+ICsJCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChpMmMtPmRl
dl9jb21wLT5zdXBwb3J0XzMzYml0cykgew0KPiArCQkJcmVnXzRnX21vZGUgPSBtdGtfaTJjX3Nl
dF80Z19tb2RlKHdwYWRkcik7DQo+ICsJCQl3cml0ZWwocmVnXzRnX21vZGUsIGkyYy0+cGRtYWJh
c2UgKyBPRkZTRVRfVFhfNEdfTU9ERSk7DQo+ICsJCX0NCj4gKw0KPiAgCQl3cml0ZWwoKHUzMil3
cGFkZHIsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfVFhfTUVNX0FERFIpOw0KPiAgCQl3cml0ZWwo
bXNncy0+bGVuLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX1RYX0xFTik7DQo+ICAJfSBlbHNlIHsN
Cj4gQEAgLTk3OSw2ICsxMDAwLDExIEBAIHN0YXRpYyBpbnQgbXRrX2kyY19kb190cmFuc2Zlcihz
dHJ1Y3QgbXRrX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywNCj4gIAkJCQkgbXNncy0+
bGVuLCBETUFfRlJPTV9ERVZJQ0UpOw0KPiAgDQo+ICAJCWkyY19wdXRfZG1hX3NhZmVfbXNnX2J1
ZihkbWFfcmRfYnVmLCBtc2dzLCB0cnVlKTsNCj4gKwl9IGVsc2UgaWYgKGkyYy0+b3AgPT0gSTJD
X01BU1RFUl9DT05USU5VT1VTX1dSKSB7DQo+ICsJCWRtYV91bm1hcF9zaW5nbGUoaTJjLT5kZXYs
IHdwYWRkciwNCj4gKwkJCQkgbXNncy0+bGVuLCBETUFfVE9fREVWSUNFKTsNCj4gKw0KPiArCQlr
ZnJlZShtc2dzLT5idWYpOw0KPiAgCX0gZWxzZSB7DQo+ICAJCWRtYV91bm1hcF9zaW5nbGUoaTJj
LT5kZXYsIHdwYWRkciwgbXNncy0+bGVuLA0KPiAgCQkJCSBETUFfVE9fREVWSUNFKTsNCj4gQEAg
LTEwMDksNiArMTAzNSw5IEBAIHN0YXRpYyBpbnQgbXRrX2kyY190cmFuc2ZlcihzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXAsDQo+ICB7DQo+ICAJaW50IHJldDsNCj4gIAlpbnQgbGVmdF9udW0gPSBu
dW07DQo+ICsJaW50IGksIGo7DQo+ICsJdTggKmRtYV9tdWx0aV93cl9idWY7DQo+ICsJc3RydWN0
IGkyY19tc2cgbXVsdGlfbXNnWzFdOw0KPiAgCXN0cnVjdCBtdGtfaTJjICppMmMgPSBpMmNfZ2V0
X2FkYXBkYXRhKGFkYXApOw0KPiAgDQo+ICAJcmV0ID0gbXRrX2kyY19jbG9ja19lbmFibGUoaTJj
KTsNCj4gQEAgLTEwMjUsNiArMTA1NCw0NCBAQCBzdGF0aWMgaW50IG10a19pMmNfdHJhbnNmZXIo
c3RydWN0IGkyY19hZGFwdGVyICphZGFwLA0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICsJaWYgKG51
bSA+IDEpIHsNCj4gKwkJZm9yIChpID0gMDsgaSA8IG51bSAtIDE7IGkrKykgew0KPiArCQkJaWYg
KCEobXNnc1tpXS5mbGFncyAmIEkyQ19NX1JEKSAmJiAhKG1zZ3NbaSsxXS5mbGFncyAmDQo+ICsJ
CQkJSTJDX01fUkQpICYmIChtc2dzW2ldLmFkZHIgPT0gbXNnc1tpKzFdLmFkZHIpDQo+ICsJCQkJ
CSYmIChtc2dzW2ldLmxlbiA9PSBtc2dzW2krMV0ubGVuKSkgew0KDQpTaW5jZSB0aGlzIGJsb2Nr
IGlzIGFsbCBmb3IgY29udGludW91cyBtb2RlIGNoZWNrLCB3ZSBjb3VsZCBtb3ZlIGZpcnN0DQpm
bGFncyBjaGVjayBvdXQgYW5kIG1hZGUgdGhlIGlmIGluIGZvciBsb29wIHNpbXBsZXIgdG8gcmVh
ZDoNCg0KCWlmIChudW0gPiAxICYmICEobXNnc1swXS5mbGFncyAmIEkyQ19NX1JEKSkgew0KCQlm
b3IgKGkgPSAwOyBpIDwgbnVtIC0gMTsgaSsrKSB7DQoJCQlpZiAoIShtc2dzW2krMV0uZmxhZ3Mg
JglJMkNfTV9SRCkgJiYgDQoJCQkJbXNnc1tpXS5hZGRyID09IG1zZ3NbaSsxXS5hZGRyICYmDQoJ
CQkJbXNnc1tpXS5sZW4gPT0gbXNnc1tpKzFdLmxlbikgew0KDQoNCj4gKwkJCQljb250aW51ZTsN
Cj4gbCsJCQl9IGVsc2UNCj4gKwkJCQlicmVhazsNCj4gKwkJfQ0KPiArCQlpZiAoaSA+PSBudW0g
LSAxKSB7DQoNCmp1c3QgY2hlY2sgaSA9PSBudW0gLTEgaXMgZW5vdWdoLg0KDQoNCj4gKwkJCWky
Yy0+b3AgPSBJMkNfTUFTVEVSX0NPTlRJTlVPVVNfV1I7DQo+ICsJCQlqID0gMDsNCj4gKwkJCWRt
YV9tdWx0aV93cl9idWYgPSBremFsbG9jKG1zZ3MtPmxlbiAqIG51bSwgR0ZQX0tFUk5FTCk7DQoN
CmRvbid0IG5lZWQgdG8gemVybyBpdCBvdXQuIGttYWxsb2MgaXMgZW5vdWdoLg0KDQo+ICsJCQlp
ZiAoIWRtYV9tdWx0aV93cl9idWYpIHsNCj4gKwkJCQlyZXQgPSAgLUVOT01FTTsNCj4gKwkJCQln
b3RvIGVycl9leGl0Ow0KPiArCQkJfQ0KPiArCQkJbXVsdGlfbXNnLT5hZGRyICA9IG1zZ3MtPmFk
ZHI7DQo+ICsJCQltdWx0aV9tc2ctPmxlbiAgID0gbXNncy0+bGVuICogbnVtOw0KPiArCQkJbXVs
dGlfbXNnLT5idWYgICA9IGRtYV9tdWx0aV93cl9idWY7DQo+ICsJCQltdWx0aV9tc2ctPmZsYWdz
ICA9IDA7DQo+ICsJCQl3aGlsZSAoaiA8IG51bSkgew0KPiArCQkJCW1lbWNweShkbWFfbXVsdGlf
d3JfYnVmICsgbXNncy0+bGVuICogaiwNCj4gKwkJCQkJCQltc2dzLT5idWYsIG1zZ3MtPmxlbik7
DQo+ICsJCQkJaisrOw0KPiArCQkJCW1zZ3MrKzsNCj4gKwkJCQl9DQoNCmV4dHJhIHRhYiBiZWZv
cmUgdGhlIGNsb3NpbmcgJ30nDQoNCj4gKw0KPiArCQkJaTJjLT5pZ25vcmVfcmVzdGFydF9pcnEg
PSBmYWxzZTsNCj4gKwkJCXJldCA9IG10a19pMmNfZG9fdHJhbnNmZXIoaTJjLCBtdWx0aV9tc2cs
IG51bSwgMCk7DQo+ICsJCQlpZiAocmV0IDwgMCkNCj4gKwkJCQlnb3RvIGVycl9leGl0Ow0KPiAr
CQkJcmV0ID0gbnVtOw0KPiArCQkJCWdvdG8gZXJyX2V4aXQ7DQo+ICsNCg0KZXh0cmEgaW5kZW50
IGxldmVsIGZvciBsYXN0IGdvdG8gYW5kIGJsYW5rIGxpbmUgYWZ0ZXIgaXQuDQoNCkpvZS5DDQoN
Cg==

