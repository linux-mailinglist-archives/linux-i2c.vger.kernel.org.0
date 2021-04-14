Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6981E35EA79
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 03:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhDNBh4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 21:37:56 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:35000 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229648AbhDNBhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 21:37:55 -0400
X-UUID: 65210f5ef41043fa85cbaca9054473f9-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ERZ0727hmIntUzrC532APuxYAnO+KGvUIEmZ+WhJ4bg=;
        b=V0IxJGNu79lCmEr+yS4pCIiSLXo2p/RunrDC6CBO/RGt0jJ76sABb5ffxEurcNJaruzI9czfNSvqs4yU4GVBqR1F6BBBbSZUIoElHCMC3Ag41nsAljeGHAmIMnzEopTWKmJ7nv+yvMcyKpsOGIaEPDW2XrCCJk20bJJ21POT5jc=;
X-UUID: 65210f5ef41043fa85cbaca9054473f9-20210414
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1914948888; Wed, 14 Apr 2021 09:37:28 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 09:37:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Apr 2021 09:37:25 +0800
Message-ID: <1618364244.32225.21.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Wed, 14 Apr 2021 09:37:24 +0800
In-Reply-To: <20210413201740.GC2751@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
         <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
         <20210407181936.GA1614@kunai> <1618228994.32225.3.camel@mhfsdcap03>
         <20210413201740.GC2751@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BDCD7573E06B32ECD29F8904F8F2797A0FA403DEDB2F512640FACE4A5C84AC0A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA0LTEzIGF0IDIyOjE3ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDA4OjAzOjE0UE0gKzA4MDAsIFFpaSBXYW5nIHdyb3Rl
Og0KPiA+IEkgY2FuJ3Qgc2VlIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiAiaTJjLXNjbC1mYWxs
aW5nLXRpbWUtbnMiIGFuZCBjbG9jaw0KPiA+IHN0cmV0Y2hpbmcsIGlzIHRoZXJlIGEgcGFyYW1l
dGVyIHJlbGF0ZWQgdG8gY2xvY2sgc3RyZXRjaGluZz8NCj4gDQo+ICggeW91IHdyb3RlICJpMmMt
c2NsLWZhbGxpbmctdGltZS1ucyIgYWJvdmUsIGRpZG4ndCB5b3UgbWVhbg0KPiAiaTJjLXNjbC1p
bnRlcm5hbC1kZWxheS1ucyIgaW5zdGVhZD8gKQ0KPiANCg0KSSBhbSBzb3JyeSwgSSBoYXZlIGNv
bmZ1c2VkIHlvdXIgY29tbWVudCB3aXRoIGxram9vbidzIGNvbW1lbnQgaW4gdGhlDQpsYXN0IG1h
aWwuIHdoYXQgSSBhY3R1YWxseSB3YW50IHRvIHNheSBpcyAiaTJjLXNjbC1pbnRlcm5hbC1kZWxh
eS1ucyIuDQoNCj4gTm90IHlldCwgYW5kIEkgd29uZGVyIGlmIHRoZXJlIGNhbiBiZSBvbmUuIElu
IEkyQyAobm90IFNNQnVzKSwgZGV2aWNlcw0KPiBhcmUgYWxsb3dlZCB0byBzdHJldGNoIHRoZSBj
bG9jayBhcyBsb25nIGFzIHRoZXkgd2FudCwgc28gd2hhdCBzaG91bGQgYmUNCj4gc3BlY2lmaWVk
IGhlcmU/DQo+IA0KPiBJIHN1Z2dlc3RlZWQgImludGVybmFsLWRlbGF5IiBiZWNhdXNlIEFGQUlV
IHlvdXIgaGFyZHdhcmUgbmVlZHMgdGhpcw0KPiBkZWxheSB0byBiZSBhYmxlIHRvIGNvcGUgd2l0
aCBjbG9jayBzdHJldGNoaW5nLg0KPiANCg0KSWYgdGhlcmUgaXMgbm90IGEgbWF4aW11bSB2YWx1
ZSBmb3IgY2xvY2sgc3RyZXRjaGluZywNCiJpMmMtc2NsLWludGVybmFsLWRlbGF5LW5zIiBzaG91
bGQgYmUgYSBnb29kIGNob2ljZSBmb3Igb3VyIGhhcmR3YXJlLA0KYWx0aG91Z2ggaXQgbWF5YmUg
bm90IGZvciBjbG9jayBzdHJldGNoaW5nLg0KDQo+ID4gSWYgeW91IHRoaW5rIGJvdGggb2YgdGhl
bSB3aWxsIGFmZmVjdCB0aGUgYWMtdGltaW5nIG9mIFNDTCwgYXQgdGhpcw0KPiA+IHBvaW50LCAi
aTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMiIG1heWJlIGEgZ29vZCBjaG9pY2UuDQo+IA0KPiBEbyB5
b3UgbWVhbiAiaTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMiIG9yICJpMmMtc2NsLWludGVybmFsLWRl
bGF5LW5zIj8NCj4gDQoNCiJpMmMtc2NsLWludGVybmFsLWRlbGF5LW5zIiBpcyBiZXR0ZXIuDQoN
ClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQpRaWkNCg0KDQo=

