Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C053CC21C
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jul 2021 11:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbhGQJIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Jul 2021 05:08:21 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:1491 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231812AbhGQJIU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Jul 2021 05:08:20 -0400
X-UUID: 7a616f9925504c56a4ed56922e923d1d-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RtLPdB7W1L1ISzH1RJkeBeFtIGnaD9ES9bFQpDbh7ng=;
        b=GBPShCH4VBq6Ud99QscbOh5NiRGG8Rfpiety+yKCg6m6YZG0iIXmEauRUkJ6jsC139aIYlqkZeWVTNfaDQpcDOINFJNqGRpMc/SRHw1uJ8yKpnLSzUIC1H/hK5CVNeC6slUV9tOej4dRmWoKoM8/tc9d+qAqK8GQkHUOK61s5QE=;
X-UUID: 7a616f9925504c56a4ed56922e923d1d-20210717
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1787049334; Sat, 17 Jul 2021 17:05:17 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 17 Jul
 2021 17:05:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 17:05:01 +0800
Message-ID: <1626512701.29703.26.camel@mhfsdcap03>
Subject: Re: [PATCH 0/8] Due to changes in hardware design, add patch to
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Leilk Liu =?UTF-8?Q?=28=E5=88=98=E7=A3=8A=29?= 
        <Leilk.Liu@mediatek.com>,
        Qii Wang =?UTF-8?Q?=28=E7=8E=8B=E7=90=AA=29?= 
        <Qii.Wang@mediatek.com>,
        Qiangming Xia =?UTF-8?Q?=28=E5=A4=8F=E5=BC=BA=E6=98=8E=29?= 
        <Qiangming.Xia@mediatek.com>,
        Daolong Zhu =?UTF-8?Q?=28=E7=A5=9D=E9=81=93=E9=BE=99=29?= 
        <ot_daolong.zhu@mediatek.com>
Date:   Sat, 17 Jul 2021 17:05:01 +0800
In-Reply-To: <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
         <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D9D5E5FF085A829D84BE3EA40A55E9C4D77E284B99C28EE19B60EB1B4F3EBB52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIxLTA3LTE1IGF0IDExOjAzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gVGh1LCBKdWwgMTUsIDIwMjEgYXQgMTA6MzcgQU0gS2V3ZWkgWHUgPGtl
