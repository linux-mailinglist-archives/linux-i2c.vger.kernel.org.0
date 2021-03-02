Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAB32B2BB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242225AbhCCBPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:42 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:32304 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1443647AbhCBMdE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Mar 2021 07:33:04 -0500
X-UUID: 5fafb8e125d3457daa75546a34b4ad5f-20210302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3ZRCi/nRxti+OHB6RGuP2kk8X0Uuta9T9GY8fOIWmF8=;
        b=uP89SOWI/4awQ9Sr2L5UPRGyaZvTeT0Z8+XtwFDT1Jl/VXo8arBymKJc20gPhe+EzoCvVtMxCcrlWI9EyrzGl2ku7hipqVBSzLKcSU0/mM6D2ELKxrCils4rsJRCSBMls6HUCkTYfVYO9Ls9Bp/1Q9SIKOf/w+O/Taclv4EnWZ0=;
X-UUID: 5fafb8e125d3457daa75546a34b4ad5f-20210302
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 539081713; Tue, 02 Mar 2021 20:32:14 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 20:32:11 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 20:32:11 +0800
Message-ID: <1614688331.28437.7.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
From:   Qii Wang <qii.wang@mediatek.com>
To:     Ikjoon Jang <ikjn@chromium.org>
CC:     <wsa@the-dreams.de>, srv_heupstream <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 2 Mar 2021 20:32:11 +0800
In-Reply-To: <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
         <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2EB7B12E6C512922AD6609AB522FD825146F1596765CF85E5FB095D7D12A9FB82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQpPbiBUdWUsIDIwMjEtMDMtMDIgYXQgMTk6MzAgKzA4MDAsIElram9vbiBKYW5nIHdyb3Rl
Og0KPiBIaSBRaWksDQo+ID4NCj4gPiBAQCAtMTE3MSw2ICsxMTczLDggQEAgc3RhdGljIGludCBt
dGtfaTJjX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHN0cnVjdCBtdGtfaTJjICpp
MmMpDQo+ID4gICAgICAgICBpZiAoaTJjLT5jbGtfc3JjX2RpdiA9PSAwKQ0KPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+ICsgICAgICAgb2ZfcHJvcGVydHlfcmVh
ZF91MzIobnAsICJjbG9jay1zdHJldGNoLW5zIiwgJmkyYy0+Y2xvY2tfc3RyZXRjaF9ucyk7DQo+
ID4gKw0KPiANCj4gSSB0aGluayB0aGlzIG5ldyBwcm9wZXJ0eSAiY2xvY2stc3RyZXRjaC1ucyIg
aXMgZm9yIHRoZSBzYW1lIHB1cnBvc2Ugb2YNCj4gImkyYy1zY2wtZmFsbGluZy10aW1lLW5zIiAr
ICJpMmMtc2NsLXJpc2luZy10aW1lLW5zIiBkZWZpbmVkIGluDQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dD8NCj4gDQoNCkkgaGF2ZW4ndCBmaW5kIHRoZSBj
b3JyZXNwb25kaW5nIGluc3RydWN0aW9uczthbmQgdGhpcyBwYXRjaCBpcyBmb3IgdGhlDQpwcm9i
bGVtIGNhdXNlZCBieSBjbG9jay1zdHJldGNoIHdoZW4gdGhlIHNjbCBpcyBwdWxsZWQuDQoNCj4g
PiAgICAgICAgIGkyYy0+aGF2ZV9wbWljID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAibWVk
aWF0ZWssaGF2ZS1wbWljIik7DQo+ID4gICAgICAgICBpMmMtPnVzZV9wdXNoX3B1bGwgPQ0KPiA+
ICAgICAgICAgICAgICAgICBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJtZWRpYXRlayx1c2Ut
cHVzaC1wdWxsIik7DQo+ID4gLS0NCj4gPiAxLjkuMQ0KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0DQo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0K

