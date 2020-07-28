Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9A5230A23
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgG1Mbi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:31:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39840 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729127AbgG1Mbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:31:38 -0400
X-UUID: a754563cde9e41c58621b9e3abc2762c-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C7A3F2v9RvGGeFoQJVRcNNIIOU6ncFE8s3J+i2oyGqU=;
        b=Cbl/aAYFjmJ4r+H/DKxJbyA0KLwmWYOEgJOolsClHST4Q2wChzApnAWL+xd6NuzM+kf4Q8hrzmrpTSoZhBomIp3M9N3uIsArfz6pNGA7xKYiA+QgYQiG9gZyournN9Q8Dgk7pnclX6XcmXcJhk5VlBemV4rylx5zZhgNDKpAzyI=;
X-UUID: a754563cde9e41c58621b9e3abc2762c-20200728
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1528350127; Tue, 28 Jul 2020 20:31:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 20:31:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 20:31:28 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>
Subject: [PATCH v2 0/4] add i2c support for mt8192
Date:   Tue, 28 Jul 2020 20:30:42 +0800
Message-ID: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhpcyBzZXJpZXMgYXJlIGJhc2VkIG9uIDUuOC1yYzEgYW5kIHdlIHByb3ZpZGUgZm91ciBpMmMg
cGF0Y2hlcw0KdG8gc3VwcG9ydCBtdDgxOTIgU29DLg0KDQpNYWluIGNoYW5nZXMgY29tcGFyZWQg
dG8gdjE6DQotLW1vZGlmeSB0aGUgY29tbWl0IHdpdGggYWNjZXNzIG1vcmUgdGhhbiA4R0IgZHJh
bQ0KLS1hZGQgUmV2aWV3ZWQtYnkgYW5kIEFja2VkLWJ5IGZyb20gWWluZ2pvZSwgTWF0dGhpYXMg
YW5kIFJvYg0KDQpRaWkgV2FuZyAoNCk6DQogIGkyYzogbWVkaWF0ZWs6IEFkZCBhcGRtYSBzeW5j
IGluIGkyYyBkcml2ZXINCiAgaTJjOiBtZWRpYXRlazogQWRkIGFjY2VzcyB0byBtb3JlIHRoYW4g
OEdCIGRyYW0gaW4gaTJjIGRyaXZlcg0KICBkdC1iaW5kaW5nczogaTJjOiB1cGRhdGUgYmluZGlu
Z3MgZm9yIE1UODE5MiBTb0MNCiAgaTJjOiBtZWRpYXRlazogQWRkIGkyYyBjb21wYXRpYmxlIGZv
ciBNZWRpYVRlayBNVDgxOTINCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXQ2
NXh4LnR4dCAgICAgICAgIHwgIDEgKw0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMg
ICAgICAgICAgICAgICAgICAgIHwgNzYgKysrKysrKysrKysrKysrLS0tLS0tLQ0KIDIgZmlsZXMg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjE=

