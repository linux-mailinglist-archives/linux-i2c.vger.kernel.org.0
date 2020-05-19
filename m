Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000011D90FF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 09:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbgESH1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 03:27:35 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39888 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728260AbgESH1f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 03:27:35 -0400
X-UUID: 2cdaba5490ef44d9a1fd8622530393cf-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JDQwDAEQwbzTq5EcThWsjsdEJ6pQB8sVA8AIJClJK6Y=;
        b=EJ0bZmQouVNXefQen0Mcp7mPOejPjWEKwBGUfcPbgTvu4pU8zEBbf6GWxdRe7pUy4ZB7feNQoQY2TzxlLZ677AkEQoGJUEKNODO3anHrCQwfJTNky80lxCXrYmBNIzLLgyrmBHZvm7C/VgbMC0xWdfiHRhSMkULUQQZP6GVxZ/w=;
X-UUID: 2cdaba5490ef44d9a1fd8622530393cf-20200519
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 628450960; Tue, 19 May 2020 15:27:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v15 1/2] dt-binding: i2c: add bus-supply property
Date:   Tue, 19 May 2020 15:27:28 +0800
Message-ID: <20200519072729.7268-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SW4gc29tZSBwbGF0Zm9ybXMsIHRoZXkgZGlzYWJsZSB0aGUgcG93ZXItc3VwcGx5IG9mIGkyYyBk
dWUNCnRvIHBvd2VyIGNvbnN1bXB0aW9uIHJlZHVjdGlvbi4gVGhpcyBwYXRjaCBhZGQgYnVzLXN1
cHBseSBwcm9wZXJ0eS4NCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVo
QG1lZGlhdGVrLmNvbT4NCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
LS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0IHwgMyAr
KysNCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQNCmluZGV4IDlhNTNkZjQyNDNjNi4uZTZi
NWFhZmM1ZGM5IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kyYy9pMmMudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy50eHQNCkBAIC05OCw2ICs5OCw5IEBAIHdhbnRzIHRvIHN1cHBvcnQgb25lIG9mIHRoZSBi
ZWxvdyBmZWF0dXJlcywgaXQgc2hvdWxkIGFkYXB0IHRoZSBiaW5kaW5ncyBiZWxvdy4NCiAJTmFt
ZXMgb2YgbWFwIHByb2dyYW1tYWJsZSBhZGRyZXNzZXMuDQogCUl0IGNhbiBjb250YWluIGFueSBt
YXAgbmVlZGluZyBhbm90aGVyIGFkZHJlc3MgdGhhbiBkZWZhdWx0IG9uZS4NCiANCistIGJ1cy1z
dXBwbHkNCisJcGhhbmRsZSB0byB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG93ZXIgdG8g
U0NML1NEQS4NCisNCiBCaW5kaW5nIG1heSBjb250YWluIG9wdGlvbmFsICJpbnRlcnJ1cHRzIiBw
cm9wZXJ0eSwgZGVzY3JpYmluZyBpbnRlcnJ1cHRzDQogdXNlZCBieSB0aGUgZGV2aWNlLiBJMkMg
Y29yZSB3aWxsIGFzc2lnbiAiaXJxIiBpbnRlcnJ1cHQgKG9yIHRoZSB2ZXJ5IGZpcnN0DQogaW50
ZXJydXB0IGlmIG5vdCB1c2luZyBpbnRlcnJ1cHQgbmFtZXMpIGFzIHByaW1hcnkgaW50ZXJydXB0
IGZvciB0aGUgc2xhdmUuDQotLSANCjIuMTguMA0K

