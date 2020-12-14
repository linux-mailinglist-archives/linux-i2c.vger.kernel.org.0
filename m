Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00F12D9452
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 09:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405205AbgLNItP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 03:49:15 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:20798 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727215AbgLNItO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 03:49:14 -0500
X-UUID: 07ff6e1b070540819f46b0b60ec874d6-20201214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=n1kA6Xt14g3xa0Kc7PDsfol/8c8gVI0uIJMViFPg2wE=;
        b=ENhkujVPk4+U8Q1Qw8QJkWL16yFzOLCfre7VkpWrT88IzkjcRsGcG++nwDhMEsQ35Jyk5/jfEDFdQgTzdLoXKXe79fD3bpV6qAd5ABblKgQNGJS/0prLi4Djr5/RnY6THD8MT6RwaAoj5fRfXcWjRkb7z1qP7cHirN+h5gsAtgg=;
X-UUID: 07ff6e1b070540819f46b0b60ec874d6-20201214
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1033874007; Mon, 14 Dec 2020 16:48:07 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Dec
 2020 16:48:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Dec 2020 16:48:04 +0800
Message-ID: <1607935685.25719.49.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
CC:     Wolfram Sang <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Mon, 14 Dec 2020 16:48:05 +0800
In-Reply-To: <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
         <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
         <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
         <1607326431.25719.33.camel@mhfsdcap03>
         <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
         <1607565387.25719.43.camel@mhfsdcap03>
         <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A348A07C4749E292614C871158F2A1BF55706716C364BA0E2AF8FF30E55F93102000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDE1OjAzICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90
