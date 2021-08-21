Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D233F395C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Aug 2021 09:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhHUHl3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Aug 2021 03:41:29 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:58224 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232195AbhHUHl3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Aug 2021 03:41:29 -0400
X-UUID: 2a75eff14ac5463ab90bb4ff072b6551-20210821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BZuld3Pemgzl736JSP8kztfRG7SFrLKgqimIWjvahso=;
        b=KMemjg/JbriLuYuBRYBhKoqnFZ7P/YW1HOHG0XKDEbZyayIVNDLW3l5iTHrWJJBfPj1XEmEmUge6bV3jXm86CLbo3kbeP72Qycq0NBWKZIz+iehg03/oqlMDH158hMJNZZQLVkJQZuexW2Egui0/poYaNWUj8bEM13WG1vSA+n4=;
X-UUID: 2a75eff14ac5463ab90bb4ff072b6551-20210821
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 786966555; Sat, 21 Aug 2021 15:40:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 21 Aug 2021 15:40:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 21 Aug 2021 15:40:44 +0800
Message-ID: <fce8934ec25d18307df11e2f308a255da5a25ce3.camel@mediatek.com>
Subject: Re: [PATCH v4 3/8] i2c: mediatek: Reset the handshake signal
 between i2c and dma
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     <wsa@the-dreams.de>, Matthias Brugger <matthias.bgg@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
        <yuhan.wei@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <liguo.zhang@mediatek.com>
Date:   Sat, 21 Aug 2021 15:40:45 +0800
In-Reply-To: <CAGXv+5EGpUV0eaQ6duZ8y8u2dvc1y3uc2YwWP=07D+ZZpzMCvQ@mail.gmail.com>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
         <1626517079-9057-4-git-send-email-kewei.xu@mediatek.com>
         <CAGXv+5EGpUV0eaQ6duZ8y8u2dvc1y3uc2YwWP=07D+ZZpzMCvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTExIGF0IDE2OjQxICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gU2F0LCBKdWwgMTcsIDIwMjEgYXQgNjoyOSBQTSBLZXdlaSBYdSA8a2V3
ZWkueHVAbWVkaWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBEdWUgdG8gY2hhbmdlcyBp
biB0aGUgaGFyZHdhcmUgZGVzaWduIG9mIHRoZSBoYW5kc2hha2luZyBzaWduYWwNCj4gPiBiZXR3
ZWVuIGkyYyBhbmQgZG1hLCBpdCBpcyBuZWNlc3NhcnkgdG8gcmVzZXQgdGhlIGhhbmRzaGFraW5n
DQo+ID4gc2lnbmFsIGJlZm9yZSBlYWNoIHRyYW5zZmVyIHRvIGVuc3VyZSB0aGF0IHRoZSBtdWx0
aS1tc2dzIGNhbg0KPiA+IGJlIHRyYW5zZmVycmVkIGNvcnJlY3RseS4NCj4gDQo+IFRoaXMgYWxz
byBhZmZlY3RzIE1UODE5Mi4gSGFzIHRoaXMgYmVlbiB0ZXN0ZWQgb24gdGhhdCBTb0MgYXMgd2Vs
bD8NCg0KWWVzLCBJdCBoYXMgYmVlbiB0ZXN0ZWQgb24gTVQ4MTkyLg0KDQo+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEtld2VpIFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAxNCArKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW10NjV4eC5jDQo+ID4gaW5kZXggMjIyZmY3NjVlNTVkLi5jMDEwODM4N2YzNGIgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiBAQCAtNDcsNiArNDcsOSBAQA0K
PiA+ICAjZGVmaW5lIEkyQ19SRF9UUkFOQUNfVkFMVUUgICAgICAgICAgICAweDAwMDENCj4gPiAg
I2RlZmluZSBJMkNfU0NMX01JU19DT01QX1ZBTFVFICAgICAgICAgMHgwMDAwDQo+ID4gICNkZWZp
bmUgSTJDX0NITl9DTFJfRkxBRyAgICAgICAgICAgICAgIDB4MDAwMA0KPiA+ICsjZGVmaW5lIEky
Q19DTFJfREVCVUdDVFIgICAgICAgICAgICAgICAweDAwMDANCj4gPiArI2RlZmluZSBJMkNfUkVM
SUFCSUxJVFkgICAgICAgICAgICAgICAgICAgICAgICAweDAwMTANCj4gPiArI2RlZmluZSBJMkNf
RE1BQUNLX0VOQUJMRSAgICAgICAgICAgICAgMHgwMDA4DQo+ID4gDQo+ID4gICNkZWZpbmUgSTJD
X0RNQV9DT05fVFggICAgICAgICAgICAgICAgIDB4MDAwMA0KPiA+ICAjZGVmaW5lIEkyQ19ETUFf
Q09OX1JYICAgICAgICAgICAgICAgICAweDAwMDENCj4gPiBAQCAtODUwLDYgKzg1MywxNyBAQCBz
dGF0aWMgaW50IG10a19pMmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMNCj4gPiAqaTJjLCBz
dHJ1Y3QgaTJjX21zZyAqbXNncywNCj4gPiANCj4gPiAgICAgICAgIHJlaW5pdF9jb21wbGV0aW9u
KCZpMmMtPm1zZ19jb21wbGV0ZSk7DQo+ID4gDQo+ID4gKyAgICAgICBpZiAoaTJjLT5kZXZfY29t
cC0+YXBkbWFfc3luYykgew0KPiA+ICsgICAgICAgICAgICAgICBtdGtfaTJjX3dyaXRldyhpMmMs
IEkyQ19DTFJfREVCVUdDVFIsDQo+ID4gT0ZGU0VUX0RFQlVHQ1RSTCk7DQo+ID4gKyAgICAgICAg
ICAgICAgIHdyaXRlbChJMkNfRE1BX0hBTkRTSEFLRV9SU1QgfCBJMkNfRE1BX1dBUk1fUlNULA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9SU1QpOw0K
PiA+ICsgICAgICAgICAgICAgICB3cml0ZWwoSTJDX0RNQV9DTFJfRkxBRywgaTJjLT5wZG1hYmFz
ZSArDQo+ID4gT0ZGU0VUX1JTVCk7DQo+IA0KPiBJMkNfRE1BX1dBUk1fUlNUIGlzIHNlbGYtY2xl
YXJpbmcuIElzIEkyQ19ETUFfSEFORFNIQUtFX1JTVCBub3QNCj4gc2VsZi1jbGVhcmluZz8gSWYg
Ym90aCBhcmUgc2VsZi1jbGVhcmluZywgZG9uJ3QgeW91IG5lZWQgdG8gd2FpdCBhbmQNCj4gY2hl
Y2sgZm9yIHRoZW0gdG8gY2xlYXJlZD8gSWYgdGhleSBhcmVuJ3Qgc2VsZi1jbGVhcmluZywgZG8g
eW91IG5lZWQNCj4gdG8gZGVsYXkgc29tZSB0aW1lIGZvciB0aGVtIHRvIGNvbXBsZXRlPw0KPiAN
Cg0KVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uIFdlIHdpbGwgYXBwcm9wcmlhdGVseSBh
ZGQgdGhlIGRlbGF5IGluDQp0aGUgbmV4dCB2ZXJzaW9uIG9mIHBhdGNoIGFjY29yZGluZyB0byB0
aGUgaGFyZHdhcmUgYmVoYXZpb3INCmNoYXJhY3RlcmlzdGljcy4gDQoNClJlZ2FyZHMNCktld2Vp
DQoNCj4gPiArICAgICAgICAgICAgICAgbXRrX2kyY193cml0ZXcoaTJjLCBJMkNfSEFORFNIQUtF
X1JTVCwNCj4gPiBPRkZTRVRfU09GVFJFU0VUKTsNCj4gPiArICAgICAgICAgICAgICAgbXRrX2ky
Y193cml0ZXcoaTJjLCBJMkNfQ0hOX0NMUl9GTEFHLA0KPiA+IE9GRlNFVF9TT0ZUUkVTRVQpOw0K
PiANCj4gU2FtZSBoZXJlLiBObyB0aW1lIGRlbGF5IG5lZWRlZD8NCj4gDQo+ID4gKyAgICAgICAg
ICAgICAgIG10a19pMmNfd3JpdGV3KGkyYywgSTJDX1JFTElBQklMSVRZIHwNCj4gPiBJMkNfRE1B
QUNLX0VOQUJMRSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT0ZGU0VUX0RF
QlVHQ1RSTCk7DQo+IA0KPiBBIGNvbW1lbnQgZXhwbGFpbmluZyB3aGF0IHRoZSBzZWN0aW9uIGFi
b3ZlIGRvZXMgd291bGQgYmUgbmljZS4NCj4gQUZBSUNVDQo+IHRoaXMgaXMgZm9yY2UgcmVzZXR0
aW5nIHRoZSBETUEgaGFuZGxpbmcuDQo+IA0KPiANCj4gUmVnYXJkcw0KPiBDaGVuWXUNCj4gDQo+
ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgY29udHJvbF9yZWcgPSBtdGtfaTJjX3Jl
YWR3KGkyYywgT0ZGU0VUX0NPTlRST0wpICYNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB+
KEkyQ19DT05UUk9MX0RJUl9DSEFOR0UgfCBJMkNfQ09OVFJPTF9SUyk7DQo+ID4gICAgICAgICBp
ZiAoKGkyYy0+c3BlZWRfaHogPiBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVEpIHx8DQo+ID4g
KGxlZnRfbnVtID49IDEpKQ0KPiA+IC0tDQo+ID4gMi4xOC4wDQo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0K

