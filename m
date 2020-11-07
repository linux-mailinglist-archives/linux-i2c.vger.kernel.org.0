Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AAB2AA427
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Nov 2020 10:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgKGJJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Nov 2020 04:09:55 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:49577 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727973AbgKGJJz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Nov 2020 04:09:55 -0500
X-UUID: 4c10f6f62e784f0f9a69b20474108dcf-20201107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DLmHKhdRR/VJKHOqoZljcarIlMnzrJ2krXQMqsv1Zb4=;
        b=rWbKmN2q5wGtSK8HcFo8PvRMUewE/9TXmxpkg991c1K8wQWvvCTP0Z4KzPASirLnh/Ij1J9Nm5RZ1Jv7VhRo7zx7U8QTLKC5IjWeTGBOmpQeG7Ba/WhZYyY3J3uuXOEREZql6fz9SEYMj/Hup1r3Crp1LMdCiZwAcz1F+2ROI1w=;
X-UUID: 4c10f6f62e784f0f9a69b20474108dcf-20201107
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 670291704; Sat, 07 Nov 2020 17:09:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 Nov 2020 17:09:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 7 Nov 2020 17:09:48 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [i2c-next,PATCH] i2c: medaitek: Move suspend and resume handling to NOIRQ phase
Date:   Sat, 7 Nov 2020 17:09:40 +0800
Message-ID: <1604740180-14645-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KU29tZSBpMmMgZGV2aWNl
IGRyaXZlciBpbmRpcmVjdGx5IHVzZXMgSTJDIGRyaXZlciB3aGVuIGl0IGlzIG5vdw0KYmVpbmcg
c3VzcGVuZGVkLiBUaGUgaTJjIGRldmljZXMgZHJpdmVyIGlzIHN1c3BlbmRlZCBkdXJpbmcgdGhl
DQpOT0lSUSBwaGFzZSBhbmQgdGhpcyBjYW5ub3QgYmUgY2hhbmdlZCBkdWUgdG8gb3RoZXIgZGVw
ZW5kZW5jaWVzLg0KVGhlcmVmb3JlLCB3ZSBhbHNvIG5lZWQgdG8gbW92ZSB0aGUgc3VzcGVuZCBo
YW5kbGluZyBmb3IgdGhlIEkyQw0KY29udHJvbGxlciBkcml2ZXIgdG8gdGhlIE5PSVJRIHBoYXNl
IGFzIHdlbGwuDQoNClNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5j
b20+DQotLS0NCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgMTkgKysrKysrKysr
KysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCmluZGV4IDMzZGU5OWIuLjZmNjE1OTUgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQorKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAtMTI1OCw3ICsxMjU4LDggQEAgc3RhdGljIGlu
dCBtdGtfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCW10a19pMmNf
Y2xvY2tfZGlzYWJsZShpMmMpOw0KIA0KIAlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5k
ZXYsIGlycSwgbXRrX2kyY19pcnEsDQotCQkJICAgICAgIElSUUZfVFJJR0dFUl9OT05FLCBJMkNf
RFJWX05BTUUsIGkyYyk7DQorCQkJICAgICAgIElSUUZfTk9fU1VTUEVORCB8IElSUUZfVFJJR0dF
Ul9OT05FLA0KKwkJCSAgICAgICBJMkNfRFJWX05BTUUsIGkyYyk7DQogCWlmIChyZXQgPCAwKSB7
DQogCQlkZXZfZXJyKCZwZGV2LT5kZXYsDQogCQkJIlJlcXVlc3QgSTJDIElSUSAlZCBmYWlsXG4i
LCBpcnEpOw0KQEAgLTEyODUsNyArMTI4NiwxNiBAQCBzdGF0aWMgaW50IG10a19pMmNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogfQ0KIA0KICNpZmRlZiBDT05GSUdfUE1f
U0xFRVANCi1zdGF0aWMgaW50IG10a19pMmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCitz
dGF0aWMgaW50IG10a19pMmNfc3VzcGVuZF9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0K
KwlzdHJ1Y3QgbXRrX2kyYyAqaTJjID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQorDQorCWkyY19t
YXJrX2FkYXB0ZXJfc3VzcGVuZGVkKCZpMmMtPmFkYXApOw0KKw0KKwlyZXR1cm4gMDsNCit9DQor
DQorc3RhdGljIGludCBtdGtfaTJjX3Jlc3VtZV9ub2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpDQog
ew0KIAlpbnQgcmV0Ow0KIAlzdHJ1Y3QgbXRrX2kyYyAqaTJjID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQpAQCAtMTMwMCwxMiArMTMxMCwxNSBAQCBzdGF0aWMgaW50IG10a19pMmNfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCiANCiAJbXRrX2kyY19jbG9ja19kaXNhYmxlKGkyYyk7DQogDQor
CWkyY19tYXJrX2FkYXB0ZXJfcmVzdW1lZCgmaTJjLT5hZGFwKTsNCisNCiAJcmV0dXJuIDA7DQog
fQ0KICNlbmRpZg0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBtdGtfaTJjX3Bt
ID0gew0KLQlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhOVUxMLCBtdGtfaTJjX3Jlc3VtZSkNCisJ
U0VUX05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMobXRrX2kyY19zdXNwZW5kX25vaXJxLA0KKwkJ
CQkgICAgICBtdGtfaTJjX3Jlc3VtZV9ub2lycSkNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIG10a19pMmNfZHJpdmVyID0gew0KLS0gDQoxLjkuMQ0K

