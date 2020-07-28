Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A24230A1D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbgG1Mbh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:31:37 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58990 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729568AbgG1Mbh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:31:37 -0400
X-UUID: c1e2c274d0754e53973379f6244ef71b-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rgglf6GVKnv1Jkvp64Ht2UoQ1fYb0dBQwks3oFNLEHQ=;
        b=R96V587uynFAoa6Ejl4QrnnXIasO/7DhXzlZRmkEUgFHC/NSY8tVMzfWU/4HHrni6FBWx4z6HekgNzM6Hk3I8e6N9UDCP891KLAFdUwXhNaGplLasdeFVRdGrHqnHC1r7HV2tR4SRK7SJTcSXVTDzgJHl3mpzVGlisoI5u65x2s=;
X-UUID: c1e2c274d0754e53973379f6244ef71b-20200728
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 865555193; Tue, 28 Jul 2020 20:31:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 20:31:31 +0800
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
Subject: [PATCH v2 3/4] dt-bindings: i2c: update bindings for MT8192 SoC
Date:   Tue, 28 Jul 2020 20:30:45 +0800
Message-ID: <1595939446-5484-4-git-send-email-qii.wang@mediatek.com>
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

QWRkIGEgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgTVQ4MTkyIHNvYy4NCg0KQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBRaWkg
V2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXQ2NXh4LnR4dCB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9pMmMtbXQ2NXh4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pMmMvaTJjLW10NjV4eC50eHQNCmluZGV4IDg4YjcxYzEuLjdmMDE5NGYgMTAwNjQ0DQot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdDY1eHgudHh0
DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdDY1eHgu
dHh0DQpAQCAtMTQsNiArMTQsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KICAgICAgICJtZWRp
YXRlayxtdDc2MjktaTJjIiwgIm1lZGlhdGVrLG10MjcxMi1pMmMiOiBmb3IgTWVkaWFUZWsgTVQ3
NjI5DQogICAgICAgIm1lZGlhdGVrLG10ODE3My1pMmMiOiBmb3IgTWVkaWFUZWsgTVQ4MTczDQog
ICAgICAgIm1lZGlhdGVrLG10ODE4My1pMmMiOiBmb3IgTWVkaWFUZWsgTVQ4MTgzDQorICAgICAg
Im1lZGlhdGVrLG10ODE5Mi1pMmMiOiBmb3IgTWVkaWFUZWsgTVQ4MTkyDQogICAgICAgIm1lZGlh
dGVrLG10ODUxNi1pMmMiLCAibWVkaWF0ZWssbXQyNzEyLWkyYyI6IGZvciBNZWRpYVRlayBNVDg1
MTYNCiAgIC0gcmVnOiBwaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGNvbnRyb2xsZXIgYW5k
IGRtYSBiYXNlLCBsZW5ndGggb2YgbWVtb3J5DQogICAgIG1hcHBlZCByZWdpb24uDQotLSANCjEu
OS4xDQo=

