Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53881D8DED
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 04:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgESC7f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 22:59:35 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:23660 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726270AbgESC7e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 22:59:34 -0400
X-UUID: 65406e5a649647bcb639b8e9ec35218a-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=M+o0Anz4/UQjLm5nYoVibliTyzmVqym+xJdpP5blyMg=;
        b=Hfb1/kAcOMyc62ESYxEaNe9rl85iTGBbye1u2kksbh65RXJ/yGx23mtBAhLKezkSCdBF8Q3sh19OqhMixugH6/LkpgS4Y3+k+Nlp/GnY0FoSR4Y7kqF9mJDxD0EA4nBnOLW8vDTEyeIenlvNDv23Kp2epA7Xr+UARfVcANG+sOM=;
X-UUID: 65406e5a649647bcb639b8e9ec35218a-20200519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1280698048; Tue, 19 May 2020 10:59:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 19 May
 2020 10:59:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 10:59:21 +0800
Message-ID: <1589857073.25512.34.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From:   Qii Wang <qii.wang@mediatek.com>
To:     Joe Perches <joe@perches.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 19 May 2020 10:57:53 +0800
In-Reply-To: <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
         <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
         <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E488EF03A7622D1ADEEB7C7CD1CCABA41B9EB17953038A2511499CEDEE1E7E62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTE4IGF0IDE3OjQ0ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIFRodSwgTWF5IDE0LCAyMDIwIGF0IDM6MTMgUE0gUWlpIFdhbmcgPHFpaS53YW5n
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgYWxnb3JpdGhtIHRv
IGNhbGN1bGF0ZSBzb21lIGFjLXRpbWluZyBwYXJhbWV0ZXJzDQo+ID4gd2hpY2ggY2FuIGZ1bGx5
IG1lZXQgSTJDIFNwZWMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndh
bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10
NjV4eC5jIHwgMzI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDI3NyBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IGluZGV4IDBjYTZjMzhhLi43MDIwNjE4
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiAr
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+IA0KPiA+ICsvKg0KPiA+ICsg
KiBDaGVjayBhbmQgQ2FsY3VsYXRlIGkyYyBhYy10aW1pbmcNCj4gPiArICoNCj4gPiArICogSGFy
ZHdhcmUgZGVzaWduOg0KPiA+ICsgKiBzYW1wbGVfbnMgPSAoMTAwMDAwMDAwMCAqIChzYW1wbGVf
Y250ICsgMSkpIC8gY2xrX3NyYw0KPiA+ICsgKiB4eHhfY250X2RpdiA9ICBzcGVjLT5taW5feHh4
X25zIC8gc2FtcGxlX25zDQo+ID4gKyAqDQo+ID4gKyAqIFNhbXBsZV9ucyBpcyByb3VuZGVkIGRv
d24gZm9yIHh4eF9jbnRfZGl2IHdvdWxkIGJlIGdyZWF0ZXINCj4gPiArICogdGhhbiB0aGUgc21h
bGxlc3Qgc3BlYy4NCj4gPiArICogVGhlIHNkYV90aW1pbmcgaXMgY2hvc2VuIGFzIHRoZSBtaWRk
bGUgdmFsdWUgYmV0d2Vlbg0KPiA+ICsgKiB0aGUgbGFyZ2VzdCBhbmQgc21hbGxlc3QuDQo+ID4g
KyAqLw0KPiA+ICtzdGF0aWMgaW50IG10a19pMmNfY2hlY2tfYWNfdGltaW5nKHN0cnVjdCBtdGtf
aTJjICppMmMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgY2xrX3NyYywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBjaGVja19zcGVlZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBzdGVwX2NudCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzYW1wbGVfY250KQ0KPiA+ICt7DQo+ID4gKyAgICAg
ICBjb25zdCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzICpzcGVjOw0KPiA+ICsgICAgICAgdW5zaWdu
ZWQgaW50IHN1X3N0YV9jbnQsIGxvd19jbnQsIGhpZ2hfY250LCBtYXhfc3RlcF9jbnQ7DQo+ID4g
KyAgICAgICB1bnNpZ25lZCBpbnQgc2RhX21heCwgc2RhX21pbiwgY2xrX25zLCBtYXhfc3RhX2Nu
dCA9IDB4M2Y7DQo+ID4gKyAgICAgICBsb25nIGxvbmcgc2FtcGxlX25zID0gKDEwMDAwMDAwMDAg
KiAoc2FtcGxlX2NudCArIDEpKSAvIGNsa19zcmM7DQo+IA0KPiBTbyBzYW1wbGVfbnMgaXMgYSA2
NC1iaXQgdmFsdWUuIElzIHRoYXQgcmVhbGx5IG5lZWRlZD8NCj4gDQoNCigxMDAwMDAwMDAwICog
KHNhbXBsZV9jbnQgKyAxKSkgLyBjbGtfc3JjIHZhbHVlIGlzIGEgMzItYml0LCAoMTAwMDAwMDAw
MA0KKiAoc2FtcGxlX2NudCArIDEpKSB3aWxsIG92ZXIgMzItYml0IGlmIHNhbXBsZV9jbnQgaXMg
Ny4NCg0KSSB0aGluayAxMDAwMDAwMDAwIGFuZCBjbGtfc3JjIGlzIHRvbyBiaWcsIG1heWJlIEkg
Y2FuIHJlZHVjZSB0aGVuIHdpdGgNCmJlIGRpdmlkZWQgYWxsIGJ5IDEwMDAuDQpleGFtcGxlOg0K
DQp1bnNpZ25lZCBpbnQgc2FtcGxlX25zOw0KdW5zaWduZWQgaW50IGNsa19zcmNfa2h6ID0gY2xr
X3NyYyAvIDEwMDA7DQoNCmlmKGNsa19zcmNfa2h6KQ0KCXNhbXBsZV9ucyA9ICgxMDAwMDAwICog
KHNhbXBsZV9jbnQgKyAxKSkgLyBjbGtfc3JjX2toejsNCmVsc2UNCglyZXR1cm4gLUVJTlZBTDsN
Cg0KPiA+ICsgICAgICAgaWYgKCFpMmMtPmRldl9jb21wLT50aW1pbmdfYWRqdXN0KQ0KPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoaTJjLT5kZXZf
Y29tcC0+bHRpbWluZ19hZGp1c3QpDQo+ID4gKyAgICAgICAgICAgICAgIG1heF9zdGFfY250ID0g
MHgxMDA7DQo+ID4gKw0KPiA+ICsgICAgICAgc3BlYyA9IG10a19pMmNfZ2V0X3NwZWMoY2hlY2tf
c3BlZWQpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChpMmMtPmRldl9jb21wLT5sdGltaW5nX2Fk
anVzdCkNCj4gPiArICAgICAgICAgICAgICAgY2xrX25zID0gMTAwMDAwMDAwMCAvIGNsa19zcmM7
DQo+ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgIGNsa19ucyA9IHNhbXBsZV9u
cyAvIDI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3Vfc3RhX2NudCA9IERJVl9ST1VORF9VUChzcGVj
LT5taW5fc3Vfc3RhX25zLCBjbGtfbnMpOw0KPiA+ICsgICAgICAgaWYgKHN1X3N0YV9jbnQgPiBt
YXhfc3RhX2NudCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC0xOw0KPiA+ICsNCj4gPiAr
ICAgICAgIGxvd19jbnQgPSBESVZfUk9VTkRfVVAoc3BlYy0+bWluX2xvd19ucywgc2FtcGxlX25z
KTsNCj4gDQo+IFNvIHRoaXMgaXMgYSAzMi1iaXQgYnkgNjQtYml0IGRpdmlzaW9uIChpbmRlZWQs
IG5vdCA2NC1ieS0zMiEpDQo+IA0KPiBub3JlcGx5QGVsbGVybWFuLmlkLmF1IHJlcG9ydHM6DQo+
IA0KPiAgICAgRVJST1I6IG1vZHBvc3Q6ICJfX3VkaXZkaTMiIFtkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW10NjV4eC5rb10gdW5kZWZpbmVkIQ0KPiAgICAgRVJST1I6IG1vZHBvc3Q6ICJfX2RpdmRp
MyIgW2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmtvXSB1bmRlZmluZWQhDQo+IA0KPiBm
b3IgMzItYml0IGJ1aWxkcy4NCj4gDQo+ID4gKyAgICAgICBtYXhfc3RlcF9jbnQgPSBtdGtfaTJj
X21heF9zdGVwX2NudChjaGVja19zcGVlZCk7DQo+ID4gKyAgICAgICBpZiAoKDIgKiBzdGVwX2Nu
dCkgPiBsb3dfY250ICYmIGxvd19jbnQgPCBtYXhfc3RlcF9jbnQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgaWYgKGxvd19jbnQgPiBzdGVwX2NudCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhpZ2hfY250ID0gMiAqIHN0ZXBfY250IC0gbG93X2NudDsNCj4gPiArICAgICAgICAgICAg
ICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBoaWdoX2NudCA9IHN0ZXBf
Y250Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGxvd19jbnQgPSBzdGVwX2NudDsNCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC0yOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHNkYV9t
YXggPSBzcGVjLT5tYXhfaGRfZGF0X25zIC8gc2FtcGxlX25zOw0KPiA+ICsgICAgICAgaWYgKHNk
YV9tYXggPiBsb3dfY250KQ0KPiA+ICsgICAgICAgICAgICAgICBzZGFfbWF4ID0gMDsNCj4gPiAr
DQo+ID4gKyAgICAgICBzZGFfbWluID0gRElWX1JPVU5EX1VQKHNwZWMtPm1pbl9zdV9kYXRfbnMs
IHNhbXBsZV9ucyk7DQo+IA0KPiBPbmUgbW9yZS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQoNCg==

