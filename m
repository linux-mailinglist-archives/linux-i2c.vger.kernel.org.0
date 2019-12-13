Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA8D11DF7E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 09:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfLMIcK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 03:32:10 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:46335 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLMIcK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 03:32:10 -0500
X-UUID: 33b50c21a5ff459abc4e50887174a776-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E5GEKeEvN9A2QtZPlbaS/WHghDVbW8YXit4h4vhd5q8=;
        b=s0hdIX/O4/r9AQQCO4xqMIeDaUt3pnoNSe/Tu0bAaFEdJo8fwzt1OQpdFRcxzbgN1TesxLRzjn/75TWTdd0oCyouel4Lc6Jyyb/Y29cAUVEBvltHAyt22AYOsTMDKLiaw5VhjR0gHBV0sxN8NjW4nGqZNryTELpxLd6ycArgEtg=;
X-UUID: 33b50c21a5ff459abc4e50887174a776-20191213
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 230474529; Fri, 13 Dec 2019 00:32:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:12:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 16:11:59 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v8 2/4] dt-binding: i2c: add bus-supply property
Date:   Fri, 13 Dec 2019 16:12:28 +0800
Message-ID: <20191213081230.23494-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
References: <20191213081230.23494-1-bibby.hsieh@mediatek.com>
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
QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLnR4dCB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0DQppbmRleCA5
YTUzZGY0MjQzYzYuLjg5ZDgyNzgwNWU4OSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0DQpAQCAtOTgsNiArOTgsOSBAQCB3YW50cyB0byBzdXBw
b3J0IG9uZSBvZiB0aGUgYmVsb3cgZmVhdHVyZXMsIGl0IHNob3VsZCBhZGFwdCB0aGUgYmluZGlu
Z3MgYmVsb3cuDQogCU5hbWVzIG9mIG1hcCBwcm9ncmFtbWFibGUgYWRkcmVzc2VzLg0KIAlJdCBj
YW4gY29udGFpbiBhbnkgbWFwIG5lZWRpbmcgYW5vdGhlciBhZGRyZXNzIHRoYW4gZGVmYXVsdCBv
bmUuDQogDQorLSBidXMtc3VwcGx5DQorCXBoYW5kbGUgdG8gdGhlIHJlZ3VsYXRvciB0aGF0IHBy
b3ZpZGVzIHBvd2VyIHRvIGkyYy4NCisNCiBCaW5kaW5nIG1heSBjb250YWluIG9wdGlvbmFsICJp
bnRlcnJ1cHRzIiBwcm9wZXJ0eSwgZGVzY3JpYmluZyBpbnRlcnJ1cHRzDQogdXNlZCBieSB0aGUg
ZGV2aWNlLiBJMkMgY29yZSB3aWxsIGFzc2lnbiAiaXJxIiBpbnRlcnJ1cHQgKG9yIHRoZSB2ZXJ5
IGZpcnN0DQogaW50ZXJydXB0IGlmIG5vdCB1c2luZyBpbnRlcnJ1cHQgbmFtZXMpIGFzIHByaW1h
cnkgaW50ZXJydXB0IGZvciB0aGUgc2xhdmUuDQotLSANCjIuMTguMA0K

