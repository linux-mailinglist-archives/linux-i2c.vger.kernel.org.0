Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65D11BB661
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 08:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD1GS2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 02:18:28 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:65234 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726309AbgD1GS2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 02:18:28 -0400
X-UUID: 6152f988bbc8476f8de1f9856db04554-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=puI0Sym2Yuv0B48OkoxjSpO6yWq9oS75PXbbSDPyG2k=;
        b=qa78bEsTT7CPwLaY3BSCahKjYsJlrPphg0VX8ENoAVVJOgS8vgEVyiqe97mXbpcS517KiAQEM6J8oduwjbuxLP1sX/eY5lotfnSAKWu8hN+BPOyPRA2b/t9MqjUmXeSAN2nb5mNeyVXnu6H9d06Ite8hlfTH1sukAN3d7DWNAvo=;
X-UUID: 6152f988bbc8476f8de1f9856db04554-20200428
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1887070626; Tue, 28 Apr 2020 14:18:25 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 14:18:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 14:18:22 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v14 0/2] add power control in i2c
Date:   Tue, 28 Apr 2020 14:18:11 +0800
Message-ID: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tDQphbmQg
aTJjIGFyZSBhbHdheSBvbiwgc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUNCmVlcHJvbSBhbmQg
aTJjIHBvd2VyIGluIG9yZGVyIHRvIG1lZXQgbG93IHBvd2VyIHJlcXVlc3QuDQoNClRoaXMgcGF0
Y2ggYWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBjb250cm9sIHBvd2VyIHRvDQpzdXBwb3J0IGFs
bCBwbGF0Zm9ybXMuDQoNCkNoYW5nZXMgc2luY2UgdjEzOg0KIC0gZml4dXAgc29tZSBsb2dpYyBl
cnJvcg0KDQpDaGFuZ2VzIHNpbmNlIHYxMjoNCiAtIHJlYmFzZSBvbnRvIHY1LjctcmMxDQogLSBj
aGFuZ2UgdGhlIHByb3BlcnR5IGRlc2NyaXB0aW9uIGluIGJpbmRpbmcNCg0KQ2hhbmdlcyBzaW5j
ZSB2MTE6DQogLSB1c2Ugc3VzcGVuZF9sYXRlL3Jlc3VtZV9lYXJseSBpbnN0ZWFkIG9mIHN1c3Bl
bmQvcmVzdW1lDQogLSByZWJhc2Ugb250byB2NS42LXJjMQ0KDQpDaGFuZ2VzIHNpbmNlIHYxMDoN
CiAtIGZpeHVwIHNvbWUgd29ybmcgY29kZXMNCg0KQ2hhbmdlcyBzaW5jZSB2OToNCiAtIGZpeHVw
IGJ1aWxkIGVycm9yDQogLSByZW1vdmUgcmVkdW5kYW50IGNvZGUNCg0KQ2hhbmdlcyBzaW5jZSB2
ODoNCiAtIGZpeHVwIHNvbWUgd3JvbmcgY29kZQ0KIC0gcmVtb3ZlIHJlZHVuZGFudCBtZXNzYWdl
DQoNCkNoYW5nZXMgc2luY2Ugdjc6DQogLSBhZGQgYmluZGluZyBkZXNjcmliZSBzdXBwbHkgcHJv
cGVydHkgaW4gaTJjIGFuZCBhdDI0Lg0KIC0gbW92ZSBpMmMgYnVzIHN1cHBseSBjb250cm9sIGlu
IGkyYy1jb3JlLg0KIC0gcmViYXNlIG9udG8gdjUuNS1yYzENCg0KICAgICAgICBbLi4uIHNuaXAg
Li4uXQ0KDQpCaWJieSBIc2llaCAoMik6DQogIGR0LWJpbmRpbmc6IGkyYzogYWRkIGJ1cy1zdXBw
bHkgcHJvcGVydHkNCiAgaTJjOiBjb3JlOiBzdXBwb3J0IGJ1cyByZWd1bGF0b3IgY29udHJvbGxp
bmcgaW4gYWRhcHRlcg0KDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9p
MmMudHh0IHwgIDMgKw0KIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAgICAgICAgICAg
ICAgICB8IDgyICsrKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2xpbnV4L2kyYy5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArDQogMyBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRp
b25zKCspDQoNCi0tIA0KMi4xOC4wDQo=

