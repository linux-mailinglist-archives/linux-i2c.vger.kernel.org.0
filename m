Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017B31DB041
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 12:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETKde (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 06:33:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:42511 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726224AbgETKde (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 06:33:34 -0400
X-UUID: 3de7439d6daf48d7a894be21cd30af4d-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HfMRe5GvWTMoSjJho2QVFn7+uU1oZw2rKqKzYM8kbw8=;
        b=CsYMkHaV/YWUmJ+CGZVffs2aeo35GtyfEDEt0YrxwqU7ePpMqx1rWkKVeZeJogPzMiaLV6OdmQ1p2xKVkMBCsLV+XdY182O+1ovxF5YPemseaj5gAB0o9iHCDb/wytWMr6iicwLEMjNhfdiYgWaQSWJJ+Xu6VxQKTt0m3c0pjvc=;
X-UUID: 3de7439d6daf48d7a894be21cd30af4d-20200520
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1810491927; Wed, 20 May 2020 18:33:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 18:33:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 18:33:27 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [next] i2c: mediatek: Use div_u64 for 64-bit division to fix 32-bit kernels
Date:   Wed, 20 May 2020 18:31:53 +0800
Message-ID: <1589970713-19944-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KVXNlIGRpdl91NjQgZm9y
IDY0LWJpdCBkaXZpc2lvbiwgYW5kIGNoYW5nZSBzYW1wbGVfbnMgdHlwZSB0bw0KdW5zaWduZWQg
aW50LiBPdGhlcndpc2UsIHRoZSBtb2R1bGUgd2lsbCByZWZlcmVuY2UgX191ZGl2ZGkzDQp1bmRl
ciAzMi1iaXQga2VybmVscywgd2hpY2ggaXMgbm90IGFsbG93ZWQgaW4ga2VybmVsIHNwYWNlLg0K
DQpTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQog
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDMgKystDQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMN
CmluZGV4IDcwMjA2MTguLmRlZWY2OWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW10NjV4eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpAQCAt
NTUxLDcgKzU1MSw4IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19jaGVja19hY190aW1pbmcoc3RydWN0
IG10a19pMmMgKmkyYywNCiAJY29uc3Qgc3RydWN0IGkyY19zcGVjX3ZhbHVlcyAqc3BlYzsNCiAJ
dW5zaWduZWQgaW50IHN1X3N0YV9jbnQsIGxvd19jbnQsIGhpZ2hfY250LCBtYXhfc3RlcF9jbnQ7
DQogCXVuc2lnbmVkIGludCBzZGFfbWF4LCBzZGFfbWluLCBjbGtfbnMsIG1heF9zdGFfY250ID0g
MHgzZjsNCi0JbG9uZyBsb25nIHNhbXBsZV9ucyA9ICgxMDAwMDAwMDAwICogKHNhbXBsZV9jbnQg
KyAxKSkgLyBjbGtfc3JjOw0KKwl1bnNpZ25lZCBpbnQgc2FtcGxlX25zID0gZGl2X3U2NCgxMDAw
MDAwMDAwVUxMICogKHNhbXBsZV9jbnQgKyAxKSwNCisJCQkJCSBjbGtfc3JjKTsNCiANCiAJaWYg
KCFpMmMtPmRldl9jb21wLT50aW1pbmdfYWRqdXN0KQ0KIAkJcmV0dXJuIDA7DQotLSANCjEuOS4x
DQo=

