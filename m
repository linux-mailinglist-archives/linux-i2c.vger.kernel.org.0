Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84FA1DAE7D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 11:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgETJQ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 05:16:26 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:13426 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726691AbgETJQ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 05:16:26 -0400
X-UUID: dea7b414c06e4463967e7de90a6aadac-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=K8ak0JSXJixdtwvCiossf6ujQlSNi19Cg+Ap0Gxff1k=;
        b=jB5Lq1jXLZfuGavlSoFR4egUEO7naGFuPZGbOGKEO9WbQND6w26kXjRDf9s5AjQtEptwyDnEYaAGBdUjpj8CcXtWwj/dk9djZ90cKaKB7ZycW6aY9GKV42aWeydaVqhY4zBxcKEaLht+cqw52fTYiPLsI+XRNRF2tAqiEgz4PGA=;
X-UUID: dea7b414c06e4463967e7de90a6aadac-20200520
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 617312505; Wed, 20 May 2020 17:16:01 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 20 May
 2020 17:15:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 17:15:59 +0800
Message-ID: <1589966065.25512.70.camel@mhfsdcap03>
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
Date:   Wed, 20 May 2020 17:14:25 +0800
In-Reply-To: <CAMuHMdXZTU+4-WyVjvv=i28x+MRVrAdRPM0_ybvkkFuh-ps+eg@mail.gmail.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
         <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
         <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
         <1589857073.25512.34.camel@mhfsdcap03>
         <CAMuHMdXgp85PVteunxrHYcMTqFgQWHmXXCVJM_KX76xkCADMpw@mail.gmail.com>
         <1589964062.25512.67.camel@mhfsdcap03>
         <CAMuHMdXZTU+4-WyVjvv=i28x+MRVrAdRPM0_ybvkkFuh-ps+eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D677F009DFC332B6657700B42BB3688C0851682D969FAD19BE398644F5528A602000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZCwgMjAyMC0wNS0yMCBhdCAxMDo1OCArMDIwMCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBRaWksDQo+IA0KPiBPbiBXZWQsIE1heSAyMCwgMjAyMCBh
