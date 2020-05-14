Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686231D30BE
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 15:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgENNMj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 09:12:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53544 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726037AbgENNMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 09:12:38 -0400
X-UUID: f5a8488ffbfc49c2948a5b3d4c07ca61-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cuoKK6jhD7pvYpNhFVneYUDj8vLgMGJ953l7rb/BFcs=;
        b=HjgMEGbvjGpUW/h1Yz5cFynS45sP70gYsnAg2cxOYhynHKFxg55dXuL324N7PEzs75rSL12cw3bYi74IhEC+ypu/GTrl2YT9s8cRDLnng0U4/DpWLW68MEytw2yICs36xl4RbWnOxpLcLui3X4EipiAKsr7r/IKHcpa4+nNiJ/0=;
X-UUID: f5a8488ffbfc49c2948a5b3d4c07ca61-20200514
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 354353475; Thu, 14 May 2020 21:12:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 21:12:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 21:12:29 +0800
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>
Subject: [PATCH v2 0/2] Add i2c ac-timing adjust support
Date:   Thu, 14 May 2020 21:09:03 +0800
Message-ID: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhpcyBzZXJpZXMgYXJlIGJhc2VkIG9uIDUuNy1yYzEsIHdlIHByb3ZpZGUgdHdvIHBhdGNoZXMg
dG8gc3VwcG9ydCBpMmMgYWMtdGltaW5nLg0KDQpNYWluIGNoYW5nZXMgY29tcGFyZWQgdG8gdjE6
DQotLWFkZCBtYWludGFpbmVyIGZvciBtZWRpYXRlayBpMmMgY29udHJvbGxlciBkcml2ZXINCi0t
Zml4IHdhcm5pbmcgb2Ygc2VsZi1hc3NpZ25tZW50DQoNClFpaSBXYW5nICgyKToNCiAgTUFJTlRB
SU5FUlM6IGFkZCBtYWludGFpbmVyIGZvciBtZWRpYXRlayBpMmMgY29udHJvbGxlciBkcml2ZXIN
CiAgaTJjOiBtZWRpYXRlazogQWRkIGkyYyBhYy10aW1pbmcgYWRqdXN0IHN1cHBvcnQNCg0KIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKw0KIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMgfCAzMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMjg0IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygt
KQ0KDQotLQ0KMS45LjENCg0K

