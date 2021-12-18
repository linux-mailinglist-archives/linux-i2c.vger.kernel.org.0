Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03A7479A02
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 10:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhLRJop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 04:44:45 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:55512 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231405AbhLRJoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Dec 2021 04:44:44 -0500
X-UUID: 5bdb8e4c8b2a4ca1a2b7de8acd8cc534-20211218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=BX/xr60YeEGkR5WPd8bZnIzzW27Ue8psX+ZM7ID81Ws=;
        b=IuS8ogSNs/5R2cHUpRZt1ZUhNsHJtgyOUdXWB3KKcb2gy1lbK2G0vswC97Kjt1A7JczB/nzKwnvK77PRIhX/eImjQV2qPwkXbMKbydit1WHb/wT2jLCmTIx1jEXcUj28dt5pVkl6kXEHotIU53/zxidkIkP8WLWqx/8QiWXbQQY=;
X-UUID: 5bdb8e4c8b2a4ca1a2b7de8acd8cc534-20211218
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 297468601; Sat, 18 Dec 2021 17:44:39 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 18 Dec 2021 17:44:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 18 Dec 2021 17:44:31 +0800
Message-ID: <dfd50de5149a38ad1bc5faf9bb26a8a04be7d314.camel@mediatek.com>
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <yuhan.wei@mediatek.com>
Date:   Sat, 18 Dec 2021 17:44:32 +0800
In-Reply-To: <YaTMQQhENmJAIUk4@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
         <20210917101416.20760-7-kewei.xu@mediatek.com> <YVf+83LdUEPjoLdI@kunai>
         <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
         <YWQYbaTIhud2QHNP@kunai> <YaTMQQhENmJAIUk4@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTExLTI5IGF0IDEzOjQ5ICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gPiBzdHJldGNoaW5nLiBCdXQgaWYgdGhlIHNsYXZlIGRldmljZSBzdHJldGNoIHRoZSBTQ0wg
