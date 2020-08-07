Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E2823E565
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 03:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGBGB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 21:06:01 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:61759 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726027AbgHGBGA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 21:06:00 -0400
X-UUID: abd9c3f39a344fe5bf9d7bb293427d99-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=G4GxAPQqpd+NBS9oJCQUn487GFr6GbmdKg9Au8QZObs=;
        b=ZRLmt8augMyTp+c3jXYI99SYRnMzNRYCfUmWSn/6LEyobabvLguovX6N5LEAH3PotQSYszq6ie+3oI1lXoDcUzSB4wg5t4o1nyCPT8nVX3RWcuhHg+18Kwa/7/K2e3oAmx7YNdWTWaLxKWqHSAz2VXbIKJRs0jaVfdH24qhnToo=;
X-UUID: abd9c3f39a344fe5bf9d7bb293427d99-20200807
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1348952034; Fri, 07 Aug 2020 09:05:58 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 Aug
 2020 09:05:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Aug 2020 09:05:55 +0800
Message-ID: <1596762313.8263.9.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
From:   Qii Wang <qii.wang@mediatek.com>
To:     Matthias Brugger <mbrugger@suse.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
        <yingjoe.chen@mediatek.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Fri, 7 Aug 2020 09:05:13 +0800
In-Reply-To: <6e029d96-6171-0006-a5bb-01d0d5a7391b@suse.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
         <1596712005.8263.4.camel@mhfsdcap03>
         <6e029d96-6171-0006-a5bb-01d0d5a7391b@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIwLTA4LTA2IGF0IDE1OjM1ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDYvMDgvMjAyMCAxMzowNiwgUWlpIFdhbmcgd3JvdGU6DQo+ID4gT24gVGh1
LCAyMDIwLTA4LTA2IGF0IDExOjQ4ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0KPiA+
PiBUaGUgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyBoYXZlIGl0J3MgbWVtYmVycyBkb2N1bWVudGVk
IGJ1dCBpcyBtaXNzaW5nIHRoZQ0KPiA+PiBzdGFydGluZyAnQCcsIHdoaWNoIGxlYWRzIHRvIHdh
cmluZ3MgbGlrZToNCj4gPj4NCj4gPj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYzoy
Njc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXINCj4gPj4gJ21pbl9sb3df
bnMnIG5vdCBkZXNjcmliZWQgaW4gJ2kyY19zcGVjX3ZhbHVlcycNCj4gPj4NCj4gPj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gPj4g
LS0tDQo+ID4+ICAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCA4ICsrKystLS0t
DQo+ID4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5j
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+PiBpbmRleCBlODg5Zjc0NzAz
ZTQuLmY1MWIzNWZjNDAwZiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tdDY1eHguYw0KPiA+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+
ID4+IEBAIC0yNTMsMTAgKzI1MywxMCBAQCBzdHJ1Y3QgbXRrX2kyYyB7DQo+ID4+DQo+ID4+ICAg
IC8qKg0KPiA+PiAgICAgKiBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzOg0KPiA+PiAtICogbWluX2xv
d19uczogbWluIExPVyBwZXJpb2Qgb2YgdGhlIFNDTCBjbG9jaw0KPiA+IA0KPiA+IENhbiB5b3Ug
aGVscCBtZSBhZGQgYSBkZXNjcmlwdGlvbiBvZiBtaW5faGlnaF9ucy4gQXMNCj4gPiBAbWluX2hp
Z2hfbnM6IG1pbiBISUdIIHBlcmlvZCBvZiB0aGUgU0NMIGNsb2NrDQo+IA0KPiBSaWdodCwgSSBm
b3Jnb3QgYWJvdXQgdGhpcyBvbmUuDQo+IA0KPiBBY3R1YWxseSBJIGRvbid0IHNlZSBhbnkgY29k
ZSB3aGljaCB1c2VzIHRoZSB2YWx1ZSwgc28gSSB0aGluayBpdCBzaG91bGQgYmUgDQo+IGRlbGV0
ZWQgZnJvbSB0aGUgc3RydWN0Lg0KPiANCj4gRG8geW91IGhhdmUgYW55IHRob3VnaHRzIG9uIHRo
aXMuDQo+IA0KDQpUaGF0IGlzIHJpZ2h0LCBpdCBpcyB1c2VkIGZvciBpbnRlcm5hbCB0ZXN0IGJl
Zm9yZS4gWW91IGNhbiBkZWxldGVkIGl0Lg0KDQo=