d2VpLnh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiAxLiBJbiBvcmRlciB0byBmYWNp
bGl0YXRlIHRoZSByZXZpZXcsIHRoZSB0d28gc2VyaWVzIG9mIHBhdGNoZXMgc3VibWl0dGVkDQo+
ID4gICAgYmVmb3JlIGhhdmUgYmVlbiBpbnRlZ3JhdGVkIHRvZ2V0aGVyLg0KPiANCj4gSSdtIG5v
dCBzdXJlIHRoYXQgcmVhbGx5IGhlbHBzLiBXZSdsbCBzZWUuDQo+IA0KPiA+IDIuIFJlc3VibWl0
IGEgcGF0Y2ggdG8gZml4aW5nIHRoZSBpbmNvcnJlY3QgcmVnaXN0ZXIgdmFsdWUuDQo+IA0KPiBG
aXhlcyBjYW4gYmUgc3VibWl0dGVkIHNlcGFyYXRlbHksIG9yIGF0IHRoZSB2ZXJ5IGxlYXN0LCBw
dXQgYXQgdGhlIHZlcnkNCj4gZnJvbnQgb2YgdGhlIHNlcmllcy4NCj4gDQo+ID4gMy4gQWRkIG1v
ZGlmeSBidXMgc3BlZWQgY2FsY3VsYXRpb24gZm9ybXVsYSBwYXRjaA0KPiANCj4gV2hlbiByZXN1
Ym1pdHRpbmcgcGF0Y2ggc2VyaWVzLCBwbGVhc2UgYWRkIGFwcHJvcHJpYXRlIHZlcnNpb25pbmcg
YW5kDQo+IGNoYW5nZWxvZ3MuIFRoaXMgd2lsbCBoZWxwIG1haW50YWluZXJzIHVuZGVyc3RhbmQg
dGhhdCB0aGlzIGlzIGEgbmV3DQo+IHZlcnNpb24gb2YgdGhlIHNlcmllcywgYW5kIHdoYXQgaGFz
IGNoYW5nZWQuIFRoaXMgaW5jbHVkZXMgdGltZXMgd2hlbg0KPiB0aGUgb3JpZ2luYWwgcGF0Y2hl
cyB3ZXJlbid0IGNoYW5nZWQsIGJ1dCBhZGRpdGlvbmFsIHBhdGNoZXMgd2VyZSBhZGRlZC4NCj4g
DQo+IFBsZWFzZSBhbHNvIGtlZXAgdGhlIG9yaWdpbmFsIHNlcmllcyBzdWJqZWN0LCB3aGljaCBJ
SVJDIHdhcyBhYm91dCBhZGRpbmcNCj4gc3VwcG9ydCBmb3IgTVQ4MTk1IEkyQy4gVGhlIHN1Ympl
Y3QgeW91IG5vdyB1c2VkIHNob3VsZCBiZSBwYXJ0IG9mIHRoZQ0KPiBjb3ZlciBsZXR0ZXIuDQo+
IA0KPiBJZiB5b3UgY29tYmluZSBkaWZmZXJlbnQgcGF0Y2ggc2VyaWVzLCB5b3Ugc2hvdWxkIHVz
ZSB0aGUgaGlnaGVzdCB2ZXJzaW9uDQo+IG51bWJlciArIDEuDQo+IA0KPiANCj4gUmVnYXJkcw0K
PiBDaGVuWXUNCj4gDQo+ID4NCj4gPiBLZXdlaSBYdSAoOCk6DQo+ID4gICBkdC1iaW5kaW5nczog
aTJjOiB1cGRhdGUgYmluZGluZ3MgZm9yIE1UODE5NSBTb0MNCj4gPiAgIGkyYzogbWVkaWF0ZWs6
IER1bXAgaTJjL2RtYSByZWdpc3RlciB3aGVuIGEgdGltZW91dCBvY2N1cnMNCj4gPiAgIGkyYzog
bWVkaWF0ZWs6IGZpeGluZyB0aGUgaW5jb3JyZWN0IHJlZ2lzdGVyIG9mZnNldA0KPiA+ICAgaTJj
OiBtZWRpYXRlazogUmVzZXQgdGhlIGhhbmRzaGFrZSBzaWduYWwgYmV0d2VlbiBpMmMgYW5kIGRt
YQ0KPiA+ICAgaTJjOiBtZWRpYXRlazogQWRkIE9GRlNFVF9FWFRfQ09ORiBzZXR0aW5nIGJhY2sN
Cj4gPiAgIGR0LWJpbmRpbmdzOiBpMmM6IGFkZCBhdHRyaWJ1dGUgZGVmYXVsdC10aW1pbmctYWRq
dXN0DQo+ID4gICBpMmM6IG1lZGlhdGVrOiBJc29sYXRlIHNwZWVkIHNldHRpbmcgdmlhIGR0cyBm
b3Igc3BlY2lhbCBkZXZpY2VzDQo+ID4gICBpMmM6IG1lZGlhdGVrOiBtb2RpZnkgYnVzIHNwZWVk
IGNhbGN1bGF0aW9uIGZvcm11bGENCj4gPg0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLW10NjV4eC50eHQgICAgICAgICB8ICAgMyArDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMgICAgICAgICAgICAgICAgICAgIHwgMjI5ICsrKysrKysrKysrKysrKysr
KystLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIxNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IC0tDQo+ID4gMS45LjENCj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCkhpIENo
ZW5ZdSwNCg0KMi4gT0ssIEkgd2lsbCBwbGFjZSB0aGUgZml4ZXMgYXQgdGhlIHZlcnkgbGVhc3Qg
aW4gdGhlIG5leHQgcGF0Y2guDQoNCjMuIEkgd2lsbCB0YWtlIHlvdXIgb3BpbmlvbiBjb21iaW5l
IGRpZmZlcmVudCBwYXRjaCBzZXJpZXMsIHlvdSBzaG91bGQNCnVzZSB0aGUgaGlnaGVzdCB2ZXJz
aW9uIG51bWJlciArMS4NCg0KSSBoYXZlIHN1Ym1pdHRlZCB0d28gZGlmZmVyZW50IHNlcmllcyBv
ZiBwYXRjaGVzIGJlZm9yZS4gVGhlIHRvcGljcyBhcmUNCiJBZGQgaTJjIHN1cHBvcnQgZm9yIG10
ODE5NSIgKGhpZ2hlc3QgdmVyc2lvbiBudW1iZXI6IFYxKSBhbmQgIkludHJvZHVjZQ0KYW4gYXR0
cmlidXRlIHRvIHNlbGVjdCB0aW1pbmcgc2V0dGluZ3MiIChoaWdoZXN0IHZlcnNpb24gbnVtYmVy
OlYzKS4NCkxhdGVyIEkgd2lsbCBjb21iaW5lIHRoZSBhYm92ZSB0d28gc2VyaWVzIG9mIHBhdGNo
ZXMgYW5kIHN1Ym1pdCBWNCB3aXRoDQoiSW50cm9kdWNpbmcgYW4gYXR0cmlidXRlIHRvIHNlbGVj
dCB0aGUgdGltZSBzZXR0aW5nIiBhcyB0aGUgc3ViamVjdA0KdGl0bGUuDQoNClRoYW5rcw0KDQpS
ZWdhcmRzDQpLZXdlaQ0KICANCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg==

