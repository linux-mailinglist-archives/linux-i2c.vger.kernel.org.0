Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5012D508F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 03:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgLJB5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 20:57:33 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:1222 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726974AbgLJB5c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 20:57:32 -0500
X-UUID: 254cd8a94516496096fe095259b4b309-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EEesHQ/nDLeSCU1U8Vi+Hs8TW6LPtGx+JbBwudhIS4A=;
        b=bJKchFDxrD5xXER0Xc4WRo7YNKWHN7RZ/i7Sh8c7QiHrEQOBiIv1aBs2uGiTTodQ/cADhYcdpb2mHEOOYxxOsGM+8t0OLbByw+mIFUcua7mco9Fd7juBhViyqF2240cwNu0dsAJWq/Cz8/69tXlknoqCpj5usYHWB5KxJ8EMtmU=;
X-UUID: 254cd8a94516496096fe095259b4b309-20201210
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 13461458; Thu, 10 Dec 2020 09:56:30 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Dec
 2020 09:56:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 09:56:28 +0800
Message-ID: <1607565387.25719.43.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
CC:     Wolfram Sang <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Thu, 10 Dec 2020 09:56:27 +0800
In-Reply-To: <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
         <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
         <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
         <1607326431.25719.33.camel@mhfsdcap03>
         <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D5CC06C8C52DF99D9DD1A87BD89711539F70665F1A7AD3104CF2DF15F1E603BC2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIwLTEyLTA3IGF0IDE4OjM1ICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90
