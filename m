Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0080F438F24
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 08:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhJYGLf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 02:11:35 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:56547 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229735AbhJYGLe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 02:11:34 -0400
X-UUID: c63f6a25fe7b440c9e8149536b629197-20211025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Wtn1HyN9ykMO2gL1yqE85JuEFWs87aBJ68lMUlhTtXA=;
        b=rI88uzLfYZ+as6eVoCXQz5TkxXl3UzsJIDChAVKoqor2fktEOHlJhqCqNoGCmLE28Q6h+nYFONAe2FtwDSvBUbLkuQ1MNeALAlY5QaRDQ7I4zkUZJ44xsf+kDjFA89GhoZt9sZ6SsJBeuNmltOtQGljobCBAEpRk9GcVZ4YBML0=;
X-UUID: c63f6a25fe7b440c9e8149536b629197-20211025
Received: from mtkcas11.mediatek.inc [(172.27.5.253)] by mailgw02.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1313698761; Mon, 25 Oct 2021 14:09:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Oct 2021 14:09:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 14:09:05 +0800
Message-ID: <2f5e3d3275dc1914cd789abfd2da68f92e0e4117.camel@mediatek.com>
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Boris Lysov <arzamas-16@mail.ee>
CC:     <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <matthias.bgg@gmail.com>, <qii.wang@mediatek.com>
Date:   Mon, 25 Oct 2021 14:09:05 +0800
In-Reply-To: <20211011183814.488ed866@pc>
References: <20211011183814.488ed866@pc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTEwLTExIGF0IDE4OjM4ICswMzAwLCBCb3JpcyBMeXNvdiB3cm90ZToNCj4g
T24gU3VuLCAxMCBPY3QgMjAyMSAxNTowNToxMyArMDgwMA0KPiBLZXdlaSBYdSA8a2V3ZWkueHVA
bWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gDQo+ID4gV2hlbiBhIHRpbWVvdXQgZXJyb3Igb2NjdXJz
IGluIGkyYyB0cmFuc3RlciwgaXQgaXMgdXN1YWxseSByZWxhdGVkDQo+ID4gdG8gdGhlIGkyYy9k
bWEgSVAgaGFyZHdhcmUgY29uZmlndXJhdGlvbi4gVGhlcmVmb3JlLCB0aGUgcHVycG9zZSBvZg0K
PiA+IHRoaXMgcGF0Y2ggaXMgdG8gZHVtcCB0aGUga2V5IHJlZ2lzdGVyIHZhbHVlcyBvZiBpMmMv
ZG1hIHdoZW4gYQ0KPiA+IHRpbWVvdXQgb2NjdXJzIGluIGkyYyBmb3IgZGVidWdnaW5nLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEtld2VpIFh1IDxrZXdlaS54dUBtZWRpYXRlay5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBJ
IHdvdWxkIGxpa2UgdG8gdGVzdCB0aGlzIHBhdGNoc2V0IG9uIG9uZSBvZiBzdXBwb3J0ZWQgcGxh
dGZvcm1zLCBhbg0KPiBtdDY1NzctcG93ZXJlZCBkZXZpY2UuIFRoaXMgZHJpdmVyIHJlcXVpcmVz
IGEgRE1BIGJhc2UuLi4NCj4gPiAJaTJjLT5wZG1hYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJj
ZSgmcGRldi0+ZGV2LCByZXMpOw0KPiA+IAlpZiAoSVNfRVJSKGkyYy0+cGRtYWJhc2UpKQ0KPiA+
IAkJcmV0dXJuIFBUUl9FUlIoaTJjLT5wZG1hYmFzZSk7DQo+IA0KPiAuLi4gaG93ZXZlciBJIGFt
IG5vdCBzdXJlIHdoYXQgYWRkcmVzcyBzaG91bGQgSSBzcGVjaWZ5IGluIHRoZSAuZHRzDQo+IGZp
bGUuIFdoaWxlDQo+IG90aGVyIGkyYyBidXNzZXMgc3VwcG9ydGVkIGJ5IHRoaXMgZHJpdmVyIHN1
Y2ggYXMgbXQ2NTg5IFsxXVsyXSBhbmQNCj4gbXQ2Nzk3IFszXQ0KPiBoYXZlIGRlc2lnbmF0ZWQg
RE1BIGZvciBJMkMsIG10NjU3NyBzZWVtcyB0byBsYWNrIGRlZGljYXRlZCBETUENCj4gZW5naW5l
IGZvciBJMkMNCj4gWzRdWzVdLg0KPiANCj4gRG8gSSBuZWVkIHRvIHNwZWNpZnkgdGhlIEdlbmVy
aWMgRE1BIGJhc2UgYWRkcmVzcyBbNF0gaW5zdGVhZD8NCj4gDQo+IFdvcnRoIG1lbnRpb25pbmcg
SSBicm91Z2h0IHVwIHRoaXMgaXNzdWUgaW4gdGhlIHBhc3QgWzVdWzZdLg0KPiANCj4gWzFdIEFM
UFMuS0sxLk1QNS5WMS4zX0VBU1RBRU9OODlfV0VUX0tLIHNvdXJjZSBjb2RlIChkb3duc3RyZWFt
KQ0KPiBbMl0gTVQ2NTg5IEhTUEErIFNtYXJ0cGhvbmUgQXBwbGljYXRpb24gUHJvY2Vzc29yIERh
dGFzaGVldCB2MS4wLA0KPiBwYWdlIDg2OQ0KPiBbM10gTVQ2Nzk3IExURS1BIFNtYXJ0cGhvbmUg
QXBwbGljYXRpb24gUHJvY2Vzc29yIFJlZ2lzdGVyIFRhYmxlDQo+IChQYXJ0IDEpIHYxLjEsDQo+
IHBhZ2UgMTc5Ng0KPiBbNF0gTVQ2NTc3IEhTUEEgU21hcnRwaG9uZSBBcHBsaWNhdGlvbiBQcm9j
ZXNzb3IgRGF0YXNoZWV0IHYwLjk0LA0KPiBwYWdlIDU0Nw0KPiBbNV0gQUxQUy5KQi5NUC5WMS4x
OV9NQks3N19UQl9KQiBzb3VyY2UgY29kZSAoZG93bnN0cmVhbSkNCj4gWzZdIGh0dHBzOi8vbWFy
Yy5pbmZvLz9sPWRldmljZXRyZWUmbT0xNTk5NDkyNDc5MDE4MzEmdz0yDQo+IFs3XSBodHRwczov
L21hcmMuaW5mby8/bD1saW51eC1pMmMmbT0xNTk5Mzk3MzA3MTQxODcmdz0yDQpIaSwgVGhpcyBw
YXRjaCBvbmx5IGFwcGxpZXMgdG8gQVBETUEoYXBwbGljYXRpb24gcHJvY2Vzc29yIERNQSkgYW5k
DQpkb2VzIG5vdCB1c2UgR0RNQShHZW5lcmljIERNQSkuSW4gYWRkaXRpb24sIHRoZSBmaWxlIGky
Yy1tdDY1eHguYyBvbmx5DQpzdXBwb3J0cyBBUERNQSBtb2RlIGJ5IGRlZmF1bHQuIElmIEFQRE1B
IGFkZHJlc3MgaXMgbm90IGNvbmZpZ3VyZWQgaW4NCmR0cywgaTJjIHRyYW5zbWlzc2lvbiB3aWxs
IGJlIGZhaWwudGh4fg0K

