Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC4E230A28
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgG1Mbp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:31:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:58928 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729619AbgG1Mbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:31:38 -0400
X-UUID: 47fce131f0bc4ce8bdd873b60e3f7dc8-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=re9A+rq4KYmObWKmW7Bf0ezIeYUSRyNZ7fUizuyl6XA=;
        b=H8P85t8YytaNjKoYFI1kWsXqlGNHU+QsH6bJ1NdAPTjWA++0Xl7lmLR5xWejWiO+M6ZZ5bTAndVRV02SKC312k+/5IvZ2p8eWhq81tfpIJ1miw6oTWU0aJMjvLgZbcZ7cQbdCG/RDQPBHlvRYgvcIncHprwV2ctvDHXrSKeQHS4=;
X-UUID: 47fce131f0bc4ce8bdd873b60e3f7dc8-20200728
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1736896492; Tue, 28 Jul 2020 20:31:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 20:31:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 20:31:31 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>
Subject: [PATCH v2 4/4] i2c: mediatek: Add i2c compatible for MediaTek MT8192
Date:   Tue, 28 Jul 2020 20:30:46 +0800
Message-ID: <1595939446-5484-5-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
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
L2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCmluZGV4IDQ5
Nzc3YTYuLmRiZjMxZWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAtMzg3LDYgKzM4
NywyMCBAQCBzdHJ1Y3QgaTJjX3NwZWNfdmFsdWVzIHsNCiAJLm1heF9kbWFfc3VwcG9ydCA9IDMz
LA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaTJjX2NvbXBhdGlibGUgbXQ4MTky
X2NvbXBhdCA9IHsNCisJLnF1aXJrcyA9ICZtdDgxODNfaTJjX3F1aXJrcywNCisJLnJlZ3MgPSBt
dF9pMmNfcmVnc192MiwNCisJLnBtaWNfaTJjID0gMCwNCisJLmRjbSA9IDAsDQorCS5hdXRvX3Jl
c3RhcnQgPSAxLA0KKwkuYXV4X2xlbl9yZWcgPSAxLA0KKwkudGltaW5nX2FkanVzdCA9IDEsDQor
CS5kbWFfc3luYyA9IDEsDQorCS5sdGltaW5nX2FkanVzdCA9IDEsDQorCS5hcGRtYV9zeW5jID0g
MSwNCisJLm1heF9kbWFfc3VwcG9ydCA9IDM2LA0KK307DQorDQogc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbXRrX2kyY19vZl9tYXRjaFtdID0gew0KIAl7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10MjcxMi1pMmMiLCAuZGF0YSA9ICZtdDI3MTJfY29tcGF0IH0sDQogCXsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTc3LWkyYyIsIC5kYXRhID0gJm10NjU3N19jb21wYXQg
fSwNCkBAIC0zOTQsNiArNDA4LDcgQEAgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyB7DQogCXsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLWkyYyIsIC5kYXRhID0gJm10NzYyMl9jb21wYXQg
fSwNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtaTJjIiwgLmRhdGEgPSAmbXQ4
MTczX2NvbXBhdCB9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1pMmMiLCAu
ZGF0YSA9ICZtdDgxODNfY29tcGF0IH0sDQorCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWkyYyIsIC5kYXRhID0gJm10ODE5Ml9jb21wYXQgfSwNCiAJe30NCiB9Ow0KIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIG10a19pMmNfb2ZfbWF0Y2gpOw0KLS0gDQoxLjkuMQ0K

