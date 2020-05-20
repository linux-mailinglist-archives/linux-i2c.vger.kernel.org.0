Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36FD1DADC7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 10:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgETIoE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 04:44:04 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:63521 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726224AbgETIoE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 04:44:04 -0400
X-UUID: d7b8e253527c43878f8fa023f1f7b048-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=u0K9CvT5HV61VJXYYwxkYfqIusTCbFNVtZQAS+tl34Q=;
        b=luKthv+eR0xrTVxdbHlaDd4k9oQjtvxMr/QNDzQKGBVUKw9IbG4QylxeWXGAnoUEIq/uuYTOjxDKqm+S7hmCBRf1LP5w90XZzJ/qxaky9IISaUKd/S1BYII6L8HUemO/mjkt0y2GYvQKFekhcMC1h6UiyTaAxcoNwHWFRhpoCf4=;
X-UUID: d7b8e253527c43878f8fa023f1f7b048-20200520
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1078213673; Wed, 20 May 2020 16:43:55 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 20 May
 2020 16:42:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 16:42:34 +0800
Message-ID: <1589964062.25512.67.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From:   Qii Wang <qii.wang@mediatek.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joe Perches <joe@perches.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>, <leilk.liu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        "Linux I2C" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 20 May 2020 16:41:02 +0800
In-Reply-To: <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
         <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
         <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
         <1589857073.25512.34.camel@mhfsdcap03>
         <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 419D878692A456EACB25265C39EB5C4831837D6DCD95B04EF9B86113CAB6032B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgMjAyMC0wNS0xOSBhdCAwOToxNCArMDIwMCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBRaWksDQo+IA0KPiBPbiBUdWUsIE1heSAxOSwgMjAyMCBh
