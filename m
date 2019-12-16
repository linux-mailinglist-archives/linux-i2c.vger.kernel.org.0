Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB8911FF57
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfLPIEx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:04:53 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:64549 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726730AbfLPIEx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:04:53 -0500
X-UUID: b70c91e8a88c4dd3816cdee682b9e289-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l3wpXk/uhyCXKXXtWKjWF1p9bNTWnEdUHRhkP+uqsEM=;
        b=Sg7uv+2VNDVQjYAur6No++lexFg6aF27FCEnvn4KLdH0FhSf59WiNadIA2/2TRazyc2UaPxwkTAFN1dH0FWUgu3dz/B7DFE/LW9fwlzaBMHu0WxFwBR0fTvglRayO5cBpdeceWevwSb5TKJdUwiWHPJC/GvkXJAWfQIIcxGWoUY=;
X-UUID: b70c91e8a88c4dd3816cdee682b9e289-20191216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 220644341; Mon, 16 Dec 2019 16:04:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 16:04:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 16:04:28 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v9 1/4] dt-binding: eeprom: at24: add vcc-supply property
Date:   Mon, 16 Dec 2019 16:04:42 +0800
Message-ID: <20191216080445.8747-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SW4gc29tZSBwbGF0Zm9ybXMsIHRoZXkgZGlzYWJsZSB0aGUgcG93ZXItc3VwcGx5IG9mIGVlcHJv
bSBkdWUNCnRvIHBvd2VyIGNvbnN1bXB0aW9uIHJlZHVjdGlvbi4gVGhpcyBwYXRjaCBhZGQgdmNj
LXN1cHBseSBwcm9wZXJ0eS4NCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5Lmhz
aWVoQG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0
LnlhbWwgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1sDQpp
bmRleCBlODc3ODU2MGQ5NjYuLmMwNGEzYjhhNmViYSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1sDQorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KQEAgLTE2Nyw2ICsxNjcs
MTAgQEAgcHJvcGVydGllczoNCiAgICAgbWluaW11bTogMQ0KICAgICBtYXhpbXVtOiA4DQogDQor
ICB2Y2Mtc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBwaGFuZGxlIG9mIHRoZSBy
ZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IHZvbHRhZ2UuDQorDQogcmVxdWlyZWQ6
DQogICAtIGNvbXBhdGlibGUNCiAgIC0gcmVnDQotLSANCjIuMTguMA0K

