Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527A4193E57
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 12:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgCZLyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 07:54:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:34383 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728119AbgCZLyo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 07:54:44 -0400
X-UUID: d2b4618c332e4d5dbaed9ffeea95d2b0-20200326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s12A0zWwSPFwWWL3hA7SUCBHPhMCTxane52Og4gdNx4=;
        b=DZV5q6701Z5tlZBX3aIj+NwrmPHB3/d4OOfg12lYyy7rGvgjI6u7+58RqVZaQnNq1s2Ev3SuKQCHbaab0RTLbuWeXZdXhp6z3qoaxg6TbE12S7reZaAkiZ9tUEnVCgNrBoVQQx8VMZEGHGm0/wleMnxEvWMpM1VjlBX8nNoFzZ4=;
X-UUID: d2b4618c332e4d5dbaed9ffeea95d2b0-20200326
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1929011097; Thu, 26 Mar 2020 19:54:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 19:54:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Mar 2020 19:54:33 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
Date:   Thu, 26 Mar 2020 19:54:36 +0800
Message-ID: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRjaCBhZGRz
IGEgYWxnb3JpdGhtIHRvIGNhbGN1bGF0ZSBzb21lIGFjLXRpbWluZyBwYXJhbWV0ZXJzDQp3aGlj
aCBjYW4gZnVsbHkgbWVldCBJMkMgU3BlYy4NCg0KU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFp
aS53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4
LmMgfCAzMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAyODEgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDY1eHguYw0KaW5kZXggMjE1MmVjNWYuLjRkYTlhYWMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQpAQCAtNDAsMTIgKzQwLDExIEBADQogI2RlZmluZSBJMkNfU09GVF9SU1QJCQkw
eDAwMDENCiAjZGVmaW5lIEkyQ19GSUZPX0FERFJfQ0xSCQkweDAwMDENCiAjZGVmaW5lIEkyQ19E
RUxBWV9MRU4JCQkweDAwMDINCi0jZGVmaW5lIEkyQ19TVF9TVEFSVF9DT04JCTB4ODAwMQ0KLSNk
ZWZpbmUgSTJDX0ZTX1NUQVJUX0NPTgkJMHgxODAwDQogI2RlZmluZSBJMkNfVElNRV9DTFJfVkFM
VUUJCTB4MDAwMA0KICNkZWZpbmUgSTJDX1RJTUVfREVGQVVMVF9WQUxVRQkJMHgwMDAzDQogI2Rl
ZmluZSBJMkNfV1JSRF9UUkFOQUNfVkFMVUUJCTB4MDAwMg0KICNkZWZpbmUgSTJDX1JEX1RSQU5B
Q19WQUxVRQkJMHgwMDAxDQorI2RlZmluZSBJMkNfU0NMX01JU19DT01QX1ZBTFVFCQkweDAwMDAN
CiANCiAjZGVmaW5lIEkyQ19ETUFfQ09OX1RYCQkJMHgwMDAwDQogI2RlZmluZSBJMkNfRE1BX0NP
Tl9SWAkJCTB4MDAwMQ0KQEAgLTU1LDEzICs1NCwxNiBAQA0KICNkZWZpbmUgSTJDX0RNQV9IQVJE
X1JTVAkJMHgwMDAyDQogI2RlZmluZSBJMkNfRE1BXzRHX01PREUJCQkweDAwMDENCiANCi0jZGVm
aW5lIEkyQ19ERUZBVUxUX0NMS19ESVYJCTUNCiAjZGVmaW5lIEkyQ19ERUZBVUxUX1NQRUVECQkx
MDAwMDAJLyogaHogKi8NCiAjZGVmaW5lIE1BWF9GU19NT0RFX1NQRUVECQk0MDAwMDANCiAjZGVm
aW5lIE1BWF9IU19NT0RFX1NQRUVECQkzNDAwMDAwDQogI2RlZmluZSBNQVhfU0FNUExFX0NOVF9E
SVYJCTgNCiAjZGVmaW5lIE1BWF9TVEVQX0NOVF9ESVYJCTY0DQorI2RlZmluZSBNQVhfQ0xPQ0tf
RElWCQkJMjU2DQogI2RlZmluZSBNQVhfSFNfU1RFUF9DTlRfRElWCQk4DQorI2RlZmluZSBJMkNf
U1RBTkRBUkRfTU9ERV9CVUZGRVIJKDEwMDAgLyAyKQ0KKyNkZWZpbmUgSTJDX0ZBU1RfTU9ERV9C
VUZGRVIJCSgzMDAgLyAyKQ0KKyNkZWZpbmUgSTJDX0ZBU1RfTU9ERV9QTFVTX0JVRkZFUgkoMjAg
LyAyKQ0KIA0KICNkZWZpbmUgSTJDX0NPTlRST0xfUlMgICAgICAgICAgICAgICAgICAoMHgxIDw8
IDEpDQogI2RlZmluZSBJMkNfQ09OVFJPTF9ETUFfRU4gICAgICAgICAgICAgICgweDEgPDwgMikN
CkBAIC0xMjYsNiArMTI4LDEyIEBAIGVudW0gSTJDX1JFR1NfT0ZGU0VUIHsNCiAJT0ZGU0VUX1RS
QU5TRkVSX0xFTl9BVVgsDQogCU9GRlNFVF9DTE9DS19ESVYsDQogCU9GRlNFVF9MVElNSU5HLA0K
KwlPRkZTRVRfU0NMX0hJR0hfTE9XX1JBVElPLA0KKwlPRkZTRVRfSFNfU0NMX0hJR0hfTE9XX1JB
VElPLA0KKwlPRkZTRVRfU0NMX01JU19DT01QX1BPSU5ULA0KKwlPRkZTRVRfU1RBX1NUT19BQ19U
SU1JTkcsDQorCU9GRlNFVF9IU19TVEFfU1RPX0FDX1RJTUlORywNCisJT0ZGU0VUX1NEQV9USU1J
TkcsDQogfTsNCiANCiBzdGF0aWMgY29uc3QgdTE2IG10X2kyY19yZWdzX3YxW10gPSB7DQpAQCAt
MTUzLDYgKzE2MSwxMiBAQCBlbnVtIEkyQ19SRUdTX09GRlNFVCB7DQogCVtPRkZTRVRfREVCVUdD
VFJMXSA9IDB4NjgsDQogCVtPRkZTRVRfVFJBTlNGRVJfTEVOX0FVWF0gPSAweDZjLA0KIAlbT0ZG
U0VUX0NMT0NLX0RJVl0gPSAweDcwLA0KKwlbT0ZGU0VUX1NDTF9ISUdIX0xPV19SQVRJT10gPSAw
eDc0LA0KKwlbT0ZGU0VUX0hTX1NDTF9ISUdIX0xPV19SQVRJT10gPSAweDc4LA0KKwlbT0ZGU0VU
X1NDTF9NSVNfQ09NUF9QT0lOVF0gPSAweDdDLA0KKwlbT0ZGU0VUX1NUQV9TVE9fQUNfVElNSU5H
XSA9IDB4ODAsDQorCVtPRkZTRVRfSFNfU1RBX1NUT19BQ19USU1JTkddID0gMHg4NCwNCisJW09G
RlNFVF9TREFfVElNSU5HXSA9IDB4ODgsDQogfTsNCiANCiBzdGF0aWMgY29uc3QgdTE2IG10X2ky
Y19yZWdzX3YyW10gPSB7DQpAQCAtMTcxLDkgKzE4NSwxMSBAQCBlbnVtIEkyQ19SRUdTX09GRlNF
VCB7DQogCVtPRkZTRVRfSFNdID0gMHgzMCwNCiAJW09GRlNFVF9JT19DT05GSUddID0gMHgzNCwN
CiAJW09GRlNFVF9GSUZPX0FERFJfQ0xSXSA9IDB4MzgsDQorCVtPRkZTRVRfU0RBX1RJTUlOR10g
PSAweDNjLA0KIAlbT0ZGU0VUX1RSQU5TRkVSX0xFTl9BVVhdID0gMHg0NCwNCiAJW09GRlNFVF9D
TE9DS19ESVZdID0gMHg0OCwNCiAJW09GRlNFVF9TT0ZUUkVTRVRdID0gMHg1MCwNCisJW09GRlNF
VF9TQ0xfTUlTX0NPTVBfUE9JTlRdID0gMHg5MCwNCiAJW09GRlNFVF9ERUJVR1NUQVRdID0gMHhl
MCwNCiAJW09GRlNFVF9ERUJVR0NUUkxdID0gMHhlOCwNCiAJW09GRlNFVF9GSUZPX1NUQVRdID0g
MHhmNCwNCkBAIC0xOTQsNiArMjEwLDE5IEBAIHN0cnVjdCBtdGtfaTJjX2NvbXBhdGlibGUgew0K
IAl1bnNpZ25lZCBjaGFyIGx0aW1pbmdfYWRqdXN0OiAxOw0KIH07DQogDQorc3RydWN0IG10a19p
MmNfYWNfdGltaW5nIHsNCisJdTE2IGh0aW1pbmc7DQorCXUxNiBsdGltaW5nOw0KKwl1MTYgaHM7
DQorCXUxNiBleHQ7DQorCXUxNiBpbnRlcl9jbGtfZGl2Ow0KKwl1MTYgc2NsX2hsX3JhdGlvOw0K
Kwl1MTYgaHNfc2NsX2hsX3JhdGlvOw0KKwl1MTYgc3RhX3N0b3A7DQorCXUxNiBoc19zdGFfc3Rv
cDsNCisJdTE2IHNkYV90aW1pbmc7DQorfTsNCisNCiBzdHJ1Y3QgbXRrX2kyYyB7DQogCXN0cnVj
dCBpMmNfYWRhcHRlciBhZGFwOwkvKiBpMmMgaG9zdCBhZGFwdGVyICovDQogCXN0cnVjdCBkZXZp
Y2UgKmRldjsNCkBAIC0yMTgsOSArMjQ3LDQ2IEBAIHN0cnVjdCBtdGtfaTJjIHsNCiAJdTE2IGx0
aW1pbmdfcmVnOw0KIAl1bnNpZ25lZCBjaGFyIGF1dG9fcmVzdGFydDsNCiAJYm9vbCBpZ25vcmVf
cmVzdGFydF9pcnE7DQorCXN0cnVjdCBtdGtfaTJjX2FjX3RpbWluZyBhY190aW1pbmc7DQogCWNv
bnN0IHN0cnVjdCBtdGtfaTJjX2NvbXBhdGlibGUgKmRldl9jb21wOw0KIH07DQogDQorLyoqDQor
ICogc3RydWN0IGkyY19zcGVjX3ZhbHVlczoNCisgKiBtaW5fbG93X25zOiBtaW4gTE9XIHBlcmlv
ZCBvZiB0aGUgU0NMIGNsb2NrDQorICogbWluX3N1X3N0YV9uczogbWluIHNldC11cCB0aW1lIGZv
ciBhIHJlcGVhdGVkIFNUQVJUIGNvbmRpdGlvbg0KKyAqIG1heF9oZF9kYXRfbnM6IG1heCBkYXRh
IGhvbGQgdGltZQ0KKyAqIG1pbl9zdV9kYXRfbnM6IG1pbiBkYXRhIHNldC11cCB0aW1lDQorICov
DQorc3RydWN0IGkyY19zcGVjX3ZhbHVlcyB7DQorCXVuc2lnbmVkIGludCBtaW5fbG93X25zOw0K
Kwl1bnNpZ25lZCBpbnQgbWluX2hpZ2hfbnM7DQorCXVuc2lnbmVkIGludCBtaW5fc3Vfc3RhX25z
Ow0KKwl1bnNpZ25lZCBpbnQgbWF4X2hkX2RhdF9uczsNCisJdW5zaWduZWQgaW50IG1pbl9zdV9k
YXRfbnM7DQorfTsNCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyBzdGFu
ZGFyZF9tb2RlX3NwZWMgPSB7DQorCS5taW5fbG93X25zID0gNDcwMCArIEkyQ19TVEFOREFSRF9N
T0RFX0JVRkZFUiwNCisJLm1pbl9zdV9zdGFfbnMgPSA0NzAwICsgSTJDX1NUQU5EQVJEX01PREVf
QlVGRkVSLA0KKwkubWF4X2hkX2RhdF9ucyA9IDM0NTAgLSBJMkNfU1RBTkRBUkRfTU9ERV9CVUZG
RVIsDQorCS5taW5fc3VfZGF0X25zID0gMjUwICsgSTJDX1NUQU5EQVJEX01PREVfQlVGRkVSLA0K
K307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgZmFzdF9tb2RlX3Nw
ZWMgPSB7DQorCS5taW5fbG93X25zID0gMTMwMCArIEkyQ19GQVNUX01PREVfQlVGRkVSLA0KKwku
bWluX3N1X3N0YV9ucyA9IDYwMCArIEkyQ19GQVNUX01PREVfQlVGRkVSLA0KKwkubWF4X2hkX2Rh
dF9ucyA9IDkwMCAtIEkyQ19GQVNUX01PREVfQlVGRkVSLA0KKwkubWluX3N1X2RhdF9ucyA9IDEw
MCArIEkyQ19GQVNUX01PREVfQlVGRkVSLA0KK307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBp
MmNfc3BlY192YWx1ZXMgZmFzdF9tb2RlX3BsdXNfc3BlYyA9IHsNCisJLm1pbl9sb3dfbnMgPSA1
MDAgKyBJMkNfRkFTVF9NT0RFX1BMVVNfQlVGRkVSLA0KKwkubWluX3N1X3N0YV9ucyA9IDI2MCAr
IEkyQ19GQVNUX01PREVfUExVU19CVUZGRVIsDQorCS5tYXhfaGRfZGF0X25zID0gNDAwIC0gSTJD
X0ZBU1RfTU9ERV9QTFVTX0JVRkZFUiwNCisJLm1pbl9zdV9kYXRfbnMgPSA1MCArIEkyQ19GQVNU
X01PREVfUExVU19CVUZGRVIsDQorfTsNCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19hZGFw
dGVyX3F1aXJrcyBtdDY1NzdfaTJjX3F1aXJrcyA9IHsNCiAJLmZsYWdzID0gSTJDX0FRX0NPTUJf
V1JJVEVfVEhFTl9SRUFELA0KIAkubWF4X251bV9tc2dzID0gMSwNCkBAIC00MDAsMTQgKzQ2Niwz
OCBAQCBzdGF0aWMgdm9pZCBtdGtfaTJjX2luaXRfaHcoc3RydWN0IG10a19pMmMgKmkyYykNCiAJ
aWYgKGkyYy0+ZGV2X2NvbXAtPmRjbSkNCiAJCW10a19pMmNfd3JpdGV3KGkyYywgSTJDX0RDTV9E
SVNBQkxFLCBPRkZTRVRfRENNX0VOKTsNCiANCi0JaWYgKGkyYy0+ZGV2X2NvbXAtPnRpbWluZ19h
ZGp1c3QpDQotCQltdGtfaTJjX3dyaXRldyhpMmMsIEkyQ19ERUZBVUxUX0NMS19ESVYgLSAxLCBP
RkZTRVRfQ0xPQ0tfRElWKTsNCi0NCiAJbXRrX2kyY193cml0ZXcoaTJjLCBpMmMtPnRpbWluZ19y
ZWcsIE9GRlNFVF9USU1JTkcpOw0KIAltdGtfaTJjX3dyaXRldyhpMmMsIGkyYy0+aGlnaF9zcGVl
ZF9yZWcsIE9GRlNFVF9IUyk7DQogCWlmIChpMmMtPmRldl9jb21wLT5sdGltaW5nX2FkanVzdCkN
CiAJCW10a19pMmNfd3JpdGV3KGkyYywgaTJjLT5sdGltaW5nX3JlZywgT0ZGU0VUX0xUSU1JTkcp
Ow0KIA0KKwlpZiAoaTJjLT5kZXZfY29tcC0+dGltaW5nX2FkanVzdCkgew0KKwkJbXRrX2kyY193
cml0ZXcoaTJjLCBpMmMtPmFjX3RpbWluZy5leHQsIE9GRlNFVF9FWFRfQ09ORik7DQorCQltdGtf
aTJjX3dyaXRldyhpMmMsIGkyYy0+YWNfdGltaW5nLmludGVyX2Nsa19kaXYsDQorCQkJICAgICAg
IE9GRlNFVF9DTE9DS19ESVYpOw0KKwkJbXRrX2kyY193cml0ZXcoaTJjLCBJMkNfU0NMX01JU19D
T01QX1ZBTFVFLA0KKwkJCSAgICAgICBPRkZTRVRfU0NMX01JU19DT01QX1BPSU5UKTsNCisJCW10
a19pMmNfd3JpdGV3KGkyYywgaTJjLT5hY190aW1pbmcuc2RhX3RpbWluZywNCisJCQkgICAgICAg
T0ZGU0VUX1NEQV9USU1JTkcpOw0KKw0KKwkJaWYgKGkyYy0+ZGV2X2NvbXAtPmx0aW1pbmdfYWRq
dXN0KSB7DQorCQkJbXRrX2kyY193cml0ZXcoaTJjLCBpMmMtPmFjX3RpbWluZy5odGltaW5nLA0K
KwkJCQkgICAgICAgT0ZGU0VUX1RJTUlORyk7DQorCQkJbXRrX2kyY193cml0ZXcoaTJjLCBpMmMt
PmFjX3RpbWluZy5ocywgT0ZGU0VUX0hTKTsNCisJCQltdGtfaTJjX3dyaXRldyhpMmMsIGkyYy0+
YWNfdGltaW5nLmx0aW1pbmcsDQorCQkJCSAgICAgICBPRkZTRVRfTFRJTUlORyk7DQorCQl9IGVs
c2Ugew0KKwkJCW10a19pMmNfd3JpdGV3KGkyYywgaTJjLT5hY190aW1pbmcuc2NsX2hsX3JhdGlv
LA0KKwkJCQkgICAgICAgT0ZGU0VUX1NDTF9ISUdIX0xPV19SQVRJTyk7DQorCQkJbXRrX2kyY193
cml0ZXcoaTJjLCBpMmMtPmFjX3RpbWluZy5oc19zY2xfaGxfcmF0aW8sDQorCQkJCSAgICAgICBP
RkZTRVRfSFNfU0NMX0hJR0hfTE9XX1JBVElPKTsNCisJCQltdGtfaTJjX3dyaXRldyhpMmMsIGky
Yy0+YWNfdGltaW5nLnN0YV9zdG9wLA0KKwkJCQkgICAgICAgT0ZGU0VUX1NUQV9TVE9fQUNfVElN
SU5HKTsNCisJCQltdGtfaTJjX3dyaXRldyhpMmMsIGkyYy0+YWNfdGltaW5nLmhzX3N0YV9zdG9w
LA0KKwkJCQkgICAgICAgT0ZGU0VUX0hTX1NUQV9TVE9fQUNfVElNSU5HKTsNCisJCX0NCisJfQ0K
Kw0KIAkvKiBJZiB1c2UgaTJjIHBpbiBmcm9tIFBNSUMgbXQ2Mzk3IHNpZGUsIG5lZWQgc2V0IFBB
VEhfRElSIGZpcnN0ICovDQogCWlmIChpMmMtPmhhdmVfcG1pYykNCiAJCW10a19pMmNfd3JpdGV3
KGkyYywgSTJDX0NPTlRST0xfV1JBUFBFUiwgT0ZGU0VUX1BBVEhfRElSKTsNCkBAIC00MjUsNiAr
NTE1LDEyOSBAQCBzdGF0aWMgdm9pZCBtdGtfaTJjX2luaXRfaHcoc3RydWN0IG10a19pMmMgKmky
YykNCiAJd3JpdGVsKEkyQ19ETUFfQ0xSX0ZMQUcsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfUlNU
KTsNCiB9DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgKm10a19pMmNf
Z2V0X3NwZWModW5zaWduZWQgaW50IHNwZWVkKQ0KK3sNCisJaWYgKHNwZWVkIDw9IEkyQ19ERUZB
VUxUX1NQRUVEKQ0KKwkJcmV0dXJuICZzdGFuZGFyZF9tb2RlX3NwZWM7DQorCWVsc2UgaWYgKHNw
ZWVkIDw9IE1BWF9GU19NT0RFX1NQRUVEKQ0KKwkJcmV0dXJuICZmYXN0X21vZGVfc3BlYzsNCisJ
ZWxzZQ0KKwkJcmV0dXJuICZmYXN0X21vZGVfcGx1c19zcGVjOw0KK30NCisNCitzdGF0aWMgaW50
IG10a19pMmNfbWF4X3N0ZXBfY250KHVuc2lnbmVkIGludCB0YXJnZXRfc3BlZWQpDQorew0KKwlp
ZiAodGFyZ2V0X3NwZWVkID4gTUFYX0ZTX01PREVfU1BFRUQpDQorCQlyZXR1cm4gTUFYX0hTX1NU
RVBfQ05UX0RJVjsNCisJZWxzZQ0KKwkJcmV0dXJuIE1BWF9TVEVQX0NOVF9ESVY7DQorfQ0KKw0K
Ky8qDQorICogQ2hlY2sgYW5kIENhbGN1bGF0ZSBpMmMgYWMtdGltaW5nDQorICoNCisgKiBIYXJk
d2FyZSBkZXNpZ246DQorICogc2FtcGxlX25zID0gKDEwMDAwMDAwMDAgKiAoc2FtcGxlX2NudCAr
IDEpKSAvIGNsa19zcmMNCisgKiB4eHhfY250X2RpdiA9ICBzcGVjLT5taW5feHh4X25zIC8gc2Ft
cGxlX25zDQorICoNCisgKiBTYW1wbGVfbnMgaXMgcm91bmRlZCBkb3duIGZvciB4eHhfY250X2Rp
diB3b3VsZCBiZSBncmVhdGVyDQorICogdGhhbiB0aGUgc21hbGxlc3Qgc3BlYy4NCisgKiBUaGUg
c2RhX3RpbWluZyBpcyBjaG9zZW4gYXMgdGhlIG1pZGRsZSB2YWx1ZSBiZXR3ZWVuDQorICogdGhl
IGxhcmdlc3QgYW5kIHNtYWxsZXN0Lg0KKyAqLw0KK3N0YXRpYyBpbnQgbXRrX2kyY19jaGVja19h
Y190aW1pbmcoc3RydWN0IG10a19pMmMgKmkyYywNCisJCQkJICAgdW5zaWduZWQgaW50IGNsa19z
cmMsDQorCQkJCSAgIHVuc2lnbmVkIGludCBjaGVja19zcGVlZCwNCisJCQkJICAgdW5zaWduZWQg
aW50IHN0ZXBfY250LA0KKwkJCQkgICB1bnNpZ25lZCBpbnQgc2FtcGxlX2NudCkNCit7DQorCWNv
bnN0IHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgKnNwZWM7DQorCXVuc2lnbmVkIGludCBzdV9zdGFf
Y250LCBsb3dfY250LCBoaWdoX2NudCwgbWF4X3N0ZXBfY250Ow0KKwl1bnNpZ25lZCBpbnQgc2Rh
X21heCwgc2RhX21pbiwgY2xrX25zLCBtYXhfc3RhX2NudCA9IDB4M2Y7DQorCWxvbmcgbG9uZyBz
YW1wbGVfbnMgPSAoMTAwMDAwMDAwMCAqIChzYW1wbGVfY250ICsgMSkpIC8gY2xrX3NyYzsNCisN
CisJaWYgKCFpMmMtPmRldl9jb21wLT50aW1pbmdfYWRqdXN0KQ0KKwkJcmV0dXJuIDA7DQorDQor
CWlmIChpMmMtPmRldl9jb21wLT5sdGltaW5nX2FkanVzdCkNCisJCW1heF9zdGFfY250ID0gMHgx
MDA7DQorDQorCXNwZWMgPSBtdGtfaTJjX2dldF9zcGVjKGNoZWNrX3NwZWVkKTsNCisNCisJaWYg
KGkyYy0+ZGV2X2NvbXAtPmx0aW1pbmdfYWRqdXN0KQ0KKwkJY2xrX25zID0gMTAwMDAwMDAwMCAv
IGNsa19zcmM7DQorCWVsc2UNCisJCWNsa19ucyA9IHNhbXBsZV9ucyAvIDI7DQorDQorCXN1X3N0
YV9jbnQgPSBESVZfUk9VTkRfVVAoc3BlYy0+bWluX3N1X3N0YV9ucywgY2xrX25zKTsNCisJaWYg
KHN1X3N0YV9jbnQgPiBtYXhfc3RhX2NudCkNCisJCXJldHVybiAtMTsNCisNCisJbG93X2NudCA9
IERJVl9ST1VORF9VUChzcGVjLT5taW5fbG93X25zLCBzYW1wbGVfbnMpOw0KKwltYXhfc3RlcF9j
bnQgPSBtdGtfaTJjX21heF9zdGVwX2NudChjaGVja19zcGVlZCk7DQorCWlmICgoMiAqIHN0ZXBf
Y250KSA+IGxvd19jbnQgJiYgbG93X2NudCA8IG1heF9zdGVwX2NudCkgew0KKwkJaWYgKGxvd19j
bnQgPiBzdGVwX2NudCkgew0KKwkJCWhpZ2hfY250ID0gMiAqIHN0ZXBfY250IC0gbG93X2NudDsN
CisJCX0gZWxzZSB7DQorCQkJaGlnaF9jbnQgPSBzdGVwX2NudDsNCisJCQlsb3dfY250ID0gc3Rl
cF9jbnQ7DQorCQl9DQorCX0gZWxzZSB7DQorCQlyZXR1cm4gLTI7DQorCX0NCisNCisJc2RhX21h
eCA9IHNwZWMtPm1heF9oZF9kYXRfbnMgLyBzYW1wbGVfbnM7DQorCWlmIChzZGFfbWF4IDwgbG93
X2NudCkNCisJCXNkYV9tYXggPSBzZGFfbWF4Ow0KKwllbHNlDQorCQlzZGFfbWF4ID0gMDsNCisN
CisJc2RhX21pbiA9IERJVl9ST1VORF9VUChzcGVjLT5taW5fc3VfZGF0X25zLCBzYW1wbGVfbnMp
Ow0KKwlpZiAoc2RhX21pbiA+IGxvd19jbnQpDQorCQlzZGFfbWluID0gc2RhX21pbjsNCisJZWxz
ZQ0KKwkJc2RhX21pbiA9IDA7DQorDQorCWlmIChzZGFfbWluID4gc2RhX21heCkNCisJCXJldHVy
biAtMzsNCisNCisJaWYgKGNoZWNrX3NwZWVkID4gTUFYX0ZTX01PREVfU1BFRUQpIHsNCisJCWlm
IChpMmMtPmRldl9jb21wLT5sdGltaW5nX2FkanVzdCkgew0KKwkJCWkyYy0+YWNfdGltaW5nLmhz
ID0gSTJDX1RJTUVfREVGQVVMVF9WQUxVRSB8DQorCQkJCShzYW1wbGVfY250IDw8IDEyKSB8ICho
aWdoX2NudCA8PCA4KTsNCisJCQlpMmMtPmFjX3RpbWluZy5sdGltaW5nICY9IH5HRU5NQVNLKDE1
LCA5KTsNCisJCQlpMmMtPmFjX3RpbWluZy5sdGltaW5nIHw9IChzYW1wbGVfY250IDw8IDEyKSB8
DQorCQkJCShsb3dfY250IDw8IDkpOw0KKwkJCWkyYy0+YWNfdGltaW5nLmV4dCAmPSB+R0VOTUFT
Syg3LCAxKTsNCisJCQlpMmMtPmFjX3RpbWluZy5leHQgfD0gKHN1X3N0YV9jbnQgPDwgMSkgfCAo
MSA8PCAwKTsNCisJCX0gZWxzZSB7DQorCQkJaTJjLT5hY190aW1pbmcuaHNfc2NsX2hsX3JhdGlv
ID0gKDEgPDwgMTIpIHwNCisJCQkJKGhpZ2hfY250IDw8IDYpIHwgbG93X2NudDsNCisJCQlpMmMt
PmFjX3RpbWluZy5oc19zdGFfc3RvcCA9IChzdV9zdGFfY250IDw8IDgpIHwNCisJCQkJc3Vfc3Rh
X2NudDsNCisJCX0NCisJCWkyYy0+YWNfdGltaW5nLnNkYV90aW1pbmcgJj0gfkdFTk1BU0soMTEs
IDYpOw0KKwkJaTJjLT5hY190aW1pbmcuc2RhX3RpbWluZyB8PSAoMSA8PCAxMikgfA0KKwkJCSgo
c2RhX21heCArIHNkYV9taW4pIC8gMikgPDwgNjsNCisJfSBlbHNlIHsNCisJCWlmIChpMmMtPmRl
dl9jb21wLT5sdGltaW5nX2FkanVzdCkgew0KKwkJCWkyYy0+YWNfdGltaW5nLmh0aW1pbmcgPSAo
c2FtcGxlX2NudCA8PCA4KSB8IChoaWdoX2NudCk7DQorCQkJaTJjLT5hY190aW1pbmcubHRpbWlu
ZyA9IChzYW1wbGVfY250IDw8IDYpIHwgKGxvd19jbnQpOw0KKwkJCWkyYy0+YWNfdGltaW5nLmV4
dCA9IChzdV9zdGFfY250IDw8IDgpIHwgKDEgPDwgMCk7DQorCQl9IGVsc2Ugew0KKwkJCWkyYy0+
YWNfdGltaW5nLnNjbF9obF9yYXRpbyA9ICgxIDw8IDEyKSB8DQorCQkJCShoaWdoX2NudCA8PCA2
KSB8IGxvd19jbnQ7DQorCQkJaTJjLT5hY190aW1pbmcuc3RhX3N0b3AgPSAoc3Vfc3RhX2NudCA8
PCA4KSB8DQorCQkJCXN1X3N0YV9jbnQ7DQorCQl9DQorDQorCQlpMmMtPmFjX3RpbWluZy5zZGFf
dGltaW5nID0gKDEgPDwgMTIpIHwNCisJCQkoc2RhX21heCArIHNkYV9taW4pIC8gMjsNCisJfQ0K
Kw0KKwlyZXR1cm4gMDsNCit9DQorDQogLyoNCiAgKiBDYWxjdWxhdGUgaTJjIHBvcnQgc3BlZWQN
CiAgKg0KQEAgLTQ0OSwxNSArNjYyLDEyIEBAIHN0YXRpYyBpbnQgbXRrX2kyY19jYWxjdWxhdGVf
c3BlZWQoc3RydWN0IG10a19pMmMgKmkyYywgdW5zaWduZWQgaW50IGNsa19zcmMsDQogCXVuc2ln
bmVkIGludCBvcHRfZGl2Ow0KIAl1bnNpZ25lZCBpbnQgYmVzdF9tdWw7DQogCXVuc2lnbmVkIGlu
dCBjbnRfbXVsOw0KKwlpbnQgcmV0ID0gLUVJTlZBTDsNCiANCiAJaWYgKHRhcmdldF9zcGVlZCA+
IE1BWF9IU19NT0RFX1NQRUVEKQ0KIAkJdGFyZ2V0X3NwZWVkID0gTUFYX0hTX01PREVfU1BFRUQ7
DQogDQotCWlmICh0YXJnZXRfc3BlZWQgPiBNQVhfRlNfTU9ERV9TUEVFRCkNCi0JCW1heF9zdGVw
X2NudCA9IE1BWF9IU19TVEVQX0NOVF9ESVY7DQotCWVsc2UNCi0JCW1heF9zdGVwX2NudCA9IE1B
WF9TVEVQX0NOVF9ESVY7DQotDQorCW1heF9zdGVwX2NudCA9IG10a19pMmNfbWF4X3N0ZXBfY250
KHRhcmdldF9zcGVlZCk7DQogCWJhc2Vfc3RlcF9jbnQgPSBtYXhfc3RlcF9jbnQ7DQogCS8qIEZp
bmQgdGhlIGJlc3QgY29tYmluYXRpb24gKi8NCiAJb3B0X2RpdiA9IERJVl9ST1VORF9VUChjbGtf
c3JjID4+IDEsIHRhcmdldF9zcGVlZCk7DQpAQCAtNDc2LDYgKzY4NiwxMSBAQCBzdGF0aWMgaW50
IG10a19pMmNfY2FsY3VsYXRlX3NwZWVkKHN0cnVjdCBtdGtfaTJjICppMmMsIHVuc2lnbmVkIGlu
dCBjbGtfc3JjLA0KIAkJCWNvbnRpbnVlOw0KIA0KIAkJaWYgKGNudF9tdWwgPCBiZXN0X211bCkg
ew0KKwkJCXJldCA9IG10a19pMmNfY2hlY2tfYWNfdGltaW5nKGkyYywgY2xrX3NyYywNCisJCQkJ
dGFyZ2V0X3NwZWVkLCBzdGVwX2NudCAtIDEsIHNhbXBsZV9jbnQgLSAxKTsNCisJCQlpZiAocmV0
KQ0KKwkJCQljb250aW51ZTsNCisNCiAJCQliZXN0X211bCA9IGNudF9tdWw7DQogCQkJYmFzZV9z
YW1wbGVfY250ID0gc2FtcGxlX2NudDsNCiAJCQliYXNlX3N0ZXBfY250ID0gc3RlcF9jbnQ7DQpA
QCAtNDg0LDYgKzY5OSw5IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19jYWxjdWxhdGVfc3BlZWQoc3Ry
dWN0IG10a19pMmMgKmkyYywgdW5zaWduZWQgaW50IGNsa19zcmMsDQogCQl9DQogCX0NCiANCisJ
aWYgKHJldCkNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KIAlzYW1wbGVfY250ID0gYmFzZV9zYW1w
bGVfY250Ow0KIAlzdGVwX2NudCA9IGJhc2Vfc3RlcF9jbnQ7DQogDQpAQCAtNTA5LDQ3ICs3Mjcs
NjggQEAgc3RhdGljIGludCBtdGtfaTJjX3NldF9zcGVlZChzdHJ1Y3QgbXRrX2kyYyAqaTJjLCB1
bnNpZ25lZCBpbnQgcGFyZW50X2NsaykNCiAJdW5zaWduZWQgaW50IGxfc3RlcF9jbnQ7DQogCXVu
c2lnbmVkIGludCBsX3NhbXBsZV9jbnQ7DQogCXVuc2lnbmVkIGludCB0YXJnZXRfc3BlZWQ7DQor
CXVuc2lnbmVkIGludCBjbGtfZGl2Ow0KKwl1bnNpZ25lZCBpbnQgbWF4X2Nsa19kaXY7DQogCWlu
dCByZXQ7DQogDQotCWNsa19zcmMgPSBwYXJlbnRfY2xrIC8gaTJjLT5jbGtfc3JjX2RpdjsNCiAJ
dGFyZ2V0X3NwZWVkID0gaTJjLT5zcGVlZF9oejsNCisJcGFyZW50X2NsayAvPSBpMmMtPmNsa19z
cmNfZGl2Ow0KIA0KLQlpZiAodGFyZ2V0X3NwZWVkID4gTUFYX0ZTX01PREVfU1BFRUQpIHsNCi0J
CS8qIFNldCBtYXN0ZXIgY29kZSBzcGVlZCByZWdpc3RlciAqLw0KLQkJcmV0ID0gbXRrX2kyY19j
YWxjdWxhdGVfc3BlZWQoaTJjLCBjbGtfc3JjLCBNQVhfRlNfTU9ERV9TUEVFRCwNCi0JCQkJCSAg
ICAgICZsX3N0ZXBfY250LCAmbF9zYW1wbGVfY250KTsNCi0JCWlmIChyZXQgPCAwKQ0KLQkJCXJl
dHVybiByZXQ7DQotDQotCQlpMmMtPnRpbWluZ19yZWcgPSAobF9zYW1wbGVfY250IDw8IDgpIHwg
bF9zdGVwX2NudDsNCi0NCi0JCS8qIFNldCB0aGUgaGlnaCBzcGVlZCBtb2RlIHJlZ2lzdGVyICov
DQotCQlyZXQgPSBtdGtfaTJjX2NhbGN1bGF0ZV9zcGVlZChpMmMsIGNsa19zcmMsIHRhcmdldF9z
cGVlZCwNCi0JCQkJCSAgICAgICZzdGVwX2NudCwgJnNhbXBsZV9jbnQpOw0KLQkJaWYgKHJldCA8
IDApDQotCQkJcmV0dXJuIHJldDsNCi0NCi0JCWkyYy0+aGlnaF9zcGVlZF9yZWcgPSBJMkNfVElN
RV9ERUZBVUxUX1ZBTFVFIHwNCi0JCQkoc2FtcGxlX2NudCA8PCAxMikgfCAoc3RlcF9jbnQgPDwg
OCk7DQorCWlmIChpMmMtPmRldl9jb21wLT50aW1pbmdfYWRqdXN0KQ0KKwkJbWF4X2Nsa19kaXYg
PSBNQVhfQ0xPQ0tfRElWOw0KKwllbHNlDQorCQltYXhfY2xrX2RpdiA9IDE7DQorDQorCWZvciAo
Y2xrX2RpdiA9IDE7IGNsa19kaXYgPD0gbWF4X2Nsa19kaXY7IGNsa19kaXYrKykgew0KKwkJY2xr
X3NyYyA9IHBhcmVudF9jbGsgLyBjbGtfZGl2Ow0KKw0KKwkJaWYgKHRhcmdldF9zcGVlZCA+IE1B
WF9GU19NT0RFX1NQRUVEKSB7DQorCQkJLyogU2V0IG1hc3RlciBjb2RlIHNwZWVkIHJlZ2lzdGVy
ICovDQorCQkJcmV0ID0gbXRrX2kyY19jYWxjdWxhdGVfc3BlZWQoaTJjLCBjbGtfc3JjLA0KKwkJ
CQkJCSAgICAgIE1BWF9GU19NT0RFX1NQRUVELA0KKwkJCQkJCSAgICAgICZsX3N0ZXBfY250LA0K
KwkJCQkJCSAgICAgICZsX3NhbXBsZV9jbnQpOw0KKwkJCWlmIChyZXQgPCAwKQ0KKwkJCQljb250
aW51ZTsNCisNCisJCQlpMmMtPnRpbWluZ19yZWcgPSAobF9zYW1wbGVfY250IDw8IDgpIHwgbF9z
dGVwX2NudDsNCisNCisJCQkvKiBTZXQgdGhlIGhpZ2ggc3BlZWQgbW9kZSByZWdpc3RlciAqLw0K
KwkJCXJldCA9IG10a19pMmNfY2FsY3VsYXRlX3NwZWVkKGkyYywgY2xrX3NyYywNCisJCQkJCQkg
ICAgICB0YXJnZXRfc3BlZWQsICZzdGVwX2NudCwNCisJCQkJCQkgICAgICAmc2FtcGxlX2NudCk7
DQorCQkJaWYgKHJldCA8IDApDQorCQkJCWNvbnRpbnVlOw0KKw0KKwkJCWkyYy0+aGlnaF9zcGVl
ZF9yZWcgPSBJMkNfVElNRV9ERUZBVUxUX1ZBTFVFIHwNCisJCQkJCShzYW1wbGVfY250IDw8IDEy
KSB8IChzdGVwX2NudCA8PCA4KTsNCisNCisJCQlpZiAoaTJjLT5kZXZfY29tcC0+bHRpbWluZ19h
ZGp1c3QpDQorCQkJCWkyYy0+bHRpbWluZ19yZWcgPQ0KKwkJCQkJKGxfc2FtcGxlX2NudCA8PCA2
KSB8IGxfc3RlcF9jbnQgfA0KKwkJCQkJKHNhbXBsZV9jbnQgPDwgMTIpIHwgKHN0ZXBfY250IDw8
IDkpOw0KKwkJfSBlbHNlIHsNCisJCQlyZXQgPSBtdGtfaTJjX2NhbGN1bGF0ZV9zcGVlZChpMmMs
IGNsa19zcmMsDQorCQkJCQkJICAgICAgdGFyZ2V0X3NwZWVkLCAmbF9zdGVwX2NudCwNCisJCQkJ
CQkgICAgICAmbF9zYW1wbGVfY250KTsNCisJCQlpZiAocmV0IDwgMCkNCisJCQkJY29udGludWU7
DQogDQotCQlpZiAoaTJjLT5kZXZfY29tcC0+bHRpbWluZ19hZGp1c3QpDQotCQkJaTJjLT5sdGlt
aW5nX3JlZyA9IChsX3NhbXBsZV9jbnQgPDwgNikgfCBsX3N0ZXBfY250IHwNCi0JCQkJCSAgIChz
YW1wbGVfY250IDw8IDEyKSB8IChzdGVwX2NudCA8PCA5KTsNCi0JfSBlbHNlIHsNCi0JCXJldCA9
IG10a19pMmNfY2FsY3VsYXRlX3NwZWVkKGkyYywgY2xrX3NyYywgdGFyZ2V0X3NwZWVkLA0KLQkJ
CQkJICAgICAgJnN0ZXBfY250LCAmc2FtcGxlX2NudCk7DQotCQlpZiAocmV0IDwgMCkNCi0JCQly
ZXR1cm4gcmV0Ow0KKwkJCWkyYy0+dGltaW5nX3JlZyA9IChsX3NhbXBsZV9jbnQgPDwgOCkgfCBs
X3N0ZXBfY250Ow0KIA0KLQkJaTJjLT50aW1pbmdfcmVnID0gKHNhbXBsZV9jbnQgPDwgOCkgfCBz
dGVwX2NudDsNCisJCQkvKiBEaXNhYmxlIHRoZSBoaWdoIHNwZWVkIHRyYW5zYWN0aW9uICovDQor
CQkJaTJjLT5oaWdoX3NwZWVkX3JlZyA9IEkyQ19USU1FX0NMUl9WQUxVRTsNCiANCi0JCS8qIERp
c2FibGUgdGhlIGhpZ2ggc3BlZWQgdHJhbnNhY3Rpb24gKi8NCi0JCWkyYy0+aGlnaF9zcGVlZF9y
ZWcgPSBJMkNfVElNRV9DTFJfVkFMVUU7DQorCQkJaWYgKGkyYy0+ZGV2X2NvbXAtPmx0aW1pbmdf
YWRqdXN0KQ0KKwkJCQlpMmMtPmx0aW1pbmdfcmVnID0NCisJCQkJCShsX3NhbXBsZV9jbnQgPDwg
NikgfCBsX3N0ZXBfY250Ow0KKwkJfQ0KIA0KLQkJaWYgKGkyYy0+ZGV2X2NvbXAtPmx0aW1pbmdf
YWRqdXN0KQ0KLQkJCWkyYy0+bHRpbWluZ19yZWcgPSAoc2FtcGxlX2NudCA8PCA2KSB8IHN0ZXBf
Y250Ow0KKwkJYnJlYWs7DQogCX0NCiANCisJaTJjLT5hY190aW1pbmcuaW50ZXJfY2xrX2RpdiA9
IGNsa19kaXYgLSAxOw0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQpAQCAtNTg5LDEyICs4MjgsNiBA
QCBzdGF0aWMgaW50IG10a19pMmNfZG9fdHJhbnNmZXIoc3RydWN0IG10a19pMmMgKmkyYywgc3Ry
dWN0IGkyY19tc2cgKm1zZ3MsDQogDQogCW10a19pMmNfd3JpdGV3KGkyYywgY29udHJvbF9yZWcs
IE9GRlNFVF9DT05UUk9MKTsNCiANCi0JLyogc2V0IHN0YXJ0IGNvbmRpdGlvbiAqLw0KLQlpZiAo
aTJjLT5zcGVlZF9oeiA8PSBJMkNfREVGQVVMVF9TUEVFRCkNCi0JCW10a19pMmNfd3JpdGV3KGky
YywgSTJDX1NUX1NUQVJUX0NPTiwgT0ZGU0VUX0VYVF9DT05GKTsNCi0JZWxzZQ0KLQkJbXRrX2ky
Y193cml0ZXcoaTJjLCBJMkNfRlNfU1RBUlRfQ09OLCBPRkZTRVRfRVhUX0NPTkYpOw0KLQ0KIAlh
ZGRyX3JlZyA9IGkyY184Yml0X2FkZHJfZnJvbV9tc2cobXNncyk7DQogCW10a19pMmNfd3JpdGV3
KGkyYywgYWRkcl9yZWcsIE9GRlNFVF9TTEFWRV9BRERSKTsNCiANCkBAIC05NTEsOSArMTE4NCw2
IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIC1FSU5WQUw7DQogDQotCWlmIChpMmMtPmRldl9jb21w
LT50aW1pbmdfYWRqdXN0KQ0KLQkJaTJjLT5jbGtfc3JjX2RpdiAqPSBJMkNfREVGQVVMVF9DTEtf
RElWOw0KLQ0KIAlpZiAoaTJjLT5oYXZlX3BtaWMgJiYgIWkyYy0+ZGV2X2NvbXAtPnBtaWNfaTJj
KQ0KIAkJcmV0dXJuIC1FSU5WQUw7DQogDQotLSANCjEuOS4xDQo=

