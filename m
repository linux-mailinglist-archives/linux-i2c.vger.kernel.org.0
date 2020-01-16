Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71DDC13D258
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 03:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgAPC4m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 21:56:42 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:56859 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728901AbgAPC4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 21:56:42 -0500
X-UUID: 126ce06ae2334d8bbdb17346fed09442-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LtjPNUgsXNGW2XU98MsD/otonEB6WtDiyz4/NVSxDTI=;
        b=ovFVlxwCPFkO0/32sCWG1QgOn0QOHvis/UneWiTsXtQP+AJjQOCCGEacv6t36LY4ge7RdjWHjUuiqWIR1nPfmvasr9SsKA+6WsIKkmAKchBaEEV3C6bYvJCtBG1QGRBpGd+rPvpsAAoCpRBfQkXK9AI6miDL6GfFPx3HbexHCK4=;
X-UUID: 126ce06ae2334d8bbdb17346fed09442-20200116
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 705813892; Thu, 16 Jan 2020 10:56:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 10:56:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 10:57:26 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v10 3/4] misc: eeprom: at24: support pm_runtime control
Date:   Thu, 16 Jan 2020 10:56:36 +0800
Message-ID: <20200116025637.3524-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
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
L2F0MjQuYw0KaW5kZXggMDY4MWQ1ZmRkNTM4Li4yZmUxYjVlMGUwMzQgMTAwNjQ0DQotLS0gYS9k
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
Y2NfcmVnKTsNCiAJCXJldHVybiAtRU5PREVWOw0KIAl9DQogDQpAQCAtNzI4LDE1ICs3NDEsNDIg
QEAgc3RhdGljIGludCBhdDI0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQogDQog
c3RhdGljIGludCBhdDI0X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KIHsNCisJ
c3RydWN0IGF0MjRfZGF0YSAqYXQyNCA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KKw0K
IAlwbV9ydW50aW1lX2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsNCisJaWYgKCFwbV9ydW50aW1lX3N0
YXR1c19zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KSkNCisJCXJlZ3VsYXRvcl9kaXNhYmxlKGF0MjQt
PnZjY19yZWcpOw0KIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KTsNCiAN
CiAJcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgYXQyNF9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQg
PSB0b19pMmNfY2xpZW50KGRldik7DQorCXN0cnVjdCBhdDI0X2RhdGEgKmF0MjQgPSBpMmNfZ2V0
X2NsaWVudGRhdGEoY2xpZW50KTsNCisNCisJcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKGF0MjQt
PnZjY19yZWcpOw0KK30NCisNCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGF0MjRfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0
b19pMmNfY2xpZW50KGRldik7DQorCXN0cnVjdCBhdDI0X2RhdGEgKmF0MjQgPSBpMmNfZ2V0X2Ns
aWVudGRhdGEoY2xpZW50KTsNCisNCisJcmV0dXJuIHJlZ3VsYXRvcl9lbmFibGUoYXQyNC0+dmNj
X3JlZyk7DQorfQ0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBhdDI0X3BtX29w
cyA9IHsNCisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVudGltZV9mb3JjZV9zdXNwZW5k
LA0KKwkJCQlwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZSkNCisJU0VUX1JVTlRJTUVfUE1fT1BTKGF0
MjRfc3VzcGVuZCwgYXQyNF9yZXN1bWUsIE5VTEwpDQorfTsNCisNCiBzdGF0aWMgc3RydWN0IGky
Y19kcml2ZXIgYXQyNF9kcml2ZXIgPSB7DQogCS5kcml2ZXIgPSB7DQogCQkubmFtZSA9ICJhdDI0
IiwNCisJCS5wbSA9ICZhdDI0X3BtX29wcywNCiAJCS5vZl9tYXRjaF90YWJsZSA9IGF0MjRfb2Zf
bWF0Y2gsDQogCQkuYWNwaV9tYXRjaF90YWJsZSA9IEFDUElfUFRSKGF0MjRfYWNwaV9pZHMpLA0K
IAl9LA0KLS0gDQoyLjE4LjANCg==

