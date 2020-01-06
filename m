Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF506130DD6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 08:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgAFHJS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 02:09:18 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:37551 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726338AbgAFHJS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 02:09:18 -0500
X-UUID: abf890a27b9744eba74fd5164fdbd476-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6r8Q6ouEmerj2BaCaPfoigdqTcUY+4/DsatOS2H3Y48=;
        b=jZVxSjMDVWIQIbcx1zrUqhYVTSn1fqcr3cbBntsPgo/sC99UrS2taKkYEEUGEovWUT3MSoVNSnZyR1iVG9OSfHeAkDVp2+oT0XLlY3QlhHbTs/ihnZAAspqmNycV55L9CDzJiBCwXch5mU11AREdHXGb9TzfEF+sKjDGRu1CIdk=;
X-UUID: abf890a27b9744eba74fd5164fdbd476-20200106
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 497406598; Mon, 06 Jan 2020 15:09:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 15:08:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 15:08:58 +0800
Message-ID: <1578294552.7875.1.camel@mtksdaap41>
Subject: Re: [PATCH v9 3/4] misc: eeprom: at24: support pm_runtime control
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Date:   Mon, 6 Jan 2020 15:09:12 +0800
In-Reply-To: <CAMpxmJUotmLe6sJ4ZEbMMzUeLJMi-gHyamEUuDJzj6k_4JjCBg@mail.gmail.com>
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
         <20191216080445.8747-4-bibby.hsieh@mediatek.com>
         <CAMpxmJUotmLe6sJ4ZEbMMzUeLJMi-gHyamEUuDJzj6k_4JjCBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDE5LTEyLTE5IGF0IDExOjUwICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBwb24uLCAxNiBncnUgMjAxOSBvIDA5OjA0IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2ll
