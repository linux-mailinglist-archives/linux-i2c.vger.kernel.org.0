Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951A611E015
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 10:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfLMJB3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 04:01:29 -0500
Received: from mailgw02.mediatek.com ([216.200.240.185]:35964 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMJB3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 04:01:29 -0500
X-UUID: 041adb71b4494861be8800baf2777a63-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y8nDm9m2qOtB71NuflHB6u7i5dLokDsUDk4uCftOpH4=;
        b=qNkL/3cx2h05DCIpLKwrTsJ4U6Wncyi6FSV2QwAqfM0UWgpcKE2Uqg/pzCaKEy2zZ5ekFKdlFFh2VOf7XF2Gbgcz96hOWepaaFtIBntFOuFi54CLhkJyczSIpgNlnv9Vw8PU2jV02jI4S69/8ueXY2q5HfIoj7wfXGA71ibKphg=;
X-UUID: 041adb71b4494861be8800baf2777a63-20191213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 835677363; Fri, 13 Dec 2019 01:01:25 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:12:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 16:11:59 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v8 0/4] add power control in i2c and at24
Date:   Fri, 13 Dec 2019 16:12:26 +0800
Message-ID: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
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
MmMNCmFyZSBhbHdheSBvbiwgc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUgZWVwcm9tIGFuZCBp
MmMgcG93ZXINCmluIG9yZGVyIHRvIG1lZXQgbG93IHBvd2VyIHJlcXVlc3QuDQpUaGlzIHBhdGNo
IGFkZCB0aGUgcG1fcnVudGltZSBvcHMgdG8gY29udHJvbCBwb3dlciB0byBzdXBwb3J0DQphbGwg
cGxhdGZvcm1zLg0KDQpDaGFuZ2VzIHNpbmNlIHY3Og0KIC0gYWRkIGJpbmRpbmcgZGVzY3JpYmUg
c3VwcGx5IHByb3BlcnR5IGluIGkyYyBhbmQgYXQyNC4NCiAtIG1vdmUgaTJjIGJ1cyBzdXBwbHkg
Y29udHJvbCBpbiBpMmMtY29yZS4NCiAtIHJlYmFzZSBvbnRvIHY1LjUtcmMxDQoNCkNoYW5nZXMg
c2luY2UgdjY6DQogLSBhZGQgYmFjayBlcnJvciBjaGVjayBmb3IgZGV2bV9yZWd1bGF0b3JfYnVs
a19nZXQoKQ0KDQpDaGFuZ2VzIHNpbmNlIHY1Og0KIC0gcmVtb3ZlIGhhc19zdXBwbGllcw0KDQpD
aGFuZ2VzIHNpbmNlIHY0Og0KIC0gYWRkIHN5c3RlbSBzbGVlcCBQTSBvcHMNCiAtIG1vdmUgcmVn
dWxhdG9yX2J1bGtfZGlzYWJsZSBiZWZvcmUgc3VzcGVuZCgpDQogLSBmaXhlcyBlcnJvciBoYW5k
bGluZw0KDQpDaGFuZ2VzIHNpbmNlIHYzOg0KIC0gcmVtb3ZlIHJlZHVuZGFudCBjYWxsaW5nIGZ1
bmN0aW9uDQogLSBjaGFuZ2UgU0lNUExFX0RFVl9QTV9PUFMgdG8gU0VUX1JVTlRJTUVfUE1fT1BT
DQogLSBjaGFuZ2Ugc3VwcGx5IG5hbWUNCg0KQ2hhbmdlcyBzaW5jZSB2MjoNCiAtIHJlYmFzZSBv
bnRvIHY1LjQtcmMxDQogLSBwbV9ydW50aW1lX2Rpc2FibGUgYW5kIHJlZ3VsYXRvcl9idWxrX2Rp
c2FibGUgYXQNCiAgIGVyciByZXR1cm4gaW4gcHJvYmUgZnVuY3Rpb24NCg0KQ2hhbmdlcyBzaW5j
ZSB2MToNCiAtIHJlbW92ZSByZWR1bmRhbnQgY29kZQ0KIC0gZml4dXAgY29kaW5nIHN0eWxlDQoN
CkJpYmJ5IEhzaWVoICg0KToNCiAgZHQtYmluZGluZzogZWVwcm9tOiBhdDI0OiBhZGQgdmNjLXN1
cHBseSBwcm9wZXJ0eQ0KICBkdC1iaW5kaW5nOiBpMmM6IGFkZCBidXMtc3VwcGx5IHByb3BlcnR5
DQogIG1pc2M6IGVlcHJvbTogYXQyNDogc3VwcG9ydCBwbV9ydW50aW1lIGNvbnRyb2wNCiAgaTJj
OiBjb3JlOiBzdXBwb3J0IGJ1cyByZWd1bGF0b3IgY29udHJvbGxpbmcgaW4gYWRhcHRlcg0KDQog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbCAgICAgIHwgIDQgKysNCiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQgfCAgMyArDQogZHJp
dmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAgICAgICAgIHwgNjYgKysrKysrKysr
KysrKysrKysrKw0KIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jICAgICAgICAgICAgICAgICAg
ICB8IDQwICsrKysrKysrKysrDQogaW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDMgKw0KIDUgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykNCg0K
LS0gDQoyLjE4LjANCg==

