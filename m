Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6E81A9774
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895073AbgDOIuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:50:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56190 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2895072AbgDOIuE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:50:04 -0400
X-UUID: e78e873eeda4492e89e02e3ffed20e99-20200415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2WBZ7hM0YoXBpJcKelYpQ39XyX/1btRpalqAnJewDts=;
        b=qm4DBBPq3UOibVVZjRUbkjuc5E5WyrgY52SLx1r2KN0Ld2PNz1/xASFtpYQ6Mc8hnyFhvXcl9D2TvD7ppzE0qV1wqbbKic1Me59ZVyMYKc5PlsAVbZFOyddyRlBG4SIJicQwGwH+qlSZifREBlIRGIrvKaKasvHd4PPOHrCM4Fg=;
X-UUID: e78e873eeda4492e89e02e3ffed20e99-20200415
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1288575515; Wed, 15 Apr 2020 16:49:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 16:49:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Apr 2020 16:49:55 +0800
Message-ID: <1586940598.5007.0.camel@mtksdaap41>
Subject: Re: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Date:   Wed, 15 Apr 2020 16:49:58 +0800
In-Reply-To: <20200324103448.GE1134@ninjato>
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
         <20200306034946.11223-2-bibby.hsieh@mediatek.com>
         <20200322130710.GA1091@ninjato>
         <CAAFQd5ANJcReHD_n0LorS+bjE8Cn_W-kY5LNgGG+L+jMmywYfA@mail.gmail.com>
         <20200324103448.GE1134@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIwLTAzLTI0IGF0IDExOjM0ICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gPiA+ICstIGJ1cy1zdXBwbHkNCj4gPiA+ID4gKyAgICAgcGhhbmRsZSB0byB0aGUgcmVndWxh
dG9yIHRoYXQgcHJvdmlkZXMgcG93ZXIgdG8gaTJjLg0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgdGhp
cyBpcyBub3QgY2xlYXIgZW5vdWdoLiBJIGFzc3VtZSBpdCBtZWFucyB0aGUgcmVndWxhdG9yIGZv
cg0KPiA+ID4gZHJpdmluZyBTQ0wvU0RBPyBJbiB0aGUgY292ZXJsZXR0ZXIgeW91IG1lbnRpb24g
YWxzbyBhbiBFRVBST00uIEluIHlvdXINCj4gPiA+IGNhc2UsIHRoaXMgaXMgZHJpdmVuIGJ5IHRo
ZSBzYW1lIHJlZ3VsYXRvcj8gSSBhbSBza2VwdGljYWwgd2UgY2FuDQo+ID4gPiBhYnN0cmFjdCBp
dCBsaWtlIHRoaXMgYmVjYXVzZSBJMkMgZGV2aWNlcyBjb3VsZCBiZSBkcml2ZW4gYnkgdmFyaW91
cw0KPiA+ID4gcmVndWxhdG9ycyBpbiB0aGUgc3lzdGVtLCBzbyB0aGVyZSBjb3VsZG4ndCBiZSBv
bmUgImJ1cyByZWd1bGF0b3IiLiBUaGUNCj4gPiA+IHJlZ3VsYXRvciBmb3IgdGhlIEVFUFJPTSBz
aG91bGQgYmUgZGVzY3JpYmVkIGluIHRoZSBFRVBST00gbm9kZS4gU28sDQo+ID4gPiB0aGlzICJi
dXMgc3VwcGx5IiBpcyBvbmx5IGZvciBkcml2aW5nIFNDTC9TREE/DQo+ID4gDQo+ID4gSW4gb3Vy
IGNhc2UgdGhlIGJ1cy1zdXBwbHkgcmVndWxhdG9yIGRyaXZlcyB0aGUgdm9sdGFnZSByYWlsIHRv
IHdoaWNoDQo+ID4gU0NML1NEQSBhcmUgcHVsbGVkIHVwIGFuZCB0aGVyZSBpcyBhbiBFRVBST00g
b24gdGhlIGJ1cywgcG93ZXJlZCBieQ0KPiA+IHlldCBhbm90aGVyIHJhaWwuIFRoZXJlIGlzIGFs
c28gYW5vdGhlciBzbGF2ZSBvbiB0aGUgYnVzIHdoaWNoIHVzZXMNCj4gPiB0aGUgc2FtZSByZWd1
bGF0b3IgYXMgdGhlIGJ1cy1zdXBwbHkgZm9yIGl0cyBvd24gcG93ZXIuDQo+ID4gDQo+ID4gSW4g
b3RoZXIgd29yZHMsIGJ1cy1zdXBwbHkgb25seSBlbnN1cmVzIHRoYXQgU0NMIGFuZCBTREEgYXJl
IGluIGENCj4gPiB1c2FibGUgc3RhdGUuIE90aGVyIGNvbnN1bWVycyBuZWVkIHRvIHJlZmVyIHRv
IHRoZSByZWd1bGF0b3IgaW4gdGhlaXINCj4gPiBvd24gc3VwcGxpZXMgaWYgdGhleSBuZWVkIGl0
IGZvciB0aGVpciBvd24gcG93ZXIuDQo+ID4gDQo+ID4gRG9lcyB0aGlzIGFuc3dlciB5b3VyIHF1
ZXN0aW9ucz8NCj4gDQo+IFllcywgdGhpcyB3YXMgZXhhY3RseSB3aGF0IEkgd2FzIGFzc3VtaW5n
Lg0KPiANCj4gU28sIEkgdGhpbmsgdGhlIGFib3ZlIGRvY3VtZW50YXRpb24gc2hvdWxkIGJlIGNo
YW5nZWQ6IHN8aTJjfFNDTC9TREF8DQo+IA0KPiBEJ2FjY29yZD8NCj4gDQpZZXMsIEkgdGhpbmsg
U0NML1NEQSBpcyBiZXR0ZXIgdGhhbiBpMmMNCg0KVG9tYXN6LCBIb3cgYWJvdXQgaXQ/DQoNClRo
YW5rcw0KDQpCaWJieQ0KDQo=

