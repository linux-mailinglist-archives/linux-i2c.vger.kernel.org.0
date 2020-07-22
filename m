Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DA722984A
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732154AbgGVMdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 08:33:01 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:2726 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728171AbgGVMdB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 08:33:01 -0400
X-UUID: c3d79c3ac96645f2b34415978695cefb-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y0cZt+gBSz7nBT4q4aJcK/JUpj5K4kPkSTxyRBuk+84=;
        b=JAxcXppL3ceJmbacPTlcw8bcjFWX9PUJjxdZxJpOrk4P0Zhp9wro4DZyE819vt4ulIyqzJLJMOELiscXyMMJn6ihbn9s79LdK7f+6Hbp34sjb5O3ESXk2WrAa+olLOi7klgv7DceNBb1lIzUbNzh9oiuqsqeqoqhHtwEXmUnhgo=;
X-UUID: c3d79c3ac96645f2b34415978695cefb-20200722
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2084351255; Wed, 22 Jul 2020 20:32:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:32:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 20:32:53 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>
Subject: [PATCH 0/4] add i2c support for mt8192
Date:   Wed, 22 Jul 2020 20:31:42 +0800
Message-ID: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
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
cGF0Y2hlcw0KdG8gc3VwcG9ydCBtdDgxOTIgU29DLg0KDQpRaWkgV2FuZyAoNCk6DQogIGkyYzog
bWVkaWF0ZWs6IEFkZCBhcGRtYSBzeW5jIGluIGkyYyBkcml2ZXINCiAgaTJjOiBtZWRpYXRlazog
U3VwcG9ydCBETUEgbWFzayByYW5nZSBvdmVyIDMzLWJpdHMNCiAgZHQtYmluZGluZ3M6IGkyYzog
dXBkYXRlIGJpbmRpbmdzIGZvciBNVDgxOTIgU29DDQogIGkyYzogbWVkaWF0ZWs6IEFkZCBpMmMg
Y29tcGF0aWJsZSBmb3IgTWVkaWFUZWsgTVQ4MTkyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvaTJjLW10NjV4eC50eHQgICAgICAgICB8ICAxICsNCiBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW10NjV4eC5jICAgICAgICAgICAgICAgICAgICB8IDc1ICsrKysrKysrKysrKysrKy0tLS0t
LS0NCiAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0K
DQotLQ0KMS45LjENCg0K

