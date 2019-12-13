Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99ED911E0B3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 10:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfLMJ2O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 04:28:14 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:39410 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfLMJ2N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 04:28:13 -0500
X-UUID: b091016788a9488ea279a735d3e135bb-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=f1qK2+7LZodsQlO7o2fhFIATRwJd4H3mQKGMDaRrhWg=;
        b=S2CBRI9IIeLbtgqzvQhYB6IxXK+S2jUQNv6LzqYBSJ9q/hCJ2g8mM//wmqh39b48Dz4ghWXDBi2MAh/nbJH0ujUwgYusT5fTB1q2wD6/TIB3EPG2JRb6A5j3bo8/Q/mMJkGDNzEeaGzD8fWZ0fpJPlTdNzn4xo3vsPA68fFDBuE=;
X-UUID: b091016788a9488ea279a735d3e135bb-20191213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 772190440; Fri, 13 Dec 2019 01:28:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 17:07:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 17:07:35 +0800
Message-ID: <1576228087.2242.0.camel@mtksdaap41>
Subject: Re: [PATCH v8 3/4] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Date:   Fri, 13 Dec 2019 17:08:07 +0800
In-Reply-To: <CAMpxmJWh3YMkn_1B=nJLmRRXn9uD2kU4grf8c+sMbWtKFZOv=w@mail.gmail.com>
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
         <20191213081230.23494-4-bibby.hsieh@mediatek.com>
         <CAMpxmJWh3YMkn_1B=nJLmRRXn9uD2kU4grf8c+sMbWtKFZOv=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDE5LTEyLTEzIGF0IDEwOjAyICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBwdC4sIDEzIGdydSAyMDE5IG8gMDk6NDcgQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVo
