Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97565229848
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 14:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbgGVMdE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 08:33:04 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:10282 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728171AbgGVMdD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 08:33:03 -0400
X-UUID: 0c7f3f6f7726497a90fdd75a3979310b-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EzKgmhCRkP6dW/RPLHXb08UTRr/7p/P/vqIkSkqWx48=;
        b=hGkJ6CPjyYkczBMRaOpgDI85MtGu2sMfebiSlzNBYDb7bNsnZmkvs5fsIxFxr09J9P+iDpjt3b4rzM28e8HI7HI0AypJSuhVzEm9SHbi8HkbhdtOs2KHK4WBht3W4g6/7VI/LV3aOjJ6vwUBUxNaaD+s6aZ3e/FHUvS3GDcAyTA=;
X-UUID: 0c7f3f6f7726497a90fdd75a3979310b-20200722
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 373540910; Wed, 22 Jul 2020 20:32:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:55 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>
Subject: [PATCH 3/4] dt-bindings: i2c: update bindings for MT8192 SoC
Date:   Wed, 22 Jul 2020 20:31:45 +0800
Message-ID: <1595421106-10017-4-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWRkIGEgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgTVQ4MTkyIHNvYy4NCg0KU2ln
bmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW10NjV4eC50eHQgfCAxICsNCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW10NjV4eC50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdDY1eHgudHh0DQppbmRleCA4OGI3MWMxLi43
ZjAxOTRmIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9pMmMtbXQ2NXh4LnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kyYy9pMmMtbXQ2NXh4LnR4dA0KQEAgLTE0LDYgKzE0LDcgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoNCiAgICAgICAibWVkaWF0ZWssbXQ3NjI5LWkyYyIsICJtZWRpYXRlayxtdDI3MTItaTJjIjog
Zm9yIE1lZGlhVGVrIE1UNzYyOQ0KICAgICAgICJtZWRpYXRlayxtdDgxNzMtaTJjIjogZm9yIE1l
ZGlhVGVrIE1UODE3Mw0KICAgICAgICJtZWRpYXRlayxtdDgxODMtaTJjIjogZm9yIE1lZGlhVGVr
IE1UODE4Mw0KKyAgICAgICJtZWRpYXRlayxtdDgxOTItaTJjIjogZm9yIE1lZGlhVGVrIE1UODE5
Mg0KICAgICAgICJtZWRpYXRlayxtdDg1MTYtaTJjIiwgIm1lZGlhdGVrLG10MjcxMi1pMmMiOiBm
b3IgTWVkaWFUZWsgTVQ4NTE2DQogICAtIHJlZzogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIG9mIHRo
ZSBjb250cm9sbGVyIGFuZCBkbWEgYmFzZSwgbGVuZ3RoIG9mIG1lbW9yeQ0KICAgICBtYXBwZWQg
cmVnaW9uLg0KLS0gDQoxLjkuMQ0K

