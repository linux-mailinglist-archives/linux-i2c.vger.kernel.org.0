Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B6B268276
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 04:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgINCL7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Sep 2020 22:11:59 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:3502 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725965AbgINCL7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Sep 2020 22:11:59 -0400
X-UUID: 9a38a2da6a754d7aa3cf4d06118cfcb7-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4W9xTEpmgZVT2/OpOki6fDK3U38sN83jinmYa+wheMg=;
        b=VCraXxCZBR2IALd9Lvmvbrh8VQdJgzDBG9DYWj9o1xV+hUUOexoYT/HqsQeGNKzv8gSsloY0SvRP0U4zJvja0VA2SSHIqViQ1ApzNU4l6xJmP09mkPSaCdPavQOsQ1Gmloik00GLBLNIqDuWOCV5Bdx9SlD6v8cIc6nV8J7nkPY=;
X-UUID: 9a38a2da6a754d7aa3cf4d06118cfcb7-20200914
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 496528751; Mon, 14 Sep 2020 10:11:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Sep
 2020 10:11:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 10:11:45 +0800
Message-ID: <1600049386.25719.7.camel@mhfsdcap03>
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Update binding example
From:   Qii Wang <qii.wang@mediatek.com>
To:     Boris Lysov <arzamas-16@mail.ee>
CC:     <linux-i2c@vger.kernel.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>
Date:   Mon, 14 Sep 2020 10:09:46 +0800
In-Reply-To: <20200907180841.0044d571@hp15>
References: <20200904223345.3daea5ad@hp15>
         <1599442087.25719.2.camel@mhfsdcap03> <20200907180841.0044d571@hp15>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3A83683D312E1AF55A83475D20CBADD2D7A3FAE740C2582C51B60FEB8DC944242000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIwLTA5LTA3IGF0IDE4OjA4ICswMzAwLCBCb3JpcyBMeXNvdiB3cm90ZToNCj4g