bGluZSBmb3IgdG9vDQo+ID4gPiBsb25nDQo+ID4gPiB0aW1lLCBvdXIgZGVzaWduIHN0aWxsIGNh
bm5vdCBtYWtlIHRTVSxTVEEvdEhELFNUQS90U1UsU1RPIG1lZXQNCj4gPiA+IHNwZWMuDQo+ID4g
DQo+ID4gSXNuJ3QgdGhlIG5ldyBhbGdvcml0aG0gYnJva2VuIGlmIGl0IGNhbm5vdCBzdXBwb3J0
IGNsb2NrDQo+ID4gc3RyZXRjaGluZz8NCj4gPiBXaGF0IHdhcyB0aGUgcHJvYmxlbSBvZiB0aGUg
b2xkIGFsZ29yaXRobSBub3QgbWVldGluZyB0aGUgc3BlYz8NCj4gPiANCj4gPiA+IEhvd2V2ZXIg
aW4gdGhlIG9sZCAoZGVmYXVsdCkgdGltaW5nIGFsZ29yaXRobSBiZWZvcmUgdGhlIGNvbW1pdA0K
PiA+ID4gYmU1Y2UwZTk3Y2M3ICgiaTJjOiBtZWRpYXRlazogQWRkIGkyYyBhYy10aW1pbmcgYWRq
dXN0IHN1cHBvcnQiKSwNCj4gPiA+IHRTVSxTVEEvdEhELFNUQS90U1UsU1RPIGNhbiBtZWV0IHNw
ZWMuIFNvIHdlIHdhbnQgdG8gZGVmaW5lIGEgbmV3DQo+ID4gPiBzZXR0aW5nICJkZWZhdWx0LWFk
anVzdC10aW1pbmciIGZvciB1c2luZyB0aGUgb2xkIChkZWZhdWx0KQ0KPiA+ID4gdGltaW5nDQo+
ID4gPiBhbGdvcml0aG0uIg0KPiA+IA0KPiA+IFdoYXQgSSBzdGlsbCBkbyBub3QgZ2V0OiB0aGUg
b2xkIGFsZ29yaXRobSB3YXMgYWJsZSB0byBoYW5kbGUgY2xvY2sNCj4gPiBzdHJldGNoaW5nLiBX
aHkgY2FuJ3QgeW91IHVwZGF0ZSB0aGUgbmV3IG9uZSB0byBoYW5kbGUgY2xvY2sNCj4gPiBzdHJl
dGNoaW5nDQo+ID4gYXMgd2VsbC4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IHdo
YXQgaXMgaXQ/DQo+IA0KPiBJIGFtIHN0aWxsIGludGVyZXN0ZWQuIEVzcGVjaWFsbHkgaW4gdGhl
IGxhc3QgcXVlc3Rpb24uIElzIHRoZSBsYXN0DQo+IHF1ZXN0aW9uIGNsZWFyIHRvIHlvdT8gSSBj
YW4gZXhwbGFpbiBzb21lIG1vcmUgb3RoZXJ3aXNlLg0KPiANCkhpLFdvbGZyYW0sDQoNCkknbSB2
ZXJ5IHNvcnJ5IHRoYXQgSSBkaWRuJ3QgcmVwbHkgdG8geW91ciBpbmZvcm1hdGlvbiBpbiB0aW1l
IGR1ZQ0KdG8gbXkgbWFueSBwZXJzb25hbCBhZmZhaXJzLg0KDQpUaGUgT2xkIGFsZ29yaXRobSB3
YXMgZGVzaWduZWQgdG8gZm9jdXMgb25seSBvbiBub3JtYWwgZnVuY3Rpb25zLCBhbmQNCm5lZWQg
dG8gYWRkIGFkZGl0aW9uYWwgY3VzdG9tIGNvZGUgdG8gYWRqdXN0IGFjLXRpbWluZyB3aGVuIHRo
ZQ0KY29tbXVuaWNhdGlvbiB0aW1pbmcgZGlkIG5vdCBtZWV0IHRoZSBzcGVjaWZpY2F0aW9ucy4g
c28gd2hlbiB0aGVyZSBpcw0Kbm8gY2xvY2sgc3RyZXRjaCwgYWMtdGltaW5nIGRvZXMgbm90IG1l
ZXQgdGhlIHNwZWMsIGJ1dCB0aGUgZnVuY3Rpb24gaXMNCmFsd2F5cyBub3JtYWwuDQoNClRoZSBu
ZXcgYWxnb3JpdGhtKFRoZSBjb21taXQgcGF0Y2g6IGJlNWNlMGU5N2NjNyAoImkyYzogbWVkaWF0
ZWs6IEFkZA0KaTJjIGFjLXRpbWluZyBhZGp1c3Qgc3VwcG9ydCIpIGlzIGJhc2VkIG9uIHRoZSBy
ZXF1aXJlbWVudHMgb2YgaTJjIHNwZWMNCnRvIGNhbGN1bGF0ZSB0aGUgaGFyZHdhcmUtcmVsYXRl
ZCBzZXR0aW5ncyBzbyB0aGF0IHRoZSBmdW5jdGlvbiBhbmQgYWMtDQp0aW1pbmcgYXJlIG5vcm1h
bCBXaGVuIHRoZXJlIGlzIG5vIGNsb2NrIHN0cmV0Y2ggb3IgdGhlIGNsb2NrIHN0cmV0Y2gNCnRp
bWUgaXMgc2hvcnQuIFdoZW4gdGhlIHN0cmV0Y2hpbmcgdGltZSBpcyB2ZXJ5IGxvbmcgKD42MHVz
KSwgaTJjIGFjLQ0KdGltaW5nIGRvZXMgbm90IG1lZXQgdGhlIHNwZWNpZmljYXRpb25zIGFuZCBj
YXVzZXMgZnVuY3Rpb24gYWJub3JtYWwuDQoNCkluIG9yZGVyIHRvIG1ha2UgdGhlIGkyYyBmdW5j
dGlvbiBub3JtYWwsIHRoaXMgcGF0Y2ggd2FzIHN1Ym1pdHRlZCwNCnRoYXQgaXMsIHdoZW4gdGhl
IHN0cmV0Y2ggaXMgbG9uZywgdGhlIG9sZCBhbGdvcml0aG0gaXMgdXNlZCB0byBlbnN1cmUNCnRo
ZSBmdW5jdGlvbiBpcyBub3JtYWwsIGFuZCB3aGVuIHRoZSBzdHJldGNoIGlzIHNob3J0LCB0aGUg
bmV3DQphbGdvcml0aG0gaXMgdXNlZCB0byBlbnN1cmUgdGhhdCB0aGUgYWMtdGltaW5nIGFuZCBm
dW5jdGlvbiBhcmUgbm9ybWFsLg0KDQpXZSBmb3VuZCB0aGF0IHdoZW4gdGhlIGFjLXRpbWluZyBj
YWxjdWxhdGlvbiBmb3JtdWxhIGlzIHVwZGF0ZWQsIHRoZQ0KbmV3IGFsZ29yaXRobSBjYW4gbWFr
ZSBpMmMgYWMtdGltaW5nIG1lZXQgdGhlIHNwZWMgYW5kIGZ1bmN0aW9uDQpub3JtYWxseS4gU28g
d2UgcGxhbiB0byByZXBsYWNlIHRoaXMgcGF0Y2ggd2l0aCBhIHBhdGNoIHRoYXQgdXBkYXRlcw0K
dGhlIGNhbGN1bGF0aW9uIGZvcm11bGEuDQoNClRoYW5rc34NCktld2VpDQo=

