Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA5C1B1E1D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 07:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDUFTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 01:19:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57482 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725881AbgDUFTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 01:19:05 -0400
X-UUID: 5917739a3a7c431fae3f17a2c9876ba8-20200421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TUoPDP4K3MLuRnUQDSlpxAsoPHlCYQbcdjRnjLPS0nk=;
        b=NG56aeh22eiV5sZI8XS3GDK4zPge1ZEEfkv11V30SJe5h53x77BVbKUIykLPhyqdcrigDX8YRVyx+dsUvP3vv31d8lHsidh7Hypfl2HnnelSvCYIR68m6iYhRCz3HsihAcI7ryIah5E31XiTYfAz/UERUDja1I2avm1kYpAaxgU=;
X-UUID: 5917739a3a7c431fae3f17a2c9876ba8-20200421
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2042194037; Tue, 21 Apr 2020 13:19:01 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 13:19:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Apr 2020 13:18:59 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v13 0/2] add power control in i2c
Date:   Tue, 21 Apr 2020 13:18:56 +0800
Message-ID: <20200421051858.11176-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tIGFuZA0K
aTJjIGFyZSBhbHdheSBvbiwgc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUgZWVwcm9tIGFuZA0K
aTJjIHBvd2VyIGluIG9yZGVyIHRvIG1lZXQgbG93IHBvd2VyIHJlcXVlc3QuDQoNClRoaXMgcGF0
Y2ggYWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBjb250cm9sIHBvd2VyDQp0byBzdXBwb3J0IGFs
bCBwbGF0Zm9ybXMuDQoNCkNoYW5nZXMgc2luY2UgdjEyOg0KIC0gcmViYXNlIG9udG8gdjUuNy1y
YzENCiAtIGNoYW5nZSB0aGUgcHJvcGVydHkgZGVzY3JpcHRpb24gaW4gYmluZGluZw0KDQpDaGFu
Z2VzIHNpbmNlIHYxMToNCiAtIHVzZSBzdXNwZW5kX2xhdGUvcmVzdW1lX2Vhcmx5IGluc3RlYWQg
b2Ygc3VzcGVuZC9yZXN1bWUNCiAtIHJlYmFzZSBvbnRvIHY1LjYtcmMxDQoNCkNoYW5nZXMgc2lu
Y2UgdjEwOg0KIC0gZml4dXAgc29tZSB3b3JuZyBjb2Rlcw0KDQpDaGFuZ2VzIHNpbmNlIHY5Og0K
IC0gZml4dXAgYnVpbGQgZXJyb3INCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KDQpDaGFuZ2Vz
IHNpbmNlIHY4Og0KIC0gZml4dXAgc29tZSB3cm9uZyBjb2RlDQogLSByZW1vdmUgcmVkdW5kYW50
IG1lc3NhZ2UNCg0KQ2hhbmdlcyBzaW5jZSB2NzoNCiAtIGFkZCBiaW5kaW5nIGRlc2NyaWJlIHN1
cHBseSBwcm9wZXJ0eSBpbiBpMmMgYW5kIGF0MjQuDQogLSBtb3ZlIGkyYyBidXMgc3VwcGx5IGNv
bnRyb2wgaW4gaTJjLWNvcmUuDQogLSByZWJhc2Ugb250byB2NS41LXJjMQ0KDQogICAgICAgIFsu
Li4gc25pcCAuLi5dDQoNCkJpYmJ5IEhzaWVoICgyKToNCiAgZHQtYmluZGluZzogaTJjOiBhZGQg
YnVzLXN1cHBseSBwcm9wZXJ0eQ0KICBpMmM6IGNvcmU6IHN1cHBvcnQgYnVzIHJlZ3VsYXRvciBj
b250cm9sbGluZyBpbiBhZGFwdGVyDQoNCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy50eHQgfCAgMyArDQogZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAg
ICAgICAgICAgICAgIHwgODIgKysrKysrKysrKysrKysrKysrKw0KIGluY2x1ZGUvbGludXgvaTJj
LmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsNCiAzIGZpbGVzIGNoYW5nZWQsIDg3
IGluc2VydGlvbnMoKykNCg0KLS0gDQoyLjE4LjANCg==

