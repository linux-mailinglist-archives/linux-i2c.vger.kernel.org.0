Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7723426DB03
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgIQMFH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:05:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:4956 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726774AbgIQMEv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:04:51 -0400
X-UUID: cc90780fa2ac404f85d9b5d58092ae3f-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rQ7X5ZN1ihMFTytakUDsBP4WZCCDHdxE3OsuojPLzkQ=;
        b=g8U6mJG2Prbq+P9NVP++MJN9xXYwiqepvdx1CESu5iNI/aRNegWhyk0JKi+ySikEVCdl5R0YxtX7AQKxbkfg44+VFS+Zh3DH7qR8FH+2s9TWprGTB9U5k476AHKAwsewgw3KV61aOKtCSKmMD1/QbopUSoIPq60pcGCQ8PmCe3E=;
X-UUID: cc90780fa2ac404f85d9b5d58092ae3f-20200917
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 365866490; Thu, 17 Sep 2020 19:58:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:58:01 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:58:01 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH 2/2] i2c: mediatek: Send i2c master code at more than 1MHz
Date:   Thu, 17 Sep 2020 19:55:42 +0800
Message-ID: <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhlIG1hc3RlciBjb2RlIG5lZWRzIHRvIGJlaW5nIHNlbnQgd2hlbiB0aGUgc3BlZWQgaXMgbW9y
ZSB0aGFuDQpJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVEsIG5vdCBJMkNfTUFYX0ZBU1RfTU9E
RV9GUkVRIGluIHRoZQ0KbGF0ZXN0IEkyQy1idXMgc3BlY2lmaWNhdGlvbiBhbmQgdXNlciBtYW51
YWwuDQoNClNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQot
LS0NCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4
LmMNCmluZGV4IGExOTc4ZWIuLjBjYmRmYmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW10NjV4eC5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQpA
QCAtNzU5LDcgKzc1OSw3IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19zZXRfc3BlZWQoc3RydWN0IG10
a19pMmMgKmkyYywgdW5zaWduZWQgaW50IHBhcmVudF9jbGspDQogCWZvciAoY2xrX2RpdiA9IDE7
IGNsa19kaXYgPD0gbWF4X2Nsa19kaXY7IGNsa19kaXYrKykgew0KIAkJY2xrX3NyYyA9IHBhcmVu
dF9jbGsgLyBjbGtfZGl2Ow0KIA0KLQkJaWYgKHRhcmdldF9zcGVlZCA+IEkyQ19NQVhfRkFTVF9N
T0RFX0ZSRVEpIHsNCisJCWlmICh0YXJnZXRfc3BlZWQgPiBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVT
X0ZSRVEpIHsNCiAJCQkvKiBTZXQgbWFzdGVyIGNvZGUgc3BlZWQgcmVnaXN0ZXIgKi8NCiAJCQly
ZXQgPSBtdGtfaTJjX2NhbGN1bGF0ZV9zcGVlZChpMmMsIGNsa19zcmMsDQogCQkJCQkJICAgICAg
STJDX01BWF9GQVNUX01PREVfRlJFUSwNCi0tIA0KMS45LjENCg==

