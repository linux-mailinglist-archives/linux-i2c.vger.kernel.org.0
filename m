Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4CC11FF5F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfLPIE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:04:58 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:44218 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726783AbfLPIE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:04:57 -0500
X-UUID: 066aca06bdff4d21bbc8a06e890cc7f2-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=77VbVuR/4GKH/NIE43ZNXEdDPN9zvEbCfzRGXHwyi9s=;
        b=II1ecyDO2TBe7ieN0X0vwTURJzqggDYMhYBlB79SuM7pfIRIseXAkVsjR2jxIOMoW9Ibelx+Cu1RC1ylDxTTNOAspkBuugDW6XvrvL/5QEMX3y4IJDGS/XJn0jv5a81LBfHaUPMiGLF6XqfJyeyzB+HgTpIwP5pYfKNW5RRO2Wk=;
X-UUID: 066aca06bdff4d21bbc8a06e890cc7f2-20191216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 709417858; Mon, 16 Dec 2019 16:04:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 16:04:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 16:04:28 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v9 3/4] misc: eeprom: at24: support pm_runtime control
Date:   Mon, 16 Dec 2019 16:04:44 +0800
Message-ID: <20191216080445.8747-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
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
IGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMgYi9kcml2ZXJzL21pc2MvZWVwcm9t
L2F0MjQuYw0KaW5kZXggMDY4MWQ1ZmRkNTM4Li42YmEyM2E3ZTRkYTEgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYw0KKysrIGIvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0
LmMNCkBAIC0yMiw2ICsyMiw3IEBADQogI2luY2x1ZGUgPGxpbnV4L252bWVtLXByb3ZpZGVyLmg+
DQogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KICNpbmNsdWRlIDxs
aW51eC9ncGlvL2NvbnN1bWVyLmg+DQogDQogLyogQWRkcmVzcyBwb2ludGVyIGlzIDE2IGJpdC4g
Ki8NCkBAIC05MSw2ICs5Miw3IEBAIHN0cnVjdCBhdDI0X2RhdGEgew0KIA0KIAlzdHJ1Y3QgZ3Bp
b19kZXNjICp3cF9ncGlvOw0KIA0KKwlzdHJ1Y3QgcmVndWxhdG9yICp2Y2NfcmVnOw0KIAkvKg0K
IAkgKiBTb21lIGNoaXBzIHRpZSB1cCBtdWx0aXBsZSBJMkMgYWRkcmVzc2VzOyBkdW1teSBkZXZp
Y2VzIHJlc2VydmUNCiAJICogdGhlbSBmb3IgdXMsIGFuZCB3ZSdsbCB1c2UgdGhlbSB3aXRoIFNN
QnVzIGNhbGxzLg0KQEAgLTY2Miw2ICs2NjQsMTAgQEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQogCWF0MjQtPmNsaWVudFswXS5jbGllbnQgPSBjbGll
bnQ7DQogCWF0MjQtPmNsaWVudFswXS5yZWdtYXAgPSByZWdtYXA7DQogDQorCWF0MjQtPnZjY19y
ZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjIik7DQorCWlmIChJU19FUlIoYXQyNC0+
dmNjX3JlZykpDQorCQlyZXR1cm4gUFRSX0VSUihhdDI0LT52Y2NfcmVnKTsNCisNCiAJYXQyNC0+
d3BfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgIndwIiwgR1BJT0RfT1VUX0hJ
R0gpOw0KIAlpZiAoSVNfRVJSKGF0MjQtPndwX2dwaW8pKQ0KIAkJcmV0dXJuIFBUUl9FUlIoYXQy
NC0+d3BfZ3Bpbyk7DQpAQCAtNzAxLDYgKzcwNywxMiBAQCBzdGF0aWMgaW50IGF0MjRfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCiANCiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVu
dCwgYXQyNCk7DQogDQorCWVyciA9IHJlZ3VsYXRvcl9lbmFibGUoYXQyNC0+dmNjX3JlZyk7DQor
CWlmIChlcnIpIHsNCisJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSB2Y2MgcmVndWxh
dG9yXG4iKTsNCisJCXJldHVybiBlcnI7DQorCX0NCisNCiAJLyogZW5hYmxlIHJ1bnRpbWUgcG0g
Ki8NCiAJcG1fcnVudGltZV9zZXRfYWN0aXZlKGRldik7DQogCXBtX3J1bnRpbWVfZW5hYmxlKGRl
dik7DQpAQCAtNzEzLDYgKzcyNSw3IEBAIHN0YXRpYyBpbnQgYXQyNF9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50KQ0KIAlwbV9ydW50aW1lX2lkbGUoZGV2KTsNCiAJaWYgKGVycikgew0K
IAkJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQorCQlyZWd1bGF0b3JfZGlzYWJsZShhdDI0LT52
Y2NfcmVnKTsNCiAJCXJldHVybiAtRU5PREVWOw0KIAl9DQogDQpAQCAtNzI5LDE0ICs3NDIsMzkg
QEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQogc3Rh
dGljIGludCBhdDI0X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KIHsNCiAJcG1f
cnVudGltZV9kaXNhYmxlKCZjbGllbnQtPmRldik7DQorCWlmICghcG1fcnVudGltZV9zdGF0dXNf
c3VzcGVuZGVkKCZjbGllbnQtPmRldikpDQorCQlyZWd1bGF0b3JfZGlzYWJsZShhdDI0LT52Y2Nf
cmVnKTsNCiAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKCZjbGllbnQtPmRldik7DQogDQogCXJl
dHVybiAwOw0KIH0NCiANCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGF0MjRfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9f
aTJjX2NsaWVudChkZXYpOw0KKwlzdHJ1Y3QgYXQyNF9kYXRhICphdDI0ID0gaTJjX2dldF9jbGll
bnRkYXRhKGNsaWVudCk7DQorDQorCXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShhdDI0LT52Y2Nf
cmVnKTsNCit9DQorDQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCBhdDI0X3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJj
X2NsaWVudChkZXYpOw0KKwlzdHJ1Y3QgYXQyNF9kYXRhICphdDI0ID0gaTJjX2dldF9jbGllbnRk
YXRhKGNsaWVudCk7DQorDQorCXJldHVybiByZWd1bGF0b3JfZW5hYmxlKGF0MjQtPnZjY19yZWcp
Ow0KK30NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgYXQyNF9wbV9vcHMgPSB7
DQorCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwNCisJ
CQkJcG1fcnVudGltZV9mb3JjZV9yZXN1bWUpDQorCVNFVF9SVU5USU1FX1BNX09QUyhhdDI0X3N1
c3BlbmQsIGF0MjRfcmVzdW1lLCBOVUxMKQ0KK307DQorDQogc3RhdGljIHN0cnVjdCBpMmNfZHJp
dmVyIGF0MjRfZHJpdmVyID0gew0KIAkuZHJpdmVyID0gew0KIAkJLm5hbWUgPSAiYXQyNCIsDQor
CQkucG0gPSAmYXQyNF9wbV9vcHMsDQogCQkub2ZfbWF0Y2hfdGFibGUgPSBhdDI0X29mX21hdGNo
LA0KIAkJLmFjcGlfbWF0Y2hfdGFibGUgPSBBQ1BJX1BUUihhdDI0X2FjcGlfaWRzKSwNCiAJfSwN
Ci0tIA0KMi4xOC4wDQo=