QG1lZGlhdGVrLmNvbT4gbmFwaXNhxYIoYSk6DQo+ID4NCj4gPiBBbHRob3VnaCBpbiB0aGUgbW9z
dCBwbGF0Zm9ybXMsIHRoZSBwb3dlciBvZiBlZXByb20gYXJlIGFsd2F5DQo+ID4gb24sIHNvbWUg
cGxhdGZvcm1zIGRpc2FibGUgdGhlIGVlcHJvbSBwb3dlciBpbiBvcmRlciB0byBtZWV0DQo+ID4g
bG93IHBvd2VyIHJlcXVlc3QuIFRoaXMgcGF0Y2ggYWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBj
b250cm9sDQo+ID4gcG93ZXIgdG8gc3VwcG9ydCBhbGwgcGxhdGZvcm1zLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIGIv
ZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMNCj4gPiBpbmRleCAwNjgxZDVmZGQ1MzguLjA2YWUy
Y2MzMmY3OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jDQo+ID4gQEAgLTIyLDYgKzIyLDcgQEAN
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9yZWdtYXAuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPg0KPiA+DQo+ID4gIC8qIEFkZHJlc3MgcG9pbnRlciBpcyAxNiBi
aXQuICovDQo+ID4gQEAgLTkxLDYgKzkyLDcgQEAgc3RydWN0IGF0MjRfZGF0YSB7DQo+ID4NCj4g
PiAgICAgICAgIHN0cnVjdCBncGlvX2Rlc2MgKndwX2dwaW87DQo+ID4NCj4gPiArICAgICAgIHN0
cnVjdCByZWd1bGF0b3IgKnZjY19yZWc7DQo+ID4gICAgICAgICAvKg0KPiA+ICAgICAgICAgICog
U29tZSBjaGlwcyB0aWUgdXAgbXVsdGlwbGUgSTJDIGFkZHJlc3NlczsgZHVtbXkgZGV2aWNlcyBy
ZXNlcnZlDQo+ID4gICAgICAgICAgKiB0aGVtIGZvciB1cywgYW5kIHdlJ2xsIHVzZSB0aGVtIHdp
dGggU01CdXMgY2FsbHMuDQo+ID4gQEAgLTY2Miw2ICs2NjQsMTIgQEAgc3RhdGljIGludCBhdDI0
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAgICAgICBhdDI0LT5jbGll
bnRbMF0uY2xpZW50ID0gY2xpZW50Ow0KPiA+ICAgICAgICAgYXQyNC0+Y2xpZW50WzBdLnJlZ21h
cCA9IHJlZ21hcDsNCj4gPg0KPiA+ICsgICAgICAgYXQyNC0+dmNjX3JlZyA9IGRldm1fcmVndWxh
dG9yX2dldChkZXYsICJ2Y2MiKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIoYXQyNC0+dmNjX3Jl
ZykpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGF0
MjQgVkNDIHJlZ3VsYXRvclxuIik7DQo+IA0KPiBUaGUgcmVndWxhdG9yIGNvcmUgaXMgcXVpdGUg
dmVyYm9zZSBpbiBpdHMgZXJyb3IgbWVzc2FnZXMgd2hlbiBjYWxsaW5nDQo+IHJlZ3VsYXRvcl9n
ZXQoKSAtIHlvdSBkb24ndCBuZWVkIHRvIGFkZCB5b3VycyBoZXJlLiBKdXN0IHJldHVybiB0aGUN
Cj4gZXJyb3IgY29kZS4NCg0KT2ssIHdpbGwgcmVtb3ZlIGl0Lg0KDQo+IA0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihhdDI0LT52Y2NfcmVnKTsNCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gICAgICAgICBhdDI0LT53cF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwo
ZGV2LCAid3AiLCBHUElPRF9PVVRfSElHSCk7DQo+ID4gICAgICAgICBpZiAoSVNfRVJSKGF0MjQt
PndwX2dwaW8pKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihhdDI0LT53cF9n
cGlvKTsNCj4gPiBAQCAtNzAxLDYgKzcwOSwxMiBAQCBzdGF0aWMgaW50IGF0MjRfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPg0KPiA+ICAgICAgICAgaTJjX3NldF9jbGllbnRk
YXRhKGNsaWVudCwgYXQyNCk7DQo+ID4NCj4gPiArICAgICAgIGVyciA9IHJlZ3VsYXRvcl9lbmFi
bGUoYXQyNC0+dmNjX3JlZyk7DQo+ID4gKyAgICAgICBpZiAoZXJyKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBhdDI0IHZjYyByZWd1bGF0b3Jc
biIpOw0KPiANCj4gRHJvcCB0aGUgYXQyNCBuYW1lIC0gZGV2X2VycigpIHdpbGwgcHJpbnQgdGhl
IGRldmljZSBuYW1lIGZvciB5b3UuDQo+IA0KT2suDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBlcnI7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgLyogZW5hYmxlIHJ1bnRp
bWUgcG0gKi8NCj4gPiAgICAgICAgIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZShkZXYpOw0KPiA+ICAg
ICAgICAgcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiBAQCAtNzEzLDYgKzcyNyw3IEBAIHN0
YXRpYyBpbnQgYXQyNF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAgICAg
ICAgcG1fcnVudGltZV9pZGxlKGRldik7DQo+ID4gICAgICAgICBpZiAoZXJyKSB7DQo+ID4gICAg
ICAgICAgICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiA+ICsgICAgICAgICAgICAg
ICByZWd1bGF0b3JfZGlzYWJsZShhdDI0LT52Y2NfcmVnKTsNCj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9ERVY7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiBAQCAtNzI5LDE0ICs3NDQs
MzkgQEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+
ID4gIHN0YXRpYyBpbnQgYXQyNF9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4g
PiAgew0KPiA+ICAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKCZjbGllbnQtPmRldik7DQo+ID4g
KyAgICAgICBpZiAocG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCZjbGllbnQtPmRldikpDQo+
ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvcl9kaXNhYmxlKGF0MjQtPnZjY19yZWcpOw0KPiAN
Cj4gV2h5IGRpZG4ndCB5b3UgZml4IHRoZSBpbnZlcnRlZCBsb2dpYyBoZXJlIGFzIEkgcG9pbnRl
ZCBvdXQgYmFjayBpbiB2Ng0KPiBvZiB0aGlzIHNlcmllcz8NCj4gDQpTb3JyeSBmb3IgbWlzc2lu
ZyBpdCBhZ2Fpbi4uLg0KSSB3aWxsIGFkZCBpbnZlcnQgbmV4dCB2ZXJzaW9uLg0KDQpCaWJieQ0K
PiBCYXJ0DQo+IA0KPiA+ICAgICAgICAgcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKCZjbGllbnQt
PmRldik7DQo+ID4NCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBhdDI0X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2Ns
aWVudChkZXYpOw0KPiA+ICsgICAgICAgc3RydWN0IGF0MjRfZGF0YSAqYXQyNCA9IGkyY19nZXRf
Y2xpZW50ZGF0YShjbGllbnQpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiByZWd1bGF0b3Jf
ZGlzYWJsZShhdDI0LT52Y2NfcmVnKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBhdDI0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4g
PiArICAgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7
DQo+ID4gKyAgICAgICBzdHJ1Y3QgYXQyNF9kYXRhICphdDI0ID0gaTJjX2dldF9jbGllbnRkYXRh
KGNsaWVudCk7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHJlZ3VsYXRvcl9lbmFibGUoYXQy
NC0+dmNjX3JlZyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyBhdDI0X3BtX29wcyA9IHsNCj4gPiArICAgICAgIFNFVF9TWVNURU1fU0xFRVBfUE1f
T1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKQ0KPiA+ICsgICAgICAgU0VUX1JVTlRJ
TUVfUE1fT1BTKGF0MjRfc3VzcGVuZCwgYXQyNF9yZXN1bWUsIE5VTEwpDQo+ID4gK307DQo+ID4g
Kw0KPiA+ICBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgYXQyNF9kcml2ZXIgPSB7DQo+ID4gICAg
ICAgICAuZHJpdmVyID0gew0KPiA+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJhdDI0IiwNCj4g
PiArICAgICAgICAgICAgICAgLnBtID0gJmF0MjRfcG1fb3BzLA0KPiA+ICAgICAgICAgICAgICAg
ICAub2ZfbWF0Y2hfdGFibGUgPSBhdDI0X29mX21hdGNoLA0KPiA+ICAgICAgICAgICAgICAgICAu
YWNwaV9tYXRjaF90YWJsZSA9IEFDUElfUFRSKGF0MjRfYWNwaV9pZHMpLA0KPiA+ICAgICAgICAg
fSwNCj4gPiAtLQ0KPiA+IDIuMTguMA0KDQo=

