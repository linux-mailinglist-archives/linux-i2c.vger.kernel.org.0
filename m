Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66D61D90F5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 09:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgESH0T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 03:26:19 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:20534 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726893AbgESH0T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 03:26:19 -0400
X-UUID: 09d982d37b6a4b5fbc457764b860d5af-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FbqUYE08FGkqqB1QZrjAMNDs1rvIDDVUkM2pRn3j0rs=;
        b=ixqFKudGjDZm10mqOtgNocT+85wz33WUeYWypRfsXQKNIhm/2mSQhO8QnwlKSfzc0wUDpujsopNcl5pZ+RQZIzmXP7XBj4bpnJ6QSnbnwCujiQxvf1kfAVHj8eLQuPkh5K2yOw7I2CilvYUJJd8Y6X1fpqixvWF/TwOW7Wgw8qs=;
X-UUID: 09d982d37b6a4b5fbc457764b860d5af-20200519
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1872474913; Tue, 19 May 2020 15:26:14 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 15:26:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 15:26:12 +0800
Message-ID: <1589873173.513.0.camel@mtksdaap41>
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in
 adapter
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <srv_heupstream@mediatek.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Date:   Tue, 19 May 2020 15:26:13 +0800
In-Reply-To: <20200519065937.GD1094@ninjato>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
         <20200428061813.27072-3-bibby.hsieh@mediatek.com>
         <20200519065937.GD1094@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksIFdvbGZyYW0sDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld2luZywgSSB3aWxsIHNlbnQgbmV4
dCB2ZXJzaW9uIGZvciBmaXhpbmcgdXAgdGhlbS4NCg0KQmliYnkNCg0KT24gVHVlLCAyMDIwLTA1
LTE5IGF0IDA4OjU5ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+IE9uIFR1ZSwgQXByIDI4
LCAyMDIwIGF0IDAyOjE4OjEzUE0gKzA4MDAsIEJpYmJ5IEhzaWVoIHdyb3RlOg0KPiA+IEFsdGhv
dWdoIGluIHRoZSBtb3N0IHBsYXRmb3JtcywgdGhlIGJ1cyBwb3dlciBvZiBpMmMNCj4gPiBhcmUg
YWx3YXkgb24sIHNvbWUgcGxhdGZvcm1zIGRpc2FibGUgdGhlIGkyYyBidXMgcG93ZXINCj4gPiBp
biBvcmRlciB0byBtZWV0IGxvdyBwb3dlciByZXF1ZXN0Lg0KPiA+IA0KPiA+IFdlIGdldCBhbmQg
ZW5hYmxlIGJ1bGsgcmVndWxhdG9yIGluIGkyYyBhZGFwdGVyIGRldmljZS4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgfCA4MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvaTJjLmggICAgICAg
ICB8ICAyICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyBiL2RyaXZlcnMvaTJj
L2kyYy1jb3JlLWJhc2UuYw0KPiA+IGluZGV4IDVjYzBiMGVjNTU3MC4uZjgxYjQyYTRlZDA3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiA+IEBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGlj
IGludCBpMmNfc21idXNfaG9zdF9ub3RpZnlfdG9faXJxKGNvbnN0IHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpDQo+ID4gIHN0YXRpYyBpbnQgaTJjX2RldmljZV9wcm9iZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBpMmNfY2xpZW50CSpjbGllbnQgPSBpMmNfdmVy
aWZ5X2NsaWVudChkZXYpOw0KPiA+ICsJc3RydWN0IGkyY19hZGFwdGVyCSphZGFwID0gY2xpZW50
LT5hZGFwdGVyOw0KPiANCj4gWW91IGFyZSBhY2Nlc3NpbmcgY2xpZW50IGJlZm9yZSB0aGUgTlVM
TCBwb2ludGVyIGNoZWNrLg0KPiANCj4gDQo+ID4gQEAgLTQxNCw2ICs0MjEsNyBAQCBzdGF0aWMg
aW50IGkyY19kZXZpY2VfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICBzdGF0aWMgaW50
IGkyY19kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgew0KPiA+ICAJc3Ry
dWN0IGkyY19jbGllbnQJKmNsaWVudCA9IGkyY192ZXJpZnlfY2xpZW50KGRldik7DQo+ID4gKwlz
dHJ1Y3QgaTJjX2FkYXB0ZXIgICAgICAqYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCj4gDQo+IFNh
bWUgaGVyZS4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgaTJjX3N1c3BlbmRfbGF0ZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBpMmNf
dmVyaWZ5X2NsaWVudChkZXYpOw0KPiA+ICsJc3RydWN0IGkyY19hZGFwdGVyICphZGFwID0gY2xp
ZW50LT5hZGFwdGVyOw0KPiA+ICsJaW50IGVycjsNCj4gPiArDQo+ID4gKwllcnIgPSBwbV9nZW5l
cmljX3N1c3BlbmRfbGF0ZSgmY2xpZW50LT5kZXYpOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQly
ZXR1cm4gZXJyOw0KPiA+ICsNCj4gPiArCWlmICghcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVk
KCZjbGllbnQtPmRldikpDQo+ID4gKwkJcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKGFkYXAtPmJ1
c19yZWd1bGF0b3IpOw0KPiA+ICsNCj4gPiArCXJldHVybiBlcnI7DQo+IA0KPiBDYW4gYmUgJ3Jl
dHVybiAwJy4NCj4gDQoNCg==

