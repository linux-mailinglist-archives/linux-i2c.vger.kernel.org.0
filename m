Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB00317B519
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 04:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgCFDuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 22:50:01 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:64009 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726251AbgCFDuB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 22:50:01 -0500
X-UUID: a36d60c36a8847c7962de5f3bd21e0f5-20200306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U31efjD+lp+hD2jMuGy2h+TErNU3bB4St4r64noK1VU=;
        b=nol7aiN3yv1gTimY87qUQJLwMePD8+8G+qKY0+rBCflaWx81TB58wa9Sbmc+vrJsvusLGQCyt4W6Ln6ZHBxVyq7sWjjdZ7u+kaO6hOHf5RSMekwgJvxC+5MFhVxJB/akjc/Bdeiy2BjCTIVZkXeXfxoe5UTyW3Yy1vr553YIcL0=;
X-UUID: a36d60c36a8847c7962de5f3bd21e0f5-20200306
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 539030844; Fri, 06 Mar 2020 11:49:48 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 11:48:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Mar 2020 11:50:18 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v12 0/2] add power control in i2c and at24
Date:   Fri, 6 Mar 2020 11:49:44 +0800
Message-ID: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWx0aG91Z2ggaW4gdGhlIG1vc3QgcGxhdGZvcm1zLCB0aGUgcG93ZXIgb2YgZWVwcm9tIGFuZCBp
MmMgYXJlIGFsd2F5IG9uLA0Kc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUgZWVwcm9tIGFuZCBp
MmMgcG93ZXIgaW4gb3JkZXIgdG8gbWVldCBsb3cgcG93ZXIgcmVxdWVzdC4NClRoaXMgcGF0Y2gg
YWRkIHRoZSBwbV9ydW50aW1lIG9wcyB0byBjb250cm9sIHBvd2VyIHRvIHN1cHBvcnQgYWxsIHBs
YXRmb3Jtcy4NCg0KQ2hhbmdlcyBzaW5jZSB2MTE6DQogLSB1c2Ugc3VzcGVuZF9sYXRlL3Jlc3Vt
ZV9lYXJseSBpbnN0ZWFkIG9mIHN1c3BlbmQvcmVzdW1lDQogLSByZWJhc2Ugb250byB2NS42LXJj
MQ0KDQpDaGFuZ2VzIHNpbmNlIHYxMDoNCiAtIGZpeHVwIHNvbWUgd29ybmcgY29kZXMNCg0KQ2hh
bmdlcyBzaW5jZSB2OToNCiAtIGZpeHVwIGJ1aWxkIGVycm9yDQogLSByZW1vdmUgcmVkdW5kYW50
IGNvZGUNCg0KQ2hhbmdlcyBzaW5jZSB2ODoNCiAtIGZpeHVwIHNvbWUgd3JvbmcgY29kZQ0KIC0g
cmVtb3ZlIHJlZHVuZGFudCBtZXNzYWdlDQoNCkNoYW5nZXMgc2luY2Ugdjc6DQogLSBhZGQgYmlu
ZGluZyBkZXNjcmliZSBzdXBwbHkgcHJvcGVydHkgaW4gaTJjIGFuZCBhdDI0Lg0KIC0gbW92ZSBp
MmMgYnVzIHN1cHBseSBjb250cm9sIGluIGkyYy1jb3JlLg0KIC0gcmViYXNlIG9udG8gdjUuNS1y
YzENCg0KQ2hhbmdlcyBzaW5jZSB2NjoNCiAtIGFkZCBiYWNrIGVycm9yIGNoZWNrIGZvciBkZXZt
X3JlZ3VsYXRvcl9idWxrX2dldCgpDQoNCiAgICAgICAgWy4uLiBzbmlwIC4uLl0NCg0KQmliYnkg
SHNpZWggKDIpOg0KICBkdC1iaW5kaW5nOiBpMmM6IGFkZCBidXMtc3VwcGx5IHByb3BlcnR5DQog
IGkyYzogY29yZTogc3VwcG9ydCBidXMgcmVndWxhdG9yIGNvbnRyb2xsaW5nIGluIGFkYXB0ZXIN
Cg0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dCB8ICAzICsN
CiBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgICAgICAgICAgICAgICAgICAgfCA4MSArKysr
KysrKysrKysrKysrKysrDQogaW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKw0KIDMgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQ0KDQotLSAN
CjIuMTguMA0K

