Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7D811FF5B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfLPIE4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:04:56 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:44218 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726730AbfLPIEz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:04:55 -0500
X-UUID: 56e57f349beb4683b05ad0bb6a7846d1-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=82ESi6iY1tfeizYCebSWspq8FkC9BPXlTu8jQJs9eog=;
        b=BaFq03J+NvBOFysstdQDfAEjRM28Td2XgtGq5uaj1l9cNA3GhIzYtkHWEn/Nlv5h6DWVhvhVr1CcT5Vi9Li7LNHhTZv1GZ7UzXnqK+DfZ1vqqWR9Js8ZHvkK0aLlYq1pyoaGY2DUH+Xk7rIYrL/jWthHo2LENuBSjueC/ysoBAw=;
X-UUID: 56e57f349beb4683b05ad0bb6a7846d1-20191216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 289590106; Mon, 16 Dec 2019 16:04:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 16:04:29 +0800
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
Subject: [PATCH v9 0/4] add power control in i2c and at24
Date:   Mon, 16 Dec 2019 16:04:41 +0800
Message-ID: <20191216080445.8747-1-bibby.hsieh@mediatek.com>
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
MmMNCmFyZSBhbHdheSBvbiwgc29tZSBwbGF0Zm9ybXMgZGlzYWJsZSB0aGUgZWVwcm9tIGFuZCBp
MmMgcG93ZXINCmluIG9yZGVyIHRvIG1lZXQgbG93IHBvd2VyIHJlcXVlc3QuDQpUaGlzIHBhdGNo
IGFkZCB0aGUgcG1fcnVudGltZSBvcHMgdG8gY29udHJvbCBwb3dlciB0byBzdXBwb3J0DQphbGwg
cGxhdGZvcm1zLg0KDQpDaGFuZ2VzIHNpbmNlIHY4Og0KIC0gZml4dXAgc29tZSB3cm9uZyBjb2Rl
DQogLSByZW1vdmUgcmVkdW5kYW50IG1lc3NhZ2UNCg0KQ2hhbmdlcyBzaW5jZSB2NzoNCiAtIGFk
ZCBiaW5kaW5nIGRlc2NyaWJlIHN1cHBseSBwcm9wZXJ0eSBpbiBpMmMgYW5kIGF0MjQuDQogLSBt
b3ZlIGkyYyBidXMgc3VwcGx5IGNvbnRyb2wgaW4gaTJjLWNvcmUuDQogLSByZWJhc2Ugb250byB2
NS41LXJjMQ0KDQpDaGFuZ2VzIHNpbmNlIHY2Og0KIC0gYWRkIGJhY2sgZXJyb3IgY2hlY2sgZm9y
IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KCkNCg0KQ2hhbmdlcyBzaW5jZSB2NToNCiAtIHJlbW92
ZSBoYXNfc3VwcGxpZXMNCg0KQ2hhbmdlcyBzaW5jZSB2NDoNCiAtIGFkZCBzeXN0ZW0gc2xlZXAg
UE0gb3BzDQogLSBtb3ZlIHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUgYmVmb3JlIHN1c3BlbmQoKQ0K
IC0gZml4ZXMgZXJyb3IgaGFuZGxpbmcNCg0KQ2hhbmdlcyBzaW5jZSB2MzoNCiAtIHJlbW92ZSBy
ZWR1bmRhbnQgY2FsbGluZyBmdW5jdGlvbg0KIC0gY2hhbmdlIFNJTVBMRV9ERVZfUE1fT1BTIHRv
IFNFVF9SVU5USU1FX1BNX09QUw0KIC0gY2hhbmdlIHN1cHBseSBuYW1lDQoNCkNoYW5nZXMgc2lu
Y2UgdjI6DQogLSByZWJhc2Ugb250byB2NS40LXJjMQ0KIC0gcG1fcnVudGltZV9kaXNhYmxlIGFu
ZCByZWd1bGF0b3JfYnVsa19kaXNhYmxlIGF0DQogICBlcnIgcmV0dXJuIGluIHByb2JlIGZ1bmN0
aW9uDQoNCkNoYW5nZXMgc2luY2UgdjE6DQogLSByZW1vdmUgcmVkdW5kYW50IGNvZGUNCiAtIGZp
eHVwIGNvZGluZyBzdHlsZQ0KDQpCaWJieSBIc2llaCAoNCk6DQogIGR0LWJpbmRpbmc6IGVlcHJv
bTogYXQyNDogYWRkIHZjYy1zdXBwbHkgcHJvcGVydHkNCiAgZHQtYmluZGluZzogaTJjOiBhZGQg
YnVzLXN1cHBseSBwcm9wZXJ0eQ0KICBtaXNjOiBlZXByb206IGF0MjQ6IHN1cHBvcnQgcG1fcnVu
dGltZSBjb250cm9sDQogIGkyYzogY29yZTogc3VwcG9ydCBidXMgcmVndWxhdG9yIGNvbnRyb2xs
aW5nIGluIGFkYXB0ZXINCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0Lnlh
bWwgICAgICB8ICA0ICsrDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9p
MmMudHh0IHwgIDMgKw0KIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyAgICAgICAgICAgICAg
ICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQu
YyAgICAgICAgICAgICAgICAgICAgfCAzOCArKysrKysrKysrKw0KIGluY2x1ZGUvbGludXgvaTJj
LmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsNCiA1IGZpbGVzIGNoYW5nZWQsIDEx
MyBpbnNlcnRpb25zKCspDQoNCi0tIA0KMi4xOC4wDQo=