ZToNCj4gDQo+IE9uIDEwLzEyLzIwMjAgMDM6NTYsIFFpaSBXYW5nIHdyb3RlOg0KPiA+IE9uIE1v
biwgMjAyMC0xMi0wNyBhdCAxODozNSArMDIwMCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+
ID4+DQo+ID4+Pg0KPiA+Pj4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDEwOjAxICswMjAwLCBHcnln
b3JpaSBTdHJhc2hrbyB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IE9uIDAzLzEyLzIwMjAgMDM6MjUs
IFFpaSBXYW5nIHdyb3RlOg0KPiA+Pj4+PiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTY6MzUgKzAx
MDAsIFdvbGZyYW0gU2FuZyB3cm90ZToNCj4gPj4+Pj4+IEhpLA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+
PiBTb21lIGkyYyBkZXZpY2UgZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMgZHJpdmVyIHdoZW4g
aXQgaXMgbm93DQo+ID4+Pj4+Pj4gYmVpbmcgc3VzcGVuZGVkLiBUaGUgaTJjIGRldmljZXMgZHJp
dmVyIGlzIHN1c3BlbmRlZCBkdXJpbmcgdGhlDQo+ID4+Pj4+Pj4gTk9JUlEgcGhhc2UgYW5kIHRo
aXMgY2Fubm90IGJlIGNoYW5nZWQgZHVlIHRvIG90aGVyIGRlcGVuZGVuY2llcy4NCj4gPj4+Pj4+
PiBUaGVyZWZvcmUsIHdlIGFsc28gbmVlZCB0byBtb3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZv
ciB0aGUgSTJDDQo+ID4+Pj4+Pj4gY29udHJvbGxlciBkcml2ZXIgdG8gdGhlIE5PSVJRIHBoYXNl
IGFzIHdlbGwuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8
cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IElzIHRoaXMgYSBidWdm
aXggYW5kIHNob3VsZCBnbyBpbnRvIDUuMTA/IE9yIGNhbiBpdCB3YWl0IGZvciA1LjExPw0KPiA+
Pj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gWWVzLCBDYW4geW91IGhlbHAgdG8gYXBwbHkgaXQgaW50
byA1LjEwPyBUaGFua3MNCj4gPj4+Pg0KPiA+Pj4+IFRvIGJlIGhvbmVzdCBpZiB5b3Ugc3RpbGwg
ZG8gaGF2ZSBhbnkgaTJjIGRldmljZSB3aGljaCBhY2Nlc3NpbmcgaTJjIGJ1c3MgYWZ0ZXIgX25v
aXJxDQo+ID4+Pj4gc3RhZ2UgYW5kIHlvdXIgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCAubWFz
dGVyX3hmZXJfYXRvbWljKCkgLSB5b3UgZGVmaW5pdGVseSBoYXZlIGEgYmlnZ2VyIHByb2JsZW0u
DQo+ID4+Pj4gU28gYWRkaW5nIElSUUZfTk9fU1VTUEVORCBzb3VuZCBsaWtlIGEgaGFjayBhbmQg
cHJvYmFibHkgd29ya3MganVzdCBieSBsdWNrLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQXQgcHJl
c2VudCwgaXQgaXMgb25seSBhIHByb2JsZW0gY2F1c2VkIGJ5IG1pc3NpbmcgaW50ZXJydXB0cywN
Cj4gPj4+IGFuZCAubWFzdGVyX3hmZXJfYXRvbWljKCkganVzdCBhIGltcGxlbWVudCBpbiBwb2xs
aW5nIG1vZGUuIFdoeSBub3Qgc2V0DQo+ID4+PiB0aGUgaW50ZXJydXB0IHRvIGEgc3RhdGUgdGhh
dCBjYW4gYWx3YXlzIGJlIHRyaWdnZXJlZD8NCj4gPj4+DQo+ID4+Pg0KPiA+Pg0KPiA+PiBCZWNh
dXNlIHlvdSBtdXN0IG5vdCB1c2UgYW55IElSUSBkcml2ZW4gb3BlcmF0aW9ucyBhZnRlciBfbm9p
cnEgc3VzcGVuZCBzdGF0ZSBhcyBpdCBtaWdodCAoYW5kIG1vc3QgcHJvYmFibHkgd2lsbCkNCj4g
Pj4gY2F1c2UgdW5wcmVkaWN0YWJsZSBiZWhhdmlvciBsYXRlciAgaW4gc3VzcGVuZF9lbnRlcigp
Og0KPiA+Pg0KPiA+PiAJYXJjaF9zdXNwZW5kX2Rpc2FibGVfaXJxcygpOw0KPiA+PiAJQlVHX09O
KCFpcnFzX2Rpc2FibGVkKCkpOw0KPiA+PiBeYWZ0ZXIgdGhpcyBwb2ludCBhbnkgSVJRIGRyaXZl
biBJMkMgdHJhbnNmZXIgd2lsbCBjYXVzZSBJUlEgdG8gYmUgcmUtZW5hYmxlZA0KPiA+Pg0KPiA+
PiBpZiB5b3UgbmVlZCAgdHVybiBvZmYgZGV2aWNlIGZyb20gcGxhdGZvcm0gY2FsbGJhY2tzIC0g
IC5tYXN0ZXJfeGZlcl9hdG9taWMoKSBoYXMgdG8gYmUgaW1wbGVtZW50ZWQgYW5kIHVzZWQuDQo+
ID4+ICAgIA0KPiA+IE1heWJlIG15IGNvbW1lbnQgaXMgYSBiaXQgZGlzdHVyYmluZy5PdXIgcHVy
cG9zZSBpcyBub3QgdG8gY2FsbCBpMmMgYW5kDQo+ID4gdXNlIGludGVycnVwdHMgYWZ0ZXIgX25v
aXJxIHBhdXNlcy5TbyBXZSB1c2UNCj4gPiBpMmNfbWFya19hZGFwdGVyX3N1c3BlbmRlZCZpMmNf
bWFya19hZGFwdGVyX3Jlc3VtZWQgdG8gYmxvY2sgdGhlc2UgaTJjDQo+ID4gdHJhbnNmZXJz77yM
IFRoZXJlIHdpbGwgbm90IGhhdmUgYW55IElSUSBkcml2ZW4gSTJDIHRyYW5zZmVyIGFmdGVyIHRo
aXMNCj4gPiBwb2ludDoNCj4gPiAgICAgICAgICBhcmNoX3N1c3BlbmRfZGlzYWJsZV9pcnFzKCk7
DQo+ID4gICAgICAgICAgQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOw0KPiA+IEJ1dCBzb21lIGRl
dmljZSBkcml2ZXIgd2lsbCBkbyBpMmMgdHJhbnNmZXIgYWZ0ZXINCj4gPiBkcG1fbm9pcnFfcmVz
dW1lX2RldmljZXMgaW4gZHBtX3Jlc3VtZV9ub2lycShQTVNHX1JFU1VNRSkgd2hlbiBvdXINCj4g
PiBkcml2ZXIgaXJxIGhhc24ndCByZXN1bWUuDQo+ID4gCXZvaWQgZHBtX3Jlc3VtZV9ub2lycShw
bV9tZXNzYWdlX3Qgc3RhdGUpDQo+ID4gCXsNCj4gPiAgICAgICAgICAJZHBtX25vaXJxX3Jlc3Vt
ZV9kZXZpY2VzKHN0YXRlKTsNCj4gDQo+IEp1c3QgdG8gY2xhcmlmeS4gWW91IGhhdmUgcmVzdW1l
IHNlcXVlbmNlIGluIGRwbV9ub2lycV9yZXN1bWVfZGV2aWNlcw0KPiAgIGRwbV9ub2lycV9yZXN1
bWVfZGV2aWNlcyAtPiByZXN1bWUgSTJDIC0+IHJlc3VtZSBzb21lIGRldmljZSAtPiBkbyBpMmMg
dHJhbnNmZXIgYWZ0ZXI/DQo+IA0KDQpZZXMuDQoNCj4gSXMgInNvbWUgZGV2aWNlIiBpbiBLZXJu
ZWwgbWFpbmxpbmU/DQo+IA0KDQpUaGUgcHJvYmxlbWF0aWMgZGV2aWNlIGRyaXZlciBpcyBkcml2
ZXJzL3JlZ3VsYXRvci9kYTkyMTEtcmVndWxhdG9yLmMgaW4NCktlcm5lbCBtYWlubGluZS4NCg0K
PiA+ICAgICAgICAgIAlyZXN1bWVfZGV2aWNlX2lycXMoKTsNCj4gPiAgICAgICAgICAJZGV2aWNl
X3dha2V1cF9kaXNhcm1fd2FrZV9pcnFzKCk7DQo+ID4gICAgICAgICAgCWNwdWlkbGVfcmVzdW1l
KCk7DQo+ID4gCX0NCj4gPiAubWFzdGVyX3hmZXJfYXRvbWljKCkgc2VlbXMgdG8gYmUgaW52YWxp
ZCBmb3IgdGhpcyBxdWVzdGlvbiBhdCB0aGlzDQo+ID4gdGltZT8NCj4gPiANCj4gDQoNCg==

