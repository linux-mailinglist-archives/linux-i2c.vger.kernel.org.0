Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9B01D9103
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 09:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgESH1g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 03:27:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39888 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728421AbgESH1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 03:27:36 -0400
X-UUID: 7676be5f02a7499aa95617916337fd01-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cUh1Pv84qKy3XQqc17KV0JLmqFgQOqKRPIBYy6sM6rk=;
        b=hvg5VwlFP5ZslPkfP3uoU5s2INzcgVGFVA4deWevIkrJtwt3IpcWhZKHYHcJVC6hOv5nRaAuOxLw5CaUSx0AnIYNXTyTocXoxbWWiP2uSRkTXGW/2nb0j/3p2Ff7m0mzQc4GGr6b62LL65KGWPjLS0Nl2REQWcl7qK+RvPV/Lb8=;
X-UUID: 7676be5f02a7499aa95617916337fd01-20200519
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 455001586; Tue, 19 May 2020 15:27:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 15:27:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 15:27:30 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v15 2/2] i2c: core: support bus regulator controlling in adapter
Date:   Tue, 19 May 2020 15:27:29 +0800
Message-ID: <20200519072729.7268-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgYnVzIHBvd2VyIG9mIGkyYw0KYXJl
IGFsd2F5IG9uLCBzb21lIHBsYXRmb3JtcyBkaXNhYmxlIHRoZSBpMmMgYnVzIHBvd2VyDQppbiBv
cmRlciB0byBtZWV0IGxvdyBwb3dlciByZXF1ZXN0Lg0KDQpXZSBnZXQgYW5kIGVuYWJsZSBidWxr
IHJlZ3VsYXRvciBpbiBpMmMgYWRhcHRlciBkZXZpY2UuDQoNClNpZ25lZC1vZmYtYnk6IEJpYmJ5
IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL2kyYy9pMmMt
Y29yZS1iYXNlLmMgfCA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQog
aW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgIHwgIDIgKw0KIDIgZmlsZXMgY2hhbmdlZCwgODYg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5j
IGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQppbmRleCA1Y2MwYjBlYzU1NzAuLmUxY2M4
ZDQ2YmM1MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KKysrIGIv
ZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQpAQCAtMzEzLDEyICszMTMsMTQgQEAgc3RhdGlj
IGludCBpMmNfc21idXNfaG9zdF9ub3RpZnlfdG9faXJxKGNvbnN0IHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpDQogc3RhdGljIGludCBpMmNfZGV2aWNlX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRl
dikNCiB7DQogCXN0cnVjdCBpMmNfY2xpZW50CSpjbGllbnQgPSBpMmNfdmVyaWZ5X2NsaWVudChk
ZXYpOw0KKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmFkYXA7DQogCXN0cnVjdCBpMmNfZHJpdmVyCSpk
cml2ZXI7DQogCWludCBzdGF0dXM7DQogDQogCWlmICghY2xpZW50KQ0KIAkJcmV0dXJuIDA7DQog
DQorCWFkYXAgPSBjbGllbnQtPmFkYXB0ZXI7DQogCWRyaXZlciA9IHRvX2kyY19kcml2ZXIoZGV2
LT5kcml2ZXIpOw0KIA0KIAljbGllbnQtPmlycSA9IGNsaWVudC0+aW5pdF9pcnE7DQpAQCAtMzc4
LDYgKzM4MCwxMiBAQCBzdGF0aWMgaW50IGkyY19kZXZpY2VfcHJvYmUoc3RydWN0IGRldmljZSAq
ZGV2KQ0KIA0KIAlkZXZfZGJnKGRldiwgInByb2JlXG4iKTsNCiANCisJc3RhdHVzID0gcmVndWxh
dG9yX2VuYWJsZShhZGFwLT5idXNfcmVndWxhdG9yKTsNCisJaWYgKHN0YXR1cyA8IDApIHsNCisJ
CWRldl9lcnIoJmFkYXAtPmRldiwgIkZhaWxlZCB0byBlbmFibGUgcG93ZXIgcmVndWxhdG9yXG4i
KTsNCisJCWdvdG8gZXJyX2NsZWFyX3dha2V1cF9pcnE7DQorCX0NCisNCiAJc3RhdHVzID0gb2Zf
Y2xrX3NldF9kZWZhdWx0cyhkZXYtPm9mX25vZGUsIGZhbHNlKTsNCiAJaWYgKHN0YXR1cyA8IDAp
DQogCQlnb3RvIGVycl9jbGVhcl93YWtldXBfaXJxOw0KQEAgLTQxNCwxMiArNDIyLDE0IEBAIHN0
YXRpYyBpbnQgaTJjX2RldmljZV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogc3RhdGljIGlu
dCBpMmNfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3QgaTJj
X2NsaWVudAkqY2xpZW50ID0gaTJjX3ZlcmlmeV9jbGllbnQoZGV2KTsNCisJc3RydWN0IGkyY19h
ZGFwdGVyICAgICAgKmFkYXA7DQogCXN0cnVjdCBpMmNfZHJpdmVyCSpkcml2ZXI7DQogCWludCBz
dGF0dXMgPSAwOw0KIA0KIAlpZiAoIWNsaWVudCB8fCAhZGV2LT5kcml2ZXIpDQogCQlyZXR1cm4g
MDsNCiANCisJYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCiAJZHJpdmVyID0gdG9faTJjX2RyaXZl
cihkZXYtPmRyaXZlcik7DQogCWlmIChkcml2ZXItPnJlbW92ZSkgew0KIAkJZGV2X2RiZyhkZXYs
ICJyZW1vdmVcbiIpOw0KQEAgLTQyNyw2ICs0MzcsOCBAQCBzdGF0aWMgaW50IGkyY19kZXZpY2Vf
cmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJfQ0KIA0KIAlkZXZfcG1fZG9tYWluX2RldGFj
aCgmY2xpZW50LT5kZXYsIHRydWUpOw0KKwlpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRl
ZCgmY2xpZW50LT5kZXYpKQ0KKwkJcmVndWxhdG9yX2Rpc2FibGUoYWRhcC0+YnVzX3JlZ3VsYXRv
cik7DQogDQogCWRldl9wbV9jbGVhcl93YWtlX2lycSgmY2xpZW50LT5kZXYpOw0KIAlkZXZpY2Vf
aW5pdF93YWtldXAoJmNsaWVudC0+ZGV2LCBmYWxzZSk7DQpAQCAtNDM4LDYgKzQ1MCw3MiBAQCBz
dGF0aWMgaW50IGkyY19kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJcmV0dXJu
IHN0YXR1czsNCiB9DQogDQorI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KK3N0YXRpYyBpbnQgaTJj
X3Jlc3VtZV9lYXJseShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50ID0gaTJjX3ZlcmlmeV9jbGllbnQoZGV2KTsNCisJc3RydWN0IGkyY19hZGFwdGVy
ICphZGFwID0gY2xpZW50LT5hZGFwdGVyOw0KKwlpbnQgZXJyOw0KKw0KKwlpZiAoIXBtX3J1bnRp
bWVfc3RhdHVzX3N1c3BlbmRlZCgmY2xpZW50LT5kZXYpKSB7DQorCQllcnIgPSByZWd1bGF0b3Jf
ZW5hYmxlKGFkYXAtPmJ1c19yZWd1bGF0b3IpOw0KKwkJaWYgKGVycikNCisJCQlyZXR1cm4gZXJy
Ow0KKwl9DQorDQorCXJldHVybiBwbV9nZW5lcmljX3Jlc3VtZV9lYXJseSgmY2xpZW50LT5kZXYp
Ow0KK30NCisNCitzdGF0aWMgaW50IGkyY19zdXNwZW5kX2xhdGUoc3RydWN0IGRldmljZSAqZGV2
KQ0KK3sNCisJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IGkyY192ZXJpZnlfY2xpZW50KGRl
dik7DQorCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsNCisJaW50
IGVycjsNCisNCisJZXJyID0gcG1fZ2VuZXJpY19zdXNwZW5kX2xhdGUoJmNsaWVudC0+ZGV2KTsN
CisJaWYgKGVycikNCisJCXJldHVybiBlcnI7DQorDQorCWlmICghcG1fcnVudGltZV9zdGF0dXNf
c3VzcGVuZGVkKCZjbGllbnQtPmRldikpDQorCQlyZXR1cm4gcmVndWxhdG9yX2Rpc2FibGUoYWRh
cC0+YnVzX3JlZ3VsYXRvcik7DQorDQorCXJldHVybiAwOw0KK30NCisjZW5kaWYNCisNCisjaWZk
ZWYgQ09ORklHX1BNDQorc3RhdGljIGludCBpMmNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KK3sNCisJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IGkyY192ZXJpZnlfY2xp
ZW50KGRldik7DQorCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+YWRhcHRlcjsN
CisJaW50IGVycjsNCisNCisJZXJyID0gcmVndWxhdG9yX2VuYWJsZShhZGFwLT5idXNfcmVndWxh
dG9yKTsNCisJaWYgKGVycikNCisJCXJldHVybiBlcnI7DQorDQorCXJldHVybiBwbV9nZW5lcmlj
X3J1bnRpbWVfcmVzdW1lKCZjbGllbnQtPmRldik7DQorfQ0KKw0KK3N0YXRpYyBpbnQgaTJjX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50ID0gaTJjX3ZlcmlmeV9jbGllbnQoZGV2KTsNCisJc3RydWN0IGkyY19hZGFwdGVy
ICphZGFwID0gY2xpZW50LT5hZGFwdGVyOw0KKwlpbnQgZXJyOw0KKw0KKwllcnIgPSBwbV9nZW5l
cmljX3J1bnRpbWVfc3VzcGVuZCgmY2xpZW50LT5kZXYpOw0KKwlpZiAoZXJyKQ0KKwkJcmV0dXJu
IGVycjsNCisNCisJcmV0dXJuIHJlZ3VsYXRvcl9kaXNhYmxlKGFkYXAtPmJ1c19yZWd1bGF0b3Ip
Ow0KK30NCisjZW5kaWYNCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaTJjX2Rl
dmljZV9wbSA9IHsNCisJU0VUX0xBVEVfU1lTVEVNX1NMRUVQX1BNX09QUyhpMmNfc3VzcGVuZF9s
YXRlLCBpMmNfcmVzdW1lX2Vhcmx5KQ0KKwlTRVRfUlVOVElNRV9QTV9PUFMoaTJjX3J1bnRpbWVf
c3VzcGVuZCwgaTJjX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQ0KK307DQorDQogc3RhdGljIHZvaWQg
aTJjX2RldmljZV9zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50ID0gaTJjX3ZlcmlmeV9jbGllbnQoZGV2KTsNCkBAIC00OTUsNiArNTcz
LDcgQEAgc3RydWN0IGJ1c190eXBlIGkyY19idXNfdHlwZSA9IHsNCiAJLnByb2JlCQk9IGkyY19k
ZXZpY2VfcHJvYmUsDQogCS5yZW1vdmUJCT0gaTJjX2RldmljZV9yZW1vdmUsDQogCS5zaHV0ZG93
bgk9IGkyY19kZXZpY2Vfc2h1dGRvd24sDQorCS5wbQkJPSAmaTJjX2RldmljZV9wbSwNCiB9Ow0K
IEVYUE9SVF9TWU1CT0xfR1BMKGkyY19idXNfdHlwZSk7DQogDQpAQCAtMTMzMyw2ICsxNDEyLDEx
IEBAIHN0YXRpYyBpbnQgaTJjX3JlZ2lzdGVyX2FkYXB0ZXIoc3RydWN0IGkyY19hZGFwdGVyICph
ZGFwKQ0KIAlpZiAocmVzKQ0KIAkJZ290byBvdXRfcmVnOw0KIA0KKwlhZGFwLT5idXNfcmVndWxh
dG9yID0gZGV2bV9yZWd1bGF0b3JfZ2V0KCZhZGFwLT5kZXYsICJidXMiKTsNCisJaWYgKElTX0VS
UihhZGFwLT5idXNfcmVndWxhdG9yKSkgew0KKwkJcmVzID0gUFRSX0VSUihhZGFwLT5idXNfcmVn
dWxhdG9yKTsNCisJCWdvdG8gb3V0X3JlZzsNCisJfQ0KIAlkZXZfZGJnKCZhZGFwLT5kZXYsICJh
ZGFwdGVyIFslc10gcmVnaXN0ZXJlZFxuIiwgYWRhcC0+bmFtZSk7DQogDQogCXBtX3J1bnRpbWVf
bm9fY2FsbGJhY2tzKCZhZGFwLT5kZXYpOw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaTJj
LmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oDQppbmRleCA0NTZmYzE3ZWNiMWMuLmJjODNhZjBkMzhk
MSAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgNCisrKyBiL2luY2x1ZGUvbGludXgv
aTJjLmgNCkBAIC0xNSw2ICsxNSw3IEBADQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgkvKiBm
b3Igc3RydWN0IGRldmljZSAqLw0KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgkvKiBmb3IgY29t
cGxldGlvbiAqLw0KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9y
ZWd1bGF0b3IvY29uc3VtZXIuaD4NCiAjaW5jbHVkZSA8bGludXgvcnRtdXRleC5oPg0KICNpbmNs
dWRlIDxsaW51eC9pcnFkb21haW4uaD4JCS8qIGZvciBIb3N0IE5vdGlmeSBJUlEgKi8NCiAjaW5j
bHVkZSA8bGludXgvb2YuaD4JCS8qIGZvciBzdHJ1Y3QgZGV2aWNlX25vZGUgKi8NCkBAIC03MjEs
NiArNzIyLDcgQEAgc3RydWN0IGkyY19hZGFwdGVyIHsNCiAJY29uc3Qgc3RydWN0IGkyY19hZGFw
dGVyX3F1aXJrcyAqcXVpcmtzOw0KIA0KIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqaG9zdF9ub3RpZnlf
ZG9tYWluOw0KKwlzdHJ1Y3QgcmVndWxhdG9yICpidXNfcmVndWxhdG9yOw0KIH07DQogI2RlZmlu
ZSB0b19pMmNfYWRhcHRlcihkKSBjb250YWluZXJfb2YoZCwgc3RydWN0IGkyY19hZGFwdGVyLCBk
ZXYpDQogDQotLSANCjIuMTguMA0K