dCAxMDo0NCBBTSBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiBP
biBUdWUsIDIwMjAtMDUtMTkgYXQgMDk6MTQgKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToNCj4gPiA+IE9uIFR1ZSwgTWF5IDE5LCAyMDIwIGF0IDQ6NTkgQU0gUWlpIFdhbmcgPHFpaS53
YW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgMjAyMC0wNS0xOCBhdCAx
Nzo0NCArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFRodSwg
TWF5IDE0LCAyMDIwIGF0IDM6MTMgUE0gUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4g
d3JvdGU6DQo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYSBhbGdvcml0aG0gdG8gY2FsY3Vs
YXRlIHNvbWUgYWMtdGltaW5nIHBhcmFtZXRlcnMNCj4gPiA+ID4gPiA+IHdoaWNoIGNhbiBmdWxs
eSBtZWV0IEkyQyBTcGVjLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgMzI4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjc3IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+ID4gPiA+ID4gaW5kZXggMGNhNmMzOGEu
LjcwMjA2MTggMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICsvKg0KPiA+ID4gPiA+ID4gKyAqIENoZWNrIGFu
ZCBDYWxjdWxhdGUgaTJjIGFjLXRpbWluZw0KPiA+ID4gPiA+ID4gKyAqDQo+ID4gPiA+ID4gPiAr
ICogSGFyZHdhcmUgZGVzaWduOg0KPiA+ID4gPiA+ID4gKyAqIHNhbXBsZV9ucyA9ICgxMDAwMDAw
MDAwICogKHNhbXBsZV9jbnQgKyAxKSkgLyBjbGtfc3JjDQo+ID4gPiA+ID4gPiArICogeHh4X2Nu
dF9kaXYgPSAgc3BlYy0+bWluX3h4eF9ucyAvIHNhbXBsZV9ucw0KPiA+ID4gPiA+ID4gKyAqDQo+
ID4gPiA+ID4gPiArICogU2FtcGxlX25zIGlzIHJvdW5kZWQgZG93biBmb3IgeHh4X2NudF9kaXYg
d291bGQgYmUgZ3JlYXRlcg0KPiA+ID4gPiA+ID4gKyAqIHRoYW4gdGhlIHNtYWxsZXN0IHNwZWMu
DQo+ID4gPiA+ID4gPiArICogVGhlIHNkYV90aW1pbmcgaXMgY2hvc2VuIGFzIHRoZSBtaWRkbGUg
dmFsdWUgYmV0d2Vlbg0KPiA+ID4gPiA+ID4gKyAqIHRoZSBsYXJnZXN0IGFuZCBzbWFsbGVzdC4N
Cj4gPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IG10a19pMmNfY2hlY2tf
YWNfdGltaW5nKHN0cnVjdCBtdGtfaTJjICppMmMsDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjbGtfc3JjLA0KPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY2hlY2tfc3Bl
ZWQsDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBzdGVwX2NudCwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IHNhbXBsZV9jbnQpDQo+ID4gPiA+ID4gPiArew0KPiA+ID4g
PiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzICpzcGVjOw0KPiA+ID4g
PiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgc3Vfc3RhX2NudCwgbG93X2NudCwgaGlnaF9jbnQs
IG1heF9zdGVwX2NudDsNCj4gPiA+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IHNkYV9tYXgs
IHNkYV9taW4sIGNsa19ucywgbWF4X3N0YV9jbnQgPSAweDNmOw0KPiA+ID4gPiA+ID4gKyAgICAg
ICBsb25nIGxvbmcgc2FtcGxlX25zID0gKDEwMDAwMDAwMDAgKiAoc2FtcGxlX2NudCArIDEpKSAv
IGNsa19zcmM7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTbyBzYW1wbGVfbnMgaXMgYSA2NC1iaXQg
dmFsdWUuIElzIHRoYXQgcmVhbGx5IG5lZWRlZD8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4g
PiAoMTAwMDAwMDAwMCAqIChzYW1wbGVfY250ICsgMSkpIC8gY2xrX3NyYyB2YWx1ZSBpcyBhIDMy
LWJpdCwgKDEwMDAwMDAwMDANCj4gPiA+ID4gKiAoc2FtcGxlX2NudCArIDEpKSB3aWxsIG92ZXIg
MzItYml0IGlmIHNhbXBsZV9jbnQgaXMgNy4NCj4gPiA+DQo+ID4gPiBUaGUgaW50ZXJtZWRpYXRl
IHZhbHVlIHdpbGwgaW5kZWVkIG5vdCBmaXQgaW4gMzItYml0Lg0KPiA+ID4gQnV0IHRoYXQgZG9l
c24ndCBtZWFuIHRoZSBlbmQgcmVzdWx0IHdvbid0IGZpdCBpbiAzMi1iaXQuDQo+ID4gPiBBcyB5
b3UgZGl2aWRlIHNwZWMtPm1pbl9sb3dfbnMgYW5kIHNwZWMtPm1pbl9zdV9kYXRfbnMgKHdoaWNo
IEkgYXNzdW1lDQo+ID4gPiBhcmUgc21hbGwgbnVtYmVycykgYnkgc2FtcGxlX25zIGJlbG93LCBz
YW1wbGVfbnMgY2Fubm90IGJlIHZlcnkgbGFyZ2UsDQo+ID4gPiBvciB0aGUgcXVvdGllbnQgd2ls
bCBiZSB6ZXJvIGFueXdheS4NCj4gPiA+IFNvIGp1c3QgZG9pbmcgdGhlIG11bHRpcGxpY2F0aW9u
IGluIDY0LWJpdCwgZm9sbG93ZWQgYnkgYSA2NC1ieS0zMg0KPiA+ID4gZGl2aXNpb24gaXMgcHJv
YmFibHkgZmluZToNCj4gPiA+DQo+ID4gPiAgICAgdW5zaWduZWQgaW50IHNhbXBsZV9ucyA9IGRp
dl91NjQoMTAwMDAwMDAwMFVMTCAqIChzYW1wbGVfY250ICsgMSksIGNsa19zcmMpOw0KPiA+ID4N
Cj4gPiA+IFlvdSBtYXkgd2FudCB0byB0YWtlIHByZWNhdXRpb25zIGZvciB0aGUgY2FzZSB3aGVy
ZSB0aGUgcGFzc2VkIHZhbHVlIG9mDQo+ID4gPiBjbGtfc3JjIGlzIGEgc21hbGwgbnVtYmVyIChj
YW4gdGhhdCBoYXBwZW4/KS4NCj4gPiA+DQo+ID4gPiBCVFcsIGNsa19nZXRfcmF0ZSgpIHJldHVy
bnMgInVuc2lnbmVkIGxvbmciLCB3aGlsZSBtdGtfaTJjX3NldF9zcGVlZCgpDQo+ID4gPiB0YWtl
cyBhbiAidW5zaWduZWQgaW50IiBwYXJlbnRfY2xrLCB3aGljaCBtYXkgY2F1c2UgZnV0dXJlIGlz
c3Vlcy4NCj4gPiA+IFlvdSBtYXkgd2FudCB0byBjaGFuZ2UgdGhhdCB0byAidW5zaWduZWQgbG9u
ZyIsIGFsb25nIHRoZSB3aG9sZQ0KPiA+ID4gcHJvcGFnYXRpb24gcGF0aCwgYW5kIHVzZSBkaXY2
NF91bCgpIGluc3RlYWQgb2YgZGl2X3U2NCgpIGFib3ZlLg0KPiA+ID4NCj4gPg0KPiA+IFRoZSBy
ZXR1cm4gdHlwZSBvZiBkaXZfdTY0IGlzIHU2NCh1bnNpZ25lZCBsb25nIGxvbmcpLCB0aGVyZSBp
cyBhDQo+ID4gY29tcHVsc29yeSB0eXBlIGNvbnZlcnNpb24gb3BlcmF0b3IuIERvIHlvdSB0aGlu
ayBpdCBpcyBuZWVkZWQ/DQo+IA0KPiBUaGUgcmVzdWx0IG9mIGEgNjQtYnktMzIgYml0IGRpdmlz
aW9uIG1heSBpbmRlZWQgbm90IGZpdCBpbiAzMi1iaXQsIHNvIHRoYXQncw0KPiB3aHkgaXQgcmV0
dXJucyB1NjQuDQo+IElmIHlvdSBrbm93IHRoZSBxdW90aWVudCB3aWxsIGFsd2F5cyBmaXQsIGl0
J3MgZmluZS4NCj4gDQo+ID4gQlRXLCB3ZSBqdXN0IG5lZWQgdG8gY2hhbmdlIHRoZSB0eXBlIG9m
IHNhbXBsZV9ucyB0byB1bnNpZ25lZCBpbnQsIG5vDQo+ID4gbWF0dGVyIHdoaWNoIG1ldGhvZCBp
cyB1c2VkLCB3aGF0IGlzIHlvdXIgb3Bpbmlvbj8NCj4gDQo+IEluZGVlZC4NCj4gDQo+IEJUVywg
SSBqdXN0IHJlYWxpemUNCj4gDQo+ICAgICBsb25nIGxvbmcgc2FtcGxlX25zID0gKDEwMDAwMDAw
MDAgKiAoc2FtcGxlX2NudCArIDEpKSAvIGNsa19zcmM7DQo+IA0KPiB3YXNuJ3QgZG9pbmcgd2hh
dCB5b3Ugd2FudGVkIGFueXdheSwgYXMgMTAwMDAwMDAwMCBpcyAoaW1wbGljaXQpIGludCwNCj4g
YW5kIHNhbXBsZV9jbnQgaXMgdW5zaWduZWQgaW50LCBzbyB0aGUgbXVsdGlwbGljYXRpb24gd2Fz
IGRvbmUgaW4gMzItYml0LA0KPiBwb3NzaWJsZSBsZWFkaW5nIHRvIGEgdHJ1bmNhdGlvbi4gIEhl
bmNlIHRoYXQgZGl2aXNpb24gd2FzIGRvbmUgaW4gMzItYml0LCB0b28sDQo+IHRoYXQncyB3aHkg
SSBkaWRuJ3Qgbm90aWNlIGEgY2FsbCB0byBfX3VkaXZkaTMoKSBpbiB0aGUgYXNzZW1ibGVyIG91
dHB1dCBoZXJlLg0KPiANCj4gU28geW91IGhhdmUgdG8gZm9yY2UgdGhlIG11bHRpcGxpY2F0aW9u
IHRvIGJlIGRvbmUgaW4gNjQtYml0LCBlLmcuDQo+IGJ5IGNoYW5naW5nIHRoZSBjb25zdGFudCB0
byAxMDAwMDAwMDAwVUxMLCBhbmQgdXNlIGRpdl91NjQoKSBmb3INCj4gdGhlIGRpdmlzaW9uLg0K
PiANCg0Kb2ssIEkgd2lsbCBnaXZlIGEgcGF0Y2ggd2l0aCB5b3VyIHdheSwgdGhhbmtzIGZvciB5
b3VyIG9waW5pb24uDQoNCj4gPg0KPiA+ID4gPiBJIHRoaW5rIDEwMDAwMDAwMDAgYW5kIGNsa19z
cmMgaXMgdG9vIGJpZywgbWF5YmUgSSBjYW4gcmVkdWNlIHRoZW4gd2l0aA0KPiA+ID4gPiBiZSBk
aXZpZGVkIGFsbCBieSAxMDAwLg0KPiA+ID4gPiBleGFtcGxlOg0KPiA+ID4gPg0KPiA+ID4gPiB1
bnNpZ25lZCBpbnQgc2FtcGxlX25zOw0KPiA+ID4gPiB1bnNpZ25lZCBpbnQgY2xrX3NyY19raHog
PSBjbGtfc3JjIC8gMTAwMDsNCj4gPiA+DQo+ID4gPiBUaGF0IG1heSBjYXVzZSB0b28gbXVjaCBs
b3NzIG9mIHByZWNpc2lvbi4NCj4gPiA+DQo+ID4NCj4gPiBjbGtfc3JjIGlzIG1vcmUgdGhhbiBN
SHogYW5kIGxlc3MgdGhhbiBHSFogZm9yIE1USyBpMmMgY29udHJvbGxlciwgc28gaXQNCj4gPiB3
b3VsZG4ndCBjYXVzZSB0b28gbXVjaCBsb3NzIG9mIHByZWNpc2lvbi4NCj4gDQo+IE9LLCBzbyB0
aGF0IHdvdWxkIHdvcmssIHRvby4NCj4gDQo+ID4gPiA+DQo+ID4gPiA+IGlmKGNsa19zcmNfa2h6
KQ0KPiA+ID4gPiAgICAgICAgIHNhbXBsZV9ucyA9ICgxMDAwMDAwICogKHNhbXBsZV9jbnQgKyAx
KSkgLyBjbGtfc3JjX2toejsNCj4gPiA+ID4gZWxzZQ0KPiA+ID4gPiAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAgICAgICBpZiAoIWkyYy0+ZGV2X2NvbXAt
PnRpbWluZ19hZGp1c3QpDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+
ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIGlmIChpMmMtPmRldl9jb21wLT5sdGlt
aW5nX2FkanVzdCkNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBtYXhfc3RhX2NudCA9IDB4
MTAwOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyAgICAgICBzcGVjID0gbXRrX2kyY19n
ZXRfc3BlYyhjaGVja19zcGVlZCk7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAg
IGlmIChpMmMtPmRldl9jb21wLT5sdGltaW5nX2FkanVzdCkNCj4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICBjbGtfbnMgPSAxMDAwMDAwMDAwIC8gY2xrX3NyYzsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgZWxzZQ0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNsa19ucyA9IHNhbXBsZV9ucyAv
IDI7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIHN1X3N0YV9jbnQgPSBESVZf
Uk9VTkRfVVAoc3BlYy0+bWluX3N1X3N0YV9ucywgY2xrX25zKTsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgaWYgKHN1X3N0YV9jbnQgPiBtYXhfc3RhX2NudCkNCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gLTE7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIGxvd19j
bnQgPSBESVZfUk9VTkRfVVAoc3BlYy0+bWluX2xvd19ucywgc2FtcGxlX25zKTsNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IFNvIHRoaXMgaXMgYSAzMi1iaXQgYnkgNjQtYml0IGRpdmlzaW9uIChpbmRl
ZWQsIG5vdCA2NC1ieS0zMiEpDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KDQo=

