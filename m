Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47730426632
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 10:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhJHItH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 04:49:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33464 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229606AbhJHItH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 04:49:07 -0400
X-UUID: 4ce23daccf624484b8db0d0c7f58abee-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pUWaCMKNXz356vlGNAhNLBmgPI/6yLDLRRv6SApHeKk=;
        b=SSvR4da6L97hLsH633+rp84rPoV2cy9M97Oqe7lZeVhGoie9GRXamONxE/XVyryGAx68CITjjqYRvk5qykJQZqMFthfGGQhNPTBlYvaUh2XZoqK2kax/n0yswdfNgMRp5o6L9iIleR0OFyj80DJOdHHkjDTihG/PVcUncu9x67E=;
X-UUID: 4ce23daccf624484b8db0d0c7f58abee-20211008
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 295826952; Fri, 08 Oct 2021 16:47:09 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Oct 2021 16:47:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 16:47:08 +0800
Message-ID: <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
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
Date:   Fri, 8 Oct 2021 16:47:11 +0800
In-Reply-To: <YVf+83LdUEPjoLdI@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
         <20210917101416.20760-7-kewei.xu@mediatek.com> <YVf+83LdUEPjoLdI@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTEwLTAyIGF0IDA4OjQwICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIEZyaSwgU2VwIDE3LCAyMDIxIGF0IDA2OjE0OjE1UE0gKzA4MDAsIEtld2VpIFh1IHdyb3Rl
Og0KPiA+IEluIHRoZSBjb21taXQgYmU1Y2UwZTk3Y2M3ICgiaTJjOiBtZWRpYXRlazogQWRkIGky
YyBhYy10aW1pbmcNCj4gPiBhZGp1c3QNCj4gPiBzdXBwb3J0IiksIHRoZSBJMkMgdGltaW5nIGNh
bGN1bGF0aW9uIGhhcyBiZWVuIHJldmlzZWQgdG8gc3VwcG9ydA0KPiA+IGFjLXRpbWluZyBhZGp1
c3RtZW50LCBob3dldmVyIHRoYXQgd2lsbCBicmVhayBvbiBzb21lIEkyQw0KPiA+IGNvbXBvbmVu
dHMuDQo+ID4gQXMgYSByZXN1bHQgd2Ugd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcgc2V0dGluZyAi
ZGVmYXVsdC1hZGp1c3QtDQo+ID4gdGltaW5nIg0KPiA+IHNvIHRob3NlIGNvbXBvbmVudHMgY2Fu
IGNob29zZSB0byB1c2UgdGhlIG9sZCAoZGVmYXVsdCkgdGltaW5nDQo+ID4gYWxnb3JpdGhtLg0K
PiANCj4gV2h5IGNhbid0IHRoZSBuZXcgY2FsY3VsYXRpb24gYmUgdXBkYXRlZCBpbiBhIHdheSB0
aGF0IGl0IHdvcmtzIGZvcg0KPiBhbGwNCj4gSTJDIGNvbXBvbmVudHM/DQo+IA0KSGksIEluIHRo
ZSBjb21taXQgYmU1Y2UwZTk3Y2M3ICgiaTJjOiBtZWRpYXRlazogQWRkIGkyYyBhYy10aW1pbmcN
CmFkanVzdCBzdXBwb3J0IiksIHRoZSBJMkMgdGltaW5nIGNhbGN1bGF0aW9uIGhhcyBiZWVuIHJl
dmlzZWQgdG8NCnN1cHBvcnQgYWMtdGltaW5nIGFkanVzdG1lbnQuQnV0IGluIG91ciBkZXNpZ24s
IGl0IHdpbGwgbWFrZQ0KdFNVLFNUQS90SEQsU1RBL3RTVSxTVE8gc2hvcnRlciB3aGVuIHRoZSBz
bGF2ZSBkZXZpY2UgaGF2ZSBjbG9jay0NCnN0cmV0Y2hpbmcgZmVhdHVyZS4gVGhlbiB3ZSB1cGxv
YWQgdGhlIGNvbW1pdCBhODBmMjQ5NDVmY2YgKCJpMmM6DQptZWRpYXRlazogVXNlIHNjbF9pbnRf
ZGVsYXlfbnMgdG8gY29tcGVuc2F0ZSBjbG9jay1zdHJldGNoaW5nIikgdG8NCnN1cHBvcnQgYWRq
dXN0aW5nIHRTVSxTVEEvdEhELFNUQS90U1UsU1RPIHdoZW4gdGhlIHNsYXZlIGRldmljZSBjbG9j
ay0NCnN0cmV0Y2hpbmcuIEJ1dCBpZiB0aGUgc2xhdmUgZGV2aWNlIHN0cmV0Y2ggdGhlIFNDTCBs
aW5lIGZvciB0b28gbG9uZw0KdGltZSwgb3VyIGRlc2lnbiBzdGlsbCBjYW5ub3QgbWFrZSB0U1Us
U1RBL3RIRCxTVEEvdFNVLFNUTyBtZWV0IHNwZWMuDQpIb3dldmVyIGluIHRoZSBvbGQgKGRlZmF1
bHQpIHRpbWluZyBhbGdvcml0aG0gYmVmb3JlIHRoZSBjb21taXQNCmJlNWNlMGU5N2NjNyAoImky
YzogbWVkaWF0ZWs6IEFkZCBpMmMgYWMtdGltaW5nIGFkanVzdCBzdXBwb3J0IiksDQp0U1UsU1RB
L3RIRCxTVEEvdFNVLFNUTyBjYW4gbWVldCBzcGVjLiBTbyB3ZSB3YW50IHRvIGRlZmluZSBhIG5l
dw0Kc2V0dGluZyAiZGVmYXVsdC1hZGp1c3QtdGltaW5nIiBmb3IgdXNpbmcgdGhlIG9sZCAoZGVm
YXVsdCkgdGltaW5nDQphbGdvcml0aG0uIFRoYW5rc34NCg==

