Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4F823F5B1
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Aug 2020 02:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgHHA5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 20:57:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:43481 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726066AbgHHA5M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 20:57:12 -0400
X-UUID: a16b5c5f65a8420c856dde4b7f4962f3-20200808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tl8qgIAJrElb58CrFhs8MW6abG2NpTHnjHQaoObZ1ys=;
        b=Lhfq1HY0SQYAnJxzdfY99qFyLIhW9bXQntZGG/P/tOBWtxed6zBus811ScUgYOcrQiXm8KiPJ3prZYJj3d9h9k5JF8lTmqFBoGep/JQ4vLPeqBUOTqcd8UCPqfp3byeE9KXGHbZAUxgxHxWchp6YHSfoWYcR0Qg5zOQFpo22TrY=;
X-UUID: a16b5c5f65a8420c856dde4b7f4962f3-20200808
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 149535832; Sat, 08 Aug 2020 08:57:07 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 8 Aug
 2020 08:57:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 08:57:04 +0800
Message-ID: <1596848179.8263.11.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Fix i2c_spec_values description
From:   Qii Wang <qii.wang@mediatek.com>
To:     <matthias.bgg@kernel.org>
CC:     <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
        <yingjoe.chen@mediatek.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Matthias Brugger" <mbrugger@suse.com>
Date:   Sat, 8 Aug 2020 08:56:19 +0800
In-Reply-To: <20200807131904.6515-1-matthias.bgg@kernel.org>
References: <20200807131904.6515-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 228AB456F0D1809A0D32EF84CD12D6E7106F8FEF72C429D702EDD5E86D0510A32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIwLTA4LTA3IGF0IDE1OjE5ICswMjAwLCBtYXR0aGlhcy5iZ2dAa2VybmVsLm9y
ZyB3cm90ZToNCj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+DQo+
IA0KPiBUaGUgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyBoYXZlIGl0J3MgbWVtYmVycyBkb2N1bWVu
dGVkIGJ1dCBpcw0KPiBtaXNzaW5nIHRoZSBzdGFydGluZyAnQCcsIHdoaWNoIGxlYWRzIHRvIHdh
cmluZ3MgbGlrZToNCj4gDQo+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmM6MjY3OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtaW5fbG93X25zJyBub3QgZGVz
Y3JpYmVkIGluICdpMmNfc3BlY192YWx1ZXMnDQo+IA0KPiBXZSBhbHNvIGRlbGV0ZSBtaW5faGln
aF9ucyBtZW1iZXIgYXMgaXQgaXMgbm90IHVzZWQgaW4gdGhlIGNvZGUuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQoNCj4gLS0tDQo+IA0KPiBDaGFu
Z2VzIHNpbmNlIHYxOg0KPiBkZWxldGUgbWludF9oaWdoX25zIG1lbWJlcg0KPiANCj4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCA5ICsrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
dDY1eHguYw0KPiBpbmRleCBlODg5Zjc0NzAzZTQuLmVmYzE0MDQxZDQ1YiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW10NjV4eC5jDQo+IEBAIC0yNTMsMTQgKzI1MywxMyBAQCBzdHJ1Y3QgbXRrX2ky
YyB7DQo+ICANCj4gIC8qKg0KPiAgICogc3RydWN0IGkyY19zcGVjX3ZhbHVlczoNCj4gLSAqIG1p
bl9sb3dfbnM6IG1pbiBMT1cgcGVyaW9kIG9mIHRoZSBTQ0wgY2xvY2sNCj4gLSAqIG1pbl9zdV9z
dGFfbnM6IG1pbiBzZXQtdXAgdGltZSBmb3IgYSByZXBlYXRlZCBTVEFSVCBjb25kaXRpb24NCj4g
LSAqIG1heF9oZF9kYXRfbnM6IG1heCBkYXRhIGhvbGQgdGltZQ0KPiAtICogbWluX3N1X2RhdF9u
czogbWluIGRhdGEgc2V0LXVwIHRpbWUNCj4gKyAqIEBtaW5fbG93X25zOiBtaW4gTE9XIHBlcmlv
ZCBvZiB0aGUgU0NMIGNsb2NrDQo+ICsgKiBAbWluX3N1X3N0YV9uczogbWluIHNldC11cCB0aW1l
IGZvciBhIHJlcGVhdGVkIFNUQVJUIGNvbmRpdGlvbg0KPiArICogQG1heF9oZF9kYXRfbnM6IG1h
eCBkYXRhIGhvbGQgdGltZQ0KPiArICogQG1pbl9zdV9kYXRfbnM6IG1pbiBkYXRhIHNldC11cCB0
aW1lDQo+ICAgKi8NCj4gIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KPiAgCXVuc2lnbmVkIGlu
dCBtaW5fbG93X25zOw0KPiAtCXVuc2lnbmVkIGludCBtaW5faGlnaF9uczsNCj4gIAl1bnNpZ25l
ZCBpbnQgbWluX3N1X3N0YV9uczsNCj4gIAl1bnNpZ25lZCBpbnQgbWF4X2hkX2RhdF9uczsNCj4g
IAl1bnNpZ25lZCBpbnQgbWluX3N1X2RhdF9uczsNCg0K

