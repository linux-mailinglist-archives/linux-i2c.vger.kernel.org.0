Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101B63F2465
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Aug 2021 03:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbhHTBrC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Aug 2021 21:47:02 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49124 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234982AbhHTBrC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Aug 2021 21:47:02 -0400
X-UUID: 1b052dc1b9f24724b0bf9b94687e961c-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=f4hvDwhqEUNQqaUdzqx9Yg5oEvR9HIx5XMJ/rdqRR2w=;
        b=VGBxY/6x8ycuVB2327rygw0KcXC21uwuw/dZ8YOHRfv579FSMDw2bOB/Q1j6HIFFfGBovFUIXe35sXZVVmzu2VRgJbqRJJxKqi5TfeU9XR+DrGM8X0FlHX1pdhFAQoZwA9V85YgZ5xoJrnDp83FyoA/SzTZwX5AYWFg0JDnJbaE=;
X-UUID: 1b052dc1b9f24724b0bf9b94687e961c-20210820
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1077654711; Fri, 20 Aug 2021 09:46:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 20 Aug
 2021 09:46:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 09:46:21 +0800
Message-ID: <1629423981.19334.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-i2c@vger.kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Fri, 20 Aug 2021 09:46:21 +0800
In-Reply-To: <YRwXZVxORTpddj2k@kunai>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
         <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru> <YRwXZVxORTpddj2k@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA4LTE3IGF0IDIyOjA5ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIFN1biwgSnVsIDA0LCAyMDIxIGF0IDA1OjM4OjQ1UE0gKzAzMDAsIFNlcmdleSBTaHR5bHlv
diB3cm90ZToNCj4gPiBJZmYgcGxhdGZvcm1fZ2V0X2lycSgpIHJldHVybnMgMCwgdGhlIGRyaXZl
cidzIHByb2JlKCkgbWV0aG9kIHdpbGwgcmV0dXJuIDANCj4gPiBlYXJseSAoYXMgaWYgdGhlIG1l
dGhvZCdzIGNhbGwgd2FzIHN1Y2Nlc3NmdWwpLiAgTGV0J3MgY29uc2lkZXIgSVJRMCB2YWxpZA0K
PiA+IGZvciBzaW1wbGljaXR5IC0tIGRldm1fcmVxdWVzdF9pcnEoKSBjYW4gYWx3YXlzIG92ZXJy
aWRlIHRoYXQgZGVjaXNpb24uLi4NCj4gPiANCj4gPiBGaXhlczogY2UzODgxNWQzOWVhICgiSTJD
OiBtZWRpYXRlazogQWRkIGRyaXZlciBmb3IgTWVkaWFUZWsgSTJDIGNvbnRyb2xsZXIiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXBydXNzaWEucnU+
DQo+IA0KPiBRaWkgV2FuZywgZG8geW91IGxpa2UgdGhpcyBwYXRjaD8NCj4gDQoNCkl0IGlzIG9r
Lg0KUmV2aWV3ZWQtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQoNClRoYW5r
cw0KDQo+ID4gDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMg
fCAgICAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiA+IA0KPiA+IEluZGV4OiBsaW51eC9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jDQo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPiA+IC0tLSBsaW51eC5vcmlnL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMNCj4gPiArKysgbGludXgvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1
eHguYw0KPiA+IEBAIC0xMjExLDcgKzEyMTEsNyBAQCBzdGF0aWMgaW50IG10a19pMmNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtDQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoaTJjLT5wZG1hYmFzZSk7DQo+
ID4gIA0KPiA+ICAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gPiAtCWlmIChp
cnEgPD0gMCkNCj4gPiArCWlmIChpcnEgPCAwKQ0KPiA+ICAJCXJldHVybiBpcnE7DQo+ID4gIA0K
PiA+ICAJaW5pdF9jb21wbGV0aW9uKCZpMmMtPm1zZ19jb21wbGV0ZSk7DQoNCg==

