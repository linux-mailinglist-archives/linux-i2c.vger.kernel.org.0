Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC29511DF6E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 09:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLMI2M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 03:28:12 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:43061 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfLMI2M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 03:28:12 -0500
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Dec 2019 03:28:12 EST
X-UUID: 425eee7b289e4ba7baaa4aa69af65b43-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+KPNy9/cU+5SN/+7zoOMUnEeZZpK9gLU/11k+ElV9RA=;
        b=Zo2ML5Imf39fIUsZWtaSnPgWilPy9zy1k1ND2mUNnkWyURHqW7nJj6RdmU1OQ7R4ZOewsN7/WZHOv0Q5nhDWhmLz9IX+rLCRU3Y3Bo1NnJ0SPZzmrOW9DiVj7cdRz+OJqy/hi+PdDlsQs4mX+OCNmjEIt+wqw+EKQMYmEgo9C+0=;
X-UUID: 425eee7b289e4ba7baaa4aa69af65b43-20191213
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 516883074; Fri, 13 Dec 2019 00:23:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:12:07 +0800
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
Subject: [PATCH v8 1/4] dt-binding: eeprom: at24: add vcc-supply property
Date:   Fri, 13 Dec 2019 16:12:27 +0800
Message-ID: <20191213081230.23494-2-bibby.hsieh@mediatek.com>
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

SW4gc29tZSBwbGF0Zm9ybXMsIHRoZXkgZGlzYWJsZSB0aGUgcG93ZXItc3VwcGx5IG9mIGVlcHJv
bSBkdWUNCnRvIHBvd2VyIGNvbnN1bXB0aW9uIHJlZHVjdGlvbi4gVGhpcyBwYXRjaCBhZGQgdmNj
LXN1cHBseSBwcm9wZXJ0eS4NCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5Lmhz
aWVoQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9lZXByb20vYXQyNC55YW1sIHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Vl
cHJvbS9hdDI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9t
L2F0MjQueWFtbA0KaW5kZXggZTg3Nzg1NjBkOTY2Li5jMDRhM2I4YTZlYmEgMTAwNjQ0DQotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0LnlhbWwNCkBA
IC0xNjcsNiArMTY3LDEwIEBAIHByb3BlcnRpZXM6DQogICAgIG1pbmltdW06IDENCiAgICAgbWF4
aW11bTogOA0KIA0KKyAgdmNjLXN1cHBseToNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgcGhh
bmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2b2x0YWdlLg0K
Kw0KIHJlcXVpcmVkOg0KICAgLSBjb21wYXRpYmxlDQogICAtIHJlZw0KLS0gDQoyLjE4LjANCg==

