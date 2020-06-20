Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB86202269
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jun 2020 09:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgFTHqA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Jun 2020 03:46:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:24322 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725835AbgFTHqA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Jun 2020 03:46:00 -0400
X-UUID: 19be2c4aac3e441d903f9b1fd88945be-20200620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=W396ifFNhTXMU6Ao6v2NVBlA5nufvq++IW1xtDsWqvQ=;
        b=NcR1VWYdt4U4MAXZYbeRRoWiLb4MntYhpBpLtk4Yg6n6wzwMy2mwK0Au/1dKZ3E8FwpTipD4NKbGJLFP9msIeQK8ensWbybephjRq3XUhlrT6EEQXrwfRFx41nrjBSqPl0MyXaTjRXcpBuZGujVzH3sm+cGsEFN1PPvtAQ6MB4Y=;
X-UUID: 19be2c4aac3e441d903f9b1fd88945be-20200620
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1283702885; Sat, 20 Jun 2020 15:45:55 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 15:45:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:45:52 +0800
Message-ID: <1592639154.5529.3.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Qii Wang <qii.wang@mediatek.com>
CC:     <wsa@the-dreams.de>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Sat, 20 Jun 2020 15:45:54 +0800
In-Reply-To: <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
         <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpTb3JyeSBmb3IgbGF0ZSByZXZpZXcuDQoNCg0KT24gVGh1LCAyMDIwLTA1LTE0IGF0IDIxOjA5
ICswODAwLCBRaWkgV2FuZyB3cm90ZToNCj4gVGhpcyBwYXRjaCBhZGRzIGEgYWxnb3JpdGhtIHRv
IGNhbGN1bGF0ZSBzb21lIGFjLXRpbWluZyBwYXJhbWV0ZXJzDQo+IHdoaWNoIGNhbiBmdWxseSBt
ZWV0IEkyQyBTcGVjLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwg
MzI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNzcgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMNCj4gaW5kZXggMGNhNmMzOGEuLjcwMjA2MTggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1tdDY1eHguYw0KDQo8Li4uPg0KDQo+IEBAIC05NDgsOSArMTE3Nyw2IEBAIHN0YXRp
YyBpbnQgbXRrX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlm
IChyZXQpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+IC0JaWYgKGkyYy0+ZGV2X2NvbXAt
PnRpbWluZ19hZGp1c3QpDQo+IC0JCWkyYy0+Y2xrX3NyY19kaXYgKj0gSTJDX0RFRkFVTFRfQ0xL
X0RJVjsNCj4gLQ0KDQpBZnRlciB0aGlzIHBhdGNoLCB0aGUgJ2Nsb2NrLWRpdicgcHJvcGVydHkg
aW4gZGV2aWNlIHRyZWUgaXMgbm8gbG9uZ2VyDQp1c2VkIGZvciBwbGF0Zm9ybSB3aXRoIHRpbWlu
Z19hZGp1c3QgYWJpbGl0eS4NClBsZWFzZSBjaGFuZ2UgdGhlIGJpbmRpbmcsIHNvIHdlIGRvbid0
IG5lZWQgdG8gcHJvdmlkZSAnY2xvY2stZGl2JyBmb3INCnRoZXNlIHBsYXRmb3JtLg0KDQpKb2Uu
Qw0KDQo+ICAJaWYgKGkyYy0+aGF2ZV9wbWljICYmICFpMmMtPmRldl9jb21wLT5wbWljX2kyYykN
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCg0K

