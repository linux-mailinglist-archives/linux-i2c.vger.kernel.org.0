Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADA02D0B27
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Dec 2020 08:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgLGHeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 02:34:50 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:9117 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725853AbgLGHeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Dec 2020 02:34:50 -0500
X-UUID: c595306f98a241539a3c857c5a4737bf-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nxMwRSEvNImRt8FLT/HpQDb52ECXSjRWAqaVtLi/YSA=;
        b=D/ElVMRk8klFNvyJvUfwhPYrrvN9bs5WTguTCg3QFQ/XcLF6Swxo3VmEFIEMXMvGyAidS4HqAQ83UlF6kG/JpBJDE7Y0UxtQnBWetyQe6SjcVAy7q0s4kQM3DcPOJMikjDDCIVoMnKyWQi9KEQ7H/jp14xnpd05vm0QIv0KHgko=;
X-UUID: c595306f98a241539a3c857c5a4737bf-20201207
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2077601130; Mon, 07 Dec 2020 15:33:52 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Dec
 2020 15:33:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 15:33:49 +0800
Message-ID: <1607326431.25719.33.camel@mhfsdcap03>
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
Date:   Mon, 7 Dec 2020 15:33:51 +0800
In-Reply-To: <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
         <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
         <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 822D965A52E0536F39BE37E6EB109DFF6F0F10236684C611F6E4658D684AAC652000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGk6DQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHBhdGllbmNlIHJldmlldy4NClRoZXJl
IGFyZSB0d28gbWFpbiBwdXJwb3NlcyBvZiB0aGlzIHBhdGNoOg0KMS5pMmNfbWFya19hZGFwdGVy
X3N1c3BlbmRlZCZpMmNfbWFya19hZGFwdGVyX3Jlc3VtZWQNCkF2b2lkIGFjY2Vzc2luZyB0aGUg
YWRhcHRlciB3aGlsZSBpdCBpcyBzdXNwZW5kZWQgYnkgbWFya2luZyBpdA0Kc3VzcGVuZGVkIGR1
cmluZyBzdXNwZW5kLiAgVGhpcyBhbGxvd3MgdGhlIEkyQyBjb3JlIHRvIGNhdGNoIHRoaXMsIGFu
ZA0KcHJpbnQgYSB3YXJuaW5nLg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LWFybS1rZXJuZWwvcGF0Y2gvMjAxODEyMTkxNjQ4MjcuMjA5ODUtMi13c2ErcmVuZXNh
c0BzYW5nLWVuZ2luZWVyaW5nLmNvbS8NCg0KMi4gSVJRRl9OT19TVVNQRU5ELg0KSGF2aW5nIGlu
dGVycnVwdHMgZGlzYWJsZWQgbWVhbnMgbm90IG9ubHkgdGhhdCBhbiBpbnRlcnJ1cHQgd2lsbCBu
b3QNCm9jY3VyIGF0IGFuIGF3a3dhcmQgdGltZSwgYnV0IGFsc28gdGhhdCB1c2luZyBhbnkgZnVu
Y3Rpb25hbGl0eSB0aGF0DQpyZXF1aXJlcyBpbnRlcnJ1cHRzIHdpbGwgbm90IHdvcmsuIFNvIGlm
IHRoZSBkcml2ZXIgdXNlcyBhbiBJMkMgYnVzIG9yDQpzaW1pbGFyIHRvIHRlbGwgdGhlIGRldmlj
ZSB0byB0dXJuIG9mZiwgYW5kIGlmIHRoZSBJMkMgYnVzIHVzZXMNCmludGVycnVwdHMgdG8gaW5k
aWNhdGUgY29tcGxldGlvbiAod2hpY2ggaXMgbm9ybWFsKSwgdGhlbiBlaXRoZXIgdGhlDQpkZXZp
Y2UgbXVzdCBiZSBwb3dlcmVkLW9mZiBpbiBzdXNwZW5kX2xhdGUsIHNvIHRoZSBJMkMgaW50ZXJy
dXB0IG11c3QgYmUNCm1hcmtlZCBJUlFGX05PX1NVU1BFTkQuDQpodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtYWNwaS9wYXRjaC8yMDE4MDkyMzEzNTgxMi4yOTU3NC04
LWhkZWdvZWRlQHJlZGhhdC5jb20vDQoNCk9uIFRodSwgMjAyMC0xMi0wMyBhdCAxMDowMSArMDIw
MCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+IA0KPiBPbiAwMy8xMi8yMDIwIDAzOjI1LCBR
aWkgV2FuZyB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTY6MzUgKzAxMDAsIFdv
bGZyYW0gU2FuZyB3cm90ZToNCj4gPj4gSGksDQo+ID4+DQo+ID4+PiBTb21lIGkyYyBkZXZpY2Ug
ZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMgZHJpdmVyIHdoZW4gaXQgaXMgbm93DQo+ID4+PiBi
ZWluZyBzdXNwZW5kZWQuIFRoZSBpMmMgZGV2aWNlcyBkcml2ZXIgaXMgc3VzcGVuZGVkIGR1cmlu
ZyB0aGUNCj4gPj4+IE5PSVJRIHBoYXNlIGFuZCB0aGlzIGNhbm5vdCBiZSBjaGFuZ2VkIGR1ZSB0
byBvdGhlciBkZXBlbmRlbmNpZXMuDQo+ID4+PiBUaGVyZWZvcmUsIHdlIGFsc28gbmVlZCB0byBt
b3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUgSTJDDQo+ID4+PiBjb250cm9sbGVyIGRy
aXZlciB0byB0aGUgTk9JUlEgcGhhc2UgYXMgd2VsbC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+Pg0KPiA+PiBJcyB0aGlz
IGEgYnVnZml4IGFuZCBzaG91bGQgZ28gaW50byA1LjEwPyBPciBjYW4gaXQgd2FpdCBmb3IgNS4x
MT8NCj4gPj4NCj4gPiANCj4gPiBZZXMsIENhbiB5b3UgaGVscCB0byBhcHBseSBpdCBpbnRvIDUu
MTA/IFRoYW5rcw0KPiANCj4gVG8gYmUgaG9uZXN0IGlmIHlvdSBzdGlsbCBkbyBoYXZlIGFueSBp
MmMgZGV2aWNlIHdoaWNoIGFjY2Vzc2luZyBpMmMgYnVzcyBhZnRlciBfbm9pcnENCj4gc3RhZ2Ug
YW5kIHlvdXIgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCAubWFzdGVyX3hmZXJfYXRvbWljKCkg
LSB5b3UgZGVmaW5pdGVseSBoYXZlIGEgYmlnZ2VyIHByb2JsZW0uDQo+IFNvIGFkZGluZyBJUlFG
X05PX1NVU1BFTkQgc291bmQgbGlrZSBhIGhhY2sgYW5kIHByb2JhYmx5IHdvcmtzIGp1c3QgYnkg
bHVjay4NCj4gDQoNCkF0IHByZXNlbnQsIGl0IGlzIG9ubHkgYSBwcm9ibGVtIGNhdXNlZCBieSBt
aXNzaW5nIGludGVycnVwdHMsDQphbmQgLm1hc3Rlcl94ZmVyX2F0b21pYygpIGp1c3QgYSBpbXBs
ZW1lbnQgaW4gcG9sbGluZyBtb2RlLiBXaHkgbm90IHNldA0KdGhlIGludGVycnVwdCB0byBhIHN0
YXRlIHRoYXQgY2FuIGFsd2F5cyBiZSB0cmlnZ2VyZWQ/DQoNCg0K

