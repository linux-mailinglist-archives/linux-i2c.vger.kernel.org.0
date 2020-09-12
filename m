Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC8E26780A
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Sep 2020 07:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgILF7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Sep 2020 01:59:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56593 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725808AbgILF7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Sep 2020 01:59:40 -0400
X-UUID: f25248f627934c929426b30cf3561136-20200912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=i9ffQliwWH6EmfVZu18WwAkTORgoZOjNhfKuRo1pCM0=;
        b=tB7yoDOWxPj3fjDSStcDiZ7Aj+hoy0lXlsZZHpMEuMeL/4tE2j14anyrae/f5qK9ITMl+mAi6F6hRg9obxIp9327UjXHuL8yytQ3euK0mGv7DWafqY3dXnX/K+eLc087j9YqBQDweuvWrFsdDo/3SbMtMxleZS2CUnf6RnBx40c=;
X-UUID: f25248f627934c929426b30cf3561136-20200912
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1817924852; Sat, 12 Sep 2020 13:59:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Sep 2020 13:59:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Sep 2020 13:59:25 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
Date:   Sat, 12 Sep 2020 13:57:26 +0800
Message-ID: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KVGhlIG1hc3RlciBjb2Rl
IG5lZWRzIHRvIGJlaW5nIHNlbnQgd2hlbiB0aGUgc3BlZWQgaXMgbW9yZSB0aGFuDQpJMkNfTUFY
X0ZBU1RfTU9ERV9QTFVTX0ZSRVEgaW5zdGVhZCBvZg0KSTJDX01BWF9ISUdIX1NQRUVEX01PREVf
RlJFUS4gRml4IGl0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0
ZWsuY29tPg0KLS0tDQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDYgKysrLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW10NjV4eC5jDQppbmRleCBlZmMxNDA0Li4wY2JkZmJlIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tdDY1eHguYw0KQEAgLTY4MSw4ICs2ODEsOCBAQCBzdGF0aWMgaW50IG10a19pMmNfY2Fs
Y3VsYXRlX3NwZWVkKHN0cnVjdCBtdGtfaTJjICppMmMsIHVuc2lnbmVkIGludCBjbGtfc3JjLA0K
IAl1bnNpZ25lZCBpbnQgY250X211bDsNCiAJaW50IHJldCA9IC1FSU5WQUw7DQogDQotCWlmICh0
YXJnZXRfc3BlZWQgPiBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVEpDQotCQl0YXJnZXRfc3Bl
ZWQgPSBJMkNfTUFYX0ZBU1RfTU9ERV9QTFVTX0ZSRVE7DQorCWlmICh0YXJnZXRfc3BlZWQgPiBJ
MkNfTUFYX0hJR0hfU1BFRURfTU9ERV9GUkVRKQ0KKwkJdGFyZ2V0X3NwZWVkID0gSTJDX01BWF9I
SUdIX1NQRUVEX01PREVfRlJFUTsNCiANCiAJbWF4X3N0ZXBfY250ID0gbXRrX2kyY19tYXhfc3Rl
cF9jbnQodGFyZ2V0X3NwZWVkKTsNCiAJYmFzZV9zdGVwX2NudCA9IG1heF9zdGVwX2NudDsNCkBA
IC03NTksNyArNzU5LDcgQEAgc3RhdGljIGludCBtdGtfaTJjX3NldF9zcGVlZChzdHJ1Y3QgbXRr
X2kyYyAqaTJjLCB1bnNpZ25lZCBpbnQgcGFyZW50X2NsaykNCiAJZm9yIChjbGtfZGl2ID0gMTsg
Y2xrX2RpdiA8PSBtYXhfY2xrX2RpdjsgY2xrX2RpdisrKSB7DQogCQljbGtfc3JjID0gcGFyZW50
X2NsayAvIGNsa19kaXY7DQogDQotCQlpZiAodGFyZ2V0X3NwZWVkID4gSTJDX01BWF9GQVNUX01P
REVfRlJFUSkgew0KKwkJaWYgKHRhcmdldF9zcGVlZCA+IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNf
RlJFUSkgew0KIAkJCS8qIFNldCBtYXN0ZXIgY29kZSBzcGVlZCByZWdpc3RlciAqLw0KIAkJCXJl
dCA9IG10a19pMmNfY2FsY3VsYXRlX3NwZWVkKGkyYywgY2xrX3NyYywNCiAJCQkJCQkgICAgICBJ
MkNfTUFYX0ZBU1RfTU9ERV9GUkVRLA0KLS0gDQoxLjkuMQ0K

