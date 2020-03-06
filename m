Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB32117B51C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 04:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCFDuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 22:50:01 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:31167 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726317AbgCFDuB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 22:50:01 -0500
X-UUID: 0d25e671cb0641578d475ef75d6700b1-20200306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=45DCbPzcTuD0FEQds0qb4eJ94Rut3//MeZj1K3bhWj8=;
        b=Rgtcp3qz+oBTgVCDb143ra96TpmmoF30FAcNgcB3JhquOnyXJw42JXleyaCJ3ZiBwNndthv0HFaKwa92flvwSL0UuNqgbohWY/r7yQsKjFklk4G8Ia7mdsGEDLE8PLANWnsWCGVwxkpsfMjwnqXlnp0qf2joBV7LGfzOxiSQWmE=;
X-UUID: 0d25e671cb0641578d475ef75d6700b1-20200306
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1924687399; Fri, 06 Mar 2020 11:49:49 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 11:48:52 +0800
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
Subject: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
Date:   Fri, 6 Mar 2020 11:49:45 +0800
Message-ID: <20200306034946.11223-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
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
QG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0IHwg
MyArKysNCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQNCmluZGV4IDlhNTNkZjQyNDNjNi4u
ODlkODI3ODA1ZTg5IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9pMmMudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2kyYy50eHQNCkBAIC05OCw2ICs5OCw5IEBAIHdhbnRzIHRvIHN1cHBvcnQgb25lIG9mIHRo
ZSBiZWxvdyBmZWF0dXJlcywgaXQgc2hvdWxkIGFkYXB0IHRoZSBiaW5kaW5ncyBiZWxvdy4NCiAJ
TmFtZXMgb2YgbWFwIHByb2dyYW1tYWJsZSBhZGRyZXNzZXMuDQogCUl0IGNhbiBjb250YWluIGFu
eSBtYXAgbmVlZGluZyBhbm90aGVyIGFkZHJlc3MgdGhhbiBkZWZhdWx0IG9uZS4NCiANCistIGJ1
cy1zdXBwbHkNCisJcGhhbmRsZSB0byB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG93ZXIg
dG8gaTJjLg0KKw0KIEJpbmRpbmcgbWF5IGNvbnRhaW4gb3B0aW9uYWwgImludGVycnVwdHMiIHBy
b3BlcnR5LCBkZXNjcmliaW5nIGludGVycnVwdHMNCiB1c2VkIGJ5IHRoZSBkZXZpY2UuIEkyQyBj
b3JlIHdpbGwgYXNzaWduICJpcnEiIGludGVycnVwdCAob3IgdGhlIHZlcnkgZmlyc3QNCiBpbnRl
cnJ1cHQgaWYgbm90IHVzaW5nIGludGVycnVwdCBuYW1lcykgYXMgcHJpbWFyeSBpbnRlcnJ1cHQg
Zm9yIHRoZSBzbGF2ZS4NCi0tIA0KMi4xOC4wDQo=

