Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC0622A72A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 08:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgGWGEk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 02:04:40 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:23623 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725536AbgGWGEk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 02:04:40 -0400
X-UUID: 04843e8a70dc46968d560848381cdb10-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=iZ9yK+S9kB96ZqeDW7h02ziiSCDTyDczQRrti5SX7zw=;
        b=c0Fsw8o9Y0LitexrQ6u+NAbfciXPCIQX5XkggI8FYKFGoHi8AbUUdIwAOxjySwXhw5FrTgv3bakJNJ2kChDblIOfiz37jVs4j1he+7eUf8Uogwlj5w7Z0BtwC2Ai5AhM2BUPYbyoGw89cPZgeAoXD5UJd8YdHEP58Hx9WhJEb0s=;
X-UUID: 04843e8a70dc46968d560848381cdb10-20200723
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 760264497; Thu, 23 Jul 2020 14:04:34 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 23 Jul
 2020 14:04:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 14:04:33 +0800
Message-ID: <1595484205.16079.28.camel@mhfsdcap03>
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
From:   Qii Wang <qii.wang@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
CC:     <wsa@the-dreams.de>, <qiangming.xia@mediatek.com>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 23 Jul 2020 14:03:25 +0800
In-Reply-To: <1595467461.7332.3.camel@mtksdaap41>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
         <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
         <1595467461.7332.3.camel@mtksdaap41>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0187662DA839AB3AB988161E5738441024327E1EEDC636DD4CFA77ABBB887D0E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIwLTA3LTIzIGF0IDA5OjI0ICswODAwLCBZaW5nam9lIENoZW4gd3JvdGU6DQo+
IE9uIFdlZCwgMjAyMC0wNy0yMiBhdCAyMDozMSArMDgwMCwgUWlpIFdhbmcgd3JvdGU6DQo+ID4g
UmVwbGFjZSAnc3VwcG9ydF8zM2JpdHMgd2l0aCAnZG1hX21heF9zdXBwb3J0JyBmb3IgRE1BIG1h
c2sNCj4gPiBvcGVyYXRpb24sIGFuZCByZXBsYWNlICdtdGtfaTJjX3NldF80Z19tb2RlJyB3aXRo
ICd1cHBlcl8zMl9iaXRzJy4NCj4gDQo+IFRoaXMgZG9lc24ndCBleHBsYWluIHdoeSB3ZSBuZWVk
IHRoaXMgcGF0Y2guIEhvdyBhYm91dDoNCj4gDQo+IE5ld2VyIE1USyBjaGlwIHN1cHBvcnQgbW9y
ZSB0aGFuIDhHQiBvZiBkcmFtLiBSZXBsYWNlIHN1cHBvcnRfMzNiaXRzDQo+IHdpdGggbW9yZSBn
ZW5lcmFsIGRtYV9tYXhfc3VwcG9ydC4NCj4gDQoNCm9rLCBUaGFua3MgZm9yIHlvdXIgY29tbWVu
dHMuDQoNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHgu
YyB8IDM3ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IGluZGV4IGU2Yjk4NGEuLmU0NzU4NzcgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+ICsrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiBAQCAtMjA5LDYgKzIwOSw3IEBAIHN0cnVj
dCBtdGtfaTJjX2NvbXBhdGlibGUgew0KPiA+ICAJdW5zaWduZWQgY2hhciBkbWFfc3luYzogMTsN
Cj4gPiAgCXVuc2lnbmVkIGNoYXIgbHRpbWluZ19hZGp1c3Q6IDE7DQo+ID4gIAl1bnNpZ25lZCBj
aGFyIGFwZG1hX3N5bmM6IDE7DQo+ID4gKwl1bnNpZ25lZCBjaGFyIG1heF9kbWFfc3VwcG9ydDsN
Cj4gDQo+IHN1cHBvcnRfMzNiaXRzIGlzIG5vIGxvbmdlciB1c2VkLiBQbGVhc2UgcmVtb3ZlIGl0
Lg0KPiANCj4gSm9lLkMNCj4gDQoNCm9rLg0KDQo+IA0KDQo=

