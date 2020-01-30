Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182B714D5E2
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 06:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgA3FLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 00:11:37 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:43143 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725869AbgA3FLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jan 2020 00:11:37 -0500
X-UUID: b734659fce8840c2b6c4b59c4d42eff4-20200130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=A6mlTIyU1cIthUpW7Hgoj/GGfwkdoCsA2KkAO/ulsKc=;
        b=CDzuA/LGa5+YTOOiVde0il0n1znEktZ7E8EyzNYWa8BDcPyMo1q3EWGeC9VhcPeYpryPrgQOsm+pd8kTZeUjsQNsegq7AUkAeh1JwSoBX6fQYLNANTfjkrKyiRNKOskYl8s/fRLq7yKD9ckpl3gJn/BO7NzJeFjGQGiCKpDZHfA=;
X-UUID: b734659fce8840c2b6c4b59c4d42eff4-20200130
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 808809328; Thu, 30 Jan 2020 13:11:31 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 Jan 2020 13:10:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 Jan 2020 13:11:33 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v11 0/2] add power control in i2c and at24
Date:   Thu, 30 Jan 2020 13:11:26 +0800
Message-ID: <20200130051128.14878-1-bibby.hsieh@mediatek.com>
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
YXRmb3Jtcy4NCg0KQ2hhbmdlcyBzaW5jZSB2MTA6DQogLSBmaXh1cCBzb21lIHdvcm5nIGNvZGVz
DQoNCkNoYW5nZXMgc2luY2Ugdjk6DQogLSBmaXh1cCBidWlsZCBlcnJvcg0KIC0gcmVtb3ZlIHJl
ZHVuZGFudCBjb2RlDQoNCkNoYW5nZXMgc2luY2Ugdjg6DQogLSBmaXh1cCBzb21lIHdyb25nIGNv
ZGUNCiAtIHJlbW92ZSByZWR1bmRhbnQgbWVzc2FnZQ0KDQpDaGFuZ2VzIHNpbmNlIHY3Og0KIC0g
YWRkIGJpbmRpbmcgZGVzY3JpYmUgc3VwcGx5IHByb3BlcnR5IGluIGkyYyBhbmQgYXQyNC4NCiAt
IG1vdmUgaTJjIGJ1cyBzdXBwbHkgY29udHJvbCBpbiBpMmMtY29yZS4NCiAtIHJlYmFzZSBvbnRv
IHY1LjUtcmMxDQoNCkNoYW5nZXMgc2luY2UgdjY6DQogLSBhZGQgYmFjayBlcnJvciBjaGVjayBm
b3IgZGV2bV9yZWd1bGF0b3JfYnVsa19nZXQoKQ0KDQogICAgICAgIFsuLi4gc25pcCAuLi5dDQoN
CkJpYmJ5IEhzaWVoICgyKToNCiAgZHQtYmluZGluZzogaTJjOiBhZGQgYnVzLXN1cHBseSBwcm9w
ZXJ0eQ0KICBpMmM6IGNvcmU6IHN1cHBvcnQgYnVzIHJlZ3VsYXRvciBjb250cm9sbGluZyBpbiBh
ZGFwdGVyDQoNCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQg
fCAgMyArDQogZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAgICAgICAgIHwg
ODEgKysrKysrKysrKysrKysrKysrKw0KIGluY2x1ZGUvbGludXgvaTJjLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICsNCiAzIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKykN
Cg0KLS0gDQoyLjE4LjANCg==

