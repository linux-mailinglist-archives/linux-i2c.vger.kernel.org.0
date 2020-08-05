Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCBD23D2C9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgHEUQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:16:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:30906 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726305AbgHEQUC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 12:20:02 -0400
X-UUID: 95c1d7cd1f6f4b74820c363d0bba8f1a-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OtQD/PJMlF3G2CJYqMrtaw2Ep2S+WhvIaUE5rI/Zd4g=;
        b=EtnKorVp0b9nIT8NOQTAL1ojafuQtpdCZAD+N5fnSpE4HT6FqVc2QpMWe7+IoOxlAaBJphxp0sHVd78haT4c2TWzBLXTya7JNlXJFSGEZxzqOS3AsKzX1myxJhBFV9DXrE3VTdcz8v/1rDSMVFOucWTskUjCS3NMDvJktNMHAk0=;
X-UUID: 95c1d7cd1f6f4b74820c363d0bba8f1a-20200805
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 182264108; Wed, 05 Aug 2020 18:53:22 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 18:53:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 18:53:20 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH v3 4/4] i2c: mediatek: Add i2c compatible for MediaTek MT8192
Date:   Wed, 5 Aug 2020 18:52:22 +0800
Message-ID: <1596624742-14727-5-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWRkIGkyYyBjb21wYXRpYmxlIGZvciBNVDgxOTIuIENvbXBhcmUgdG8gTVQ4MTgzIGkyYyBjb250
cm9sbGVyLA0KTVQ4MTkyIHN1cHBvcnQgbW9yZSB0aGVuIDhHQiBETUEgbW9kZS4NCg0KU2lnbmVk
LW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAxNSArKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCmluZGV4IDQ2
Mzg2MGUuLmU4ODlmNzQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAtMzg2LDYgKzM4
NiwyMCBAQCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzIHsNCiAJLm1heF9kbWFfc3VwcG9ydCA9IDMz
LA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaTJjX2NvbXBhdGlibGUgbXQ4MTky
X2NvbXBhdCA9IHsNCisJLnF1aXJrcyA9ICZtdDgxODNfaTJjX3F1aXJrcywNCisJLnJlZ3MgPSBt
dF9pMmNfcmVnc192MiwNCisJLnBtaWNfaTJjID0gMCwNCisJLmRjbSA9IDAsDQorCS5hdXRvX3Jl
c3RhcnQgPSAxLA0KKwkuYXV4X2xlbl9yZWcgPSAxLA0KKwkudGltaW5nX2FkanVzdCA9IDEsDQor
CS5kbWFfc3luYyA9IDEsDQorCS5sdGltaW5nX2FkanVzdCA9IDEsDQorCS5hcGRtYV9zeW5jID0g
MSwNCisJLm1heF9kbWFfc3VwcG9ydCA9IDM2LA0KK307DQorDQogc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbXRrX2kyY19vZl9tYXRjaFtdID0gew0KIAl7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10MjcxMi1pMmMiLCAuZGF0YSA9ICZtdDI3MTJfY29tcGF0IH0sDQogCXsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTc3LWkyYyIsIC5kYXRhID0gJm10NjU3N19jb21wYXQg
fSwNCkBAIC0zOTMsNiArNDA3LDcgQEAgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyB7DQogCXsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLWkyYyIsIC5kYXRhID0gJm10NzYyMl9jb21wYXQg
fSwNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtaTJjIiwgLmRhdGEgPSAmbXQ4
MTczX2NvbXBhdCB9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1pMmMiLCAu
ZGF0YSA9ICZtdDgxODNfY29tcGF0IH0sDQorCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWkyYyIsIC5kYXRhID0gJm10ODE5Ml9jb21wYXQgfSwNCiAJe30NCiB9Ow0KIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIG10a19pMmNfb2ZfbWF0Y2gpOw0KLS0gDQoxLjkuMQ0K

