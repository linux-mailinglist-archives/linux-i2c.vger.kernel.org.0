Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA9235C5DF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 14:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbhDLMDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 08:03:45 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:21408 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237718AbhDLMDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 08:03:43 -0400
X-UUID: 3c5422fa0b1444acbab3ca09c068501e-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xjIpJFHcvYjgEZJlihOq0w4qVxnmy2ixpDuQuCRxIzY=;
        b=OMOwPMoMGgd2PQpew6blRmRm5tPg487EzvFFjRV8puBSekNrMfhWCpRssgcIAROkww5l2LWAMUSolHEiY9X+2MLZ9/peGRlGYoJd40y8lRsQC0yT1rCn26FXQayEjxK9oGLYB6NpNBar5o7dLQjYFaXyOKNuiWHXYuPMPIJTv7o=;
X-UUID: 3c5422fa0b1444acbab3ca09c068501e-20210412
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1622231637; Mon, 12 Apr 2021 20:03:21 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 20:03:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:03:14 +0800
Message-ID: <1618228994.32225.3.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Mon, 12 Apr 2021 20:03:14 +0800
In-Reply-To: <20210407181936.GA1614@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
         <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
         <20210407181936.GA1614@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A7CFFEEEB61B385686FB02EAD7F2826708C53DF7161DB026B3C8B8AD5232F5922000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIxLTA0LTA3IGF0IDIwOjE5ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gRHVlIHRvIGNsb2NrIHN0cmV0Y2gsIG91ciBIVyBJUCBjYW5ub3QgbWVldCB0aGUgYWMtdGlt
aW5nDQo+ID4gc3BlYyh0U1U7U1RBLHRTVTtTVE8pLiANCj4gPiBUaGVyZSBpc24ndCBhIHNhbWUg
ZGVsYXkgZm9yIGNsb2NrIHN0cmV0Y2hpbmcsIHNvIHdlIG5lZWQgcGFzcyBhDQo+ID4gcGFyYW1l
dGVyIHdoaWNoIGNhbiBiZSBmb3VuZCB0aHJvdWdoIG1lYXN1cmVtZW50IHRvIG1lZXQgbW9zdA0K
PiA+IGNvbmRpdGlvbnMuDQo+IA0KPiBXaGF0IGFib3V0IHVzaW5nIHRoaXMgZXhpc3RpbmcgYmlu
ZGluZz8NCj4gDQo+IC0gaTJjLXNjbC1pbnRlcm5hbC1kZWxheS1ucw0KPiAgICAgICAgIE51bWJl
ciBvZiBuYW5vc2Vjb25kcyB0aGUgSVAgY29yZSBhZGRpdGlvbmFsbHkgbmVlZHMgdG8gc2V0dXAg
U0NMLg0KPiANCg0KSSBjYW4ndCBzZWUgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuICJpMmMtc2Ns
LWZhbGxpbmctdGltZS1ucyIgYW5kIGNsb2NrDQpzdHJldGNoaW5nLCBpcyB0aGVyZSBhIHBhcmFt
ZXRlciByZWxhdGVkIHRvIGNsb2NrIHN0cmV0Y2hpbmc/DQpJZiB5b3UgdGhpbmsgYm90aCBvZiB0
aGVtIHdpbGwgYWZmZWN0IHRoZSBhYy10aW1pbmcgb2YgU0NMLCBhdCB0aGlzDQpwb2ludCwgImky
Yy1zY2wtZmFsbGluZy10aW1lLW5zIiBtYXliZSBhIGdvb2QgY2hvaWNlLg0KDQo=

