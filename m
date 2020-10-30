Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648702A04DA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 12:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgJ3L6O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 07:58:14 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51851 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725355AbgJ3L6O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Oct 2020 07:58:14 -0400
X-UUID: 72551d5e58d0428b9b041b74830659a2-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ToIiaIPerS3D72ArokmIM6oaTzcfLiLc3SIQSu5S6cI=;
        b=ucDTi/88lvtdsPWqQALsPDdX8fIAkj6w6GaxWkXpDsH97iAONDYKS/cNEdIEUsf/Mo0sAlf869odvsCc6u6tawE89URCU+1nKHFPVoCk9JTyVQ+rAW4N97DsNUfxN5DbqSMg0ZYREVU0T80vu4fe0SmeNQ5NaVXpyzbeJ1sUnwg=;
X-UUID: 72551d5e58d0428b9b041b74830659a2-20201030
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1754038679; Fri, 30 Oct 2020 19:58:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 19:58:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 19:58:05 +0800
From:   <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: move dma reset before i2c reset
Date:   Fri, 30 Oct 2020 19:58:01 +0800
Message-ID: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KVGhlIGkyYyBkcml2ZXIg
ZGVmYXVsdCBkbyBkbWEgcmVzZXQgYWZ0ZXIgaTJjIHJlc2V0LCBidXQgc29tZXRpbWVzDQppMmMg
cmVzZXQgd2lsbCB0cmlnZ2VyIGRtYSB0eDJyeCwgdGhlbiBhcGRtYSB3cml0ZSBkYXRhIHRvIGRy
YW0NCndoaWNoIGhhcyBiZWVuIGkyY19wdXRfZG1hX3NhZmVfbXNnX2J1ZihrZnJlZSkuIE1vdmUg
ZG1hIHJlc2V0DQpiZWZvcmUgaTJjIHJlc2V0IGluIG10a19pMmNfaW5pdF9odyB0byBmaXggaXQu
DQoNClNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQotLS0N
CiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgOCArKysrLS0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
dDY1eHguYw0KaW5kZXggMGNiZGZiZS4uMzNkZTk5YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4
LmMNCkBAIC00NzUsNiArNDc1LDEwIEBAIHN0YXRpYyB2b2lkIG10a19pMmNfaW5pdF9odyhzdHJ1
Y3QgbXRrX2kyYyAqaTJjKQ0KIHsNCiAJdTE2IGNvbnRyb2xfcmVnOw0KIA0KKwl3cml0ZWwoSTJD
X0RNQV9IQVJEX1JTVCwgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9SU1QpOw0KKwl1ZGVsYXkoNTAp
Ow0KKwl3cml0ZWwoSTJDX0RNQV9DTFJfRkxBRywgaTJjLT5wZG1hYmFzZSArIE9GRlNFVF9SU1Qp
Ow0KKw0KIAltdGtfaTJjX3dyaXRldyhpMmMsIEkyQ19TT0ZUX1JTVCwgT0ZGU0VUX1NPRlRSRVNF
VCk7DQogDQogCS8qIFNldCBpb2NvbmZpZyAqLw0KQEAgLTUyOSwxMCArNTMzLDYgQEAgc3RhdGlj
IHZvaWQgbXRrX2kyY19pbml0X2h3KHN0cnVjdCBtdGtfaTJjICppMmMpDQogDQogCW10a19pMmNf
d3JpdGV3KGkyYywgY29udHJvbF9yZWcsIE9GRlNFVF9DT05UUk9MKTsNCiAJbXRrX2kyY193cml0
ZXcoaTJjLCBJMkNfREVMQVlfTEVOLCBPRkZTRVRfREVMQVlfTEVOKTsNCi0NCi0Jd3JpdGVsKEky
Q19ETUFfSEFSRF9SU1QsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfUlNUKTsNCi0JdWRlbGF5KDUw
KTsNCi0Jd3JpdGVsKEkyQ19ETUFfQ0xSX0ZMQUcsIGkyYy0+cGRtYWJhc2UgKyBPRkZTRVRfUlNU
KTsNCiB9DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfc3BlY192YWx1ZXMgKm10a19pMmNf
Z2V0X3NwZWModW5zaWduZWQgaW50IHNwZWVkKQ0KLS0gDQoxLjkuMQ0K