ZToNCj4gDQo+ID4gDQo+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDEwOjAxICswMjAwLCBHcnln
b3JpaSBTdHJhc2hrbyB3cm90ZToNCj4gPj4NCj4gPj4gT24gMDMvMTIvMjAyMCAwMzoyNSwgUWlp
IFdhbmcgd3JvdGU6DQo+ID4+PiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTY6MzUgKzAxMDAsIFdv
bGZyYW0gU2FuZyB3cm90ZToNCj4gPj4+PiBIaSwNCj4gPj4+Pg0KPiA+Pj4+PiBTb21lIGkyYyBk
ZXZpY2UgZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMgZHJpdmVyIHdoZW4gaXQgaXMgbm93DQo+
ID4+Pj4+IGJlaW5nIHN1c3BlbmRlZC4gVGhlIGkyYyBkZXZpY2VzIGRyaXZlciBpcyBzdXNwZW5k
ZWQgZHVyaW5nIHRoZQ0KPiA+Pj4+PiBOT0lSUSBwaGFzZSBhbmQgdGhpcyBjYW5ub3QgYmUgY2hh
bmdlZCBkdWUgdG8gb3RoZXIgZGVwZW5kZW5jaWVzLg0KPiA+Pj4+PiBUaGVyZWZvcmUsIHdlIGFs
c28gbmVlZCB0byBtb3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUgSTJDDQo+ID4+Pj4+
IGNvbnRyb2xsZXIgZHJpdmVyIHRvIHRoZSBOT0lSUSBwaGFzZSBhcyB3ZWxsLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0K
PiA+Pj4+DQo+ID4+Pj4gSXMgdGhpcyBhIGJ1Z2ZpeCBhbmQgc2hvdWxkIGdvIGludG8gNS4xMD8g
T3IgY2FuIGl0IHdhaXQgZm9yIDUuMTE/DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBZZXMsIENhbiB5
b3UgaGVscCB0byBhcHBseSBpdCBpbnRvIDUuMTA/IFRoYW5rcw0KPiA+Pg0KPiA+PiBUbyBiZSBo
b25lc3QgaWYgeW91IHN0aWxsIGRvIGhhdmUgYW55IGkyYyBkZXZpY2Ugd2hpY2ggYWNjZXNzaW5n
IGkyYyBidXNzIGFmdGVyIF9ub2lycQ0KPiA+PiBzdGFnZSBhbmQgeW91ciBkcml2ZXIgZG9lcyBu
b3QgaW1wbGVtZW50IC5tYXN0ZXJfeGZlcl9hdG9taWMoKSAtIHlvdSBkZWZpbml0ZWx5IGhhdmUg
YSBiaWdnZXIgcHJvYmxlbS4NCj4gPj4gU28gYWRkaW5nIElSUUZfTk9fU1VTUEVORCBzb3VuZCBs
aWtlIGEgaGFjayBhbmQgcHJvYmFibHkgd29ya3MganVzdCBieSBsdWNrLg0KPiA+Pg0KPiA+IA0K
PiA+IEF0IHByZXNlbnQsIGl0IGlzIG9ubHkgYSBwcm9ibGVtIGNhdXNlZCBieSBtaXNzaW5nIGlu
dGVycnVwdHMsDQo+ID4gYW5kIC5tYXN0ZXJfeGZlcl9hdG9taWMoKSBqdXN0IGEgaW1wbGVtZW50
IGluIHBvbGxpbmcgbW9kZS4gV2h5IG5vdCBzZXQNCj4gPiB0aGUgaW50ZXJydXB0IHRvIGEgc3Rh
dGUgdGhhdCBjYW4gYWx3YXlzIGJlIHRyaWdnZXJlZD8NCj4gPiANCj4gPiANCj4gDQo+IEJlY2F1
c2UgeW91IG11c3Qgbm90IHVzZSBhbnkgSVJRIGRyaXZlbiBvcGVyYXRpb25zIGFmdGVyIF9ub2ly
cSBzdXNwZW5kIHN0YXRlIGFzIGl0IG1pZ2h0IChhbmQgbW9zdCBwcm9iYWJseSB3aWxsKQ0KPiBj
YXVzZSB1bnByZWRpY3RhYmxlIGJlaGF2aW9yIGxhdGVyICBpbiBzdXNwZW5kX2VudGVyKCk6DQo+
IA0KPiAJYXJjaF9zdXNwZW5kX2Rpc2FibGVfaXJxcygpOw0KPiAJQlVHX09OKCFpcnFzX2Rpc2Fi
bGVkKCkpOw0KPiBeYWZ0ZXIgdGhpcyBwb2ludCBhbnkgSVJRIGRyaXZlbiBJMkMgdHJhbnNmZXIg
d2lsbCBjYXVzZSBJUlEgdG8gYmUgcmUtZW5hYmxlZA0KPiANCj4gaWYgeW91IG5lZWQgIHR1cm4g
b2ZmIGRldmljZSBmcm9tIHBsYXRmb3JtIGNhbGxiYWNrcyAtICAubWFzdGVyX3hmZXJfYXRvbWlj
KCkgaGFzIHRvIGJlIGltcGxlbWVudGVkIGFuZCB1c2VkLg0KPiAgIA0KTWF5YmUgbXkgY29tbWVu
dCBpcyBhIGJpdCBkaXN0dXJiaW5nLk91ciBwdXJwb3NlIGlzIG5vdCB0byBjYWxsIGkyYyBhbmQN
CnVzZSBpbnRlcnJ1cHRzIGFmdGVyIF9ub2lycSBwYXVzZXMuU28gV2UgdXNlDQppMmNfbWFya19h
ZGFwdGVyX3N1c3BlbmRlZCZpMmNfbWFya19hZGFwdGVyX3Jlc3VtZWQgdG8gYmxvY2sgdGhlc2Ug
aTJjDQp0cmFuc2ZlcnPvvIwgVGhlcmUgd2lsbCBub3QgaGF2ZSBhbnkgSVJRIGRyaXZlbiBJMkMg
dHJhbnNmZXIgYWZ0ZXIgdGhpcw0KcG9pbnQ6DQogICAgICAgIGFyY2hfc3VzcGVuZF9kaXNhYmxl
X2lycXMoKTsNCiAgICAgICAgQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOw0KQnV0IHNvbWUgZGV2
aWNlIGRyaXZlciB3aWxsIGRvIGkyYyB0cmFuc2ZlciBhZnRlcg0KZHBtX25vaXJxX3Jlc3VtZV9k
ZXZpY2VzIGluIGRwbV9yZXN1bWVfbm9pcnEoUE1TR19SRVNVTUUpIHdoZW4gb3VyDQpkcml2ZXIg
aXJxIGhhc24ndCByZXN1bWUuDQoJdm9pZCBkcG1fcmVzdW1lX25vaXJxKHBtX21lc3NhZ2VfdCBz
dGF0ZSkNCgl7DQogICAgICAgIAlkcG1fbm9pcnFfcmVzdW1lX2RldmljZXMoc3RhdGUpOw0KICAg
ICAgICAJcmVzdW1lX2RldmljZV9pcnFzKCk7DQogICAgICAgIAlkZXZpY2Vfd2FrZXVwX2Rpc2Fy
bV93YWtlX2lycXMoKTsNCiAgICAgICAgCWNwdWlkbGVfcmVzdW1lKCk7DQoJfQ0KLm1hc3Rlcl94
ZmVyX2F0b21pYygpIHNlZW1zIHRvIGJlIGludmFsaWQgZm9yIHRoaXMgcXVlc3Rpb24gYXQgdGhp
cw0KdGltZT8NCg0K