aEBtZWRpYXRlay5jb20+IG5hcGlzYcWCKGEpOg0KPiA+DQo+ID4gQWx0aG91Z2ggaW4gdGhlIG1v
c3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tIGFyZSBhbHdheQ0KPiA+IG9uLCBzb21l
IHBsYXRmb3JtcyBkaXNhYmxlIHRoZSBlZXByb20gcG93ZXIgaW4gb3JkZXIgdG8gbWVldA0KPiA+
IGxvdyBwb3dlciByZXF1ZXN0LiBUaGlzIHBhdGNoIGFkZCB0aGUgcG1fcnVudGltZSBvcHMgdG8g
Y29udHJvbA0KPiA+IHBvd2VyIHRvIHN1cHBvcnQgYWxsIHBsYXRmb3Jtcy4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+DQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIHwgMzggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYyBi
L2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jDQo+ID4gaW5kZXggMDY4MWQ1ZmRkNTM4Li42YmEy
M2E3ZTRkYTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMNCj4g
PiArKysgYi9kcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYw0KPiA+IEBAIC0yMiw2ICsyMiw3IEBA
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9udm1lbS1wcm92aWRlci5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvcmVnbWFwLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2dwaW8vY29uc3VtZXIuaD4NCj4gPg0KPiA+ICAvKiBBZGRyZXNzIHBvaW50ZXIgaXMgMTYg
Yml0LiAqLw0KPiA+IEBAIC05MSw2ICs5Miw3IEBAIHN0cnVjdCBhdDI0X2RhdGEgew0KPiA+DQo+
ID4gICAgICAgICBzdHJ1Y3QgZ3Bpb19kZXNjICp3cF9ncGlvOw0KPiA+DQo+ID4gKyAgICAgICBz
dHJ1Y3QgcmVndWxhdG9yICp2Y2NfcmVnOw0KPiA+ICAgICAgICAgLyoNCj4gPiAgICAgICAgICAq
IFNvbWUgY2hpcHMgdGllIHVwIG11bHRpcGxlIEkyQyBhZGRyZXNzZXM7IGR1bW15IGRldmljZXMg
cmVzZXJ2ZQ0KPiA+ICAgICAgICAgICogdGhlbSBmb3IgdXMsIGFuZCB3ZSdsbCB1c2UgdGhlbSB3
aXRoIFNNQnVzIGNhbGxzLg0KPiA+IEBAIC02NjIsNiArNjY0LDEwIEBAIHN0YXRpYyBpbnQgYXQy
NF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAgICAgICAgYXQyNC0+Y2xp
ZW50WzBdLmNsaWVudCA9IGNsaWVudDsNCj4gPiAgICAgICAgIGF0MjQtPmNsaWVudFswXS5yZWdt
YXAgPSByZWdtYXA7DQo+ID4NCj4gPiArICAgICAgIGF0MjQtPnZjY19yZWcgPSBkZXZtX3JlZ3Vs
YXRvcl9nZXQoZGV2LCAidmNjIik7DQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGF0MjQtPnZjY19y
ZWcpKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihhdDI0LT52Y2NfcmVnKTsN
Cj4gPiArDQo+ID4gICAgICAgICBhdDI0LT53cF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9u
YWwoZGV2LCAid3AiLCBHUElPRF9PVVRfSElHSCk7DQo+ID4gICAgICAgICBpZiAoSVNfRVJSKGF0
MjQtPndwX2dwaW8pKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihhdDI0LT53
cF9ncGlvKTsNCj4gPiBAQCAtNzAxLDYgKzcwNywxMiBAQCBzdGF0aWMgaW50IGF0MjRfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPg0KPiA+ICAgICAgICAgaTJjX3NldF9jbGll
bnRkYXRhKGNsaWVudCwgYXQyNCk7DQo+ID4NCj4gPiArICAgICAgIGVyciA9IHJlZ3VsYXRvcl9l
bmFibGUoYXQyNC0+dmNjX3JlZyk7DQo+ID4gKyAgICAgICBpZiAoZXJyKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSB2Y2MgcmVndWxhdG9yXG4i
KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gPiArICAgICAgIH0NCj4gPiAr
DQo+ID4gICAgICAgICAvKiBlbmFibGUgcnVudGltZSBwbSAqLw0KPiA+ICAgICAgICAgcG1fcnVu
dGltZV9zZXRfYWN0aXZlKGRldik7DQo+ID4gICAgICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYp
Ow0KPiA+IEBAIC03MTMsNiArNzI1LDcgQEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAgICAgICBwbV9ydW50aW1lX2lkbGUoZGV2KTsNCj4g
PiAgICAgICAgIGlmIChlcnIpIHsNCj4gPiAgICAgICAgICAgICAgICAgcG1fcnVudGltZV9kaXNh
YmxlKGRldik7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvcl9kaXNhYmxlKGF0MjQtPnZj
Y19yZWcpOw0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiAgICAgICAg
IH0NCj4gPg0KPiA+IEBAIC03MjksMTQgKzc0MiwzOSBAQCBzdGF0aWMgaW50IGF0MjRfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiAgc3RhdGljIGludCBhdDI0X3JlbW92ZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICB7DQo+ID4gICAgICAgICBwbV9ydW50aW1l
X2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsNCj4gPiArICAgICAgIGlmICghcG1fcnVudGltZV9zdGF0
dXNfc3VzcGVuZGVkKCZjbGllbnQtPmRldikpDQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRv
cl9kaXNhYmxlKGF0MjQtPnZjY19yZWcpOw0KPiANCj4gRGlkIHlvdSBhdCBsZWFzdCAqdHJ5KiB0
byBjb21waWxlIHRoaXM/IEJlY2F1c2UgaWYgeW91IGRpZCwgeW91J2QNCj4gbm90aWNlIGl0IGRv
ZXNuJ3QgYnVpbGQuDQo+IA0KPiBCYXJ0DQoNCg0KWWVwLCBJIHRyeSB0byBjb21waWxlIHRoZW0u
Li4gYnV0IEkgZm9yZ2V0IHRvIGVuYWJsZSBhdDI0IGluDQpkZWZjb25maWcuLi4gU29ycnksIEkg
d2lsbCBmaXggdGhlbSBpbiBteSBuZXh0IHZlcnNpb24uDQoNCg0KQmliYnkNCj4gDQo+ID4gICAg
ICAgICBwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KTsNCj4gPg0KPiA+ICAg
ICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIGF0MjRfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICAg
IHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7DQo+ID4gKyAg
ICAgICBzdHJ1Y3QgYXQyNF9kYXRhICphdDI0ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7
DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKGF0MjQtPnZjY19y
ZWcpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGF0MjRf
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsNCj4gPiArICAgICAgIHN0cnVj
dCBhdDI0X2RhdGEgKmF0MjQgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gPiArDQo+
ID4gKyAgICAgICByZXR1cm4gcmVndWxhdG9yX2VuYWJsZShhdDI0LT52Y2NfcmVnKTsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGF0MjRfcG1fb3Bz
ID0gew0KPiA+ICsgICAgICAgU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVudGltZV9mb3Jj
ZV9zdXNwZW5kLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUpDQo+ID4gKyAgICAgICBTRVRfUlVOVElNRV9QTV9PUFMoYXQyNF9zdXNw
ZW5kLCBhdDI0X3Jlc3VtZSwgTlVMTCkNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBzdHJ1
Y3QgaTJjX2RyaXZlciBhdDI0X2RyaXZlciA9IHsNCj4gPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+
ID4gICAgICAgICAgICAgICAgIC5uYW1lID0gImF0MjQiLA0KPiA+ICsgICAgICAgICAgICAgICAu
cG0gPSAmYXQyNF9wbV9vcHMsDQo+ID4gICAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9
IGF0MjRfb2ZfbWF0Y2gsDQo+ID4gICAgICAgICAgICAgICAgIC5hY3BpX21hdGNoX3RhYmxlID0g
QUNQSV9QVFIoYXQyNF9hY3BpX2lkcyksDQo+ID4gICAgICAgICB9LA0KPiA+IC0tDQo+ID4gMi4x
OC4wDQoNCg==

