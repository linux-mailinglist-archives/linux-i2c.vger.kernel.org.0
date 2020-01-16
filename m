Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C863D13D259
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 03:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgAPC4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 21:56:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:45279 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728890AbgAPC4o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 21:56:44 -0500
X-UUID: 1242d598029d4602a71570b276af82fc-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=c8y/tHViRjt47Qgzch+UoqbSFNraHWP1QCXQqQJwc7k=;
        b=LjDW1hx4gOTimgLSh8pzBulVjWyyhSr3jG8IOKfXEwdG4QnseT8KGsV09/sly2R/yvY1hAsN0+ccs1mZgTEemDRg25ugcQqnLdjkMPiLMlH8OKfFxGcHct+QumknBSvm+XgTKVDfuNb8hjWHfyPqpl19tiorZo4DrtAzLfzfjhk=;
X-UUID: 1242d598029d4602a71570b276af82fc-20200116
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 92989258; Thu, 16 Jan 2020 10:56:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 10:56:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 10:57:25 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v10 0/4] add power control in i2c and at24
Date:   Thu, 16 Jan 2020 10:56:33 +0800
Message-ID: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tIGFuZCBp
MmMgYXJlIGFsd2F5IG9uLA0Kc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUgZWVwcm9tIGFuZCBp
MmMgcG93ZXIgaW4gb3JkZXIgdG8gbWVldCBsb3cgcG93ZXIgcmVxdWVzdC4NClRoaXMgcGF0Y2gg
YWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBjb250cm9sIHBvd2VyIHRvIHN1cHBvcnQgYWxsIHBs
YXRmb3Jtcy4NCg0KQ2hhbmdlcyBzaW5jZSB2OToNCiAtIGZpeHVwIGJ1aWxkIGVycm9yDQogLSBy
ZW1vdmUgcmVkdW5kYW50IGNvZGUNCg0KQ2hhbmdlcyBzaW5jZSB2ODoNCiAtIGZpeHVwIHNvbWUg
d3JvbmcgY29kZQ0KIC0gcmVtb3ZlIHJlZHVuZGFudCBtZXNzYWdlDQoNCkNoYW5nZXMgc2luY2Ug
djc6DQogLSBhZGQgYmluZGluZyBkZXNjcmliZSBzdXBwbHkgcHJvcGVydHkgaW4gaTJjIGFuZCBh
dDI0Lg0KIC0gbW92ZSBpMmMgYnVzIHN1cHBseSBjb250cm9sIGluIGkyYy1jb3JlLg0KIC0gcmVi
YXNlIG9udG8gdjUuNS1yYzENCg0KQ2hhbmdlcyBzaW5jZSB2NjoNCiAtIGFkZCBiYWNrIGVycm9y
IGNoZWNrIGZvciBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldCgpDQoNCkNoYW5nZXMgc2luY2UgdjU6
DQogLSByZW1vdmUgaGFzX3N1cHBsaWVzDQoNCkNoYW5nZXMgc2luY2UgdjQ6DQogLSBhZGQgc3lz
dGVtIHNsZWVwIFBNIG9wcw0KIC0gbW92ZSByZWd1bGF0b3JfYnVsa19kaXNhYmxlIGJlZm9yZSBz
dXNwZW5kKCkNCiAtIGZpeGVzIGVycm9yIGhhbmRsaW5nDQoNCkNoYW5nZXMgc2luY2UgdjM6DQog
LSByZW1vdmUgcmVkdW5kYW50IGNhbGxpbmcgZnVuY3Rpb24NCiAtIGNoYW5nZSBTSU1QTEVfREVW
X1BNX09QUyB0byBTRVRfUlVOVElNRV9QTV9PUFMNCiAtIGNoYW5nZSBzdXBwbHkgbmFtZQ0KDQpD
aGFuZ2VzIHNpbmNlIHYyOg0KIC0gcmViYXNlIG9udG8gdjUuNC1yYzENCiAtIHBtX3J1bnRpbWVf
ZGlzYWJsZSBhbmQgcmVndWxhdG9yX2J1bGtfZGlzYWJsZSBhdA0KICAgZXJyIHJldHVybiBpbiBw
cm9iZSBmdW5jdGlvbg0KDQpDaGFuZ2VzIHNpbmNlIHYxOg0KIC0gcmVtb3ZlIHJlZHVuZGFudCBj
b2RlDQogLSBmaXh1cCBjb2Rpbmcgc3R5bGUNCg0KQmliYnkgSHNpZWggKDQpOg0KICBkdC1iaW5k
aW5nOiBlZXByb206IGF0MjQ6IGFkZCB2Y2Mtc3VwcGx5IHByb3BlcnR5DQogIGR0LWJpbmRpbmc6
IGkyYzogYWRkIGJ1cy1zdXBwbHkgcHJvcGVydHkNCiAgbWlzYzogZWVwcm9tOiBhdDI0OiBzdXBw
b3J0IHBtX3J1bnRpbWUgY29udHJvbA0KICBpMmM6IGNvcmU6IHN1cHBvcnQgYnVzIHJlZ3VsYXRv
ciBjb250cm9sbGluZyBpbiBhZGFwdGVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXBy
b20vYXQyNC55YW1sICAgICAgfCAgNCArDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9pMmMudHh0IHwgIDMgKw0KIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAg
ICAgICAgICAgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL21pc2MvZWVw
cm9tL2F0MjQuYyAgICAgICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysNCiBpbmNsdWRlL2xp
bnV4L2kyYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArDQogNSBmaWxlcyBjaGFu
Z2VkLCAxMzEgaW5zZXJ0aW9ucygrKQ0KDQotLSANCjIuMTguMA0K

