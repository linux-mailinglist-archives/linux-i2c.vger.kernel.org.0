Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC28211DFAA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 09:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfLMIrA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 03:47:00 -0500
Received: from mailgw02.mediatek.com ([216.200.240.185]:51935 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLMIq7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 03:46:59 -0500
X-UUID: bc384c60e406488fa87ddc5686c575e7-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EbyLLh8fLgxiUJJArCFl+4W6spqur8NIC5o9y+Ad+tg=;
        b=kpTI1o/2uV4vlI07AITFhkqNSNmTXJkK2H6rBlWWhKQDPVrkr3a6slv95yAyFTvqS8CcNELz0FlqBxTRes2ukca00jMGEW+8qrXtr/dFvGt32I8vN7FokQAbMqW10ViftTPnDxEIdYzkyMmZtULYmoE8F7WsoThDZFChYGQJPc0=;
X-UUID: bc384c60e406488fa87ddc5686c575e7-20191213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1710396386; Fri, 13 Dec 2019 00:46:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:12:15 +0800
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
Subject: [PATCH v8 3/4] misc: eeprom: at24: support pm_runtime control
Date:   Fri, 13 Dec 2019 16:12:29 +0800
Message-ID: <20191213081230.23494-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tIGFyZSBh
bHdheQ0Kb24sIHNvbWUgcGxhdGZvcm1zIGRpc2FibGUgdGhlIGVlcHJvbSBwb3dlciBpbiBvcmRl
ciB0byBtZWV0DQpsb3cgcG93ZXIgcmVxdWVzdC4gVGhpcyBwYXRjaCBhZGQgdGhlIHBtX3J1bnRp
bWUgb3BzIHRvIGNvbnRyb2wNCnBvd2VyIHRvIHN1cHBvcnQgYWxsIHBsYXRmb3Jtcy4NCg0KU2ln
bmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMgYi9kcml2ZXJzL21pc2MvZWVwcm9t
L2F0MjQuYw0KaW5kZXggMDY4MWQ1ZmRkNTM4Li4wNmFlMmNjMzJmNzkgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYw0KKysrIGIvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0
LmMNCkBAIC0yMiw2ICsyMiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+
DQogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KICNpbmNsdWRlIDxs
aW51eC9ncGlvL2NvbnN1bWVyLmg+DQogDQogLyogQWRkcmVzcyBwb2ludGVyIGlzIDE2IGJpdC4g
Ki8NCkBAIC05MSw2ICs5Miw3IEBAIHN0cnVjdCBhdDI0X2RhdGEgew0KIA0KIAlzdHJ1Y3QgZ3Bp
b19kZXNjICp3cF9ncGlvOw0KIA0KKwlzdHJ1Y3QgcmVndWxhdG9yICp2Y2NfcmVnOw0KIAkvKg0K
IAkgKiBTb21lIGNoaXBzIHRpZSB1cCBtdWx0aXBsZSBJMkMgYWRkcmVzc2VzOyBkdW1teSBkZXZp
Y2VzIHJlc2VydmUNCiAJICogdGhlbSBmb3IgdXMsIGFuZCB3ZSdsbCB1c2UgdGhlbSB3aXRoIFNN
QnVzIGNhbGxzLg0KQEAgLTY2Miw2ICs2NjQsMTIgQEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQogCWF0MjQtPmNsaWVudFswXS5jbGllbnQgPSBjbGll
bnQ7DQogCWF0MjQtPmNsaWVudFswXS5yZWdtYXAgPSByZWdtYXA7DQogDQorCWF0MjQtPnZjY19y
ZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjIik7DQorCWlmIChJU19FUlIoYXQyNC0+
dmNjX3JlZykpIHsNCisJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBhdDI0IFZDQyByZWd1
bGF0b3JcbiIpOw0KKwkJcmV0dXJuIFBUUl9FUlIoYXQyNC0+dmNjX3JlZyk7DQorCX0NCisNCiAJ
YXQyNC0+d3BfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgIndwIiwgR1BJT0Rf
T1VUX0hJR0gpOw0KIAlpZiAoSVNfRVJSKGF0MjQtPndwX2dwaW8pKQ0KIAkJcmV0dXJuIFBUUl9F
UlIoYXQyNC0+d3BfZ3Bpbyk7DQpAQCAtNzAxLDYgKzcwOSwxMiBAQCBzdGF0aWMgaW50IGF0MjRf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCiANCiAJaTJjX3NldF9jbGllbnRkYXRh
KGNsaWVudCwgYXQyNCk7DQogDQorCWVyciA9IHJlZ3VsYXRvcl9lbmFibGUoYXQyNC0+dmNjX3Jl
Zyk7DQorCWlmIChlcnIpIHsNCisJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBhdDI0
IHZjYyByZWd1bGF0b3JcbiIpOw0KKwkJcmV0dXJuIGVycjsNCisJfQ0KKw0KIAkvKiBlbmFibGUg
cnVudGltZSBwbSAqLw0KIAlwbV9ydW50aW1lX3NldF9hY3RpdmUoZGV2KTsNCiAJcG1fcnVudGlt
ZV9lbmFibGUoZGV2KTsNCkBAIC03MTMsNiArNzI3LDcgQEAgc3RhdGljIGludCBhdDI0X3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQogCXBtX3J1bnRpbWVfaWRsZShkZXYpOw0KIAlp
ZiAoZXJyKSB7DQogCQlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCisJCXJlZ3VsYXRvcl9kaXNh
YmxlKGF0MjQtPnZjY19yZWcpOw0KIAkJcmV0dXJuIC1FTk9ERVY7DQogCX0NCiANCkBAIC03Mjks
MTQgKzc0NCwzOSBAQCBzdGF0aWMgaW50IGF0MjRfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCkNCiBzdGF0aWMgaW50IGF0MjRfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
DQogew0KIAlwbV9ydW50aW1lX2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsNCisJaWYgKHBtX3J1bnRp
bWVfc3RhdHVzX3N1c3BlbmRlZCgmY2xpZW50LT5kZXYpKQ0KKwkJcmVndWxhdG9yX2Rpc2FibGUo
YXQyNC0+dmNjX3JlZyk7DQogCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmY2xpZW50LT5kZXYp
Ow0KIA0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCBhdDI0
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KK3sNCisJc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsNCisJc3RydWN0IGF0MjRfZGF0YSAqYXQyNCA9IGky
Y19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KKw0KKwlyZXR1cm4gcmVndWxhdG9yX2Rpc2FibGUo
YXQyNC0+dmNjX3JlZyk7DQorfQ0KKw0KK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgYXQyNF9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KK3sNCisJc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCA9IHRvX2kyY19jbGllbnQoZGV2KTsNCisJc3RydWN0IGF0MjRfZGF0YSAqYXQyNCA9IGkyY19n
ZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KKw0KKwlyZXR1cm4gcmVndWxhdG9yX2VuYWJsZShhdDI0
LT52Y2NfcmVnKTsNCit9DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGF0MjRf
cG1fb3BzID0gew0KKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1
c3BlbmQsDQorCQkJCXBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKQ0KKwlTRVRfUlVOVElNRV9QTV9P
UFMoYXQyNF9zdXNwZW5kLCBhdDI0X3Jlc3VtZSwgTlVMTCkNCit9Ow0KKw0KIHN0YXRpYyBzdHJ1
Y3QgaTJjX2RyaXZlciBhdDI0X2RyaXZlciA9IHsNCiAJLmRyaXZlciA9IHsNCiAJCS5uYW1lID0g
ImF0MjQiLA0KKwkJLnBtID0gJmF0MjRfcG1fb3BzLA0KIAkJLm9mX21hdGNoX3RhYmxlID0gYXQy
NF9vZl9tYXRjaCwNCiAJCS5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIoYXQyNF9hY3BpX2lk
cyksDQogCX0sDQotLSANCjIuMTguMA0K

