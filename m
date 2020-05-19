Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA141D9102
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 09:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgESH1g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 03:27:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:7703 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728260AbgESH1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 03:27:36 -0400
X-UUID: adc4f696b1e14d8c9ba15a5079358734-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oL98Zf59wkfDwYkcc8w6kchhj2fMFqBNES4Jw/XRS64=;
        b=mcKuya/cFyHat3GURRzodusHocyUQoxchLr7i7/ua17hqQ2a8XGm6GObL5MyGqMEKuApDJvt00OST2qc1Wd5VA2hGYaxghevS1qtw0gMAA8k+kf4+MIaoT86vFYQthuFEU1WOlTzpjqksXCsSV95fcCSAqFh96hAeEEFKtfU5MA=;
X-UUID: adc4f696b1e14d8c9ba15a5079358734-20200519
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2059660591; Tue, 19 May 2020 15:27:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 15:27:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 15:27:30 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v15 0/2]  add power control in i2c
Date:   Tue, 19 May 2020 15:27:27 +0800
Message-ID: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tDQphbmQg
aTJjIGFyZSBhbHdheSBvbiwgc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUNCmVlcHJvbSBhbmQg
aTJjIHBvd2VyIGluIG9yZGVyIHRvIG1lZXQgbG93IHBvd2VyIHJlcXVlc3QuDQoNClRoaXMgcGF0
Y2ggYWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBjb250cm9sIHBvd2VyIHRvDQpzdXBwb3J0IGFs
bCBwbGF0Zm9ybXMuDQoNCkNoYW5nZXMgc2luY2UgdjE0Og0KIC0gY2hhbmdlIHRoZSByZXR1cm4g
dmFsdWUgaW4gbm9ybWFsIGNvbmRpdGlvbg0KIC0gYWNjZXNzIHRoZSB2YXJpYWJsZSBhZnRlciBO
VUxMIHBvaW50ZXIgY2hlY2tpbmcNCiAtIGFkZCBhY2sgdGFnDQoNCkNoYW5nZXMgc2luY2UgdjEz
Og0KIC0gZml4dXAgc29tZSBsb2dpYyBlcnJvcg0KDQpDaGFuZ2VzIHNpbmNlIHYxMjoNCiAtIHJl
YmFzZSBvbnRvIHY1LjctcmMxDQogLSBjaGFuZ2UgdGhlIHByb3BlcnR5IGRlc2NyaXB0aW9uIGlu
IGJpbmRpbmcNCg0KQ2hhbmdlcyBzaW5jZSB2MTE6DQogLSB1c2Ugc3VzcGVuZF9sYXRlL3Jlc3Vt
ZV9lYXJseSBpbnN0ZWFkIG9mIHN1c3BlbmQvcmVzdW1lDQogLSByZWJhc2Ugb250byB2NS42LXJj
MQ0KDQpDaGFuZ2VzIHNpbmNlIHYxMDoNCiAtIGZpeHVwIHNvbWUgd29ybmcgY29kZXMNCg0KQ2hh
bmdlcyBzaW5jZSB2OToNCiAtIGZpeHVwIGJ1aWxkIGVycm9yDQogLSByZW1vdmUgcmVkdW5kYW50
IGNvZGUNCg0KQ2hhbmdlcyBzaW5jZSB2ODoNCiAtIGZpeHVwIHNvbWUgd3JvbmcgY29kZQ0KIC0g
cmVtb3ZlIHJlZHVuZGFudCBtZXNzYWdlDQoNCiAgICAgICAgWy4uLiBzbmlwIC4uLl0NCg0KQmli
YnkgSHNpZWggKDIpOg0KICBkdC1iaW5kaW5nOiBpMmM6IGFkZCBidXMtc3VwcGx5IHByb3BlcnR5
DQogIGkyYzogY29yZTogc3VwcG9ydCBidXMgcmVndWxhdG9yIGNvbnRyb2xsaW5nIGluIGFkYXB0
ZXINCg0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dCB8ICAz
ICsNCiBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgICAgICAgICAgICAgICAgICAgfCA4NCAr
KysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKw0KIDMgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQ0KDQot
LSANCjIuMTguMA0K

