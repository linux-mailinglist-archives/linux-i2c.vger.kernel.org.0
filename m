Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECE4382663
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 10:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhEQIN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 04:13:26 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54365 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231919AbhEQIN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 May 2021 04:13:26 -0400
X-UUID: 883adc4170cf43f8a0473e3efb14c757-20210517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zLyMCemFhgBqwL7usnjoYVnjjOx47JZAGAfTiTk0jK0=;
        b=SOhGF5CB8cCEMbD/alFbXeOENjeSw8RaHJnVpmpdCfcENYrzKlS+DjATgqU1VAALHPp1fgHRNWk5tdvlMlaYF1TLxmFD4uzvLPoVjFmkj/79uME+E6UgBAZL9pcVl2ni/rhW3nLt8zUwO3pYjnb2gbaUYlgijNk14hI95HMwwbc=;
X-UUID: 883adc4170cf43f8a0473e3efb14c757-20210517
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 116137431; Mon, 17 May 2021 16:06:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 16:06:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 16:06:53 +0800
Message-ID: <1621238813.24305.5.camel@mhfsdcap03>
Subject: Re: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
From:   Qii Wang <qii.wang@mediatek.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "Bibby Hsieh" <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 17 May 2021 16:06:53 +0800
In-Reply-To: <20210507131406.2224177-4-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
         <20210507131406.2224177-4-hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTA3IGF0IDIxOjE0ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6DQo+
IEFkZCB2YnVzLXN1cHBseSB3aGljaCBwcm92aWRlcyBwb3dlciB0byBTQ0wvU0RBLiBQYXNzIHRo
aXMgcmVndWxhdG9yDQo+IGludG8gY29yZSBzbyBpdCBjYW4gYmUgdHVybmVkIG9uL29mZiBmb3Ig
bG93IHBvd2VyIG1vZGUgc3VwcG9ydC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2Fu
ZyA8aHNpbnlpQGNocm9taXVtLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFFpaSBXYW5nIDxxaWkud2Fu
Z0BtZWRpYXRlay5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gaW5kZXggNWRkZmE0ZTU2ZWUyLi4yMmQxZDE0YjVk
ZTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gKysr
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiBAQCAtMTIyMCw2ICsxMjIwLDEz
IEBAIHN0YXRpYyBpbnQgbXRrX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiAgCWkyYy0+YWRhcC5xdWlya3MgPSBpMmMtPmRldl9jb21wLT5xdWlya3M7DQo+ICAJaTJj
LT5hZGFwLnRpbWVvdXQgPSAyICogSFo7DQo+ICAJaTJjLT5hZGFwLnJldHJpZXMgPSAxOw0KPiAr
CWkyYy0+YWRhcC5idXNfcmVndWxhdG9yID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCZw
ZGV2LT5kZXYsICJ2YnVzIik7DQo+ICsJaWYgKElTX0VSUihpMmMtPmFkYXAuYnVzX3JlZ3VsYXRv
cikpIHsNCj4gKwkJaWYgKFBUUl9FUlIoaTJjLT5hZGFwLmJ1c19yZWd1bGF0b3IpID09IC1FTk9E
RVYpDQo+ICsJCQlpMmMtPmFkYXAuYnVzX3JlZ3VsYXRvciA9IE5VTEw7DQo+ICsJCWVsc2UNCj4g
KwkJCXJldHVybiBQVFJfRVJSKGkyYy0+YWRhcC5idXNfcmVndWxhdG9yKTsNCj4gKwl9DQo+ICAN
Cj4gIAlyZXQgPSBtdGtfaTJjX3BhcnNlX2R0KHBkZXYtPmRldi5vZl9ub2RlLCBpMmMpOw0KPiAg
CWlmIChyZXQpDQoNCg==

