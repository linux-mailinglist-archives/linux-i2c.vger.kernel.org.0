Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0391423DA5F
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 14:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgHFMgx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 08:36:53 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37694 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726923AbgHFLOk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 07:14:40 -0400
X-UUID: 8271cb3c4d904dd39d5c6a59fc41d09e-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=81yr++aU7+XxgAqjzy+4dxBSf9qaA6XpetwM97SESGs=;
        b=e7LJq29OgasN7UOqAY9dT759QzXEoNacew8H+ap9oqxiKRl+noQDphmm4jZONqrjtTOVt6O80tqAvD+32Ae0uqx0Dtjmu1B5BEmI7tohA802YBAg1GbXii6Hr0DXlmJ6V9YAz7oI1yza4Kqnqf4NH41oykPJ1+mV+zpR/DnP9qw=;
X-UUID: 8271cb3c4d904dd39d5c6a59fc41d09e-20200806
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 136117303; Thu, 06 Aug 2020 19:07:29 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 Aug
 2020 19:07:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 19:07:27 +0800
Message-ID: <1596712005.8263.4.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Fix i2c_spec_values description
From:   Qii Wang <qii.wang@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     <wsa@the-dreams.de>, <yingjoe.chen@mediatek.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Matthias Brugger <mbrugger@suse.com>
Date:   Thu, 6 Aug 2020 19:06:45 +0800
In-Reply-To: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
References: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIwLTA4LTA2IGF0IDExOjQ4ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiBUaGUgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyBoYXZlIGl0J3MgbWVtYmVycyBkb2N1bWVu
dGVkIGJ1dCBpcyBtaXNzaW5nIHRoZSANCj4gc3RhcnRpbmcgJ0AnLCB3aGljaCBsZWFkcyB0byB3
YXJpbmdzIGxpa2U6DQo+IA0KPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jOjI2Nzog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciANCj4gJ21pbl9sb3dfbnMnIG5v
dCBkZXNjcmliZWQgaW4gJ2kyY19zcGVjX3ZhbHVlcycNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCA4ICsrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
dDY1eHguYw0KPiBpbmRleCBlODg5Zjc0NzAzZTQuLmY1MWIzNWZjNDAwZiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW10NjV4eC5jDQo+IEBAIC0yNTMsMTAgKzI1MywxMCBAQCBzdHJ1Y3QgbXRrX2ky
YyB7DQo+IA0KPiAgIC8qKg0KPiAgICAqIHN0cnVjdCBpMmNfc3BlY192YWx1ZXM6DQo+IC0gKiBt
aW5fbG93X25zOiBtaW4gTE9XIHBlcmlvZCBvZiB0aGUgU0NMIGNsb2NrDQoNCkNhbiB5b3UgaGVs
cCBtZSBhZGQgYSBkZXNjcmlwdGlvbiBvZiBtaW5faGlnaF9ucy4gQXMNCkBtaW5faGlnaF9uczog
bWluIEhJR0ggcGVyaW9kIG9mIHRoZSBTQ0wgY2xvY2sNClRoYW5rcw0KIA0KPiAtICogbWluX3N1
X3N0YV9uczogbWluIHNldC11cCB0aW1lIGZvciBhIHJlcGVhdGVkIFNUQVJUIGNvbmRpdGlvbg0K
PiAtICogbWF4X2hkX2RhdF9uczogbWF4IGRhdGEgaG9sZCB0aW1lDQo+IC0gKiBtaW5fc3VfZGF0
X25zOiBtaW4gZGF0YSBzZXQtdXAgdGltZQ0KPiArICogQG1pbl9sb3dfbnM6IG1pbiBMT1cgcGVy
aW9kIG9mIHRoZSBTQ0wgY2xvY2sNCj4gKyAqIEBtaW5fc3Vfc3RhX25zOiBtaW4gc2V0LXVwIHRp
bWUgZm9yIGEgcmVwZWF0ZWQgU1RBUlQgY29uZGl0aW9uDQo+ICsgKiBAbWF4X2hkX2RhdF9uczog
bWF4IGRhdGEgaG9sZCB0aW1lDQo+ICsgKiBAbWluX3N1X2RhdF9uczogbWluIGRhdGEgc2V0LXVw
IHRpbWUNCj4gICAgKi8NCj4gICBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzIHsNCj4gICAJdW5zaWdu
ZWQgaW50IG1pbl9sb3dfbnM7DQoNCg==

