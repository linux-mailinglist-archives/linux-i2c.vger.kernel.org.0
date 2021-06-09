Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171ED3A0A26
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jun 2021 04:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbhFICpt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 22:45:49 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:28621 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231668AbhFICpt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 22:45:49 -0400
X-UUID: f59f9558455346669f8bd0657494bac2-20210609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YlJZ3DSxIMXeeLudsnal26OpngdTHTMDMazjVteE63M=;
        b=oXlRf4LYUNlbjKZsBgREzBjofsq6ZhYSeR7vwnYuiSt1XPWB2G2wPhUPLK8gKZHrXcN7wVEDg/+SVuC7pFLOwJRDzZ1W9R/jhrl8RKv9CPcBBFhs9FU/MECdWMVivq4ToyQg6fy48n+NlelLjPc/DCDV5zX4G6o+b22kHxCJNew=;
X-UUID: f59f9558455346669f8bd0657494bac2-20210609
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1086761753; Wed, 09 Jun 2021 10:43:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Jun
 2021 10:43:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 10:43:44 +0800
Message-ID: <1623206624.14050.10.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     <wsa@the-dreams.de>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <liguo.zhang@mediatek.com>
Date:   Wed, 9 Jun 2021 10:43:44 +0800
In-Reply-To: <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
         <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
         <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 978AC84873E67237AE466C5D838E8CDB2EB7D777515206BE778ADE526AA155F82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA2LTA4IGF0IDE2OjAxICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDgvMDYvMjAyMSAwNToxNiwgS2V3ZWkgWHUgd3JvdGU6DQo+ID4gRnJvbTog
Iktld2VpLlh1IiA8a2V3ZWkueHVAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFdoZW4gYSB0aW1l
b3V0IGVycm9yIG9jY3VycyBpbiBpMmMgdHJhbnN0ZXIsIGl0IGlzIHVzdWFsbHkgcmVsYXRlZA0K
PiA+IHRvIHRoZSBpMmMvZG1hIElQIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uIFRoZXJlZm9yZSwg
dGhlIHB1cnBvc2Ugb2YNCj4gPiB0aGlzIHBhdGNoIGlzIHRvIGR1bXAgdGhlIGtleSByZWdpc3Rl
ciB2YWx1ZXMgb2YgaTJjL2RtYSB3aGVuIGENCj4gPiB0aW1lb3V0IG9jY3VycyBpbiBpMmMgZm9y
IGRlYnVnZ2luZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXdlaS5YdSA8a2V3ZWkueHVA
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4
eC5jIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gaW5kZXggNWRkZmE0ZS4uZTY1YTQxZSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jDQo+ID4gKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IEBAIC0xMjUsNiArMTI1LDcgQEAg
ZW51bSBJMkNfUkVHU19PRkZTRVQgew0KPiA+ICAJT0ZGU0VUX0hTLA0KPiA+ICAJT0ZGU0VUX1NP
RlRSRVNFVCwNCj4gPiAgCU9GRlNFVF9EQ01fRU4sDQo+ID4gKwlPRkZTRVRfTVVMVElfRE1BLA0K
PiA+ICAJT0ZGU0VUX1BBVEhfRElSLA0KPiA+ICAJT0ZGU0VUX0RFQlVHU1RBVCwNCj4gPiAgCU9G
RlNFVF9ERUJVR0NUUkwsDQo+ID4gQEAgLTE5Miw4ICsxOTMsOSBAQCBlbnVtIEkyQ19SRUdTX09G
RlNFVCB7DQo+ID4gIAlbT0ZGU0VUX1RSQU5TRkVSX0xFTl9BVVhdID0gMHg0NCwNCj4gPiAgCVtP
RkZTRVRfQ0xPQ0tfRElWXSA9IDB4NDgsDQo+ID4gIAlbT0ZGU0VUX1NPRlRSRVNFVF0gPSAweDUw
LA0KPiA+ICsJW09GRlNFVF9NVUxUSV9ETUFdID0gMHg4NCwNCj4gPiAgCVtPRkZTRVRfU0NMX01J
U19DT01QX1BPSU5UXSA9IDB4OTAsDQo+ID4gLQlbT0ZGU0VUX0RFQlVHU1RBVF0gPSAweGUwLA0K
PiA+ICsJW09GRlNFVF9ERUJVR1NUQVRdID0gMHhlNCwNCj4gDQo+IElzIHRoaXMgb2Zmc2V0IG9u
bHkgZm9yIG10ODE5MiBvciBhbHNvIGZvciBtdDgxODM/DQo+IEluIGFueSBjYXNlIHRoYXQgc2hv
dWxkIGdvIGluIGFzIGFub3RoZXIgcGF0Y2guIEVpdGhlciBhIGZpeCBvciBhIG5ldw0KPiBtdF9p
MmNfcmVnc192M1tdDQo+IA0KPiBSZWdhcmRzLA0KICBNYXR0aGlhcw0KDQpIaSBNYXR0aGlhcywN
Cg0KVGhpcyBvZmZzZXQgdmFsdWUgaXMgc3VpdGFibGUgZm9yIHRoZSBJQyBvZiBtdF9pMmNfcmVn
c192MiBoYXJkd2FyZQ0KZGVzaWduIHNpbWlsYXIgdG8gbXQ4MTkyLzgxOTUsIG5vdCBmb3IgODE4
My4NCg0KVGhlIHJlYXNvbiBmb3IgdGhlIG1vZGlmaWNhdGlvbiBoZXJlIGlzIHRoYXQgdGhlIHBy
ZXZpb3VzDQpvZmZzZXQgaW5mb3JtYXRpb24gaXMgaW5jb3JyZWN0LCBPRkZTRVRfREVCVUdTVEFU
ID0gMFhFNCBpcw0KdGhlIGNvcnJlY3QgdmFsdWUuDQoNClJlZ2FyZHMsDQpLZXdlaQ0KDQoNCg==