dCA0OjU5IEFNIFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IE9u
IE1vbiwgMjAyMC0wNS0xOCBhdCAxNzo0NCArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPiA+ID4gT24gVGh1LCBNYXkgMTQsIDIwMjAgYXQgMzoxMyBQTSBRaWkgV2FuZyA8cWlpLndh
bmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGEgYWxnb3Jp
dGhtIHRvIGNhbGN1bGF0ZSBzb21lIGFjLXRpbWluZyBwYXJhbWV0ZXJzDQo+ID4gPiA+IHdoaWNo
IGNhbiBmdWxseSBtZWV0IEkyQyBTcGVjLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAzMjggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3NyBpbnNl
cnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQo+ID4gPiA+IGluZGV4IDBjYTZjMzhhLi43MDIwNjE4IDEwMDY0NA0KPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiA+DQo+ID4gPiA+ICsvKg0KPiA+ID4g
PiArICogQ2hlY2sgYW5kIENhbGN1bGF0ZSBpMmMgYWMtdGltaW5nDQo+ID4gPiA+ICsgKg0KPiA+
ID4gPiArICogSGFyZHdhcmUgZGVzaWduOg0KPiA+ID4gPiArICogc2FtcGxlX25zID0gKDEwMDAw
MDAwMDAgKiAoc2FtcGxlX2NudCArIDEpKSAvIGNsa19zcmMNCj4gPiA+ID4gKyAqIHh4eF9jbnRf
ZGl2ID0gIHNwZWMtPm1pbl94eHhfbnMgLyBzYW1wbGVfbnMNCj4gPiA+ID4gKyAqDQo+ID4gPiA+
ICsgKiBTYW1wbGVfbnMgaXMgcm91bmRlZCBkb3duIGZvciB4eHhfY250X2RpdiB3b3VsZCBiZSBn
cmVhdGVyDQo+ID4gPiA+ICsgKiB0aGFuIHRoZSBzbWFsbGVzdCBzcGVjLg0KPiA+ID4gPiArICog
VGhlIHNkYV90aW1pbmcgaXMgY2hvc2VuIGFzIHRoZSBtaWRkbGUgdmFsdWUgYmV0d2Vlbg0KPiA+
ID4gPiArICogdGhlIGxhcmdlc3QgYW5kIHNtYWxsZXN0Lg0KPiA+ID4gPiArICovDQo+ID4gPiA+
ICtzdGF0aWMgaW50IG10a19pMmNfY2hlY2tfYWNfdGltaW5nKHN0cnVjdCBtdGtfaTJjICppMmMs
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGNsa19zcmMsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGNoZWNrX3NwZWVkLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBzdGVwX2NudCwNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2FtcGxlX2NudCkNCj4gPiA+ID4gK3sN
Cj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzICpzcGVjOw0KPiA+
ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBzdV9zdGFfY250LCBsb3dfY250LCBoaWdoX2NudCwg
bWF4X3N0ZXBfY250Ow0KPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBzZGFfbWF4LCBzZGFf
bWluLCBjbGtfbnMsIG1heF9zdGFfY250ID0gMHgzZjsNCj4gPiA+ID4gKyAgICAgICBsb25nIGxv
bmcgc2FtcGxlX25zID0gKDEwMDAwMDAwMDAgKiAoc2FtcGxlX2NudCArIDEpKSAvIGNsa19zcmM7
DQo+ID4gPg0KPiA+ID4gU28gc2FtcGxlX25zIGlzIGEgNjQtYml0IHZhbHVlLiBJcyB0aGF0IHJl
YWxseSBuZWVkZWQ/DQo+ID4gPg0KPiA+DQo+ID4gKDEwMDAwMDAwMDAgKiAoc2FtcGxlX2NudCAr
IDEpKSAvIGNsa19zcmMgdmFsdWUgaXMgYSAzMi1iaXQsICgxMDAwMDAwMDAwDQo+ID4gKiAoc2Ft
cGxlX2NudCArIDEpKSB3aWxsIG92ZXIgMzItYml0IGlmIHNhbXBsZV9jbnQgaXMgNy4NCj4gDQo+
IFRoZSBpbnRlcm1lZGlhdGUgdmFsdWUgd2lsbCBpbmRlZWQgbm90IGZpdCBpbiAzMi1iaXQuDQo+
IEJ1dCB0aGF0IGRvZXNuJ3QgbWVhbiB0aGUgZW5kIHJlc3VsdCB3b24ndCBmaXQgaW4gMzItYml0
Lg0KPiBBcyB5b3UgZGl2aWRlIHNwZWMtPm1pbl9sb3dfbnMgYW5kIHNwZWMtPm1pbl9zdV9kYXRf
bnMgKHdoaWNoIEkgYXNzdW1lDQo+IGFyZSBzbWFsbCBudW1iZXJzKSBieSBzYW1wbGVfbnMgYmVs
b3csIHNhbXBsZV9ucyBjYW5ub3QgYmUgdmVyeSBsYXJnZSwNCj4gb3IgdGhlIHF1b3RpZW50IHdp
bGwgYmUgemVybyBhbnl3YXkuDQo+IFNvIGp1c3QgZG9pbmcgdGhlIG11bHRpcGxpY2F0aW9uIGlu
IDY0LWJpdCwgZm9sbG93ZWQgYnkgYSA2NC1ieS0zMg0KPiBkaXZpc2lvbiBpcyBwcm9iYWJseSBm
aW5lOg0KPiANCj4gICAgIHVuc2lnbmVkIGludCBzYW1wbGVfbnMgPSBkaXZfdTY0KDEwMDAwMDAw
MDBVTEwgKiAoc2FtcGxlX2NudCArIDEpLCBjbGtfc3JjKTsNCj4gDQo+IFlvdSBtYXkgd2FudCB0
byB0YWtlIHByZWNhdXRpb25zIGZvciB0aGUgY2FzZSB3aGVyZSB0aGUgcGFzc2VkIHZhbHVlIG9m
DQo+IGNsa19zcmMgaXMgYSBzbWFsbCBudW1iZXIgKGNhbiB0aGF0IGhhcHBlbj8pLg0KPiANCj4g
QlRXLCBjbGtfZ2V0X3JhdGUoKSByZXR1cm5zICJ1bnNpZ25lZCBsb25nIiwgd2hpbGUgbXRrX2ky
Y19zZXRfc3BlZWQoKQ0KPiB0YWtlcyBhbiAidW5zaWduZWQgaW50IiBwYXJlbnRfY2xrLCB3aGlj
aCBtYXkgY2F1c2UgZnV0dXJlIGlzc3Vlcy4NCj4gWW91IG1heSB3YW50IHRvIGNoYW5nZSB0aGF0
IHRvICJ1bnNpZ25lZCBsb25nIiwgYWxvbmcgdGhlIHdob2xlDQo+IHByb3BhZ2F0aW9uIHBhdGgs
IGFuZCB1c2UgZGl2NjRfdWwoKSBpbnN0ZWFkIG9mIGRpdl91NjQoKSBhYm92ZS4NCj4gDQoNClRo
ZSByZXR1cm4gdHlwZSBvZiBkaXZfdTY0IGlzIHU2NCh1bnNpZ25lZCBsb25nIGxvbmcpLCB0aGVy
ZSBpcyBhDQpjb21wdWxzb3J5IHR5cGUgY29udmVyc2lvbiBvcGVyYXRvci4gRG8geW91IHRoaW5r
IGl0IGlzIG5lZWRlZD8NCkJUVywgd2UganVzdCBuZWVkIHRvIGNoYW5nZSB0aGUgdHlwZSBvZiBz
YW1wbGVfbnMgdG8gdW5zaWduZWQgaW50LCBubw0KbWF0dGVyIHdoaWNoIG1ldGhvZCBpcyB1c2Vk
LCB3aGF0IGlzIHlvdXIgb3Bpbmlvbj8NCg0KPiA+IEkgdGhpbmsgMTAwMDAwMDAwMCBhbmQgY2xr
X3NyYyBpcyB0b28gYmlnLCBtYXliZSBJIGNhbiByZWR1Y2UgdGhlbiB3aXRoDQo+ID4gYmUgZGl2
aWRlZCBhbGwgYnkgMTAwMC4NCj4gPiBleGFtcGxlOg0KPiA+DQo+ID4gdW5zaWduZWQgaW50IHNh
bXBsZV9uczsNCj4gPiB1bnNpZ25lZCBpbnQgY2xrX3NyY19raHogPSBjbGtfc3JjIC8gMTAwMDsN
Cj4gDQo+IFRoYXQgbWF5IGNhdXNlIHRvbyBtdWNoIGxvc3Mgb2YgcHJlY2lzaW9uLg0KPiANCg0K
Y2xrX3NyYyBpcyBtb3JlIHRoYW4gTUh6IGFuZCBsZXNzIHRoYW4gR0haIGZvciBNVEsgaTJjIGNv
bnRyb2xsZXIsIHNvIGl0DQp3b3VsZG4ndCBjYXVzZSB0b28gbXVjaCBsb3NzIG9mIHByZWNpc2lv
bi4NCg0KPiA+DQo+ID4gaWYoY2xrX3NyY19raHopDQo+ID4gICAgICAgICBzYW1wbGVfbnMgPSAo
MTAwMDAwMCAqIChzYW1wbGVfY250ICsgMSkpIC8gY2xrX3NyY19raHo7DQo+ID4gZWxzZQ0KPiA+
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiA+ID4gKyAgICAgICBpZiAoIWkyYy0+
ZGV2X2NvbXAtPnRpbWluZ19hZGp1c3QpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
MDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGlmIChpMmMtPmRldl9jb21wLT5sdGltaW5n
X2FkanVzdCkNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIG1heF9zdGFfY250ID0gMHgxMDA7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBzcGVjID0gbXRrX2kyY19nZXRfc3BlYyhjaGVja19z
cGVlZCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBpZiAoaTJjLT5kZXZfY29tcC0+bHRp
bWluZ19hZGp1c3QpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBjbGtfbnMgPSAxMDAwMDAwMDAw
IC8gY2xrX3NyYzsNCj4gPiA+ID4gKyAgICAgICBlbHNlDQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICBjbGtfbnMgPSBzYW1wbGVfbnMgLyAyOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgc3Vf
c3RhX2NudCA9IERJVl9ST1VORF9VUChzcGVjLT5taW5fc3Vfc3RhX25zLCBjbGtfbnMpOw0KPiA+
ID4gPiArICAgICAgIGlmIChzdV9zdGFfY250ID4gbWF4X3N0YV9jbnQpDQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLTE7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBsb3dfY250
ID0gRElWX1JPVU5EX1VQKHNwZWMtPm1pbl9sb3dfbnMsIHNhbXBsZV9ucyk7DQo+ID4gPg0KPiA+
ID4gU28gdGhpcyBpcyBhIDMyLWJpdCBieSA2NC1iaXQgZGl2aXNpb24gKGluZGVlZCwgbm90IDY0
LWJ5LTMyISkNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQoNCg==