T24gTW9uLCA3IFNlcCAyMDIwIDA5OjI4OjA3ICswODAwDQo+IFFpaSBXYW5nIDxxaWkud2FuZ0Bt
ZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiBPbiBGcmksIDIwMjAtMDktMDQgYXQgMjI6MzMg
KzAzMDAsIEJvcmlzIEx5c292IHdyb3RlOg0KPiA+ID4gRXhhbXBsZSB1c2VzIHZhbHVlcyBmb3Ig
TVQ2NTg5IFNvQywgYnV0IE1UNjU3NyB3YXMgc3BlY2lmaWVkIGluICJjb21wYXRpYmxlIiBwcm9w
ZXJ0eS4NCj4gPiA+ICAgDQo+ID4gDQo+ID4gV2h5IGRvIHlvdSB0aGluayB0aGUgZXhhbXBsZSBp
cyBNVDY1ODkgU29DLCBub3QgTVQ2NTc3Pw0KPiA+IA0KPiANCj4gVGhlIGJlc3Qgd2F5IHRvIGV4
cGxhaW4gd2h5IGl0J3MgZm9yIE1UNjU4OSBpbnN0ZWFkIG9mIE1UNjU3NyBpcyB0byBwcm92aWRl
DQo+IGFuIGV4YW1wbGUgOykgSSB3aWxsIHJlZmVyIHRvIHZhcmlvdXMgZG93bnN0cmVhbSBMaW51
eCBrZXJuZWwgc291cmNlcywgSSBob3BlDQo+IHNoYXJpbmcgR2l0SHViIGxpbmtzIGlzIGFwcHJv
cHJpYXRlLg0KPiANCj4gDQo+IFRoaXMgaXMgdGhlIGtlcm5lbCBzb3VyY2UgY29kZSBvZiBMZW5v
dm8gUDc4MCAoTVQ2NTg5KQ0KPiBodHRwczovL2dpdGh1Yi5jb20vYW5kcmV5YTEwOC9iaW5kdS1r
ZXJuZWwtbWVkaWF0ZWsNCj4gDQo+IG1lZGlhdGVrL3BsYXRmb3JtL210NjU4OS9rZXJuZWwvY29y
ZS9pbmNsdWRlL21hY2gvbXRfcmVnX2Jhc2UuaCAsIGxpbmUgMTE1Og0KPiA+ICNkZWZpbmUgSTJD
MF9CQVNFICAgICAgICAgICAgICAgICAgMHhGMTAwRDAwMA0KPiBUaGlzIGFkZHJlc3MgaXMgdmly
dHVhbCwgYW5kIGl0IHRyYW5zbGF0ZXMgaW50byBwaHlzaWNhbCBhZGRyZXNzIDB4MTEwMEQwMDAN
Cj4gMHgxMTAwRDAwMCBlcXVhbHMgdG8gdGhlIHZhbHVlIGluIGV4YW1wbGUNCj4gDQo+IG1lZGlh
dGVrL3BsYXRmb3JtL210NjU4OS9rZXJuZWwvY29yZS9tdF9kZXZzLmMgLCBsaW5lIDg0NjoNCj4g
PiAuZW5kICAgID0gSU9fVklSVF9UT19QSFlTKEkyQzBfQkFTRSkgKyAweDcwLA0KPiAweDcwIHNo
b3dzIGxlbmd0aCBvZiBtZW1vcnkgcmVnaW9uLCB3aGljaCBhbHNvIGVxdWFscyB0byB0aGUgdmFs
dWUgaW4gZXhhbXBsZQ0KPiANCj4gbWVkaWF0ZWsvcGxhdGZvcm0vbXQ2NTg5L2tlcm5lbC9kcml2
ZXJzL2kyYy9pMmMuYyAsIGxpbmUgMTE0MDoNCj4gPiBpMmMtPnBkbWFiYXNlID0gQVBfRE1BX0JB
U0UgKyAweDMwMCArICgweDgwKihpMmMtPmlkKSk7DQo+IEZvciBpZD0wLCBwaHlzaWNhbCBwZG1h
YmFzZSBpcyAweDExMDAwMzAwIHdoaWNoIGFsc28gbWF0Y2hlcyB0aGUgYWRkcmVzcyBpbiBleGFt
cGxlDQo+IA0KPiBtZWRpYXRlay9wbGF0Zm9ybS9tdDY1ODkva2VybmVsL2NvcmUvaW5jbHVkZS9t
YWNoL210X2lycS5oICwgbGluZSAyOToNCj4gPiAjZGVmaW5lIE1UX0kyQzBfSVJRX0lEICAgICAg
ICAgICAgICAgICAgICAgIChHSUNfUFJJVkFURV9TSUdOQUxTICsgNDQpDQo+IFRoZSBJUlEgSUQg
KDQ0KSBlcXVhbHMgdG8gb25lIHNwZWNpZmllZCBpbiBkdC1iaW5kaW5nIGV4YW1wbGU6DQo+ID4g
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ0IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0KPiBUaGVz
ZSB2YWx1ZXMgYXJlIHNhbWUgZm9yIG90aGVyIE1UNjU4OSBkZXZpY2VzLCBoZXJlIGFyZSBmZXcg
b3RoZXIgcmVwb3NpdG9yaWVzDQo+IGNvbnRhaW5pbmcgc2FtZSBsaW5lcyBvZiBjb2RlIGFzIGFi
b3ZlIChsaW5lIG51bWJlcnMgbWlnaHQgYmUgb2ZmIGZvciBhIGZldyBsaW5lcywNCj4gYnV0IHRo
ZSB2YWx1ZXMgSSBhbSByZWZlcnJpbmcgdG8gYXJlIHNhbWUpOg0KPiBNaWNyb21heCBBMTE2IChN
VDY1ODkpIC0gaHR0cHM6Ly9naXRodWIuY29tL25lb21hbnUvTmVvS2VybmVsLU1UNjU4OS1BMTE2
DQo+IEFjZXIgVjM3MCAoTVQ2NTg5KSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9TaHIzcHMvYW5kcm9p
ZF9rZXJuZWxfYWNlcl9WMzcwX01UNjU4OQ0KPiBicSBBcXVhcmlzIDUuNyAoTVQ2NTg5KSAtIGh0
dHBzOi8vZ2l0aHViLmNvbS9sdWNrYXNmYi9hcXVhcmlzLTUuNw0KPiANCj4gDQo+IE5vdyBsZXRz
IHRha2UgYSBsb29rIGF0IE1UNjU3NyBkZXZpY2VzLiBUaGlzIGlzIHRoZSBrZXJuZWwgc291cmNl
IGNvZGUgb2YgWlRFIHY5NzA6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9kcmFnb25wdC9LZXJuZWxf
My40LjY3X0tLX1pURV92OTcwDQo+IA0KPiBtZWRpYXRlay9wbGF0Zm9ybS9tdDY1ODkva2VybmVs
L2NvcmUvaW5jbHVkZS9tYWNoL210X3JlZ19iYXNlLmggLCBsaW5lIDY4Og0KPiA+ICNkZWZpbmUg
STJDMF9CQVNFIDB4RjEwMTIwMDANCj4gVGhpcyBhZGRyZXNzIGlzIHZpcnR1YWwsIGFuZCBpdCB0
cmFuc2xhdGVzIGludG8gcGh5c2ljYWwgYWRkcmVzcyAweEMxMDEyMDAwDQo+IDB4QzEwMTIwMDAg
ZG9lcyBub3QgZXF1YWwgdG8gMHgxMTAwZDAwMCBsaXN0ZWQgaW4gZXhhbXBsZSENCj4gDQo+IG1l
ZGlhdGVrL3BsYXRmb3JtL210NjU3Ny9rZXJuZWwvZHJpdmVycy9pMmMvaTJjLmMNCj4gTm8gbWVu
dGlvbnMgb2YgcGRtYWJhc2UuIFRoZXJlIGFyZSBubyBETUEgYWRkcmVzc2VzIGluIHRoaXMgZmls
ZSENCj4gDQo+IG1lZGlhdGVrL3BsYXRmb3JtL210NjU3Ny9rZXJuZWwvY29yZS9pbmNsdWRlL21h
Y2gvbXRfaXJxLmggLCBsaW5lIDcwOg0KPiA+ICNkZWZpbmUgTVRfSTJDMF9JUlFfSUQgICAgICAg
ICAgICAgICAgICAoR0lDX1BSSVZBVEVfU0lHTkFMUyArIDQ5KQ0KPiBUaGUgSVJRIElEICg0OSkg
ZG9lcyBub3QgbWF0Y2ggdGhlIElEICg0NCkgc3BlY2lmaWVkIGluIGV4YW1wbGUhDQo+IA0KPiBP
dGhlciBNVDY1Nzcga2VybmVscyB3aXRoIHNhbWUgdmFsdWVzOg0KPiBBY2VyIFYzNjAgKE1UNjU3
NykgLSBodHRwczovL2dpdGh1Yi5jb20vYXF1aWxhLWRldi9tdDY1Nzdfa2VybmVsMy40DQo+IEFj
ZXIgQzEwIChNVDY1NzcpIC0gaHR0cHM6Ly9naXRodWIuY29tL0RyLVNoYWRvdy9hbmRyb2lkX2tl
cm5lbF9hY2VyX2MxMA0KPiBXaWtvIENpbmsgU2xpbSAoTVQ2NTc3KSAtIGh0dHBzOi8vZ2l0aHVi
LmNvbS90aGVib2xlc2xhdy9rZXJuZWxfd2lrb19zODA3Mw0KPiANCj4gDQo+IEFzIHlvdSBjYW4g
c2VlLCBjdXJyZW50IGR0LWJpbmRpbmcgZXhhbXBsZSByZXByZXNlbnRzIE1UNjU4OSBTb0MgdmFs
dWVzLCBub3QgTVQ2NTc3Lg0KPiBJIGhhdmUgc2VudCBhZGRpdGlvbmFsIGVtYWlsIGFib3V0IGky
Yy1tdDY1eHggYW5kIE1UNjU3NyBjb21wYXRpYmlsaXR5LCB3aGVyZQ0KPiBJIHZvaWNlZCBteSBj
b25jZXJucyBhYm91dCBJMkMgRE1BIG9uIHRoYXQgU29DLiBJIGhvcGUgeW91IGNhbiBsb29rIGlu
dG8gaXQuDQoNCk5vbmUgb2YgdGhlIGV4YW1wbGVzIHlvdSBjaXRlZCBhcmUgdGhlIHVwc3RyZWFt
IGNvZGUgb2Ygb3VyIG9mZmljaWFsDQpyZWxlYXNlLCBhbmQgdGhlIG5hbWUgb2YgY3VzdG9tZXIn
cyBTT0MgY2Fubm90IGJlIGFjY3VyYXRlbHkgZXZhbHVhdGVkLiANCg==

