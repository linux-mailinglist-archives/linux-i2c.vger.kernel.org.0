Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66B9426512
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 09:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhJHHPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 03:15:18 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35830 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229693AbhJHHPR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 03:15:17 -0400
X-UUID: 82172bf867174dd08af19ca7eea86e21-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qWjr+AiJvYo10hf1cS6L6W6bO/DtrFRJjsgwpRlO+3k=;
        b=rjLsj8+2NCkKY6qFoWiVjATBm9mrR/P/OnNoYMfPcJgOrPC+nkFCCJnFsCrKByACRiiG64Zahm9qw1AkGPl/6+H5LiXBfoC/xaYUXscmxXInOrLtTkvovnFGdzR+kCOhfLxr5PdQPeojBqE4JrRyQWNFvqlW2VdolCN6AqqOSgU=;
X-UUID: 82172bf867174dd08af19ca7eea86e21-20211008
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 440280912; Fri, 08 Oct 2021 15:13:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 15:13:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 15:13:18 +0800
Message-ID: <461ed34baaf49acda8a3287635f0b4670240cd35.camel@mediatek.com>
Subject: Re: [PATCH v7 3/7] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <yuhan.wei@mediatek.com>
Date:   Fri, 8 Oct 2021 15:13:21 +0800
In-Reply-To: <YVf+KCztQI9XrdEq@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
         <20210917101416.20760-4-kewei.xu@mediatek.com> <YVf+KCztQI9XrdEq@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTEwLTAyIGF0IDA4OjM3ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gQEAgLTgzNyw2ICs4MzksNTcgQEAgc3RhdGljIGludCBtdGtfaTJjX3NldF9zcGVlZChzdHJ1
Y3QgbXRrX2kyYw0KPiA+ICppMmMsIHVuc2lnbmVkIGludCBwYXJlbnRfY2xrKQ0KPiA+ICAJcmV0
dXJuIDA7DQo+ID4gIH0NCj4gPiArc3RhdGljIHZvaWQgaTJjX2R1bXBfcmVnaXN0ZXIoc3RydWN0
IG10a19pMmMgKmkyYykNCj4gPiArew0KPiA+ICsJZGV2X2VycihpMmMtPmRldiwgIlNMQVZFX0FE
RFI6IDB4JXgsIElOVFJfTUFTSzogMHgleFxuIiwNCj4gPiArCQltdGtfaTJjX3JlYWR3KGkyYywg
T0ZGU0VUX1NMQVZFX0FERFIpLA0KPiA+ICsJCW10a19pMmNfcmVhZHcoaTJjLCBPRkZTRVRfSU5U
Ul9NQVNLKSk7DQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgdG9vIHZlcmJvc2UgYW5kIHNob3VsZCBi
ZSBhIGRlYnVnZ2luZyBvbmx5IHBhdGNoIG5vdA0KPiByZWFsbHkgc3VpdGVkIGZvciB1cHN0cmVh
bS4gQnV0IGlmIHlvdSBsaWtlIGl0IHRoaXMgd2F5LCB0aGVuIGtlZXANCj4gdGhlIHZlcmJvc2l0
eS4gSG93ZXZlciwgZGV2X2VyciBpcyB0b28gc3Ryb25nLCB0aGlzIHJlYWxseSBuZWVkcyB0bw0K
PiBiZQ0KPiBkZXZfZGJnLiBUaW1lb3V0cyBjYW4gaGFwcGVuIG9uIGFuIEkyQyBidXMsIHRoaW5r
IGFib3V0IGFuIEVFUFJPTSBpbg0KPiBhDQo+IGxvbmcgZXJhc2UgY3ljbGUgd2hpbGUgeW91IHdh
bnQgdG8gcmVhZCBpdC4gUGVyZmVjdGx5IG5vcm1hbC4NCj4gDQo+IA0KPiA+ICAJaWYgKHJldCA9
PSAwKSB7DQo+ID4gLQkJZGV2X2RiZyhpMmMtPmRldiwgImFkZHI6ICV4LCB0cmFuc2ZlciB0aW1l
b3V0XG4iLCBtc2dzLQ0KPiA+ID5hZGRyKTsNCj4gPiArCQlkZXZfZXJyKGkyYy0+ZGV2LCAiYWRk
cjogJXgsIHRyYW5zZmVyIHRpbWVvdXRcbiIsIG1zZ3MtDQo+ID4gPmFkZHIpOw0KPiA+ICsJCWky
Y19kdW1wX3JlZ2lzdGVyKGkyYyk7DQo+IA0KPiBOZWVkcyB0byBzdGF5IGRldl9kYmcgYXMgd2Vs
bC4NCj4gDQo+IFllcywgSXQgaXMgdXNlZCBmb3IgZGVidWdnaW5nLGJ1dCBkdW1wIHRoZSB2YWx1
ZSBvZiB2YWx1ZSBvZiB0aGUNCj4gcmVnaXN0ZXIgaXMgdmVyeSBpbXBvcnRhbnQgZm9yIGRlYnVn
Z2luZyxzbyB3ZSB0aGluayBpdCBpcw0KPiBuZWNlc3NhcnkuIFdlIHdpbGwgdXNlIGRldl9kYmcg
dG8gcmVwbGFjZSBkZXZfZXJyIGluIFY4LiBUaGFua3N+DQo=

