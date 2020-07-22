Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD3E22984B
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 14:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgGVMdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 08:33:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54298 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726768AbgGVMdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 08:33:00 -0400
X-UUID: 81ed6e2d5e034e9f85fc5e5db346e2cb-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aLmjvIyF1BWzJBOgWkh6tBLLu/lhJMxA+h9rtJu6iXU=;
        b=FQD+HP7V+EniNyuj6nqp4/75FuRgjGFkDq5A21goXLmOCb+whRBbPgunGVc6uNtzDEkhORw8c0qGhVVrkr/zyX/Divlf1aF0+uFYlVjOTEo1v5VgTcdnFcDhFvC5eEp9BFx86+ei/z7Vh1+G7P+5B/afX0mnUydoHkpYo8t5EIk=;
X-UUID: 81ed6e2d5e034e9f85fc5e5db346e2cb-20200722
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 10683494; Wed, 22 Jul 2020 20:32:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:54 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>
Subject: [PATCH 1/4] i2c: mediatek: Add apdma sync in i2c driver
Date:   Wed, 22 Jul 2020 20:31:43 +0800
Message-ID: <1595421106-10017-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V2l0aCB0aGUgYXBkbWEgcmVtb3ZlIGhhbmQtc2hha2Ugc2lnbmFsLCBpdCBuZWVkIHRvIGtlZXAg
aTJjIGFuZA0KYXBkbWEgaW4gc3luYyBtYW51YWxseS4NCg0KU2lnbmVkLW9mZi1ieTogUWlpIFdh
bmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXQ2NXh4LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMN
CmluZGV4IGRlZWY2OWUuLmU2Yjk4NGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW10NjV4eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAt
NDgsNiArNDgsOSBAQA0KIA0KICNkZWZpbmUgSTJDX0RNQV9DT05fVFgJCQkweDAwMDANCiAjZGVm
aW5lIEkyQ19ETUFfQ09OX1JYCQkJMHgwMDAxDQorI2RlZmluZSBJMkNfRE1BX0FTWU5DX01PREUJ
CTB4MDAwNA0KKyNkZWZpbmUgSTJDX0RNQV9TS0lQX0NPTkZJRwkJMHgwMDEwDQorI2RlZmluZSBJ
MkNfRE1BX0RJUl9DSEFOR0UJCTB4MDIwMA0KICNkZWZpbmUgSTJDX0RNQV9TVEFSVF9FTgkJMHgw
MDAxDQogI2RlZmluZSBJMkNfRE1BX0lOVF9GTEFHX05PTkUJCTB4MDAwMA0KICNkZWZpbmUgSTJD
X0RNQV9DTFJfRkxBRwkJMHgwMDAwDQpAQCAtMjA1LDYgKzIwOCw3IEBAIHN0cnVjdCBtdGtfaTJj
X2NvbXBhdGlibGUgew0KIAl1bnNpZ25lZCBjaGFyIHRpbWluZ19hZGp1c3Q6IDE7DQogCXVuc2ln
bmVkIGNoYXIgZG1hX3N5bmM6IDE7DQogCXVuc2lnbmVkIGNoYXIgbHRpbWluZ19hZGp1c3Q6IDE7
DQorCXVuc2lnbmVkIGNoYXIgYXBkbWFfc3luYzogMTsNCiB9Ow0KIA0KIHN0cnVjdCBtdGtfaTJj
X2FjX3RpbWluZyB7DQpAQCAtMzExLDYgKzMxNSw3IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMg
ew0KIAkudGltaW5nX2FkanVzdCA9IDEsDQogCS5kbWFfc3luYyA9IDAsDQogCS5sdGltaW5nX2Fk
anVzdCA9IDAsDQorCS5hcGRtYV9zeW5jID0gMCwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX2kyY19jb21wYXRpYmxlIG10NjU3N19jb21wYXQgPSB7DQpAQCAtMzI0LDYgKzMyOSw3
IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KIAkudGltaW5nX2FkanVzdCA9IDAsDQogCS5k
bWFfc3luYyA9IDAsDQogCS5sdGltaW5nX2FkanVzdCA9IDAsDQorCS5hcGRtYV9zeW5jID0gMCwN
CiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2kyY19jb21wYXRpYmxlIG10NjU4OV9j
b21wYXQgPSB7DQpAQCAtMzM3LDYgKzM0Myw3IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0K
IAkudGltaW5nX2FkanVzdCA9IDAsDQogCS5kbWFfc3luYyA9IDAsDQogCS5sdGltaW5nX2FkanVz
dCA9IDAsDQorCS5hcGRtYV9zeW5jID0gMCwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2kyY19jb21wYXRpYmxlIG10NzYyMl9jb21wYXQgPSB7DQpAQCAtMzUwLDYgKzM1Nyw3IEBA
IHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KIAkudGltaW5nX2FkanVzdCA9IDAsDQogCS5kbWFf
c3luYyA9IDAsDQogCS5sdGltaW5nX2FkanVzdCA9IDAsDQorCS5hcGRtYV9zeW5jID0gMCwNCiB9
Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2kyY19jb21wYXRpYmxlIG10ODE3M19jb21w
YXQgPSB7DQpAQCAtMzYyLDYgKzM3MCw3IEBAIHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KIAku
dGltaW5nX2FkanVzdCA9IDAsDQogCS5kbWFfc3luYyA9IDAsDQogCS5sdGltaW5nX2FkanVzdCA9
IDAsDQorCS5hcGRtYV9zeW5jID0gMCwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2kyY19jb21wYXRpYmxlIG10ODE4M19jb21wYXQgPSB7DQpAQCAtMzc1LDYgKzM4NCw3IEBAIHN0
cnVjdCBpMmNfc3BlY192YWx1ZXMgew0KIAkudGltaW5nX2FkanVzdCA9IDEsDQogCS5kbWFfc3lu
YyA9IDEsDQogCS5sdGltaW5nX2FkanVzdCA9IDEsDQorCS5hcGRtYV9zeW5jID0gMCwNCiB9Ow0K
IA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19pMmNfb2ZfbWF0Y2hbXSA9
IHsNCkBAIC03OTgsNiArODA4LDcgQEAgc3RhdGljIGludCBtdGtfaTJjX2RvX3RyYW5zZmVyKHN0
cnVjdCBtdGtfaTJjICppMmMsIHN0cnVjdCBpMmNfbXNnICptc2dzLA0KIAl1MTYgc3RhcnRfcmVn
Ow0KIAl1MTYgY29udHJvbF9yZWc7DQogCXUxNiByZXN0YXJ0X2ZsYWcgPSAwOw0KKwl1MTYgZG1h
X3N5bmMgPSAwOw0KIAl1MzIgcmVnXzRnX21vZGU7DQogCXU4ICpkbWFfcmRfYnVmID0gTlVMTDsN
CiAJdTggKmRtYV93cl9idWYgPSBOVUxMOw0KQEAgLTg1MSwxMCArODYyLDE2IEBAIHN0YXRpYyBp
bnQgbXRrX2kyY19kb190cmFuc2ZlcihzdHJ1Y3QgbXRrX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21z
ZyAqbXNncywNCiAJCW10a19pMmNfd3JpdGV3KGkyYywgbnVtLCBPRkZTRVRfVFJBTlNBQ19MRU4p
Ow0KIAl9DQogDQorCWlmIChpMmMtPmRldl9jb21wLT5hcGRtYV9zeW5jKSB7DQorCQlkbWFfc3lu
YyA9IEkyQ19ETUFfU0tJUF9DT05GSUcgfCBJMkNfRE1BX0FTWU5DX01PREU7DQorCQlpZiAoaTJj
LT5vcCA9PSBJMkNfTUFTVEVSX1dSUkQpDQorCQkJZG1hX3N5bmMgfD0gSTJDX0RNQV9ESVJfQ0hB
TkdFOw0KKwl9DQorDQogCS8qIFByZXBhcmUgYnVmZmVyIGRhdGEgdG8gc3RhcnQgdHJhbnNmZXIg
Ki8NCiAJaWYgKGkyYy0+b3AgPT0gSTJDX01BU1RFUl9SRCkgew0KIAkJd3JpdGVsKEkyQ19ETUFf
SU5UX0ZMQUdfTk9ORSwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9JTlRfRkxBRyk7DQotCQl3cml0
ZWwoSTJDX0RNQV9DT05fUlgsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfQ09OKTsNCisJCXdyaXRl
bChJMkNfRE1BX0NPTl9SWCB8IGRtYV9zeW5jLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0NPTik7
DQogDQogCQlkbWFfcmRfYnVmID0gaTJjX2dldF9kbWFfc2FmZV9tc2dfYnVmKG1zZ3MsIDEpOw0K
IAkJaWYgKCFkbWFfcmRfYnVmKQ0KQEAgLTg3Nyw3ICs4OTQsNyBAQCBzdGF0aWMgaW50IG10a19p
MmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMgKmkyYywgc3RydWN0IGkyY19tc2cgKm1zZ3Ms
DQogCQl3cml0ZWwobXNncy0+bGVuLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX1JYX0xFTik7DQog
CX0gZWxzZSBpZiAoaTJjLT5vcCA9PSBJMkNfTUFTVEVSX1dSKSB7DQogCQl3cml0ZWwoSTJDX0RN
QV9JTlRfRkxBR19OT05FLCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0lOVF9GTEFHKTsNCi0JCXdy
aXRlbChJMkNfRE1BX0NPTl9UWCwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9DT04pOw0KKwkJd3Jp
dGVsKEkyQ19ETUFfQ09OX1RYIHwgZG1hX3N5bmMsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfQ09O
KTsNCiANCiAJCWRtYV93cl9idWYgPSBpMmNfZ2V0X2RtYV9zYWZlX21zZ19idWYobXNncywgMSk7
DQogCQlpZiAoIWRtYV93cl9idWYpDQpAQCAtOTAwLDcgKzkxNyw3IEBAIHN0YXRpYyBpbnQgbXRr
X2kyY19kb190cmFuc2ZlcihzdHJ1Y3QgbXRrX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21zZyAqbXNn
cywNCiAJCXdyaXRlbChtc2dzLT5sZW4sIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfVFhfTEVOKTsN
CiAJfSBlbHNlIHsNCiAJCXdyaXRlbChJMkNfRE1BX0NMUl9GTEFHLCBpMmMtPnBkbWFiYXNlICsg
T0ZGU0VUX0lOVF9GTEFHKTsNCi0JCXdyaXRlbChJMkNfRE1BX0NMUl9GTEFHLCBpMmMtPnBkbWFi
YXNlICsgT0ZGU0VUX0NPTik7DQorCQl3cml0ZWwoSTJDX0RNQV9DTFJfRkxBRyB8IGRtYV9zeW5j
LCBpMmMtPnBkbWFiYXNlICsgT0ZGU0VUX0NPTik7DQogDQogCQlkbWFfd3JfYnVmID0gaTJjX2dl
dF9kbWFfc2FmZV9tc2dfYnVmKG1zZ3MsIDEpOw0KIAkJaWYgKCFkbWFfd3JfYnVmKQ0KLS0gDQox
LjkuMQ0K

