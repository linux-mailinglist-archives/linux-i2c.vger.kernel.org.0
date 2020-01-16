Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A6B13D25D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 03:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgAPC4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 21:56:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:7583 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729025AbgAPC4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jan 2020 21:56:45 -0500
X-UUID: 614c1596f1c14bb8b6956f812ec76900-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=45DCbPzcTuD0FEQds0qb4eJ94Rut3//MeZj1K3bhWj8=;
        b=X9FqOANyp9LvnN4U7TxR+lpJdYRK6VlIPfqlgFDh5ZdjTJr4RariZIeRVv8ADGl2APGIl6KJ2wM+zZBXFGp59W4qxuiPsS5L7Gwq2uL4+TReCMsv4CjfZe7gnW7bnxjqaAkJmiST/SkIizVBTdx+PyijwqdLB8mAgrdt8L62fd0=;
X-UUID: 614c1596f1c14bb8b6956f812ec76900-20200116
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1959894609; Thu, 16 Jan 2020 10:56:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 10:56:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 10:57:26 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v10 2/4] dt-binding: i2c: add bus-supply property
Date:   Thu, 16 Jan 2020 10:56:35 +0800
Message-ID: <20200116025637.3524-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
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

