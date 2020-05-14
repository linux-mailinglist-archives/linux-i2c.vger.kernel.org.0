Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370661D2488
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 03:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgENBQb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 21:16:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:30287 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725943AbgENBQb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 21:16:31 -0400
X-UUID: 1fc01e12372544abbe0a7183ca72fb34-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zjMY/FI5QGNWlw3U1ijZ6qtahuUWrj4419TytCRSaxY=;
        b=KQTYpgkmb5q5ycBXcY0piGxVCS/mYOvsireZQ7MPT+pBstfejaLe1ZJcxMz1u536QdGT0uQgqzhFU2g1VpqtDxPBaL4BJPiQDDrtyffSu9wmdmIxBeqP+uZCh8DmxPR1GN/Z1aYnR9teC0v0wVEardcFJjBuvypwRWbuCjWlmVc=;
X-UUID: 1fc01e12372544abbe0a7183ca72fb34-20200514
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 66452614; Thu, 14 May 2020 09:16:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 May
 2020 09:16:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 09:16:23 +0800
Message-ID: <1589418905.25512.10.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date:   Thu, 14 May 2020 09:15:05 +0800
In-Reply-To: <20200512133852.GE13516@ninjato>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
         <20200512133852.GE13516@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTEyIGF0IDE1OjM4ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IEhpIFFpaSBXYW5nLA0KPiANCj4gT24gVGh1LCBNYXIgMjYsIDIwMjAgYXQgMDc6NTQ6MzZQTSAr
MDgwMCwgcWlpLndhbmdAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiA+IEZyb206IFFpaSBXYW5nIDxx
aWkud2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgYWxnb3Jp
dGhtIHRvIGNhbGN1bGF0ZSBzb21lIGFjLXRpbWluZyBwYXJhbWV0ZXJzDQo+ID4gd2hpY2ggY2Fu
IGZ1bGx5IG1lZXQgSTJDIFNwZWMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcg
PHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IENvdWxkIHlvdSByZWJhc2UgdGhpcyBvbiB0
b3Agb2YgaTJjL2Zvci1uZXh0IG9yIHY1LjctcmNYPyBCZWNhdXNlIG9mDQo+IGNvbW1pdCA5MDIy
NGU2NDY4ZTEgKCJpMmM6IGRyaXZlcnM6IFVzZSBnZW5lcmljIGRlZmluaXRpb25zIGZvciBidXMN
Cj4gZnJlcXVlbmNpZXMiKSB3aGljaCB3YXMgYWRkZWQgdHdvIGRheXMgYmVmb3JlIHlvdXIgcGF0
Y2ggd2FzIHNlbnQgb3V0Lg0KPiANCj4gT3RoZXJ3aXNlIG1vc3RseSBtaW5vciBuaXRzLg0KPiAN
Cj4gPiArc3RhdGljIGludCBtdGtfaTJjX21heF9zdGVwX2NudCh1bnNpZ25lZCBpbnQgdGFyZ2V0
X3NwZWVkKQ0KPiA+ICt7DQo+ID4gKwlpZiAodGFyZ2V0X3NwZWVkID4gTUFYX0ZTX01PREVfU1BF
RUQpDQo+ID4gKwkJcmV0dXJuIE1BWF9IU19TVEVQX0NOVF9ESVY7DQo+ID4gKwllbHNlDQo+ID4g
KwkJcmV0dXJuIE1BWF9TVEVQX0NOVF9ESVY7DQo+ID4gK30NCj4gDQo+IE1heWJlIHRlcm5hcnkg
b3BlcmF0b3IgaGVyZT8gWW91ciBjaG9pY2UuDQo+IA0KDQpVc2UgdGVybmFyeSBvcGVyYXRvciBo
ZXJlIHdpbGwgb3ZlciA4MCBieXRlcywgYW5kIG5lZWQgYSBsaW5lIGJyZWFrLA0KTWF5YmUgdGhp
cyBjb2RlIGxvb2tzIHNpbXBsZXIuDQoNCj4gQW5kIG15IGNvZGUgY2hlY2tlcnMgY29tcGxhaW5l
ZDoNCj4gDQo+ICAgICBDUFBDSEVDSw0KPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5j
OjU5MToxMTogd2FybmluZzogUmVkdW5kYW50IGFzc2lnbm1lbnQgb2YgJ3NkYV9tYXgnIHRvIGl0
c2VsZi4gW3NlbGZBc3NpZ25tZW50XQ0KPiAgIHNkYV9tYXggPSBzZGFfbWF4Ow0KPiAgICAgICAg
ICAgXg0KPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jOjU5NzoxMTogd2FybmluZzog
UmVkdW5kYW50IGFzc2lnbm1lbnQgb2YgJ3NkYV9taW4nIHRvIGl0c2VsZi4gW3NlbGZBc3NpZ25t
ZW50XQ0KPiAgIHNkYV9taW4gPSBzZGFfbWluOw0KPiANCm9rLCBJIHdpbGwgbW9kaWZ5IGl0Lg0K
DQo+IExhc3QgcXVlc3Rpb246IFlvdSBzZWVtIHRvIGJlIHRoZSBvbmUgZG9pbmcgbWFqb3IgdXBk
YXRlcyB0byB0aGlzDQo+IGRyaXZlci4gVGhhbmtzIGZvciB0aGF0ISBBcmUgeW91IG1heWJlIGlu
dGVyZXN0ZWQgaW4gYmVjb21pbmcgdGhlDQo+IG1haW50YWluZXIgZm9yIHRoaXMgZHJpdmVyPyBJ
IHRoaW5rIHRoZXJlIHdvbid0IGJlIG11Y2ggcGF0Y2hlcyB0bw0KPiByZXZpZXcgYW5kIHJlcG9y
dHMgdG8gaGFuZGxlIGJ1dCBpdCB3aWxsIHNwZWVkIHVwIHByb2Nlc3NpbmcgZm9yIG1lLg0KPiAN
Cg0KWWVzLCBJdCBpcyBteSBob25vciB0byBiZSB0aGUgbWFpbnRhaW5lciBmb3IgdGhpcyBkcml2
ZXIuDQoNCj4gQWxsIHRoZSBiZXN0LA0KPiANCj4gICAgV29sZnJhbQ0KPiANCg0K

