Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AC4393B19
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 03:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhE1Bjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 21:39:37 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:22752 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235261AbhE1Bjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 21:39:37 -0400
X-UUID: 7b26f5ce6a954f25a6648383fa9a9afd-20210528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QrMvjMYFuFTBM7jcmVcI5ahKgZpshwo6hK1fPt+ufjM=;
        b=NAq1XEIsRLdtTozLuVHBidYlRLOrat91FHocM0dm3LOwLngY8PpG7LoWVjW+cDgHOT5+W/1iges3hYSWWxCtRAYzXLtxvGBSxZ3mQ2j33hT66spPQsWeZVG8fTrlr9+gtCnFVtC9WTIft+pHiT+xL9iTKS1G2BWPfMyxob8iqvk=;
X-UUID: 7b26f5ce6a954f25a6648383fa9a9afd-20210528
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1279760548; Fri, 28 May 2021 09:37:54 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 09:37:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 09:37:43 +0800
Message-ID: <1622165863.15667.3.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Fri, 28 May 2021 09:37:43 +0800
In-Reply-To: <YK/9wMhoACc0beN/@kunai>
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
         <YK/9wMhoACc0beN/@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E88BF11A0816A7B0929EAA4BD18F0349C9EDA1B743732DD7FA01BC962629EE32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIxLTA1LTI3IGF0IDIyOjE0ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIFRodSwgTWF5IDI3LCAyMDIxIGF0IDA4OjA0OjA0UE0gKzA4MDAsIHFpaS53YW5nQG1lZGlh
dGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29t
Pg0KPiA+IA0KPiA+IFRoZSBpMmMgY29udHJvbGxlciBkcml2ZXIgZG8gZG1hIHJlc2V0IGFmdGVy
IHRyYW5zZmVyIHRpbWVvdXQsDQo+ID4gYnV0IHNvbWV0aW1lcyBkbWEgcmVzZXQgd2lsbCB0cmln
Z2VyIGFuIHVuZXhwZWN0ZWQgRE1BX0VSUiBpcnEuDQo+ID4gSXQgd2lsbCBjYXVzZSB0aGUgaTJj
IGNvbnRyb2xsZXIgdG8gY29udGludW91c2x5IHNlbmQgaW50ZXJydXB0cw0KPiA+IHRvIHRoZSBz
eXN0ZW0gYW5kIGNhdXNlIHNvZnQgbG9jay11cC4gU28gd2UgbmVlZCB0byBkaXNhYmxlIGkyYw0K
PiA+IHN0YXJ0X2VuIGFuZCBjbGVhciBpbnRyX3N0YXQgdG8gc3RvcCBpMmMgY29udHJvbGxlciBi
ZWZvcmUgZG1hDQo+ID4gcmVzZXQgd2hlbiB0cmFuc2ZlciB0aW1lb3V0Lg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBJcyB0
aGVyZSBhIHN1aXRhYmxlIEZpeGVzIHRhZyBmb3IgdGhpcz8NCj4gDQoNCkNhbiB5b3UgaGVscCB0
byBhZGQgdGhlIGZvbGxvd2luZyB0YWcsIHRoYW5rcw0KRml4ZXM6IGFhZmNlZDY3M2MwNigiaTJj
OiBtZWRpYXRlazogbW92ZSBkbWEgcmVzZXQgYmVmb3JlIGkyYyByZXNldCIpDQoNCg==

